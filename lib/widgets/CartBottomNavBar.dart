import 'package:flutter/material.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 140,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Total harga
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total:',
                  style: TextStyle(
                    color: Color(0xFFF1BF42),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$29.00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xFFF1BF42),
                  ),
                ),
              ],
            ),

            // Tombol checkout dengan efek ripple
            Material(
              color: const Color(0xFFF1BF42),
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Proceeding to Checkout...")),
                  );
                },
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: const Text(
                    'Check Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
