class HomeProductModel {
  const HomeProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.discount,
  });

  final int id;
  final String title;
  final String image;
  final double price;
  final double oldPrice;
  final double rating;
  final int discount;
}
