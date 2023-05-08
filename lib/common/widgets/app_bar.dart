import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../external/controllers/auth.dart';

class CommonAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key, this.text = 'Personal Connect'});
  final String text;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: const Color(0xFF6DB1E7),
      automaticallyImplyLeading: false,
      title: Text(text),
      centerTitle: false,
      elevation: 2,
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: const Text('ログアウト'),
                  content: const Text('ログアウトしますか？'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(0),
                      ),
                      child: const Text('キャンセル'),
                    ),
                    TextButton(
                      onPressed: () async {
                        final authController = ref.read(authControllerProvider);
                        await authController.signOut();
                        if (context.mounted) {
                          Navigator.pop(context);
                          GoRouter.of(context).go('/');
                        }
                      },
                      style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(0),
                      ),
                      child: const Text('はい'),
                    )
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.logout_rounded),
        ),
      ],
    );
  }
}
