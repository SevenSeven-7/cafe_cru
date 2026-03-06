import 'package:flutter/material.dart';
import 'menu_screen.dart';
import 'cart_screen.dart';
import 'order_history_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF5D4037),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeDashboard();
      case 1:
        return const MenuScreen();
      case 2:
        return const OrderHistoryScreen();
      case 3:
        return const CartScreen();
      case 4:
        return const ProfileScreen();
      default:
        return _buildHomeDashboard();
    }
  }

  Widget _buildHomeDashboard() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Good Morning,',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      'Coffee Lover!',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF3E2723)),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=cafeuser'),
                ),
              ],
            ),
            const SizedBox(height: 25),
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for coffee, tea, or snacks...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Featured / Promo
            const Text(
              'Featured Promos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3E2723)),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPromoCard('Buy 1 Get 1', 'On all Cold Brews', Colors.brown[400]!),
                  _buildPromoCard('30% Discount', 'For your first order', Colors.orange[400]!),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Categories
            const Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3E2723)),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryChip('Hot Coffee', Icons.local_cafe, true),
                  _buildCategoryChip('Cold Coffee', Icons.ac_unit, false),
                  _buildCategoryChip('Non Coffee', Icons.emoji_food_beverage, false),
                  _buildCategoryChip('Tea', Icons.eco, false),
                  _buildCategoryChip('Snacks', Icons.cookie, false),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Popular Menu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Menu',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3E2723)),
                ),
                TextButton(onPressed: () {}, child: const Text('See All')),
              ],
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildPopularItem();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoCard(String title, String subtitle, Color color) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, IconData icon, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: FilterChip(
        label: Text(label),
        avatar: Icon(icon, size: 18, color: isSelected ? Colors.white : Colors.grey),
        selected: isSelected,
        onSelected: (val) {},
        backgroundColor: Colors.white,
        selectedColor: const Color(0xFF5D4037),
        labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black87),
      ),
    );
  }

  Widget _buildPopularItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network('https://picsum.photos/seed/coffee/100/100', width: 70, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Caramel Macchiato', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('Rich espresso with caramel', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          const Text('Rp 25k', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFE64A19))),
        ],
      ),
    );
  }
}
