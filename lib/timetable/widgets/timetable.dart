import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_connect/timetable/widgets/lecture_edit_modal.dart';

import '../entities/lecture.dart';
import '../entities/timetable.dart';
import 'lecture_table.dart';

const rowMaxLength = 7;
final headerColor = Colors.pink.shade300;

class TimetableWidget extends HookWidget {
  const TimetableWidget({
    super.key,
    required this.initialTimetable,
    this.canEdit = false,
    this.onSave,
  });

  final Timetable initialTimetable;
  final bool canEdit;
  final void Function(Timetable state)? onSave;

  @override
  Widget build(BuildContext context) {
    final state = useState(initialTimetable);
    final timetableNameController =
        useTextEditingController(text: initialTimetable.name);
    return Column(
      children: [
        TextFormField(
          controller: timetableNameController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.edit),
            labelText: '時間割名',
            labelStyle: TextStyle(fontSize: 14),
          ),
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        LectureTableWidget(
          lectures: state.value.lectures,
          onTapCell: ({required period, required weekday}) async {
            final result = await showModalBottomSheet<Lecture>(
              context: context,
              builder: (_) => LectureEditModalWidget(
                lecture: state.value.lectures[weekday]?[period] ??
                    Lecture.withDefaults(),
              ),
            );
            if (result != null) {
              final newLectures = state.value.lectures[weekday] ?? {};
              state.value = state.value.copyWith(
                lectures: {
                  ...state.value.lectures,
                  weekday: {...newLectures, period: result}
                },
              );
            }
          },
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: onSave != null
              ? () => onSave!(
                    state.value.copyWith(name: timetableNameController.text),
                  )
              : null,
          child: const Text('保存'),
        ),
      ],
    );
  }
}
