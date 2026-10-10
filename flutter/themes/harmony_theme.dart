// GENERATED from the HTML prototype m-harmony.html — HarmonyOS / Fluent Mobile.
// Usage: MaterialApp(theme: HarmonyTheme.light, darkTheme: HarmonyTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class HarmonyTheme {
  HarmonyTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Noto Sans';
  static const double radius = 24;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFF1F3F5), surface: Color(0xFFFFFFFF), surfaceAlt: Color(0xFFE9EDF2),
    text: Color(0xFF182431), muted: Color(0xFF66727F), line: Color(0x1A182431),
    accent: Color(0xFF0A59F7), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF41BA41), warn: Color(0xFFED6F21), bad: Color(0xFFE84026),
    chart: [Color(0xFF0A59F7), Color(0xFF2EC5C8), Color(0xFF8B5CF6), Color(0xFFED6F21), Color(0xFFE84382)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF0B0D10), surface: Color(0xFF191C21), surfaceAlt: Color(0xFF24282F),
    text: Color(0xFFE5E8EC), muted: Color(0xFF9AA3AD), line: Color(0x17FFFFFF),
    accent: Color(0xFF317AF7), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF5CD65C), warn: Color(0xFFFF8F4A), bad: Color(0xFFFF6A52),
    chart: [Color(0xFF317AF7), Color(0xFF3FD8DB), Color(0xFFA07BFF), Color(0xFFFF8F4A), Color(0xFFFF6AA3)],
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
