import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_connect/components/layout.dart';
import 'package:personal_connect/components/navigation_bar.dart';
import 'package:personal_connect/repositories/user_info.dart';

import '../components/account_info.dart';
import '../controllers/auth.dart';

class MyAccountPage extends ConsumerWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuth = ref.watch(firebaseAuthProvider);
    final userInfo = ref.watch(userInfoStreamProvider);
    final userInfoRepository = ref.watch(userInfoRepositoryProvider);

    return Scaffold(
      appBar: commonAppBar(),
      bottomNavigationBar: const CommonNavigationBar(),
      body: userInfo.when(
        data: (info) => AccountInfo(
          iconUrl: firebaseAuth.currentUser?.photoURL ??
              'https://picsum.photos/seed/495/600',
          email: firebaseAuth.currentUser?.email,
          displayName: info.displayName,
          canEdit: true,
          onSave: (state) async {
            await userInfoRepository.setDisplayName(
              displayName: state.displayName,
            );
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('保存しました'),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              );
            }
          },
        ),
        error: (err, _) => const Center(child: Text('エラーが発生しました')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
