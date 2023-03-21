import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/layout.dart';
import '../controllers/auth.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: commonAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('logo'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () async {
                            final user = await authController
                                .signInWithMicrosoft(context);
                            if (user != null && context.mounted) {
                              GoRouter.of(context).go('/home');
                            }
                          },
                          child: const Text('ログイン'),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            0,
                            2,
                            0,
                            20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
