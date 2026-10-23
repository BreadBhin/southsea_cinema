import 'package:southsea_cinema/models/movie.dart';

class MovieRepositories {
  List<Movie> getMovies() {
    return const[
      Movie(
        id: 1,
        title: 'Inglorious Bastards', 
        description: 'Nazis get fucked up', 
        ageRating: '18', 
        price: 100, 
        imagePath: 'assets/images/IB.jpg',
      
     ),
      Movie(
        id: 2, 
        title: "Cheech and Chong- Still smokin'", 
        description: 'They have you rollin in your seats boiz', 
        ageRating: 'pg', 
        price: 1.08956, 
        imagePath: 'assets/images/CCSS.jpg'
        
      )
    ];
  }
}