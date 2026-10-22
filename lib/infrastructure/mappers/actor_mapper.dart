import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath: cast.profilePath != null
        ? Environment.theMovieDBImages + cast.profilePath!
        : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIVKaQypm6szZTxVX92VIC6jK85K1pk_EK32vmHJnkEMhcjuMLucu8raE&s=10',
    character: cast.character,
  );
}
