import 'package:flutter/material.dart';

class CartItemSamples extends StatefulWidget {
  const CartItemSamples({super.key});

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
  // contoh data dummy
  List<Map<String, dynamic>> items = List.generate(
    5,
    (i) => {
      "title": "Product $i",
      "price": 55,
      "quantity": 1,
      "hidden": false,
    },
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, i) {
        // kalau item disembunyiin -> return SizedBox kosong
        if (items[i]["hidden"]) return const SizedBox.shrink();

        return Container(
          height: 110,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Radio(
                value: i,
                groupValue: null,
                activeColor: const Color(0xFFF1BF42),
                onChanged: (index) {},
              ),
              Container(
                height: 70,
                width: 70,
                margin: const EdgeInsets.only(right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12), // kasih radius kotak
                  child: Image.asset(
                    'images/carts/$i.jpg',
                    fit: BoxFit.cover, // biar gambar nutupin kotak penuh
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[i]["title"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF1BF42),
                      ),
                    ),
                    Text(
                      "\$${items[i]["price"]}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF1BF42),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // tombol delete cuma sembunyiin item, gak hapus data
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          items[i]["hidden"] = true;
                        });
                      },
                      child: const Icon(Icons.delete, color: Colors.red),
                    ),
                    Row(
                      children: [
                        // tombol +
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              items[i]["quantity"]++;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: const Icon(Icons.add, size: 18),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            items[i]["quantity"].toString().padLeft(2, "0"),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFF1BF42),
                            ),
                          ),
                        ),
                        // tombol –
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (items[i]["quantity"] > 1) {
                                items[i]["quantity"]--;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: const Icon(Icons.remove, size: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
