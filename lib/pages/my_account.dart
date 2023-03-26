import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_connect/components/account_info.dart';
import 'package:personal_connect/components/layout.dart';
import 'package:personal_connect/components/navigation_bar.dart';

import '../controllers/auth.dart';

class MyAccountPage extends ConsumerWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuth = ref.watch(firebaseAuthProvider);
    return Scaffold(
      appBar: commonAppBar(),
      bottomNavigationBar: const CommonNavigationBar(),
      body: AccountInfo(
        iconUrl: firebaseAuth.currentUser?.photoURL ??
            'https://picsum.photos/seed/495/600',
        email: firebaseAuth.currentUser?.email,
        displayName: firebaseAuth.currentUser?.displayName,
      ),
    );
  }
}
