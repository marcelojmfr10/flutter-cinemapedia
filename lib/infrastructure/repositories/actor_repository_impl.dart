import 'package:cinemapedia/domain/domain.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;

  new(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
