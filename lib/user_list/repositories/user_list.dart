import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../external/controllers/store.dart';
import '../../user_data/entities/user_data.dart';

final userListStreamProvider = StreamProvider.autoDispose((ref) {
  final store = ref.watch(firestoreProvider);
  final usersSnapshot = store.collection('users').snapshots();
  return usersSnapshot.map(
    (snapshot) => snapshot.docs
        .map(
          (doc) => UserData.fromJson(doc.data()),
        )
        .toList(),
  );
});
