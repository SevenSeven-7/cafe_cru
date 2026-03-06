import 'package:flutter/material.dart';
import 'schedule_order_screen.dart';

class DeliveryMethodScreen extends StatefulWidget {
  const DeliveryMethodScreen({super.key});

  @override
  State<DeliveryMethodScreen> createState() => _DeliveryMethodScreenState();
}

class _DeliveryMethodScreenState extends State<DeliveryMethodScreen> {
  String _method = 'Pick Up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Method', style: TextStyle(color: Color(0xFF3E2723), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3E2723)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('How do you want to get your order?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            _buildMethodOption('Pick Up', Icons.storefront, 'Collect from our store'),
            const SizedBox(height: 16),
            _buildMethodOption('Delivery', Icons.delivery_dining, 'We bring it to your door'),
            const SizedBox(height: 32),
            if (_method == 'Delivery') ...[
              const Text('Delivery Address', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your address...',
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.orange[50], borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: const [
                    Icon(Icons.info_outline, color: Colors.orange),
                    SizedBox(width: 12),
                    Expanded(child: Text('Delivery fee is Rp 10.000 for this location.', style: TextStyle(color: Colors.orange))),
                  ],
                ),
              ),
            ] else ...[
              const Text('Pickup Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    const Icon(Icons.access_time, color: Color(0xFF5D4037)),
                    const SizedBox(width: 12),
                    const Expanded(child: Text('Estimate preparation time: 10-15 mins')),
                  ],
                ),
              ),
            ],
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5D4037),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ScheduleOrderScreen()));
                },
                child: const Text('Continue', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodOption(String title, IconData icon, String subtitle) {
    bool isSelected = _method == title;
    return GestureDetector(
      onTap: () => setState(() => _method = title),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? const Color(0xFF5D4037) : Colors.grey[300]!, width: 2),
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? const Color(0xFF5D4037).withOpacity(0.05) : Colors.white,
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: isSelected ? const Color(0xFF5D4037) : Colors.grey),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
            ),
            if (isSelected) const Icon(Icons.check_circle, color: Color(0xFF5D4037)),
          ],
        ),
      ),
    );
  }
}
