import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // List kategori yang ingin ditampikan
    final List<String> categories = [
      'Outfit',
      'Makanan',
      'Skincare',
      'Elektronik',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < categories.length; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  // ✅ gambar dipaksa kotak 40x40
                  SizedBox.square(
                    dimension: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'images/categories/${i + 1}.jpg',
                        fit: BoxFit.cover, // isi penuh ke kotak
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    categories[i],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xFFF1BF42),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
