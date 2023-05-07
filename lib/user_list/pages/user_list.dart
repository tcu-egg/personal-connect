import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_connect/user_list/repositories/user_list.dart';
import 'package:personal_connect/user_list/widgets/user_card.dart';

import '../../common/widgets/navigation_bar.dart';
import '../../external/controllers/auth.dart';
import '../../layout.dart';
import '../../social/entities/follower.dart';
import '../../social/entities/following.dart';
import '../../social/repositories/follower.dart';
import '../../social/repositories/following.dart';
import '../../user_data/entities/user_data.dart';

class UserListPage extends HookConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuth = ref.watch(firebaseAuthProvider);
    final userList = ref.watch(userListStreamProvider);
    final followings =
        ref.watch(followingsStreamProvider(firebaseAuth.currentUser!.uid));
    final followingsRepository =
        ref.watch(followingsRepositoryProvider(firebaseAuth.currentUser!.uid));

    final filteredUserList = useState<Iterable<UserData>>([]);
    final searchText = useState('');
    useEffect(
      () {
        if (userList.hasValue) {
          filteredUserList.value = userList.value!.where((userData) {
            // 自分自身は表示しない
            final isNotMyself =
                userData.userId != firebaseAuth.currentUser!.uid;
            // 検索条件
            final searchCondition =
                userData.displayName.contains(searchText.value);
            return isNotMyself && searchCondition;
          });
        }
        return null;
      },
      [userList, searchText],
    );

    Widget buildFollowButton(UserData userData) {
      return followings.when(
        data: (data) =>
            // フォローリストに存在するかどうかで表示を変える
            data
                    .where((element) => element.userId == userData.userId)
                    .isNotEmpty
                ? TextButton(
                    onPressed: () async {
                      // フォロー解除
                      await followingsRepository.remove(
                        followingUserId: userData.userId,
                      );
                      final followersRepository = ref
                          .read(followersRepositoryProvider(userData.userId));
                      await followersRepository.remove(
                        followerUserId: firebaseAuth.currentUser!.uid,
                      );
                    },
                    child: const Text('フォロー中'),
                  )
                : TextButton(
                    onPressed: () async {
                      // フォローする
                      await followingsRepository.add(
                        entity: Following.withDefaults(userId: userData.userId),
                      );
                      final followersRepository = ref
                          .read(followersRepositoryProvider(userData.userId));
                      await followersRepository.add(
                        entity: Follower.withDefaults(
                          userId: firebaseAuth.currentUser!.uid,
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'フォローする',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
        error: (err, _) => Center(child: Text('エラーが発生しました: $err')),
        loading: () => const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: commonAppBar(),
      bottomNavigationBar: const CommonNavigationBar(),
      body: Column(
        children: [
          TextFormField(
            onChanged: (value) => searchText.value = value,
            decoration: const InputDecoration(
              labelText: 'ユーザー名で絞り込み',
              prefixIcon: Icon(Icons.search),
              fillColor: Color.fromRGBO(0x0E, 0x15, 0x1B, 0.475),
            ),
          ),
          SingleChildScrollView(
            child: userList.when(
              data: (users) => Column(
                children: filteredUserList.value
                    .map(
                      (userData) => UserCardWidget(
                        userData: userData,
                        button: buildFollowButton(userData),
                      ),
                    )
                    .toList(),
              ),
              error: (err, _) => Center(child: Text('エラーが発生しました: $err')),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
