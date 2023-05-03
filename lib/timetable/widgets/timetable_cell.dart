import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_connect/themes/timetable_colors.dart';

import '../entities/lecture.dart';

class TimetableCellWidget extends HookWidget {
  const TimetableCellWidget({super.key, this.lecture});

  final Lecture? lecture;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(),
        color: Theme.of(context)
            .extension<TimetableColors>()!
            .from(lecture?.color ?? TimetableColor.selected1),
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
