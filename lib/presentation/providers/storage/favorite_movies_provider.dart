import 'package:cinemapedia/domain/domain.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final favoriteMoviesProvider =
//     NotifierProvider<StorageMoviesNotifier, Map<int, Movie>>(
//       StorageMoviesNotifier.new,
//     );

// typedef MoviesCallback = Future<List<Movie>> Function(String query);

// class StorageMoviesNotifier extends Notifier<Map<int, Movie>> {
//   int page = 0;
//   late final MoviesCallback moviesCallback;

//   @override
//   Map<int, Movie> build() {
//     moviesCallback = ref
//         .watch(localStorageRepositoryProvider)
//         .isFavoriteMovie(movieId);
//     return {};
//   }

//   Future<void> toggleFavoriteMovie(Movie movie) async {
//     final List<Movie> movies = await moviesCallback(query);
//     ref.read(searchQueryProvider.notifier).update(query);

//     state = movies;
//     return movies;
//   }
// }
