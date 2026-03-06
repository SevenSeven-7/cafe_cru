import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String _selectedCategory = 'All';
  bool _isGridView = true;

  final List<Map<String, dynamic>> _menuItems = [
    {'name': 'Caffè Latte', 'type': 'Coffee', 'price': 'Rp 28k', 'rating': 4.8, 'img': 'coffee'},
    {'name': 'Green Tea Latte', 'type': 'Tea', 'price': 'Rp 32k', 'rating': 4.7, 'img': 'tea'},
    {'name': 'Chocolate Brownie', 'type': 'Dessert', 'price': 'Rp 25k', 'rating': 4.9, 'img': 'dessert'},
    {'name': 'Caramel Macchiato', 'type': 'Coffee', 'price': 'Rp 35k', 'rating': 4.8, 'img': 'coffee2'},
    {'name': 'Iced Peach Tea', 'type': 'Non Coffee', 'price': 'Rp 22k', 'rating': 4.6, 'img': 'peach'},
    {'name': 'Croissant', 'type': 'Dessert', 'price': 'Rp 20k', 'rating': 4.7, 'img': 'croissant'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Menu', style: TextStyle(color: Color(0xFF3E2723), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view, color: const Color(0xFF5D4037)),
            onPressed: () => setState(() => _isGridView = !_isGridView),
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Categories
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: ['All', 'Coffee', 'Non Coffee', 'Tea', 'Dessert'].map((cat) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: _selectedCategory == cat,
                      onSelected: (selected) {
                        setState(() => _selectedCategory = cat);
                      },
                      selectedColor: const Color(0xFF5D4037),
                      labelStyle: TextStyle(color: _selectedCategory == cat ? Colors.white : Colors.black87),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          // Menu List/Grid
          Expanded(
            child: _isGridView ? _buildGrid() : _buildList(),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: _menuItems.length,
      itemBuilder: (context, index) {
        final item = _menuItems[index];
        return _buildMenuCard(item);
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _menuItems.length,
      itemBuilder: (context, index) {
        final item = _menuItems[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _buildMenuListTile(item),
        );
      },
    );
  }

  Widget _buildMenuCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(item: item))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.network('https://picsum.photos/seed/${item['img']}/200/200', width: double.infinity, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.favorite_border, size: 18, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item['price'], style: const TextStyle(color: Color(0xFFE64A19), fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 14),
                          Text(item['rating'].toString(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuListTile(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(item: item))),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network('https://picsum.photos/seed/${item['img']}/100/100', width: 80, height: 80, fit: BoxFit.cover),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(item['type'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 8),
                  Text(item['price'], style: const TextStyle(color: Color(0xFFE64A19), fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Column(
              children: [
                const Icon(Icons.favorite_border, color: Colors.red),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(item['rating'].toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
