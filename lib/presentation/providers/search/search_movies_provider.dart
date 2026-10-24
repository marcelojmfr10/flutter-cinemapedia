import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final searchQueryProvider = Provider<String>((ref) => '');

final searchQueryProvider = NotifierProvider<SearchQueryNotifier, String>(
  SearchQueryNotifier.new,
);

class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void update(String query) => state = query;
}

final searchedMoviesProvider =
    NotifierProvider<SearchedMoviesNotifier, List<Movie>>(
      SearchedMoviesNotifier.new,
    );

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends Notifier<List<Movie>> {
  late final SearchMoviesCallback searchMovies;

  @override
  List<Movie> build() {
    searchMovies = ref.watch(movieRepositoryProvider).searchMovies;
    return [];
  }

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update(query);

    state = movies;
    return movies;
  }
}
