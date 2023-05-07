import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_connect/utils/date.dart';

import '../../external/controllers/store.dart';
import '../entities/following.dart';

final _followingsStoreProvider = Provider.family((ref, String userId) {
  final store = ref.watch(firestoreProvider);
  final followingsRef =
      store.collection('social').doc(userId).collection('followings');
  return followingsRef;
});

final followingsStreamProvider = StreamProvider.autoDispose.family(
  (ref, String userId) {
    final store = ref.watch(_followingsStoreProvider(userId));
    final followingsSnapshots = store.snapshots();
    return followingsSnapshots.map(
      (snapshot) =>
          snapshot.docs.map((doc) => Following.fromJson(doc.data())).toList(),
    );
  },
);

final followingsRepositoryProvider = Provider.family(FollowingsRepository.new);

class FollowingsRepository {
  FollowingsRepository(this.ref, this.userId);
  final ProviderRef<FollowingsRepository> ref;
  final String userId;

  Future<void> add({required Following entity}) async {
    final store = ref.watch(_followingsStoreProvider(userId));
    final now = timeNow();
    await store
        .doc(entity.userId)
        .set(entity.copyWith(updatedAt: now).toJson());
  }

  Future<void> remove({required String followingUserId}) async {
    final store = ref.watch(_followingsStoreProvider(userId));
    await store.doc(followingUserId).delete();
  }
}
