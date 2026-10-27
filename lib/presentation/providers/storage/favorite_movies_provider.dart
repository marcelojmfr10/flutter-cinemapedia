import 'package:cinemapedia/domain/domain.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMoviesProvider =
    NotifierProvider<StorageMoviesNotifier, Map<int, Movie>>(
      StorageMoviesNotifier.new,
    );

class StorageMoviesNotifier extends Notifier<Map<int, Movie>> {
  int page = 0;

  LocalStorageRepository get _localStorageRepository =>
      ref.read(localStorageRepositoryProvider);

  @override
  Map<int, Movie> build() => {};

  Future<List<Movie>> loadNextPage() async {
    final movies = await _localStorageRepository.loadFavoriteMovies(
      limit: 10,
      offset: page * 10,
    );

    page++;

    state = {...state, for (final movie in movies) movie.id: movie};

    return movies;
  }

  Future<void> toggleFavoriteMovie(Movie movie) async {
    final isFavorite = await _localStorageRepository.isFavoriteMovie(movie.id);
    await _localStorageRepository.toggleFavoriteMovie(movie);

    if (isFavorite) {
      state = {...state}..remove(movie.id);
      return;
    }

    state = {...state, movie.id: movie};
  }
}
