// GENERATED from the HTML prototype m-oneui.html — One UI (Samsung).
// Usage: MaterialApp(theme: OneuiTheme.light, darkTheme: OneuiTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class OneuiTheme {
  OneuiTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Inter Tight';
  static const double radius = 26;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFF4F4F6), surface: Color(0xFFFFFFFF), surfaceAlt: Color(0xFFECECF0),
    text: Color(0xFF111114), muted: Color(0xFF6B6B73), line: Color(0x0F111114),
    accent: Color(0xFF3E7BFA), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF1FA35C), warn: Color(0xFFE88A00), bad: Color(0xFFF2364A),
    chart: [Color(0xFF3E7BFA), Color(0xFF2CC5A4), Color(0xFF8B6CF6), Color(0xFFFFA31A), Color(0xFFFF5C7A)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF000000), surface: Color(0xFF17171A), surfaceAlt: Color(0xFF232327),
    text: Color(0xFFFAFAFA), muted: Color(0xFF9B9BA3), line: Color(0x14FFFFFF),
    accent: Color(0xFF5B93FF), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF3DDC84), warn: Color(0xFFFFB340), bad: Color(0xFFFF5A6A),
    chart: [Color(0xFF5B93FF), Color(0xFF3FD9B8), Color(0xFFA48BFF), Color(0xFFFFB340), Color(0xFFFF7A92)],
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
