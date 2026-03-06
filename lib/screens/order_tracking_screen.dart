import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Your Order', style: TextStyle(color: Color(0xFF3E2723), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color(0xFF3E2723)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Map Preview
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.blue[50],
            child: const Center(
              child: Icon(Icons.map, size: 80, color: Colors.blueAccent),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Delivery Status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  _buildTrackStep('Order Placed', '9:10 AM', true, true),
                  _buildTrackStep('Preparing', '9:15 AM', true, true),
                  _buildTrackStep('Ready for Pickup/Delivery', '9:30 AM', false, true),
                  _buildTrackStep('Completed', '-', false, false),
                  const SizedBox(height: 40),
                  // Order Summary Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.local_cafe, color: Color(0xFF5D4037), size: 30),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('2 Items ordered', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text('Total: Rp 80k', style: TextStyle(color: Colors.grey, fontSize: 13)),
                            ],
                          ),
                        ),
                        TextButton(onPressed: () {}, child: const Text('Details')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackStep(String title, String time, bool isDone, bool showLine) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isDone ? const Color(0xFF5D4037) : Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: isDone ? const Icon(Icons.check, size: 12, color: Colors.white) : null,
            ),
            if (showLine)
              Container(
                width: 2,
                height: 40,
                color: isDone ? const Color(0xFF5D4037) : Colors.grey[300],
              ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isDone ? Colors.black : Colors.grey)),
            Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ],
    );
  }
}
