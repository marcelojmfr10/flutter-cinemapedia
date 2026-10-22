import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef GetMovieCallback = Future<Movie> Function(String movieId);

final movieInfoProvider =
    NotifierProvider<MovieMapNotifier, Map<String, Movie>>(
      MovieMapNotifier.new,
    );

class MovieMapNotifier extends Notifier<Map<String, Movie>> {
  late final GetMovieCallback getMovie;

  @override
  Map<String, Movie> build() {
    getMovie = ref.watch(movieRepositoryProvider).getMovieById;
    return {};
  }

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
