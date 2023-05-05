import 'package:flutter/material.dart';

AppBar appBarLayout(String text) {
  return AppBar(
    backgroundColor: const Color(0xFF6DB1E7),
    automaticallyImplyLeading: false,
    title: Text(text),
    centerTitle: false,
    elevation: 2,
  );
}

AppBar commonAppBar() {
  return appBarLayout('PersonalConnect');
}

BottomNavigationBar navigationBar() {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
    ],
  );
}
