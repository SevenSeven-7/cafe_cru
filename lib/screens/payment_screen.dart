import 'package:flutter/material.dart';
import 'order_confirmation_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = 'E-Wallet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method', style: TextStyle(color: Color(0xFF3E2723), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3E2723)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select your preferred payment method', style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 24),
            _buildPaymentOption('Cash', Icons.money),
            const SizedBox(height: 12),
            _buildPaymentOption('Card', Icons.credit_card),
            const SizedBox(height: 12),
            _buildPaymentOption('E-Wallet', Icons.account_balance_wallet),
            const SizedBox(height: 12),
            _buildPaymentOption('QR Payment', Icons.qr_code),
            const SizedBox(height: 32),
            const Text('Add Voucher', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter voucher code',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB300),
                    foregroundColor: const Color(0xFF3E2723),
                  ),
                  onPressed: () {},
                  child: const Text('Apply'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            _buildSummaryRow('Order Amount', 'Rp 70k'),
            _buildSummaryRow('Delivery Fee', 'Rp 10k'),
            _buildSummaryRow('Voucher Discount', '- Rp 0'),
            const Divider(height: 32),
            _buildSummaryRow('Total', 'Rp 80k', isTotal: true),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF388E3C), // Green for success/action
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderConfirmationScreen()));
                },
                child: const Text('Place Order', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String label, IconData icon) {
    bool isSelected = _selectedMethod == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = label),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? const Color(0xFF5D4037) : Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF5D4037)),
            const SizedBox(width: 16),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Spacer(),
            if (isSelected) const Icon(Icons.check_circle, color: Color(0xFF5D4037)),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: isTotal ? 20 : 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontSize: isTotal ? 20 : 16, fontWeight: FontWeight.bold, color: isTotal ? const Color(0xFFE64A19) : Colors.black)),
        ],
      ),
    );
  }
}
