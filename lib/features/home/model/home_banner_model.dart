class HomeBannerModel {
  const HomeBannerModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.buttonText = 'SHOP NOW',
  });

  final int id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String buttonText;
}
