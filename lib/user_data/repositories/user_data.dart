import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_connect/utils/date.dart';

import '../../external/controllers/store.dart';
import '../entities/user_data.dart';

final _userDataStoreProvider = Provider.family((ref, String userId) {
  final store = ref.watch(firestoreProvider);
  final usersRef = store.collection('users');
  return usersRef.doc(userId);
});

final userDataStreamProvider = StreamProvider.autoDispose.family(
  (ref, String userId) {
    final store = ref.watch(_userDataStoreProvider(userId));
    final res = store.snapshots().map((doc) => doc.data());
    return res.map((data) {
      if (data == null) {
        throw Exception('UserData not found');
      }
      return UserData.fromJson(data);
    });
  },
);

final userInfoRepositoryProvider = Provider.family(UserDataRepository.new);

class UserDataRepository {
  UserDataRepository(this.ref, this.userId);
  final ProviderRef<UserDataRepository> ref;
  final String userId;

  Future<void> save({required UserData entity}) async {
    final store = ref.watch(_userDataStoreProvider(userId));
    final now = timeNow();
    await store.set(entity.copyWith(updatedAt: now).toJson());
  }
}
