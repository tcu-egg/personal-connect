import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _Item extends BottomNavigationBarItem {
  _Item({required super.icon, super.label, required this.route});
  final String route;
}

var _items = [
  _Item(icon: const Icon(Icons.home), label: 'Home', route: '/home'),
  _Item(icon: const Icon(Icons.person), label: 'Profile', route: '/profile')
];

final currentIndexProvider =
    StateProviderFamily<int, int>((ref, param) => param);

class CommonNavigationBar extends ConsumerWidget {
  const CommonNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(
      currentIndexProvider(
        // 初期値を表示されているページのindexに設定する
        _items.indexWhere(
          (element) => GoRouter.of(context).location == element.route,
        ),
      ).notifier,
    );

    return BottomNavigationBar(
      items: _items,
      currentIndex: currentIndex.state,
      onTap: (value) {
        currentIndex.state = value;
        if (context.mounted) {
          GoRouter.of(context).go(_items[currentIndex.state].route);
        }
      },
    );
  }
}
