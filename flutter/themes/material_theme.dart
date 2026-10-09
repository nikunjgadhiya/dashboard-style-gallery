// GENERATED from the HTML prototype m-material.html — Material 3 Expressive.
// Usage: MaterialApp(theme: MaterialTheme.light, darkTheme: MaterialTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class MaterialTheme {
  MaterialTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Roboto Flex';
  static const double radius = 24;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFFDF7FF), surface: Color(0xFFF3EDF7), surfaceAlt: Color(0xFFE9DDFF),
    text: Color(0xFF1D1A22), muted: Color(0xFF4A4456), line: Color(0xFFCBC3D6),
    accent: Color(0xFF6D3BD7), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF1C7A52), warn: Color(0xFFA35A00), bad: Color(0xFFBA1A3A),
    chart: [Color(0xFF6D3BD7), Color(0xFFE5527F), Color(0xFFF08A3C), Color(0xFF1C9A6C), Color(0xFF3F7AE0)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF151218), surface: Color(0xFF221E26), surfaceAlt: Color(0xFF4F378B),
    text: Color(0xFFE8E0EC), muted: Color(0xFFCBC3D6), line: Color(0xFF4A4456),
    accent: Color(0xFFCFBCFF), onAccent: Color(0xFF3B0B8F),
    ok: Color(0xFF7FD8A9), warn: Color(0xFFFFB877), bad: Color(0xFFFFB3BF),
    chart: [Color(0xFFCFBCFF), Color(0xFFFFB0C8), Color(0xFFFFB877), Color(0xFF7FD8A9), Color(0xFFA8C7FF)],
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
