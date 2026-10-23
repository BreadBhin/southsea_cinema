import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repositories.dart';

void main() {
  group('MovieRepositories', () {
    final MovieRepositories repository = MovieRepositories();

    test('getMovies returns the two configured movies', () {
      final List<Movie> movies = repository.getMovies();

      expect(movies, hasLength(2));
      expect(movies.map((movie) => movie.id), ['1', '2']);
      expect(
        movies.map((movie) => movie.title),
        ['Inglorious Bastards', "Cheech and Chong- Still smokin'"],
      );
      for (final movie in movies) {
        expect(movie.imagePath, isNotEmpty);
        expect(movie.price, greaterThan(0));
      }
    });

    test('getMovieById returns the matching movie', () {
      final Movie? movie = repository.getMovieById('1');

      expect(movie, isNotNull);
      expect(movie?.title, 'Inglorious Bastards');
    });

    test('getMovieById returns null when the id does not exist', () {
      expect(repository.getMovieById('missing'), isNull);
    });
  });
}
