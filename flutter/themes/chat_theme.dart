// GENERATED from the HTML prototype m-chat.html — Chat-First AI Assistant.
// Usage: MaterialApp(theme: ChatTheme.light, darkTheme: ChatTheme.dark, ...)
// Status/chart colours: Theme.of(context).extension<InventoryColors>()!
import 'package:flutter/material.dart';
import '../inventory_colors.dart';

class ChatTheme {
  ChatTheme._();

  /// Add this font in pubspec.yaml (or use google_fonts).
  static const String fontFamily = 'Inter';
  static const double radius = 20;

  static final ThemeData light = _build(Brightness.light, _light);
  static final ThemeData dark = _build(Brightness.dark, _dark);

  static const _light = _Palette(
    bg: Color(0xFFF7F7FB), surface: Color(0xFFFFFFFF), surfaceAlt: Color(0xFFEFEFF7),
    text: Color(0xFF14142B), muted: Color(0xFF6B6B85), line: Color(0x1414142B),
    accent: Color(0xFF6D4AFF), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF12A150), warn: Color(0xFFD97706), bad: Color(0xFFE5484D),
    chart: [Color(0xFF6D4AFF), Color(0xFF2F80FF), Color(0xFF14B8A6), Color(0xFFF59E0B), Color(0xFFEC4899)],
  );

  static const _dark = _Palette(
    bg: Color(0xFF0D0D16), surface: Color(0xFF181826), surfaceAlt: Color(0xFF232336),
    text: Color(0xFFF0F0FF), muted: Color(0xFF9A9AB8), line: Color(0x17FFFFFF),
    accent: Color(0xFF8F75FF), onAccent: Color(0xFFFFFFFF),
    ok: Color(0xFF3ECF8E), warn: Color(0xFFFBBF24), bad: Color(0xFFFF6B6F),
    chart: [Color(0xFF8F75FF), Color(0xFF5AA0FF), Color(0xFF2DD4BF), Color(0xFFFBBF24), Color(0xFFF472B6)],
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
