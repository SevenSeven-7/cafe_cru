import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> item;
  const ProductDetailScreen({super.key, required this.item});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String _selectedSize = 'Medium';
  String _selectedMilk = 'Full Cream';
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: const Color(0xFF5D4037),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://picsum.photos/seed/${widget.item['img']}/600/600',
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                onPressed: () => setState(() => _isFavorite = !_isFavorite),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.item['name'],
                          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF3E2723)),
                        ),
                      ),
                      Text(
                        widget.item['price'],
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFE64A19)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.item['rating']} (120+ reviews)',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Experience the rich, velvety texture and balanced flavor of our signature ${widget.item['name']}. Made with premium beans and crafted with passion.',
                    style: TextStyle(color: Colors.grey[700], height: 1.5),
                  ),
                  const SizedBox(height: 30),
                  const Text('Size', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    children: ['Small', 'Medium', 'Large'].map((size) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: ChoiceChip(
                          label: Text(size),
                          selected: _selectedSize == size,
                          onSelected: (val) => setState(() => _selectedSize = size),
                          selectedColor: const Color(0xFF5D4037),
                          labelStyle: TextStyle(color: _selectedSize == size ? Colors.white : Colors.black87),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  const Text('Type of Milk', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: _selectedMilk,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    items: ['Full Cream', 'Oat Milk', 'Almond Milk', 'Soy Milk'].map((milk) {
                      return DropdownMenuItem(value: milk, child: Text(milk));
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedMilk = val!),
                  ),
                  const SizedBox(height: 24),
                  const Text('Extra Options', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    children: [
                      _buildExtraChip('Extra Espresso'),
                      _buildExtraChip('Less Sugar'),
                      _buildExtraChip('Chocolate Drizzle'),
                    ],
                  ),
                  const SizedBox(height: 100), // Space for bottom button
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.remove), padding: EdgeInsets.zero, constraints: const BoxConstraints()),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add), padding: EdgeInsets.zero, constraints: const BoxConstraints()),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5D4037),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to Cart!')));
                },
                child: const Text('Add to Cart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExtraChip(String label) {
    return FilterChip(
      label: Text(label),
      onSelected: (val) {},
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[300]!),
      ),
    );
  }
}
