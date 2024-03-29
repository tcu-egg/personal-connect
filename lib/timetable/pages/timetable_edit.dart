import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_connect/common/widgets/app_bar.dart';

import '../../common/widgets/navigation_bar.dart';
import '../../external/controllers/auth.dart';
import '../repositories/timetable.dart';
import '../widgets/timetable.dart';

class TimetableEditPage extends ConsumerWidget {
  const TimetableEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuth = ref.watch(firebaseAuthProvider);
    final timetable =
        ref.watch(timetableStreamProvider(firebaseAuth.currentUser!.uid));

    return Scaffold(
      appBar: const CommonAppBar(),
      bottomNavigationBar: const CommonNavigationBar(),
      body: timetable.when(
        data: (data) => Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 128),
              child: TimetableWidget(
                initialTimetable: data,
                canEdit: true,
                onSave: (state) async {
                  if (data != state) {
                    final timetableRepository = ref.read(
                      timetableRepositoryProvider(
                        firebaseAuth.currentUser!.uid,
                      ),
                    );
                    await timetableRepository.save(entity: state);
                  }
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('保存しました'),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
        error: (err, _) => const Center(child: Text('エラーが発生しました')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
