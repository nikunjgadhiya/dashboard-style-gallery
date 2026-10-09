# Flutter themes

Each mobile prototype (`m-*.html`) has a matching Flutter theme generated from the same colour tokens, so a style you like in the browser can be used in a Flutter app.

```
flutter/
  inventory_colors.dart        ThemeExtension for status + chart colours (shared)
  themes/
    ios_glass_theme.dart       M1 iOS 26 Liquid Glass
    material_theme.dart        M2 Material 3 Expressive
    bento_theme.dart           M8 Bento Mobile
    chat_theme.dart            M17 Chat-First AI Assistant
    scanner_theme.dart         M18 Scanner-First Warehouse
```

## Use a theme

Copy `inventory_colors.dart` and the theme file you want into your app (for example `lib/theme/`), then:

```dart
import 'theme/themes/bento_theme.dart';

MaterialApp(
  theme: BentoTheme.light,
  darkTheme: BentoTheme.dark,
  themeMode: ThemeMode.system,
  home: const HomeScreen(),
);
```

Status and chart colours (in stock / low / out, platform colours) come from the theme extension:

```dart
final c = Theme.of(context).extension<InventoryColors>()!;
Container(color: c.warn);      // low-stock badge
PieChartSectionData(color: c.chart[0]);   // Amazon slice (fl_chart)
```

## What each theme sets

- **`ColorScheme`:** primary = accent, surface, onSurface, error and outline colours
- **App background:** `scaffoldBackgroundColor`
- **Shapes:** `CardThemeData` and chip corner radius from the prototype
- **Navigation bar:** `NavigationBarThemeData` with the accent indicator
- **Font:** `fontFamily`. Add the font to `pubspec.yaml`, or use `google_fonts`.

## Not covered by a theme

Glass blur, clipped shapes (cookie/flower icons), gradients and screen layouts are widget work, not theme data. Build them with `BackdropFilter`, `ClipPath`/`ShapeBorder`, `DecoratedBox` and the screen structure from the HTML prototype. Charts map to `fl_chart`: the donut is a `PieChart`, orders is a `BarChart`, and the sales trend is a `LineChart`.

The files require Flutter 3.27 or newer, for `CardThemeData` and `Color.withValues`.
