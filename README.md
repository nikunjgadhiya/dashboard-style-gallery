# Dashboard Style Gallery

One inventory dashboard (TIFFNY Inventory: stock and master SKU manager) built in many UI design styles. Every page has the same sidebar menu, KPIs and charts, so you can compare the styles directly.

Each page includes:

- A sidebar with the full grouped menu (Overview, Inventory, Purchase, Catalog, Sales, System), collapsible on mobile
- A top bar with search, a light/dark mode switch, notifications and the user chip
- Period tabs (Today, This Week, This Month, This Quarter, This Year) that update the orders KPI, the bar chart and the date range
- 4 KPI cards: Total Stock, Total Orders, Total SKU, Low Stock Items
- A **platform-wise stock** donut chart (Amazon, Flipkart, Myntra, Ajio, FirstCry)
- A **platform-wise orders** bar chart
- A **top selling SKU** table
- **Platform-wise SKU allocation** (In / Low / Out of stock)

> All numbers are demo data.

---

## Style status

### ✅ Done

| # | Style | File | Default theme | Key CSS | Best for |
|---|-------|------|---------------|---------|----------|
| 1 | Glassmorphism | `glassmorphism.html` | Dark | `backdrop-filter: blur()`, `rgba()` panels | Creative, multimedia, dark UIs |
| 2 | Neumorphism | `neumorphism.html` | Light | Dual `box-shadow` (light + dark), `inset` | Smart-home panels, minimal tools |
| 3 | Claymorphism | `claymorphism.html` | Light | Large `border-radius`, multi `inset` shadows | Fintech, friendly AI, gamified apps |
| 4 | Aurora UI | `aurora.html` | Dark | Animated blurred gradients, glow | Futuristic tech, premium hero widgets |
| 5 | Bento Box UI | `bento.html` | Light | `grid-template-areas`, `gap` | Analytics screens, SaaS hubs |
| 6 | Neo-Brutalism (Mono) | `brutalism.html` | Light | Thick borders, `box-shadow: 5px 5px 0`, monospace | Tools, utilities, developer products |
| 7 | Neo-Brutalism (Colour) | `brutalism-color.html` | Light | Same with flat saturated fills | Playful SaaS, creator tools |
| 8 | Memphis | `memphis.html` | Light | Inline SVG shapes, `clip-path`, patterns | Youthful, creative, playful brands |

Every done style has a working **light and dark mode**.

### ⏳ Pending (ideas for the next styles)

| # | Style | Look | Key CSS | Best for |
|---|-------|------|---------|----------|
| 9 | Liquid Glass | Apple-style refractive glass with specular highlights | `backdrop-filter`, SVG `feDisplacementMap`, layered highlights | Premium consumer apps |
| 10 | Material Design 3 | Tonal surfaces, dynamic colour, rounded containers | Tonal palette tokens, elevation | Android and Google-style apps |
| 11 | Fluent (Mica / Acrylic) | Windows 11 translucent layers, subtle depth | `backdrop-filter`, noise texture | Enterprise and Microsoft-style tools |
| 12 | Swiss / Minimal | Strict grid, big type, almost no decoration | Typographic scale, hairlines | Reports, finance, editorial |
| 13 | Cyberpunk / Neon | Dark chrome, neon outlines, glitch accents | `text-shadow` glow, `clip-path` angles | Gaming, crypto, tech |
| 14 | Retro Windows 95 | Bevelled grey windows, title bars, pixel icons | `border-style: outset/inset` | Fun internal tools, nostalgia |
| 15 | Terminal / Hacker | Green-on-black CRT, ASCII charts, scanlines | Monospace, `repeating-linear-gradient` scanlines | Dev ops, monitoring |
| 16 | Vaporwave / Y2K | Pastel gradients, chrome text, grids | Gradient text, perspective grid | Music, fashion, creative |
| 17 | Skeuomorphism | Real-world textures: leather, metal, paper | Textures, gradients, realistic shadows | Calculators, audio apps |
| 18 | Paper / Notebook | Lined paper, sticky notes, hand-drawn charts | Background lines, handwritten fonts | Education, planners |
| 19 | Dark Luxury | Black and gold, serif type, thin rules | Serif fonts, gold gradients | Premium brands, jewellery, fashion |
| 20 | Kawaii / Pastel | Soft pastels, cute icons, bubbly shapes | Pastel tokens, rounded everything | Kids, lifestyle apps |

---

## Run locally

The pages share `assets/base.css` and `assets/dashboard.js`, so serve the folder rather than opening the files directly:

```bash
python -m http.server 5510
```

Then open <http://localhost:5510> to see the gallery.

You need an internet connection for Chart.js (cdnjs) and Google Fonts.

## Project structure

```
index.html              Gallery that links every style
glassmorphism.html      Style pages: each one is layout markup plus its own <style>
neumorphism.html
claymorphism.html
aurora.html
bento.html
brutalism.html
brutalism-color.html    Reuses brutalism.html styles, adds a colour layer at the end
memphis.html
assets/
  base.css              Shared structural layout and responsive rules
  dashboard.js          Shared demo data, menu, KPIs, table, charts, period tabs, theme toggle
```

## Adding a new style

1. Copy an existing page (Glassmorphism has the plainest markup).
2. Rename the theme key in the small `<head>` script (`dash-theme:<file>.html`) and set the default in `<html data-theme="...">`.
3. Restyle using CSS variables. The charts read these automatically:
   - `--c1` to `--c5`: chart and platform colours
   - `--muted`, `--grid`: chart text and grid lines
   - `--bar-radius`, `--bar-border`, `--bar-bw`, `--bar-stacked`: bar chart shape
   - `--donut-border`, `--donut-bw`, `--donut-radius`, `--donut-spacing`, `--donut-cutout`: donut chart shape
   - `--trend`: line colour for the optional revenue chart (`#trendChart`)
4. Add a `:root[data-theme="dark"]` (or `"light"`) block for the opposite theme.
5. Add a card to `index.html` and move the style from **Pending** to **Done** above.
