// GENERATED from the HTML prototype m-luxury.html — Dark Luxury Mobile.
// Usage: MaterialApp(theme: LuxuryTheme.light, darkTheme: LuxuryTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class LuxuryTheme {
  LuxuryTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Montserrat';
  static const double radius = 2;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFF6F2E9), surface: Color(0xFFFFFDF8), surfaceAlt: Color(0xFFF1EBDD),
    text: Color(0xFF1A1814), muted: Color(0xFF7A7262), line: Color(0x40A8823C),
    accent: Color(0xFF8A6A1C), onAccent: Color(0xFFFFFDF8),
    ok: Color(0xFF4F7A3A), warn: Color(0xFF8A6A1C), bad: Color(0xFF8B2E2E),
    chart: [Color(0xFF8A6A1C), Color(0xFF1A1814), Color(0xFFC9B88F), Color(0xFF6B5A3E), Color(0xFFD9CDB0)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF0A0A0A), surface: Color(0xFF121212), surfaceAlt: Color(0xFF191919),
    text: Color(0xFFECE6DA), muted: Color(0xFF8A8478), line: Color(0x33C9A961),
    accent: Color(0xFFC9A961), onAccent: Color(0xFF0A0A0A),
    ok: Color(0xFFA3B87A), warn: Color(0xFFC9A961), bad: Color(0xFFC0645A),
    chart: [Color(0xFFC9A961), Color(0xFFE8D9B5), Color(0xFF8C6A3F), Color(0xFFF5F0E6), Color(0xFF5E5A52)],
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
