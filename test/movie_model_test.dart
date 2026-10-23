import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('movie model tests', () {
    test('creates Sandwich instance with given properties', () {
      const Movie(
        id: 3,
        title: 'Toy Story',
        description: 'Loaded with fresh vegetables.',
        ageRating: '18',
        price: 5.25,
        imagePath: 'assets/images/six_inch.jpeg',
      );
    });
  });
}