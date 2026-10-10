// GENERATED from the HTML prototype m-map.html — Map / Location View.
// Usage: MaterialApp(theme: MapTheme.light, darkTheme: MapTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class MapTheme {
  MapTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Inter';
  static const double radius = 18;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFFFFFFF), surface: Color(0xFFFFFFFF), surfaceAlt: Color(0xFFF1F3F4),
    text: Color(0xFF202124), muted: Color(0xFF5F6368), line: Color(0x1A202124),
    accent: Color(0xFF1A73E8), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF188038), warn: Color(0xFFE37400), bad: Color(0xFFD93025),
    chart: [Color(0xFF1A73E8), Color(0xFF188038), Color(0xFFA142F4), Color(0xFFE37400), Color(0xFFD01884)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF121418), surface: Color(0xFF1E2127), surfaceAlt: Color(0xFF2A2E36),
    text: Color(0xFFE8EAED), muted: Color(0xFF9AA0A6), line: Color(0x1AFFFFFF),
    accent: Color(0xFF8AB4F8), onAccent: Color(0xFF0B1220),
    ok: Color(0xFF81C995), warn: Color(0xFFFDD663), bad: Color(0xFFF28B82),
    chart: [Color(0xFF8AB4F8), Color(0xFF81C995), Color(0xFFC58AF9), Color(0xFFFDD663), Color(0xFFFF8BCB)],
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
