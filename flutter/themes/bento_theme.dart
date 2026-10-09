// GENERATED from the HTML prototype m-bento.html — Bento Mobile.
// Usage: MaterialApp(theme: BentoTheme.light, darkTheme: BentoTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class BentoTheme {
  BentoTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Plus Jakarta Sans';
  static const double radius = 24;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFF4F4F1), surface: Color(0xFFFFFFFF), surfaceAlt: Color(0xFFF4F4F1),
    text: Color(0xFF18181B), muted: Color(0xFF71717A), line: Color(0xFFE7E5E4),
    accent: Color(0xFF18181B), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF16A34A), warn: Color(0xFFD97706), bad: Color(0xFFE11D48),
    chart: [Color(0xFF4F46E5), Color(0xFF22C55E), Color(0xFFF59E0B), Color(0xFFEC4899), Color(0xFF06B6D4)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF0B0B0C), surface: Color(0xFF161618), surfaceAlt: Color(0xFF1F1F22),
    text: Color(0xFFF4F4F5), muted: Color(0xFFA1A1AA), line: Color(0xFF27272A),
    accent: Color(0xFFBEF264), onAccent: Color(0xFF18181B),
    ok: Color(0xFF4ADE80), warn: Color(0xFFFBBF24), bad: Color(0xFFFB7185),
    chart: [Color(0xFF818CF8), Color(0xFF4ADE80), Color(0xFFFBBF24), Color(0xFFF472B6), Color(0xFF22D3EE)],
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
