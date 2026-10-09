import 'package:flutter/material.dart';

/// Status + chart colours shared by every generated TIFFNY theme.
class InventoryColors extends ThemeExtension<InventoryColors> {
  const InventoryColors({required this.ok, required this.warn, required this.bad, required this.chart});
  final Color ok, warn, bad;
  final List<Color> chart;

  @override
  InventoryColors copyWith({Color? ok, Color? warn, Color? bad, List<Color>? chart}) =>
      InventoryColors(ok: ok ?? this.ok, warn: warn ?? this.warn, bad: bad ?? this.bad, chart: chart ?? this.chart);

  @override
  InventoryColors lerp(ThemeExtension<InventoryColors>? other, double t) {
    if (other is! InventoryColors) return this;
    return InventoryColors(
      ok: Color.lerp(ok, other.ok, t)!,
      warn: Color.lerp(warn, other.warn, t)!,
      bad: Color.lerp(bad, other.bad, t)!,
      chart: List.generate(chart.length, (i) => Color.lerp(chart[i], other.chart[i], t)!),
    );
  }
}
