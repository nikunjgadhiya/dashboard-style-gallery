// GENERATED from the HTML prototype m-widgets.html — Widget-Based Home.
// Usage: MaterialApp(theme: WidgetsTheme.light, darkTheme: WidgetsTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class WidgetsTheme {
  WidgetsTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Inter';
  static const double radius = 22;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFDFE6F5), surface: Color(0xD9FFFFFF), surfaceAlt: Color(0xFFF1F4FA),
    text: Color(0xFF111827), muted: Color(0xFF6B7280), line: Color(0x1A111827),
    accent: Color(0xFF2563EB), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF16A34A), warn: Color(0xFFEA580C), bad: Color(0xFFDC2626),
    chart: [Color(0xFF2563EB), Color(0xFF16A34A), Color(0xFF9333EA), Color(0xFFEA580C), Color(0xFFDB2777)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF0B0F1A), surface: Color(0xD91C2233), surfaceAlt: Color(0xFF232A3D),
    text: Color(0xFFF3F4F6), muted: Color(0xFF9CA3AF), line: Color(0x17FFFFFF),
    accent: Color(0xFF60A5FA), onAccent: Color(0xFF0B0F1A),
    ok: Color(0xFF4ADE80), warn: Color(0xFFFB923C), bad: Color(0xFFF87171),
    chart: [Color(0xFF60A5FA), Color(0xFF4ADE80), Color(0xFFC084FC), Color(0xFFFB923C), Color(0xFFF472B6)],
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
