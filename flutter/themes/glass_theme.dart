// GENERATED from the HTML prototype m-glass.html — Glassmorphism Mobile.
// Usage: MaterialApp(theme: GlassTheme.light, darkTheme: GlassTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class GlassTheme {
  GlassTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Inter';
  static const double radius = 22;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFEEF1FB), surface: Color(0x80FFFFFF), surfaceAlt: Color(0x59FFFFFF),
    text: Color(0xFF1E2340), muted: Color(0xFF5A6085), line: Color(0x191E2340),
    accent: Color(0xFF5B6CFF), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF059669), warn: Color(0xFFD97706), bad: Color(0xFFE11D48),
    chart: [Color(0xFF3B82F6), Color(0xFF10B981), Color(0xFFA855F7), Color(0xFFF97316), Color(0xFFEC4899)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF0B1026), surface: Color(0x14FFFFFF), surfaceAlt: Color(0x0FFFFFFF),
    text: Color(0xFFEEF2FF), muted: Color(0xFFB9C0E6), line: Color(0x21FFFFFF),
    accent: Color(0xFF7DD3FC), onAccent: Color(0xFF0B1026),
    ok: Color(0xFF34D399), warn: Color(0xFFFBBF24), bad: Color(0xFFFB7185),
    chart: [Color(0xFF60A5FA), Color(0xFF34D399), Color(0xFFC084FC), Color(0xFFFB923C), Color(0xFFF472B6)],
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
