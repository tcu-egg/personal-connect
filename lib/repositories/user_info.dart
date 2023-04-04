import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_connect/controllers/auth.dart';
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

final _userInfoStoreProvider = Provider((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  final store = ref.watch(firestoreProvider);
  final usersRef = store.collection('users');
  return usersRef.doc(auth.currentUser!.uid);
});

final userInfoStreamProvider = StreamProvider(
  (ref) {
    final store = ref.watch(_userInfoStoreProvider);
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

final userInfoRepositoryProvider = Provider(UserInfoRepository.new);

class UserInfoRepository {
  UserInfoRepository(this.ref);
  final ProviderRef<UserInfoRepository> ref;

  Future<void> setInitialData(SetInitialDataParams params) async {
    final store = ref.watch(_userInfoStoreProvider);
    final now = _timeNow();
    await store.set({
      'displayName': params.displayName,
      'createdAt': now,
      'updatedAt': now,
    });
  }

  Future<void> setDisplayName({required String displayName}) async {
    final store = ref.watch(_userInfoStoreProvider);
    await store.set(
      {
        'displayName': displayName,
        'updatedAt': _timeNow(),
      },
      SetOptions(merge: true),
    );
  }
}
