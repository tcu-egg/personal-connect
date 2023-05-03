import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_connect/components/layout.dart';
import 'package:personal_connect/components/navigation_bar.dart';
import 'package:personal_connect/repositories/user_info.dart';

import '../components/account_info.dart';
import '../controllers/auth.dart';
import '../timetable/repositories/timetable.dart';
import '../timetable/widgets/timetable.dart';

class MyAccountPage extends ConsumerWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuth = ref.watch(firebaseAuthProvider);
    final userInfo = ref.watch(userInfoStreamProvider);
    final userInfoRepository = ref.watch(userInfoRepositoryProvider);
    final timetable =
        ref.watch(timetableStreamProvider(firebaseAuth.currentUser!.uid));

    return Scaffold(
      appBar: commonAppBar(),
      bottomNavigationBar: const CommonNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            userInfo.when(
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 128),
              child: timetable.when(
                data: (data) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => print('navigate to edit page'),
                    child: TimetableWidget(
                      lectures: data.lectures,
                    ),
                  ),
                ),
                error: (err, _) => const Center(child: Text('エラーが発生しました')),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
