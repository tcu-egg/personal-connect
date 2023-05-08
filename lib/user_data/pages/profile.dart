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

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuth = ref.watch(firebaseAuthProvider);
    final userInfo = ref.watch(userDataStreamProvider(userId));
    final timetable = ref.watch(timetableStreamProvider(userId));

    bool isAuthor() {
      return firebaseAuth.currentUser?.uid == userId;
    }

    return Scaffold(
      appBar: commonAppBar(),
      bottomNavigationBar: const CommonNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            userInfo.when(
              data: (data) => UserDataWidget(
                initialUserInfo: data,
                email: isAuthor() ? firebaseAuth.currentUser?.email : null,
                canEdit: isAuthor(),
                onSave: isAuthor()
                    ? (state) async {
                        if (data != state) {
                          final userInfoRepository =
                              ref.read(userInfoRepositoryProvider(userId));
                          await userInfoRepository.save(entity: state);
                        }
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('保存しました'),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                          );
                        }
                      }
                    : null,
              ),
              error: (err, _) => const Center(child: Text('エラーが発生しました')),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 128),
              child: timetable.when(
                data: (data) => MouseRegion(
                  cursor: isAuthor()
                      ? SystemMouseCursors.click
                      : SystemMouseCursors.basic,
                  child: GestureDetector(
                    onTap: () => isAuthor()
                        ? GoRouter.of(context).go('/profile/edit-timetable')
                        : null,
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
