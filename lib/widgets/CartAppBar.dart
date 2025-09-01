import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // tombol back → Navigator.pop
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Color(0xFFF1BF42),
            ),
          ),

          // teks judul cart lebih menarik (pakai emoji + font custom)
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              '🛒 Cart',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w900,
                fontFamily: 'Roboto', // bisa ganti ke font lain kalau udah import
                color: Color(0xFFF1BF42),
              ),
            ),
          ),

          const Spacer(),

          // popup menu di titik tiga
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              size: 30,
              color: Color(0xFFF1BF42),
            ),
            onSelected: (value) {
              if (value == 'refresh') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cart refreshed!")),
                );
              } else if (value == 'settings') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Go to settings")),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'refresh',
                child: Text('Refresh Cart'),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: Text('Settings'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
