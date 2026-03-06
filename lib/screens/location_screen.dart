import 'package:flutter/material.dart';
import 'delivery_method_screen.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Cafe Location', style: TextStyle(color: Color(0xFF3E2723), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3E2723)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search city or cafe...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),
          // Map Placeholder
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: NetworkImage('https://maps.googleapis.com/maps/api/staticmap?center=-6.2088,106.8456&zoom=13&size=600x300&key=YOUR_API_KEY'), // Mock map
                fit: BoxFit.cover,
                onError: _handleError,
              ),
            ),
            child: const Center(child: Icon(Icons.location_on, size: 50, color: Colors.red)),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildLocationTile(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  static void _handleError(Object e, StackTrace? s) {}

  Widget _buildLocationTile(BuildContext context, int index) {
    final names = ['CupfulCanvas Cafe - Main Street', 'CupfulCanvas Cafe - Downtown', 'CupfulCanvas Cafe - Riverside'];
    final distances = ['0.5 km', '1.2 km', '2.5 km'];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(names[index], style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Jl. Example Road No. 123, Indonesia'),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.directions_walk, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(distances[index], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(width: 12),
                const Icon(Icons.access_time, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                const Text('Open until 10 PM', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliveryMethodScreen()));
        },
      ),
    );
  }
}
