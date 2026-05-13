import '../model/home_category_model.dart';
import '../model/home_product_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  HomeLoaded({
    required this.categories,
    required this.products,
  });

  final List<HomeCategoryModel> categories;
  final List<HomeProductModel> products;
}

class HomeError extends HomeState {
  HomeError(this.message);

  final String message;
}
