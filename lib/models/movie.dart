class Movie {
	final int id;
	final String title;
	final String description;
	final String ageRating;
	final double price;
	final String imagePath;

	const Movie({
		required this.id,
		required this.title,
		required this.description,
		required this.ageRating,
		required this.price,
		required this.imagePath,
	});


  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
}