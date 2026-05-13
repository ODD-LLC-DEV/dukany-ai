import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/home_category_model.dart';
import '../model/home_product_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> loadHome() async {
    emit(HomeLoading());

    await Future.delayed(const Duration(milliseconds: 800));

    final categories = [
      const HomeCategoryModel(
        id: 1,
        title: 'Groceries',
        icon: '🛒',
        backgroundColor: 0xFFFFF1E5,
      ),
      const HomeCategoryModel(
        id: 2,
        title: 'Electronics',
        icon: '💻',
        backgroundColor: 0xFFEAF2FF,
      ),
      const HomeCategoryModel(
        id: 3,
        title: 'Fashion',
        icon: '👕',
        backgroundColor: 0xFFFFEAF2,
      ),
      const HomeCategoryModel(
        id: 4,
        title: 'Beauty',
        icon: '💄',
        backgroundColor: 0xFFE8FFF1,
      ),
    ];

    final products = [
      const HomeProductModel(
        id: 1,
        title: 'Fresh Orange',
        image: 'https://images.unsplash.com/photo-1547514701-42782101795e',
        price: 8.5,
        oldPrice: 12,
        rating: 4.8,
        discount: 20,
      ),
      const HomeProductModel(
        id: 2,
        title: 'Red Apple',
        image: 'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce',
        price: 6,
        oldPrice: 9,
        rating: 4.7,
        discount: 15,
      ),
      const HomeProductModel(
        id: 3,
        title: 'Strawberry Box',
        image: 'https://images.unsplash.com/photo-1464965911861-746a04b4bca6',
        price: 11,
        oldPrice: 16,
        rating: 4.9,
        discount: 30,
      ),
    ];

    emit(HomeLoaded(categories: categories, products: products));
  }
}
