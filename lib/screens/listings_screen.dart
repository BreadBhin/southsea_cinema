import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repositories.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

class ListingsScreen extends StatelessWidget {
  const ListingsScreen ({super.key});

  @override 
  Widget build(BuildContext context){
    final MovieRepositories repository = MovieRepositories();
    final List<Movie> movies = repository.getMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Listings'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: movies[index]);
        },
      ),
    );
  }

}