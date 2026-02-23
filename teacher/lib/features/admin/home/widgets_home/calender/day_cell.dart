class DayCell {
  final int value;
  final bool faint;
  final bool isBlue;
  final bool isYellow;
  final bool isGray;

  const DayCell({
    required this.value,
    this.faint = false,
    this.isBlue = false,
    this.isYellow = false,
    this.isGray = false,
  });

  DayCell copyWith({bool? faint, bool? isBlue, bool? isYellow, bool? isGray}) {
    return DayCell(
      value: value,
      faint: faint ?? this.faint,
      isBlue: isBlue ?? this.isBlue,
      isYellow: isYellow ?? this.isYellow,
      isGray: isGray ?? this.isGray,
    );
  }
}
