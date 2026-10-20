import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDBKey =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay api key';

  static String theMovieDBAPI =
      dotenv.env['THE_MOVIEDB_URL'] ?? 'No hay api url';
}
