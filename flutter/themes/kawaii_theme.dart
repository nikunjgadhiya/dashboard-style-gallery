// GENERATED from the HTML prototype m-kawaii.html — Kawaii Mobile.
// Usage: MaterialApp(theme: KawaiiTheme.light, darkTheme: KawaiiTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class KawaiiTheme {
  KawaiiTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Fredoka';
  static const double radius = 28;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFFFF5FA), surface: Color(0xFFFFFFFF), surfaceAlt: Color(0xFFFFF0F7),
    text: Color(0xFF6B4F72), muted: Color(0xFFA58AAD), line: Color(0xFFF6CFE3),
    accent: Color(0xFFFF8FC1), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF3FB889), warn: Color(0xFFE89A3C), bad: Color(0xFFFF5C8D),
    chart: [Color(0xFFFF8FC1), Color(0xFF7FD8B4), Color(0xFFB49CFF), Color(0xFFFFB880), Color(0xFF7CC4FF)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF231B38), surface: Color(0xFF2F2549), surfaceAlt: Color(0xFF3A2F58),
    text: Color(0xFFFBE8FF), muted: Color(0xFFC3B3DC), line: Color(0xFF4C3D72),
    accent: Color(0xFFFF9FCB), onAccent: Color(0xFF231B38),
    ok: Color(0xFF7FD8B4), warn: Color(0xFFFFD36E), bad: Color(0xFFFF8FB5),
    chart: [Color(0xFFFF9FCB), Color(0xFF7FD8B4), Color(0xFFC3AFFF), Color(0xFFFFC79A), Color(0xFF8FCFFF)],
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
