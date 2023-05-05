import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../external/controllers/store.dart';
import '../../utils/date.dart';
import '../entities/timetable.dart';

final _timetableStoreProvider = Provider.family((ref, String userId) {
  final store = ref.watch(firestoreProvider);
  final timetablesRef = store.collection('timetables');
  return timetablesRef.doc(userId);
});

final timetableStreamProvider =
    StreamProvider.autoDispose.family<Timetable, String>((ref, userId) {
  final store = ref.watch(_timetableStoreProvider(userId));
  final res = store.snapshots().map((doc) => doc.data());

  return res.map((data) {
    if (data == null) {
      return Timetable.withDefaults();
    }
    return Timetable.fromJson(data);
  });
});

final timetableRepositoryProvider = Provider.family(TimetableRepository.new);

class TimetableRepository {
  TimetableRepository(this.ref, this.userId);
  final ProviderRef<TimetableRepository> ref;
  final String userId;

  Future<void> save({required Timetable entity}) async {
    final store = ref.watch(_timetableStoreProvider(userId));
    await store.set(
      entity.copyWith(updatedAt: timeNow()).toJson(),
    );
  }
}
