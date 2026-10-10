// GENERATED from the HTML prototype m-brutal.html — Neo-Brutalism Mobile.
// Usage: MaterialApp(theme: BrutalTheme.light, darkTheme: BrutalTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class BrutalTheme {
  BrutalTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Space Grotesk';
  static const double radius = 10;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFFFF4E0), surface: Color(0xFFFFFFFF), surfaceAlt: Color(0xFFFFF4E0),
    text: Color(0xFF0A0A0A), muted: Color(0xFF4A4A4A), line: Color(0xFF0A0A0A),
    accent: Color(0xFFFF6B9D), onAccent: Color(0xFF0A0A0A),
    ok: Color(0xFF0F8A4F), warn: Color(0xFFB86E00), bad: Color(0xFFD62F4B),
    chart: [Color(0xFF4D96FF), Color(0xFF3DDC97), Color(0xFFFF6B9D), Color(0xFFFFD23F), Color(0xFFA78BFA)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF15151B), surface: Color(0xFF212129), surfaceAlt: Color(0xFF2A2A33),
    text: Color(0xFFF5EFE0), muted: Color(0xFFBDB7A8), line: Color(0xFFF5EFE0),
    accent: Color(0xFFFF6B9D), onAccent: Color(0xFF0A0A0A),
    ok: Color(0xFF3DDC97), warn: Color(0xFFFFD23F), bad: Color(0xFFFF6B9D),
    chart: [Color(0xFF4D96FF), Color(0xFF3DDC97), Color(0xFFFF6B9D), Color(0xFFFFD23F), Color(0xFFA78BFA)],
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
