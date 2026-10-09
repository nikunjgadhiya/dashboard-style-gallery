// GENERATED from the HTML prototype m-scanner.html — Scanner-First Warehouse.
// Usage: MaterialApp(theme: ScannerTheme.light, darkTheme: ScannerTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class ScannerTheme {
  ScannerTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Barlow';
  static const double radius = 14;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFECECEA), surface: Color(0xFFFFFFFF), surfaceAlt: Color(0xFFE0E0DC),
    text: Color(0xFF0D0D0D), muted: Color(0xFF4A4A46), line: Color(0x260D0D0D),
    accent: Color(0xFFFFCC00), onAccent: Color(0xFF0D0D0D),
    ok: Color(0xFF0A8F3D), warn: Color(0xFFC26A00), bad: Color(0xFFD61F1F),
    chart: [Color(0xFF0D0D0D), Color(0xFFFFCC00), Color(0xFF0A8F3D), Color(0xFFD61F1F), Color(0xFF6B6B66)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF0B0B0B), surface: Color(0xFF1A1A1A), surfaceAlt: Color(0xFF262626),
    text: Color(0xFFFFFFFF), muted: Color(0xFFB5B5B0), line: Color(0x26FFFFFF),
    accent: Color(0xFFFFD400), onAccent: Color(0xFF0B0B0B),
    ok: Color(0xFF3DDC84), warn: Color(0xFFFFA31A), bad: Color(0xFFFF4D4D),
    chart: [Color(0xFFFFD400), Color(0xFFFFFFFF), Color(0xFF3DDC84), Color(0xFFFF4D4D), Color(0xFF8A8A85)],
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
