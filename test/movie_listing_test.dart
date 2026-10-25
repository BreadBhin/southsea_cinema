import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/screens/movie_listing.dart';

void main() {
  testWidgets('shows the movie selected from the repository', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: MovieListing(movieId: '2')),
    );

    expect(find.text("Cheech and Chong- Still smokin'"), findsOneWidget);
    expect(find.text('They have you rollin in your seats boiz'), findsOneWidget);
    expect(find.text('Age rating: pg'), findsOneWidget);
  });

  testWidgets('shows a message when the movie id is unknown', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: MovieListing(movieId: 'missing')),
    );

    expect(find.text('Movie not found.'), findsOneWidget);
  });
}
