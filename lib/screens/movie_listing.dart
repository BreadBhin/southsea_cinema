import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repositories.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key, required this.movieId});

  final String movieId;

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  final MovieRepositories _repository = MovieRepositories();
  int _ticketCount = 1;
  bool _orderConfirmed = false;

  @override
  Widget build(BuildContext context) {
    final Movie? movie = _repository.getMovieById(widget.movieId);

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: movie == null
          ? const Center(
              child: Text(
                'Movie not found.',
                style: TextStyle(color: cinemaFontBlack),
              ),
            )
          : _buildMovieDetails(movie),
      floatingActionButton: movie == null
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  _orderConfirmed = true;
                });
              },
              label: const Text('BOOK NOW!'),
            ),
    );
  }

  Widget _buildMovieDetails(Movie movie) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              movie.imagePath,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            movie.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: cinemaBrand,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            movie.description,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
              color: cinemaFontBlack,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Age rating: ${movie.ageRating}',
            style: const TextStyle(fontSize: 16, color: cinemaFontBlack),
          ),
          const SizedBox(height: 10),
          Text(
            'Price per ticket: ${movie.formattedPrice}',
            style: const TextStyle(fontSize: 16, color: cinemaFontBlack),
          ),
          const SizedBox(height: 32),
          const Text(
            'Number of tickets',
            style: TextStyle(fontSize: 16, color: cinemaBrand),
          ),
          const SizedBox(height: 10),
          DropdownMenu<int>(
            initialSelection: _ticketCount,
            onSelected: (int? value) {
              if (value != null) {
                setState(() {
                  _ticketCount = value;
                  _orderConfirmed = false;
                });
              }
            },
            dropdownMenuEntries: List.generate(
              5,
              (index) => DropdownMenuEntry<int>(
                value: index + 1,
                label: '${index + 1} ${index == 0 ? 'ticket' : 'tickets'}',
              ),
            ),
          ),
          if (_orderConfirmed) ...[
            const SizedBox(height: 24),
            Text(
              'You are going to see ${movie.title}!',
              style: const TextStyle(color: cinemaFontBlack, fontSize: 16),
            ),
          ],
        ],
      ),
    );
  }
}