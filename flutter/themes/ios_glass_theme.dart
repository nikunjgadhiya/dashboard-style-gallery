// GENERATED from the HTML prototype m-ios-glass.html — iOS 26 Liquid Glass.
// Usage: MaterialApp(theme: IosGlassTheme.light, darkTheme: IosGlassTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class IosGlassTheme {
  IosGlassTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Inter';
  static const double radius = 22;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFE9EEF7), surface: Color(0xB8FFFFFF), surfaceAlt: Color(0x73FFFFFF),
    text: Color(0xFF0B0B0F), muted: Color(0xFF5E6270), line: Color(0x243C3C43),
    accent: Color(0xFF007AFF), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF28A745), warn: Color(0xFFE08600), bad: Color(0xFFFF3B30),
    chart: [Color(0xFF007AFF), Color(0xFF34C759), Color(0xFFAF52DE), Color(0xFFFF9500), Color(0xFFFF2D55)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF0B0C12), surface: Color(0xA624242E), surfaceAlt: Color(0x17FFFFFF),
    text: Color(0xFFF5F5F7), muted: Color(0xFFA1A1AB), line: Color(0x1FFFFFFF),
    accent: Color(0xFF0A84FF), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF30D158), warn: Color(0xFFFF9F0A), bad: Color(0xFFFF453A),
    chart: [Color(0xFF0A84FF), Color(0xFF30D158), Color(0xFFBF5AF2), Color(0xFFFF9F0A), Color(0xFFFF375F)],
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
