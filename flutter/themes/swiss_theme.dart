// GENERATED from the HTML prototype m-swiss.html — Swiss Minimal Mobile.
// Usage: MaterialApp(theme: SwissTheme.light, darkTheme: SwissTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class SwissTheme {
  SwissTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Inter Tight';
  static const double radius = 0;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFFFFFFF), surface: Color(0xFFFFFFFF), surfaceAlt: Color(0xFFF2F2F2),
    text: Color(0xFF0D0D0D), muted: Color(0xFF6B6B6B), line: Color(0x240D0D0D),
    accent: Color(0xFFE3000F), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF0D0D0D), warn: Color(0xFF6B6B6B), bad: Color(0xFFE3000F),
    chart: [Color(0xFF0D0D0D), Color(0xFFE3000F), Color(0xFF8A8A8A), Color(0xFFC8C8C8), Color(0xFF454545)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF0D0D0D), surface: Color(0xFF0D0D0D), surfaceAlt: Color(0xFF1A1A1A),
    text: Color(0xFFF2F2F2), muted: Color(0xFF9A9A9A), line: Color(0x29F2F2F2),
    accent: Color(0xFFFF3B30), onAccent: Color(0xFF0D0D0D),
    ok: Color(0xFFF2F2F2), warn: Color(0xFF9A9A9A), bad: Color(0xFFFF3B30),
    chart: [Color(0xFFF2F2F2), Color(0xFFFF3B30), Color(0xFF8A8A8A), Color(0xFF4D4D4D), Color(0xFFBDBDBD)],
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
