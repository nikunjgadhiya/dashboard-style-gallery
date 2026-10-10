// GENERATED from the HTML prototype m-watch.html — Wearable Companion.
// Usage: MaterialApp(theme: WatchTheme.light, darkTheme: WatchTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class WatchTheme {
  WatchTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Inter';
  static const double radius = 20;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFFFFFFF), surface: Color(0xFFF2F2F7), surfaceAlt: Color(0xFFE5E5EA),
    text: Color(0xFF000000), muted: Color(0xFF6E6E73), line: Color(0x1A000000),
    accent: Color(0xFFFF2D55), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF34C759), warn: Color(0xFFFF9500), bad: Color(0xFFFF3B30),
    chart: [Color(0xFFFA114F), Color(0xFF7AC70C), Color(0xFF00B4D8), Color(0xFFFF9500), Color(0xFFAF52DE)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF000000), surface: Color(0xFF1C1C1E), surfaceAlt: Color(0xFF2C2C2E),
    text: Color(0xFFFFFFFF), muted: Color(0xFF98989D), line: Color(0x1FFFFFFF),
    accent: Color(0xFFFF375F), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF30D158), warn: Color(0xFFFF9F0A), bad: Color(0xFFFF453A),
    chart: [Color(0xFFFA114F), Color(0xFFA6FF00), Color(0xFF00F0FF), Color(0xFFFF9F0A), Color(0xFFBF5AF2)],
  );

  static ThemeData _build(Brightness b, _Palette p) => ThemeData(
        useMaterial3: true,
        brightness: b,
        fontFamily: fontFamily,
        scaffoldBackgroundColor: p.bg,
        colorScheme: ColorScheme(
          brightness: b,
          primary: p.accent,
          onPrimary: p.onAccent,
          secondary: p.chart[1],
          onSecondary: p.onAccent,
          error: p.bad,
          onError: const Color(0xFFFFFFFF),
          surface: p.surface,
          onSurface: p.text,
          surfaceContainerHighest: p.surfaceAlt,
          onSurfaceVariant: p.muted,
          outlineVariant: p.line,
        ),
        cardTheme: CardThemeData(
          color: p.surface,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: p.surface,
          selectedColor: p.accent,
          labelStyle: TextStyle(color: p.muted, fontWeight: FontWeight.w600),
          shape: const StadiumBorder(),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: p.surface,
          indicatorColor: p.accent.withValues(alpha: 0.16),
        ),
        dividerColor: p.line,
        extensions: [
          InventoryColors(ok: p.ok, warn: p.warn, bad: p.bad, chart: p.chart),
        ],
      );
}

class _Palette {
  const _Palette({
    required this.bg, required this.surface, required this.surfaceAlt,
    required this.text, required this.muted, required this.line,
    required this.accent, required this.onAccent,
    required this.ok, required this.warn, required this.bad, required this.chart,
  });
  final Color bg, surface, surfaceAlt, text, muted, line, accent, onAccent, ok, warn, bad;
  final List<Color> chart;
}
