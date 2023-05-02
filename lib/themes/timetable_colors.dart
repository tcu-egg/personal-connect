import 'package:flutter/material.dart';

enum TimetableColor {
  unselected,
  selected1,
  selected2,
  selected3,
  selected4,
}

@immutable
class TimetableColors extends ThemeExtension<TimetableColors> {
  const TimetableColors({
    required this.unselected,
    required this.selected1,
    required this.selected2,
    required this.selected3,
    required this.selected4,
  });

  final Color unselected;
  final Color selected1;
  final Color selected2;
  final Color selected3;
  final Color selected4;

  Color from(TimetableColor timetableColor) {
    switch (timetableColor) {
      case TimetableColor.unselected:
        return unselected;
      case TimetableColor.selected1:
        return selected1;
      case TimetableColor.selected2:
        return selected2;
      case TimetableColor.selected3:
        return selected3;
      case TimetableColor.selected4:
        return selected4;
    }
  }

  @override
  TimetableColors copyWith({
    Color? unselected,
    Color? selected1,
    Color? selected2,
    Color? selected3,
    Color? selected4,
  }) {
    return TimetableColors(
      unselected: unselected ?? this.unselected,
      selected1: selected1 ?? this.selected1,
      selected2: selected2 ?? this.selected2,
      selected3: selected3 ?? this.selected3,
      selected4: selected4 ?? this.selected4,
    );
  }

  @override
  TimetableColors lerp(ThemeExtension<TimetableColors>? other, double t) {
    if (other is! TimetableColors) {
      return this;
    }
    return TimetableColors(
      unselected: Color.lerp(unselected, other.unselected, t)!,
      selected1: Color.lerp(selected1, other.selected1, t)!,
      selected2: Color.lerp(selected2, other.selected2, t)!,
      selected3: Color.lerp(selected3, other.selected3, t)!,
      selected4: Color.lerp(selected4, other.selected4, t)!,
    );
  }
}
