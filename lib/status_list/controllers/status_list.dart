import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../social/repositories/following.dart';
import '../../user_data/entities/user_data.dart';
import '../entities/following_user_status.dart';

final followingUserStatusListControllerProvider = Provider.family(
  FollowingUserStatusListController.new,
);

class FollowingUserStatusListController {
  FollowingUserStatusListController(this.ref, this.userId);
  final ProviderRef<FollowingUserStatusListController> ref;
  final String userId;

  Future<List<FollowingUserStatus>> get() async {
    final followingsRepository = ref.read(followingsRepositoryProvider(userId));
    final followings = await followingsRepository.getAll();
    final followingUsers = await FirebaseFirestore.instance
        .collection('users')
        .where('userId', whereIn: followings.map((e) => e.userId))
        .where('statusMessage', isNull: false)
        .get();

    return followingUsers.docs.map((doc) {
      final userData = UserData.fromJson(doc.data());
      return FollowingUserStatus(
        userId: userData.userId,
        displayName: userData.displayName,
        statusMessage: userData.statusMessage!,
        iconUrl: userData.iconUrl,
      );
    }).toList();
  }
}
