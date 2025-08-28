import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFF1BF42),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildProfileSection(),
              const SizedBox(height: 30),
              _buildSettingsSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF1BF42), Color.fromARGB(255, 255, 226, 159)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/ucup.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Yusuf Kroco',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'yusufkroco@gmail.com',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFF1BF42), size: 28),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Column(
      children: [
        _buildSettingItem(
          context,
          icon: Icons.person_outline,
          title: 'Profile',
          onTap: () {
            Navigator.pushNamed(context, '/accountPage');
          },
        ),
        _buildSettingItem(
          context,
          icon: Icons.lock_outline,
          title: 'Change Password',
          onTap: () {
            Navigator.pushNamed(context, '/changePassword');
          },
        ),
        _buildSettingItem(
          context,
          icon: Icons.notifications_outlined,
          title: 'Notifications',
          onTap: () {
            Navigator.pushNamed(context, '/notifications');
          },
        ),
        _buildSettingItem(
          context,
          icon: Icons.help_outline,
          title: 'Help & Support',
          onTap: () {
            Navigator.pushNamed(context, '/help');
          },
        ),
        _buildSettingItem(
          context,
          icon: Icons.logout,
          title: 'Logout',
          onTap: () {
            _showLogoutDialog(context);
          },
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Logout',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, 'LoginPage', arguments: 'Logout Successful');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF1BF42),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
