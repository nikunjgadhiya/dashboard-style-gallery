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

## ✅ Done (20)

| # | Style | File | Default theme | Flutter theme |
|---|-------|------|---------------|---------------|
| M1 | iOS 26 Liquid Glass | `m-ios-glass.html` | Light | `flutter/themes/ios_glass_theme.dart` |
| M2 | Material 3 Expressive | `m-material.html` | Light | `flutter/themes/material_theme.dart` |
| M3 | One UI (Samsung) | `m-oneui.html` | Light | `flutter/themes/oneui_theme.dart` |
| M4 | HarmonyOS / Fluent Mobile | `m-harmony.html` | Light | `flutter/themes/harmony_theme.dart` |
| M5 | Glassmorphism Mobile | `m-glass.html` | Dark | `flutter/themes/glass_theme.dart` |
| M6 | Neumorphism Mobile | `m-neu.html` | Light | `flutter/themes/neu_theme.dart` |
| M7 | Claymorphism Mobile | `m-clay.html` | Light | `flutter/themes/clay_theme.dart` |
| M8 | Bento Mobile | `m-bento.html` | Light | `flutter/themes/bento_theme.dart` |
| M9 | Neo-Brutalism Mobile | `m-brutal.html` | Light | `flutter/themes/brutal_theme.dart` |
| M10 | Dark Luxury Mobile | `m-luxury.html` | Dark | `flutter/themes/luxury_theme.dart` |
| M11 | Kawaii Mobile | `m-kawaii.html` | Light | `flutter/themes/kawaii_theme.dart` |
| M12 | Terminal Mobile | `m-terminal.html` | Dark | `flutter/themes/terminal_theme.dart` |
| M13 | Swiss Minimal Mobile | `m-swiss.html` | Light | `flutter/themes/swiss_theme.dart` |
| M14 | Card Stack / Swipe | `m-swipe.html` | Light | `flutter/themes/swipe_theme.dart` |
| M15 | Super-App Grid | `m-superapp.html` | Light | `flutter/themes/superapp_theme.dart` |
| M16 | Widget-Based Home | `m-widgets.html` | Light | `flutter/themes/widgets_theme.dart` |
| M17 | Chat-First AI Assistant | `m-chat.html` | Light | `flutter/themes/chat_theme.dart` |
| M18 | Scanner-First Warehouse | `m-scanner.html` | Dark | `flutter/themes/scanner_theme.dart` |
| M19 | Map / Location View | `m-map.html` | Light | `flutter/themes/map_theme.dart` |
| M20 | Wearable Companion | `m-watch.html` | Dark | `flutter/themes/watch_theme.dart` |

All 20 styles have 10 working screens (Home, Stock, SKU detail, Orders, Scan, Purchase orders, New PO, Alerts, Profile, More), search and filters, charts, and a light/dark switch (in Profile, or in the side panel on desktop).

---

## ⏳ Pending (next ideas)

| # | Style | Look | Best for |
|---|-------|------|----------|
| M21 | Tablet / iPad Split View | Sidebar + list + detail in three columns on a tablet frame | Store managers on iPad |
| M22 | Foldable (Galaxy Fold) | Cover-screen summary that unfolds into a two-pane dashboard | Power users |
| M23 | Voice-First | Big mic button, spoken answers shown as cards, waveform | Hands-busy warehouse staff |
| M24 | AR Shelf Scan | Camera view with floating stock labels over shelves | Shelf audits |
| M25 | Kiosk / Rugged Handheld | Huge buttons, physical-key hints, sunlight-readable contrast | Zebra-style scanners |
| M26 | Notification-Centric | Lock-screen-style live activities and actionable notifications | Managers on the move |

---

## Build notes (for later)

- **Frame:** each style is one HTML file with a centred phone frame (notch / status bar) on desktop, and full-screen on real phones.
- **Navigation:** screens switch inside one page using the bottom tab bar, with no reload.
- **Data and charts:** reuse `assets/dashboard.js` for the data, with charts tuned for small widths.
- **Theme:** the light/dark toggle sits on the Profile screen and is remembered per style, like the web pages.
- **Gallery:** add a `mobile.html` gallery page linking all mobile styles, and add a link to it from `index.html`.
- **Built:** all 20 styles (M1–M20). Pattern styles (M8, M14–M20) replace the Home screen through `window.MobileVariant` in `assets/mobile.js`.

