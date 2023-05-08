import 'package:flutter/material.dart';
import 'package:personal_connect/timetable/themes/timetable_color.dart';

import '../entities/lecture.dart';

class LectureCellWidget extends StatelessWidget {
  const LectureCellWidget({super.key, this.lecture});

  final Lecture? lecture;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(),
        color: Theme.of(context)
            .extension<TimetableColorTheme>()!
            .from(lecture?.color ?? TimetableColor.unselected),
      ),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 96,
        ),
        padding: const EdgeInsets.all(4),
        alignment: Alignment.center,
        child: lecture is Lecture
            ? Column(
                children: [
                  Text(
                    lecture!.lectureName,
                  ),
                  Text(
                    lecture!.professorName,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    lecture!.roomName,
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              )
            : const Text('empty'),
      ),
    );
  }
}
