
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bottomnavigationbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
 const Bottomnavigationbar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Color(0xFFE3F2FD),
        type: BottomNavigationBarType.fixed,
        iconSize: 30.w,
        onTap: onTap,
        // unselectedIconTheme:IconThemeData(color:const Color(0xFF607D8B)),
        // selectedIconTheme: IconThemeData(color: const Color.fromARGB(255, 151, 208, 233)),
        unselectedItemColor: const Color(0xFF607D8B),
        selectedItemColor: const Color.fromARGB(255, 101, 180, 214),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_outlined),
            label: "favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: "profile",
          ),
        ]);
  }
}
