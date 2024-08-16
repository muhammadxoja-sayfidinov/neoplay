import 'package:flutter/material.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';
import 'package:neoplay/presentation/widgets/movie_card.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: MovieCard(
        imageUrl: 'http://asilmedia.org/uploads/mini/fullstory/8f/49c9afb79ba4fa50320ab6f504f3ef.jpg',

        imdbRating: 7.2,
        kinopoiskRating: 7.2,
        neoPlayRating: 7.2,
      )
      ),
    );
  }
}
