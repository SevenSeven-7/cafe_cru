import 'package:flutter/material.dart';
import 'favorite_screen.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(color: Color(0xFF3E2723), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // User Header
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=cafeuser'),
            ),
            const SizedBox(height: 16),
            const Text('John Doe', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text('johndoe@example.com', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 40),
            // Menu Options
            _buildProfileTile(Icons.person_outline, 'Edit Profile', () {}),
            _buildProfileTile(Icons.receipt_long_outlined, 'Order History', () {}),
            _buildProfileTile(Icons.payment_outlined, 'Payment Methods', () {}),
            _buildProfileTile(Icons.favorite_outline, 'My Favorites', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoriteScreen()));
            }),
            _buildProfileTile(Icons.settings_outlined, 'Settings', () {}),
            const Divider(height: 40),
            _buildProfileTile(Icons.logout, 'Logout', () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            }, color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile(IconData icon, String label, VoidCallback onTap, {Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? const Color(0xFF5D4037)),
      title: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }
}
