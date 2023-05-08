import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../entities/timetable.dart';
import 'lecture_cell.dart';

const rowMaxLength = 7;
final headerColor = Colors.pink.shade300;

class LectureTableWidget extends StatelessWidget {
  const LectureTableWidget({super.key, required this.lectures, this.onTapCell});

  final Map<Weekday, LectureMap> lectures;
  final void Function({required Weekday weekday, required int period})?
      onTapCell;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              ColoredBox(
                color: headerColor,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  width: 32,
                  height: 32,
                  child: const Text(''),
                ),
              ),
              ...Weekday.values.map(
                (weekday) => Expanded(
                  child: ColoredBox(
                    color: headerColor,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: SizedBox(
                        height: 32,
                        child: Center(
                          child: Text(
                            weekday.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ...List.generate(
          rowMaxLength,
          (index) => IntrinsicHeight(
            child: Row(
              children: [
                ColoredBox(
                  color: Colors.pink.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    width: 32,
                    child: Center(
                      child: Text(
                        (index + 1).toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                ...Weekday.values.map(
                  (weekday) => Expanded(
                    child: MouseRegion(
                      cursor: onTapCell != null
                          ? SystemMouseCursors.click
                          : MouseCursor.defer,
                      child: GestureDetector(
                        onTap: onTapCell != null
                            ? () =>
                                onTapCell!(weekday: weekday, period: index + 1)
                            : null,
                        child: LectureCellWidget(
                          lecture: lectures[weekday]?[index + 1],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
