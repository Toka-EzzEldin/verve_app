import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBF3FA), // خلفية وردية فاتحة جداً
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 24.0, bottom: 20.0),
            child: const Text(
              'Settings',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E1B2E),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        children: [
          // قسم GENERAL
          _buildSectionTitle('GENERAL'),
          const SizedBox(height: 8),
          _buildSettingItem(
            icon: Icons.person_outline,
            title: 'Account',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.notifications_none,
            title: 'Notifications',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.card_giftcard_outlined,
            title: 'Coupons',
            onTap: () {},
          ),
          _buildSettingItem(icon: Icons.logout, title: 'Logout', onTap: () {}),
          _buildSettingItem(
            icon: Icons.delete_outline,
            title: 'Delete account',
            onTap: () {},
          ),

          const SizedBox(height: 24),

          // قسم FEEDBACK
          _buildSectionTitle('FEEDBACK'),
          const SizedBox(height: 8),
          _buildSettingItem(
            icon: Icons.warning_amber_rounded,
            title: 'Report a bug',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.send_outlined,
            title: 'Send feedback',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  // ودجت لتسهيل بناء عناوين الأقسام
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        letterSpacing: 0.8,
      ),
    );
  }

  // ودجت لبناء عناصر القائمة مع الفواصل
  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon, color: const Color(0xFF1E1B2E), size: 24),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E1B2E),
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 16,
          ),
          onTap: onTap,
        ),
        const Divider(height: 1, thickness: 0.8, color: Color(0xFFF0F0F0)),
      ],
    );
  }
}
