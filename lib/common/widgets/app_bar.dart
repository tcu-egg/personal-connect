import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key, this.text = 'Personal Connect'});
  final String text;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF6DB1E7),
      automaticallyImplyLeading: false,
      title: Text(text),
      centerTitle: false,
      elevation: 2,
    );
  }
}
