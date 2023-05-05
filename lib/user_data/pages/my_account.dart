import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/navigation_bar.dart';
import '../../external/controllers/auth.dart';
import '../../layout.dart';
import '../../timetable/repositories/timetable.dart';
import '../../timetable/widgets/lecture_table.dart';
import '../repositories/user_data.dart';
import '../widgets/user_data.dart';

class MyAccountPage extends ConsumerWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuth = ref.watch(firebaseAuthProvider);
    final userInfo =
        ref.watch(userDataStreamProvider(firebaseAuth.currentUser!.uid));
    final userInfoRepository =
        ref.watch(userInfoRepositoryProvider(firebaseAuth.currentUser!.uid));
    final timetable =
        ref.watch(timetableStreamProvider(firebaseAuth.currentUser!.uid));

    return Scaffold(
      appBar: commonAppBar(),
      bottomNavigationBar: const CommonNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            userInfo.when(
              data: (data) => UserDataWidget(
                initialUserInfo: data,
                email: firebaseAuth.currentUser?.email,
                canEdit: true,
                onSave: (state) async {
                  if (data != state) {
                    await userInfoRepository.save(entity: state);
                  }
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
                    onTap: () =>
                        GoRouter.of(context).go('/profile/edit-timetable'),
                    child: LectureTableWidget(
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
