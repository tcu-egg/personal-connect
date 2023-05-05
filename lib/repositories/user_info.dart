import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_connect/controllers/store.dart';

class UserInfo {
  UserInfo({
    required this.displayName,
    required this.createdAt,
    required this.updatedAt,
  });
  final String displayName;
  final String createdAt;
  final String updatedAt;
}

final _userInfoStoreProvider = Provider.family((ref, String userId) {
  final store = ref.watch(firestoreProvider);
  final usersRef = store.collection('users');
  return usersRef.doc(userId);
});

final userInfoStreamProvider = StreamProvider.autoDispose.family(
  (ref, String userId) {
    final store = ref.watch(_userInfoStoreProvider(userId));
    final res = store.snapshots().map((doc) => doc.data());
    return res.map((data) {
      if (data == null) {
        throw Exception('UserInfo not found');
      }
      return UserInfo(
        displayName: data['displayName'] as String,
        createdAt: data['createdAt'] as String,
        updatedAt: data['updatedAt'] as String,
      );
    });
  },
);

class SetInitialDataParams {
  SetInitialDataParams({required this.displayName});
  final String displayName;
}

String _timeNow() => DateTime.now().toUtc().toIso8601String();

final userInfoRepositoryProvider = Provider.family(UserInfoRepository.new);

class UserInfoRepository {
  UserInfoRepository(this.ref, this.userId);
  final ProviderRef<UserInfoRepository> ref;
  final String userId;

  Future<void> setInitialData(SetInitialDataParams params) async {
    final store = ref.watch(_userInfoStoreProvider(userId));
    final now = _timeNow();
    await store.set({
      'displayName': params.displayName,
      'createdAt': now,
      'updatedAt': now,
    });
  }

  Future<void> setDisplayName({required String displayName}) async {
    final store = ref.watch(_userInfoStoreProvider(userId));
    await store.set(
      {
        'displayName': displayName,
        'updatedAt': _timeNow(),
      },
      SetOptions(merge: true),
    );
  }
}
