import '../model/home_banner_model.dart';
import '../model/home_category_item_model.dart';
import '../model/home_product_item_model.dart';

class ModernHomeState {
  const ModernHomeState({
    this.isLoading = false,
    this.selectedBottomTab = 0,
    this.banners = const [],
    this.categories = const [],
    this.products = const [],
  });

  final bool isLoading;
  final int selectedBottomTab;
  final List<HomeBannerModel> banners;
  final List<HomeCategoryItemModel> categories;
  final List<HomeProductItemModel> products;

  ModernHomeState copyWith({
    bool? isLoading,
    int? selectedBottomTab,
    List<HomeBannerModel>? banners,
    List<HomeCategoryItemModel>? categories,
    List<HomeProductItemModel>? products,
  }) {
    return ModernHomeState(
      isLoading: isLoading ?? this.isLoading,
      selectedBottomTab: selectedBottomTab ?? this.selectedBottomTab,
      banners: banners ?? this.banners,
      categories: categories ?? this.categories,
      products: products ?? this.products,
    );
  }
}
