class HomeProductItemModel {
  const HomeProductItemModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.isHealthy,
  });

  final int id;
  final String name;
  final String image;
  final double price;
  final double oldPrice;
  final int discount;
  final bool isHealthy;
}
