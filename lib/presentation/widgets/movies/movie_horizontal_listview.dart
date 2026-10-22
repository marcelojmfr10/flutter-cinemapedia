import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListView extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const new({
    super.key,
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null || subTitle != null)
            _Title(title: title, subTitle: subTitle),

          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: movies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const new({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  }

                  return FadeIn(child: child);
                },
              ),
            ),
          ),

          SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: Text(movie.title, maxLines: 2, style: textStyles.titleSmall),
          ),

          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                SizedBox(width: 3),
                Text(
                  '${movie.voteAverage}',
                  style: textStyles.bodyMedium?.copyWith(
                    color: Colors.yellow.shade800,
                  ),
                ),
                // SizedBox(width: 10),
                Spacer(),
                Text(
                  HumanFormats.number(movie.popularity),
                  style: textStyles.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const new({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
              style: ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subTitle!),
            ),
        ],
      ),
    );
  }
}
