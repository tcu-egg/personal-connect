import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/navigation_bar.dart';
import '../../external/controllers/auth.dart';
import '../../layout.dart';
import '../controllers/status_list.dart';
import '../widgets/status_card.dart';

class StatusListPage extends HookConsumerWidget {
  const StatusListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuth = ref.watch(firebaseAuthProvider);
    final followingUserStatusListController = ref.read(
      followingUserStatusListControllerProvider(
        firebaseAuth.currentUser!.uid,
      ),
    );

    return Scaffold(
      appBar: commonAppBar(),
      bottomNavigationBar: const CommonNavigationBar(),
      body: Column(
        children: [
          SingleChildScrollView(
            child: FutureBuilder(
              future: followingUserStatusListController.get(),
              builder: (context, snapshot) => Row(
                children: snapshot.hasData && snapshot.requireData.isNotEmpty
                    ? snapshot.requireData
                        .map(
                          (userData) => InkWell(
                            onTap: () {
                              GoRouter.of(context).go(
                                '/users/${userData.userId}',
                              );
                            },
                            child: StatusCardWidget(
                              iconUrl: userData.iconUrl,
                              displayName: userData.displayName,
                              statusMessage: userData.statusMessage,
                            ),
                          ),
                        )
                        .toList()
                    : [const Text('表示できる情報がありません')],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
