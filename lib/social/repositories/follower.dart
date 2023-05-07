import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../external/controllers/store.dart';
import '../../utils/date.dart';
import '../entities/follower.dart';

final _followersStoreProvider = Provider.family((ref, String userId) {
  final store = ref.watch(firestoreProvider);
  final followersRef =
      store.collection('social').doc(userId).collection('followers');
  return followersRef;
});

final followersStreamProvider = StreamProvider.autoDispose.family(
  (ref, String userId) {
    final store = ref.watch(_followersStoreProvider(userId));
    final followersSnapshots = store.snapshots();
    return followersSnapshots.map(
      (snapshot) =>
          snapshot.docs.map((doc) => Follower.fromJson(doc.data())).toList(),
    );
  },
);

final followersRepositoryProvider = Provider.family(FollowersRepository.new);

class FollowersRepository {
  FollowersRepository(this.ref, this.userId);
  final ProviderRef<FollowersRepository> ref;
  final String userId;

  Future<void> add({required Follower entity}) async {
    final store = ref.watch(_followersStoreProvider(userId));
    final now = timeNow();
    await store
        .doc(entity.userId)
        .set(entity.copyWith(updatedAt: now).toJson());
  }

  Future<void> remove({required String followerUserId}) async {
    final store = ref.watch(_followersStoreProvider(userId));
    await store.doc(followerUserId).delete();
  }
}
