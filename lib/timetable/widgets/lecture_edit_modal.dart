import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../entities/lecture.dart';
import '../themes/timetable_color.dart';

class LectureEditModalWidget extends HookWidget {
  const LectureEditModalWidget({super.key, required this.lecture});

  final Lecture lecture;

  @override
  Widget build(BuildContext context) {
    final lectureNameController =
        useTextEditingController(text: lecture.lectureName);
    final professorNameController =
        useTextEditingController(text: lecture.professorName);
    final roomNameController = useTextEditingController(text: lecture.roomName);
    final selectedColor = useState(lecture.color);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 128, vertical: 8),
        child: Column(
          children: [
            TextFormField(
              controller: lectureNameController,
              decoration: InputDecoration(
                labelText: '講義名',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.background,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.background,
                prefixIcon: const Icon(
                  Icons.book_rounded,
                ),
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextFormField(
              controller: professorNameController,
              decoration: InputDecoration(
                labelText: '教授名',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.background,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.background,
                prefixIcon: const Icon(
                  Icons.person_rounded,
                ),
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextFormField(
              controller: roomNameController,
              decoration: InputDecoration(
                labelText: '教室名',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.background,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.background,
                prefixIcon: const Icon(
                  Icons.meeting_room_rounded,
                ),
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            DropdownButtonFormField(
              value: selectedColor.value,
              items: TimetableColor.values
                  .map(
                    (color) => DropdownMenuItem(
                      value: color,
                      child: ColoredBox(
                        color: Theme.of(context)
                            .extension<TimetableColorTheme>()!
                            .from(color),
                        child: Text(color.toString()),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                if (item != null) {
                  selectedColor.value = item;
                }
              },
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.pop(
                context,
                Lecture(
                  lectureName: lectureNameController.text,
                  professorName: professorNameController.text,
                  roomName: roomNameController.text,
                  color: selectedColor.value,
                ),
              ),
              child: const Text('追加'),
            )
          ],
        ),
      ),
    );
  }
}
