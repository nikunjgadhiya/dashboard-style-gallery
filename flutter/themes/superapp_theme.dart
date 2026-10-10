// GENERATED from the HTML prototype m-superapp.html — Super-App Grid.
// Usage: MaterialApp(theme: SuperappTheme.light, darkTheme: SuperappTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class SuperappTheme {
  SuperappTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Inter';
  static const double radius = 18;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFF2F5FB), surface: Color(0xFFFFFFFF), surfaceAlt: Color(0xFFEEF2FA),
    text: Color(0xFF101828), muted: Color(0xFF667085), line: Color(0x14101828),
    accent: Color(0xFF0F4FD6), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF12B76A), warn: Color(0xFFF79009), bad: Color(0xFFF04438),
    chart: [Color(0xFF0F4FD6), Color(0xFF12B886), Color(0xFFFF7A1A), Color(0xFF7C4DFF), Color(0xFFEC4899)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF0B1120), surface: Color(0xFF141C2F), surfaceAlt: Color(0xFF1B2540),
    text: Color(0xFFEEF2FF), muted: Color(0xFF98A2B3), line: Color(0x14FFFFFF),
    accent: Color(0xFF4F86FF), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF32D583), warn: Color(0xFFFDB022), bad: Color(0xFFF97066),
    chart: [Color(0xFF4F86FF), Color(0xFF2DD4A8), Color(0xFFFF9A4D), Color(0xFF9B7BFF), Color(0xFFF472B6)],
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
