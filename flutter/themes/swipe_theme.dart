// GENERATED from the HTML prototype m-swipe.html — Card Stack / Swipe.
// Usage: MaterialApp(theme: SwipeTheme.light, darkTheme: SwipeTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class SwipeTheme {
  SwipeTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Outfit';
  static const double radius = 26;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFFFF1F0), surface: Color(0xFFFFFFFF), surfaceAlt: Color(0xFFFFF5F4),
    text: Color(0xFF24151A), muted: Color(0xFF7F6A70), line: Color(0x1424151A),
    accent: Color(0xFFFF4F6D), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF1FB37A), warn: Color(0xFFF29A1D), bad: Color(0xFFFF4F6D),
    chart: [Color(0xFFFF4F6D), Color(0xFFFF9A3C), Color(0xFF7C5CFF), Color(0xFF1FB37A), Color(0xFF2FA8FF)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF170D12), surface: Color(0xFF24161D), surfaceAlt: Color(0xFF2E1D25),
    text: Color(0xFFFDEEF1), muted: Color(0xFFC2A6AE), line: Color(0x17FFFFFF),
    accent: Color(0xFFFF6A85), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF34D399), warn: Color(0xFFFBBF24), bad: Color(0xFFFF6A85),
    chart: [Color(0xFFFF6A85), Color(0xFFFFAD5C), Color(0xFF9A82FF), Color(0xFF34D399), Color(0xFF5CBCFF)],
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
