import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // menu icon
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.sort,
              size: 28,
              color: Color(0xFFEBAB09),
            ),
          ),

          const SizedBox(width: 10),

          // title
          const Text(
            'Bakul Susu',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFFEBAB09),
              letterSpacing: 1,
            ),
          ),

          const Spacer(),

          // message with badge
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -8, end: -5),
            badgeAnimation: const badges.BadgeAnimation.fade(
              animationDuration: Duration(milliseconds: 300),
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.blue,
              padding: EdgeInsets.all(6),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              elevation: 0,
            ),
            badgeContent: const Text(
              '2',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Navigator.pushNamed(context, "ListChat");
              },
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.message_rounded,
                  size: 30,
                  color: Color(0xFFEBAB09),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
