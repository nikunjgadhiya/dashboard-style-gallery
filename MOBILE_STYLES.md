# Mobile App Design Styles

Mobile app versions of the TIFFNY Inventory dashboard as clickable phone-sized HTML prototypes (shown in a 390×844 frame on desktop, full screen on a real phone), with the same data as the web gallery. Browse them in `mobile.html`. Each style also exports a Flutter `ThemeData` file to `flutter/themes/` (see `flutter/README.md`).

## Screens per design

Every style should cover the same set of screens so they compare side by side:

| # | Screen | Contents |
|---|--------|----------|
| 1 | Home / Dashboard | Greeting, period switcher, 4 KPI cards, stock donut, mini order chart |
| 2 | Stock | Search, platform filter chips, SKU list with stock status badges |
| 3 | SKU Detail | Product image, stock per platform, reorder button, history chart |
| 4 | Orders | Order list grouped by day, status pills, swipe actions |
| 5 | Scan | Barcode scanner camera view with result sheet |
| 6 | Purchase Orders | PO list, create-PO flow (multi-step form) |
| 7 | Alerts | Low-stock and out-of-stock notifications |
| 8 | Profile / Settings | User card, light/dark toggle, preferences |

Common pieces: bottom tab bar (Home, Stock, Scan, Orders, More), a floating scan button, pull-to-refresh, bottom sheets, and light/dark mode.

---

## ✅ Done

| # | Style | File | Default theme | Flutter theme |
|---|-------|------|---------------|---------------|
| M1 | iOS 26 Liquid Glass | `m-ios-glass.html` | Light | `flutter/themes/ios_glass_theme.dart` |
| M2 | Material 3 Expressive | `m-material.html` | Light | `flutter/themes/material_theme.dart` |
| M8 | Bento Mobile | `m-bento.html` | Light | `flutter/themes/bento_theme.dart` |
| M17 | Chat-First AI Assistant | `m-chat.html` | Light | `flutter/themes/chat_theme.dart` |
| M18 | Scanner-First Warehouse | `m-scanner.html` | Dark | `flutter/themes/scanner_theme.dart` |

All done styles have 10 working screens (Home, Stock, SKU detail, Orders, Scan, Purchase orders, New PO, Alerts, Profile, More), search and filters, charts, and a light/dark switch (in Profile, or in the side panel on desktop).

---

## ⏳ Pending mobile styles

### Platform-native

| # | Style | Look | Best for |
|---|-------|------|----------|
| M1 | ~~iOS 26 Liquid Glass~~ ✅ | Glass tab bar and sheets, large titles, SF-style type, inset grouped lists | iPhone-first apps |
| M2 | ~~Material 3 Expressive (Android)~~ ✅ | Shape-morphing FAB, navigation bar with pill indicator, tonal surfaces | Android-first apps |
| M3 | One UI (Samsung) | Big header area for reachability, content in the bottom half, rounded cards | One-handed use |
| M4 | HarmonyOS / Fluent mobile | Clean cards, soft depth, cross-device style | Enterprise mobile |

### Visual styles (adapted from the web gallery)

| # | Style | Look | Best for |
|---|-------|------|----------|
| M5 | Glassmorphism Mobile | Frosted cards over a gradient wallpaper, glass tab bar | Consumer, lifestyle |
| M6 | Neumorphism Mobile | Soft raised controls, pressed tab icons, calm palette | Smart-home, utilities |
| M7 | Claymorphism Mobile | Puffy pastel cards, bouncy buttons, playful icons | Friendly fintech |
| M8 | ~~Bento Mobile~~ ✅ | Single-column bento tiles of mixed sizes, bold hero tile | Analytics summaries |
| M9 | Neo-Brutalism Mobile | Thick borders, hard shadows, loud colour blocks | Creator and indie apps |
| M10 | Dark Luxury Mobile | Black and gold, serif numbers, minimal chrome | Premium retail |
| M11 | Kawaii Mobile | Pastel, cat-ear cards, sticker icons, cheerful empty states | Kids, lifestyle |
| M12 | Terminal Mobile | Green-on-black, monospace, command-style search | Developer tools |
| M13 | Swiss Minimal Mobile | Big type, strict grid, one accent colour | Reports, finance |

### Mobile-first patterns

| # | Style | Look | Best for |
|---|-------|------|----------|
| M14 | Card Stack / Swipe | Tinder-style swipeable SKU cards to approve or reorder | Fast decisions |
| M15 | Super-App Grid | Icon grid home (like WeChat / Paytm) with mini-app tiles | Multi-module apps |
| M16 | Widget-Based Home | Home made of resizable widgets (iOS / Android widget look) | At-a-glance stats |
| M17 | ~~Chat-First / AI Assistant~~ ✅ | Conversational home ("How much stock on Amazon?") with answer cards | AI-driven apps |
| M18 | ~~Scanner-First Warehouse~~ ✅ | Camera-dominant UI, big tap targets, high contrast for warehouse floors | Field and warehouse staff |
| M19 | Map / Location View | Warehouse and store locations on a map with stock pins | Multi-location inventory |
| M20 | Wearable Companion | Apple Watch / Wear OS glanceable KPIs and alerts | Managers on the move |

---

## Build notes (for later)

- **Frame:** each style is one HTML file with a centred phone frame (notch / status bar) on desktop, and full-screen on real phones.
- **Navigation:** screens switch inside one page using the bottom tab bar, with no reload.
- **Data and charts:** reuse `assets/dashboard.js` for the data, with charts tuned for small widths.
- **Theme:** the light/dark toggle sits on the Profile screen and is remembered per style, like the web pages.
- **Gallery:** add a `mobile.html` gallery page linking all mobile styles, and add a link to it from `index.html`.
- **Suggested order:** ~~M1 → M2 → M18 → M8 → M17~~ (done), then M3–M7, M9–M16, M19, M20.
