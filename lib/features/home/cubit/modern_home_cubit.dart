import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/home_banner_model.dart';
import '../model/home_category_item_model.dart';
import '../model/home_product_item_model.dart';
import 'modern_home_state.dart';

class ModernHomeCubit extends Cubit<ModernHomeState> {
  ModernHomeCubit() : super(const ModernHomeState());

  Future<void> loadHome() async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 700));

    emit(
      state.copyWith(
        isLoading: false,
        banners: const [
          HomeBannerModel(
            id: 1,
            title: 'Up to 30% Off',
            subtitle: 'Stay Frosty, Stay Tasty!',
            imageUrl: 'https://images.unsplash.com/photo-1542838132-92c53300491e',
          ),
        ],
        categories: const [
          HomeCategoryItemModel(id: 1, title: 'Beverages', image: '🥤'),
          HomeCategoryItemModel(id: 2, title: 'Frozen Food', image: '🍕'),
          HomeCategoryItemModel(id: 3, title: 'Appliances', image: '📺'),
          HomeCategoryItemModel(id: 4, title: 'TVs', image: '📱'),
          HomeCategoryItemModel(id: 5, title: 'Meat', image: '🍖'),
          HomeCategoryItemModel(id: 6, title: 'Mobile', image: '📱'),
        ],
        products: const [
          HomeProductItemModel(
            id: 1,
            name: 'Koki Spicy Chicken Pane',
            image: 'https://images.unsplash.com/photo-1515003197210-e0cd71810b5f',
            price: 189.95,
            oldPrice: 239.20,
            discount: 11,
            isHealthy: true,
          ),
          HomeProductItemModel(
            id: 2,
            name: 'Nescafe 3in1 Original',
            image: 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085',
            price: 136.80,
            oldPrice: 170.0,
            discount: 15,
            isHealthy: true,
          ),
          HomeProductItemModel(
            id: 3,
            name: 'Crystal Sunflower Oil',
            image: 'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5',
            price: 456.50,
            oldPrice: 510,
            discount: 8,
            isHealthy: false,
          ),
        ],
      ),
    );
  }

  void changeBottomTab(int index) {
    emit(state.copyWith(selectedBottomTab: index));
  }
}
