import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _Item extends BottomNavigationBarItem {
  _Item({required super.icon, super.label, required this.route});
  final String route;
}

var _items = [
  _Item(icon: const Icon(Icons.home), label: 'Home', route: '/home'),
  _Item(icon: const Icon(Icons.person), label: 'Profile', route: '/profile')
];

int geLocationIndex(String location) {
  final index = _items.indexWhere(
    (element) => location.startsWith(element.route),
  );

  return index == -1 ? 0 : index;
}

class CommonNavigationBar extends StatelessWidget {
  const CommonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    var currentIndex = geLocationIndex(GoRouter.of(context).location);

    return BottomNavigationBar(
      items: _items,
      currentIndex: currentIndex,
      onTap: (value) {
        currentIndex = value;
        if (context.mounted) {
          GoRouter.of(context).go(_items[currentIndex].route);
        }
      },
    );
  }
}
