// GENERATED from the HTML prototype m-clay.html — Claymorphism Mobile.
// Usage: MaterialApp(theme: ClayTheme.light, darkTheme: ClayTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class ClayTheme {
  ClayTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Nunito';
  static const double radius = 30;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFEFEAFD), surface: Color(0xFFFBFAFF), surfaceAlt: Color(0xFFF1EDFF),
    text: Color(0xFF2E2A4F), muted: Color(0xFF7A7499), line: Color(0x142E2A4F),
    accent: Color(0xFF7C6CF2), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF2FA982), warn: Color(0xFFE08C1A), bad: Color(0xFFF0507A),
    chart: [Color(0xFF7C6CF2), Color(0xFF4FD1A5), Color(0xFFFFB547), Color(0xFFFF7EB6), Color(0xFF5EC8F2)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF17152A), surface: Color(0xFF24213D), surfaceAlt: Color(0xFF2D2950),
    text: Color(0xFFECE9FF), muted: Color(0xFFA49EC6), line: Color(0x14FFFFFF),
    accent: Color(0xFF8F80FF), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF4FD1A5), warn: Color(0xFFFFB547), bad: Color(0xFFFF7E9A),
    chart: [Color(0xFF8F80FF), Color(0xFF4FD1A5), Color(0xFFFFB547), Color(0xFFFF7EB6), Color(0xFF5EC8F2)],
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
