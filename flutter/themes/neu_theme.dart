// GENERATED from the HTML prototype m-neu.html — Neumorphism Mobile.
// Usage: MaterialApp(theme: NeuTheme.light, darkTheme: NeuTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class NeuTheme {
  NeuTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Manrope';
  static const double radius = 22;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFE6EBF3), surface: Color(0xFFE6EBF3), surfaceAlt: Color(0xFFDDE3ED),
    text: Color(0xFF3B4660), muted: Color(0xFF7E89A2), line: Color(0x1F3B4660),
    accent: Color(0xFF5B6CFF), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF1FB89A), warn: Color(0xFFE39A2F), bad: Color(0xFFEF5D7A),
    chart: [Color(0xFF5B6CFF), Color(0xFF22C3A6), Color(0xFFA66BFF), Color(0xFFFF8A5B), Color(0xFFFF6B9A)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF282D37), surface: Color(0xFF282D37), surfaceAlt: Color(0xFF2F3541),
    text: Color(0xFFDFE4EF), muted: Color(0xFF8D96AB), line: Color(0x12FFFFFF),
    accent: Color(0xFF8492FF), onAccent: Color(0xFF1D212A),
    ok: Color(0xFF2FD1B0), warn: Color(0xFFF4B155), bad: Color(0xFFF2738C),
    chart: [Color(0xFF8492FF), Color(0xFF2FD1B0), Color(0xFFB88AFF), Color(0xFFFF9D74), Color(0xFFFF85AD)],
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
