import 'package:cinemapedia/domain/domain.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

final actorsByMovieProvider =
    NotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
      ActorsByMovieNotifier.new,
    );

class ActorsByMovieNotifier extends Notifier<Map<String, List<Actor>>> {
  late final GetActorsCallback getActors;

  @override
  Map<String, List<Actor>> build() {
    getActors = ref.watch(actorsRepositoryProvider).getActorsByMovie;
    return {};
  }

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
