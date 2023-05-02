import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_connect/controllers/auth.dart';

import 'pages/home.dart';
import 'pages/my_account.dart';
import 'pages/signin.dart';

const _initialLocation = '/';
final router = Provider(
  (ref) => GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: _initialLocation,
    routes: [
      GoRoute(
        path: _initialLocation,
        pageBuilder: (context, state) =>
            const MaterialPage(child: SignInPage()),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
      ),
      GoRoute(
        path: '/profile',
        pageBuilder: (context, state) =>
            const MaterialPage(child: MyAccountPage()),
      )
    ],
    redirect: (context, state) async {
      final auth = ref.read(firebaseAuthProvider);
      final isSignedIn = auth.currentUser != null;
      final isInitialLocation = _initialLocation == state.subloc;

      if (!isSignedIn && !isInitialLocation) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('ログインしてください'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
        return '/';
      }

      if (isSignedIn && isInitialLocation) {
        return '/home';
      }

      return null;
    },
  ),
);