import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/modern_home_cubit.dart';
import '../../cubit/modern_home_state.dart';
import '../../widgets/home_banner_widget.dart';
import '../../widgets/home_category_item_widget.dart';
import '../../widgets/home_product_item_widget.dart';

class ModernHomeScreen extends StatelessWidget {
  const ModernHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ModernHomeCubit()..loadHome(),
      child: BlocBuilder<ModernHomeCubit, ModernHomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.selectedBottomTab,
              selectedItemColor: const Color(0xFFB8E34B),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                context.read<ModernHomeCubit>().changeBottomTab(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categories'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Account'),
              ],
            ),
            body: SafeArea(
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              color: Color(0xFF003C35),
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.location_on, color: Color(0xFFB8E34B), size: 18),
                                    SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        'Fagous - Sharqia',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_down, color: Colors.white)
                                  ],
                                ),
                                const SizedBox(height: 14),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search +12000 items',
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          HomeBannerWidget(banner: state.banners.first),
                          const SizedBox(height: 22),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Best sellers near you 🔥',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          SizedBox(
                            height: 260,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                return HomeProductItemWidget(
                                  product: state.products[index],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Shop by Categories',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'See All',
                                  style: TextStyle(
                                    color: Color(0xFF003C35),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 110,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: state.categories.length,
                              itemBuilder: (context, index) {
                                return HomeCategoryItemWidget(
                                  category: state.categories[index],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Exclusive deals!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'See All',
                                  style: TextStyle(
                                    color: Color(0xFF003C35),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),
                          SizedBox(
                            height: 260,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                return HomeProductItemWidget(
                                  product: state.products[index],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
