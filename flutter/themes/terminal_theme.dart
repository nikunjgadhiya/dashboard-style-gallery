// GENERATED from the HTML prototype m-terminal.html — Terminal Mobile.
// Usage: MaterialApp(theme: TerminalTheme.light, darkTheme: TerminalTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class TerminalTheme {
  TerminalTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'JetBrains Mono';
  static const double radius = 0;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFF3F0E2), surface: Color(0xFFF8F6EC), surfaceAlt: Color(0xFFE2EFDC),
    text: Color(0xFF10331D), muted: Color(0xFF4A6A52), line: Color(0x4010331D),
    accent: Color(0xFF0B7A34), onAccent: Color(0xFFF3F0E2),
    ok: Color(0xFF0B7A34), warn: Color(0xFF9A5300), bad: Color(0xFFB3261E),
    chart: [Color(0xFF0B7A34), Color(0xFFC27C00), Color(0xFF5B7A63), Color(0xFF10331D), Color(0xFF2AA3A3)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF040904), surface: Color(0xFF071207), surfaceAlt: Color(0xFF0C1F0D),
    text: Color(0xFF33FF66), muted: Color(0xFF25A84C), line: Color(0x4033FF66),
    accent: Color(0xFF33FF66), onAccent: Color(0xFF040904),
    ok: Color(0xFF33FF66), warn: Color(0xFFFFB000), bad: Color(0xFFFF5555),
    chart: [Color(0xFF33FF66), Color(0xFFFFB000), Color(0xFF1F9E45), Color(0xFFB6FF9C), Color(0xFF00D4A0)],
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
