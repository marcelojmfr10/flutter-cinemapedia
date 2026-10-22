import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier((repo) => repo.getNowPlaying),
);

final popularMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier((repo) => repo.getPopular),
);

final upcomingMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier((repo) => repo.getUpcoming),
);

final topRatedMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier((repo) => repo.getTopRated),
);

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends Notifier<List<Movie>> {
  MoviesNotifier(this._selectFetch);

  final MovieCallback Function(MoviesRepository repo) _selectFetch;

  int currentPage = 0;
  bool isLoading = false;
  late final MovieCallback fetchMoreMovies;

  @override
  List<Movie> build() {
    fetchMoreMovies = _selectFetch(ref.watch(movieRepositoryProvider));
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(Duration(milliseconds: 300));
    isLoading = false;
  }
}
