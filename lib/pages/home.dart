import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_connect/components/navigation_bar.dart';

import '../controllers/auth.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider);
    return Scaffold(
      bottomNavigationBar: const CommonNavigationBar(),
      body: Column(
        children: [
          const Text('Logged In'),
          TextButton(
            onPressed: () async {
              await authController.signOut();
              if (context.mounted) {
                GoRouter.of(context).go('/');
              }
            },
            child: const Text('ログアウト'),
          ),
          TextButton(
            onPressed: () async {
              if (context.mounted) {
                GoRouter.of(context).go('/profile');
              }
            },
            child: const Text('My Profile'),
          ),
        ],
      ),
    );
  }
}
