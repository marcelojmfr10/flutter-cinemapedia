import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  static const name = 'movie_screen';
  final String movieId;

  const new({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('MovieID: $movieId')));
  }
}
