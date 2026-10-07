/* Shared data + rendering for the dashboard style demos.
   Each page supplies its look through CSS variables (--c1..--c5, --muted, --grid, --bar-radius, ...). */
(function () {
  const $ = (s) => document.querySelector(s);
  const html = document.documentElement;
  const css = (n, d = '') => getComputedStyle(html).getPropertyValue(n).trim().replace(/^(['"])(.*)\1$/, '$2') || d;
  const num = (n, d = 0) => { const v = parseFloat(css(n)); return isNaN(v) ? d : v; };
  const fmt = (n) => Math.round(n).toLocaleString('en-IN');
  const money = (n) => (n >= 1e7 ? '₹' + (n / 1e7).toFixed(2) + ' Cr' : '₹' + (n / 1e5).toFixed(1) + ' L');
  const alpha = (hex, a) => {
    let h = hex.replace('#', '');
    if (h.length === 3) h = h.split('').map((c) => c + c).join('');
    const n = parseInt(h, 16);
    return `rgba(${(n >> 16) & 255},${(n >> 8) & 255},${n & 255},${a})`;
  };
  const rand = (k) => { const x = Math.sin(k * 127.1 + 311.7) * 43758.5453; return x - Math.floor(x); };

  /* ---------- icons ---------- */
  const ICONS = {
    home: '<path d="M3 11 12 4l9 7"/><path d="M5 10v10h14V10"/><path d="M10 20v-5h4v5"/>',
    flow: '<circle cx="6" cy="6" r="2.5"/><circle cx="18" cy="18" r="2.5"/><path d="M6 8.5V14a4 4 0 0 0 4 4h5.5"/>',
    truck: '<path d="M2 6h12v10H2zM14 10h4l4 4v2h-8"/><circle cx="6" cy="18" r="2"/><circle cx="18" cy="18" r="2"/>',
    store: '<path d="M3 9l2-5h14l2 5M4 9v11h16V9M3 9h18"/><path d="M9 20v-6h6v6"/>',
    box: '<path d="M21 8 12 3 3 8v8l9 5 9-5z"/><path d="M3 8l9 5 9-5M12 13v8"/>',
    tag: '<path d="M3 3h8l10 10-8 8L3 11z"/><circle cx="7.5" cy="7.5" r="1.5"/>',
    upload: '<path d="M12 15V3M7 8l5-5 5 5"/><path d="M4 15v5h16v-5"/>',
    file: '<path d="M14 3H6v18h12V7z"/><path d="M14 3v4h4M9 13h6M9 17h6"/>',
    cart: '<circle cx="9" cy="20" r="1.5"/><circle cx="18" cy="20" r="1.5"/><path d="M2 3h3l2.5 12h12L22 7H6"/>',
    plus: '<rect x="3" y="3" width="18" height="18" rx="4"/><path d="M12 8v8M8 12h8"/>',
    check: '<circle cx="12" cy="12" r="9"/><path d="m8 12 3 3 5-6"/>',
    clock: '<circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/>',
    note: '<path d="M5 3h14v18H5z"/><path d="M9 8h6M9 12h6M9 16h3"/>',
    image: '<rect x="3" y="4" width="18" height="16" rx="2"/><circle cx="9" cy="10" r="2"/><path d="m21 16-5-5-9 9"/>',
    barcode: '<path d="M4 5v14M7 5v14M11 5v14M14 5v14M18 5v14M20 5v14"/>',
    bag: '<path d="M5 8h14l-1 13H6z"/><path d="M9 8V6a3 3 0 0 1 6 0v2"/>',
    history: '<path d="M3 12a9 9 0 1 0 3-6.7L3 8"/><path d="M3 3v5h5M12 7v5l3 2"/>',
    gear: '<circle cx="12" cy="12" r="3"/><path d="M12 2v3M12 19v3M2 12h3M19 12h3M4.9 4.9 7 7M17 17l2.1 2.1M4.9 19.1 7 17M17 7l2.1-2.1"/>',
    alert: '<path d="M12 3 2 20h20z"/><path d="M12 10v4M12 17h.01"/>',
    search: '<circle cx="11" cy="11" r="7"/><path d="m20 20-4-4"/>',
    bell: '<path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9"/><path d="M10 21a2 2 0 0 0 4 0"/>',
    calendar: '<rect x="3" y="5" width="18" height="16" rx="2"/><path d="M3 10h18M8 3v4M16 3v4"/>',
    menu: '<path d="M4 6h16M4 12h16M4 18h16"/>',
    chev: '<path d="m9 6 6 6-6 6"/>',
    trend: '<path d="m3 17 6-6 4 4 8-8"/><path d="M14 7h7v7"/>',
    sun: '<circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M4.9 4.9l1.4 1.4M17.7 17.7l1.4 1.4M2 12h2M20 12h2M4.9 19.1l1.4-1.4M17.7 6.3l1.4-1.4"/>',
    moon: '<path d="M21 12.8A9 9 0 1 1 11.2 3a7 7 0 0 0 9.8 9.8z"/>',
  };
  const icon = (n, cls = '') =>
    `<svg class="ic ${cls}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">${ICONS[n] || ''}</svg>`;
  window.DashIcon = icon;

  /* ---------- data ---------- */
  const MENU = [
    ['Overview', [['Dashboard', 'home', 1], ['Project Flow', 'flow']]],
    ['Inventory', [['Outside Vendor', 'truck', 0, 1], ['Shop', 'store', 0, 1], ['Main Stock', 'box', 0, 1], ['Master SKU', 'tag', 0, 1], ['Stock Upload', 'upload', 0, 1], ['PDF Stock Upload', 'file']]],
    ['Purchase', [['Amazon PO', 'cart', 0, 1], ['PO Create', 'plus'], ['PO Approved / Release', 'check'], ['Open PO Status', 'clock'], ['GRN / MRN Note', 'note']]],
    ['Catalog', [['Product Image Upload', 'image'], ['Barcode Section', 'barcode']]],
    ['Sales', [['Orders', 'bag', 0, 1], ['Import History', 'history']]],
    ['System', [['Settings', 'gear']]],
  ];
  const PLATFORMS = ['Amazon', 'Flipkart', 'Myntra', 'Ajio', 'FirstCry'];
  const STOCK = [58420, 31250, 27880, 16140, 11598];
  const SHARE = [0.38, 0.25, 0.18, 0.11, 0.08];
  const ALLOC = [[210, 640, 300], [120, 420, 210], [95, 330, 190], [60, 200, 150], [35, 115, 104]];
  const AVG = 2380;
  const SKUS = [
    ['MC-14-BLACK-38', 'Classic T-Shirt', 'Mavic', 1794, 4483206],
    ['MC-14-BLACK-30', 'Classic T-Shirt', 'Mavic', 1757, 4390743],
    ['MC-14-KHAKHI-36', 'Classic T-Shirt', 'Mavic', 1646, 4113354],
    ['MC-14-GREEN-32', 'Classic T-Shirt', 'Mavic', 1609, 4020891],
    ['MC-14-GREY-38', 'Classic T-Shirt', 'Mavic', 1239, 3096261],
    ['MC-14-BLACK-32', 'Classic T-Shirt', 'Mavic', 1105, 2761395],
    ['MC-9-GREEN-36', 'Vooter Men Cargo', 'Vooter', 1037, 1244400],
    ['MDT-37-LIGHT-BROWN-L', 'Jeans', 'Tiffny Denim', 1023, 2455200],
  ];
  const SWATCH = { BLACK: '#262b36', GREEN: '#3f8f5a', GREY: '#9aa3ae', KHAKHI: '#b9a27a', LIGHT: '#a47551' };
  const PERIODS = [
    { name: 'Today', f: 0.034, range: '07 Oct 2026', labels: ['8 AM', '10 AM', '12 PM', '2 PM', '4 PM', '6 PM', '8 PM'] },
    { name: 'This Week', f: 0.24, range: '01 – 07 Oct 2026', labels: ['Thu', 'Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed'] },
    { name: 'This Month', f: 1, range: '08 Sep – 07 Oct 2026', labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'] },
    { name: 'This Quarter', f: 2.95, range: '08 Jul – 07 Oct 2026', labels: ['Jul', 'Aug', 'Sep', 'Oct'] },
    { name: 'This Year', f: 11.8, range: '01 Jan – 07 Oct 2026', labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'] },
  ];
  const series = (p) =>
    PLATFORMS.map((_, j) =>
      p.labels.map((_, i) => Math.round(((6420 * p.f) / p.labels.length) * SHARE[j] * (0.65 + 0.7 * rand(i * 5 + j * 17 + p.labels.length))))
    );

  /* ---------- static icons, menu, mobile nav ---------- */
  document.querySelectorAll('[data-icon]').forEach((el) => el.insertAdjacentHTML('afterbegin', icon(el.dataset.icon)));

  const menu = $('#menu');
  if (menu) {
    menu.innerHTML = MENU.map(([g, items]) =>
      `<div class="nav-group">${g}</div>` +
      items.map(([l, ic, act, sub]) =>
        `<a href="#" class="nav-item${act ? ' active' : ''}">${icon(ic)}<span>${l}</span>${sub ? icon('chev', 'chev') : ''}</a>`).join('')
    ).join('');
    menu.addEventListener('click', (e) => {
      const a = e.target.closest('.nav-item');
      if (!a) return;
      e.preventDefault();
      menu.querySelectorAll('.nav-item').forEach((x) => x.classList.toggle('active', x === a));
      document.body.classList.remove('nav-open');
    });
  }
  $('.menu-btn')?.addEventListener('click', () => document.body.classList.toggle('nav-open'));
  $('.scrim')?.addEventListener('click', () => document.body.classList.remove('nav-open'));

  /* ---------- KPIs ---------- */
  const KPIS = [
    { label: 'Total Stock', value: 145288, delta: 12.5, icon: 'box' },
    { label: 'Total Orders', value: 6420, delta: 18.7, icon: 'cart', orders: true },
    { label: 'Total SKU', value: 3179, delta: 9.3, icon: 'tag' },
    { label: 'Low Stock Items', value: 1705, delta: -5.2, icon: 'alert' },
  ];
  const kpis = $('#kpis');
  if (kpis) {
    kpis.innerHTML = KPIS.map((k, i) =>
      `<div class="kpi kpi-${i + 1}"><div class="kpi-icon">${icon(k.icon)}</div><div class="kpi-body">` +
      `<div class="kpi-label">${k.label}</div><div class="kpi-value"${k.orders ? ' id="ordersValue"' : ''}>${fmt(k.value)}</div>` +
      `<div class="kpi-delta ${k.delta >= 0 ? 'up' : 'down'}">${k.delta >= 0 ? '▲' : '▼'} ${Math.abs(k.delta)}% <span>vs. previous period</span></div></div></div>`
    ).join('');
  }

  /* ---------- table ---------- */
  const body = $('#skuBody');
  if (body) {
    const max = Math.max(...SKUS.map((r) => r[3]));
    body.innerHTML = SKUS.map((r, i) => {
      const sw = SWATCH[r[0].split('-')[2]] || '#888';
      return `<tr><td class="rank">${i + 1}</td>` +
        `<td><div class="sku-cell"><span class="thumb" style="background:${sw}"></span><div><div class="sku">${r[0]}</div><div class="prod">${r[1]}</div></div></div></td>` +
        `<td class="brand-c">${r[2]}</td>` +
        `<td class="num"><div class="qty">${fmt(r[3])}</div><div class="meter"><i style="width:${(r[3] / max) * 100}%"></i></div></td>` +
        `<td class="num rev">₹${fmt(r[4])}</td></tr>`;
    }).join('');
  }

  /* ---------- SKU allocation ---------- */
  const alloc = $('#alloc');
  if (alloc) {
    alloc.innerHTML =
      `<div class="alloc-row alloc-head"><div></div><div></div><div class="alloc-nums"><span>In</span><span>Low</span><span>Out</span><span>Total</span></div></div>` +
      ALLOC.map(([a, b, c], j) => {
        const t = a + b + c;
        return `<div class="alloc-row"><div class="alloc-name"><i style="background:var(--c${j + 1})"></i>${PLATFORMS[j]}</div>` +
          `<div class="alloc-bar"><span class="ok" style="width:${(a / t) * 100}%"></span><span class="warn" style="width:${(b / t) * 100}%"></span><span class="bad" style="width:${(c / t) * 100}%"></span></div>` +
          `<div class="alloc-nums"><b class="ok-t">${a}</b><b class="warn-t">${b}</b><b class="bad-t">${c}</b><b>${fmt(t)}</b></div></div>`;
      }).join('');
    const tot = ALLOC.reduce((s, r) => s + r[0] + r[1] + r[2], 0);
    const sum = (k) => ALLOC.reduce((s, r) => s + r[k], 0);
    const pct = (v) => Math.round((v / tot) * 100) + '%';
    $('#allocSummary').innerHTML =
      `<div><span>Total SKU</span><strong>${fmt(tot)}</strong></div>` +
      `<div class="ok-t"><span>In stock</span><strong>${fmt(sum(0))}</strong><em>${pct(sum(0))}</em></div>` +
      `<div class="warn-t"><span>Low stock</span><strong>${fmt(sum(1))}</strong><em>${pct(sum(1))}</em></div>` +
      `<div class="bad-t"><span>Out of stock</span><strong>${fmt(sum(2))}</strong><em>${pct(sum(2))}</em></div>`;
  }


  /* ---------- theme toggle ---------- */
  const THEME_KEY = 'dash-theme:' + (location.pathname.split('/').pop() || 'index.html');
  const themeBtn = $('#themeToggle');
  const paintThemeBtn = () => {
    if (!themeBtn) return;
    const dark = html.dataset.theme === 'dark';
    themeBtn.innerHTML = icon(dark ? 'sun' : 'moon');
    themeBtn.setAttribute('aria-label', dark ? 'Switch to light mode' : 'Switch to dark mode');
    themeBtn.title = themeBtn.getAttribute('aria-label');
  };
  paintThemeBtn();
  themeBtn?.addEventListener('click', () => {
    html.dataset.theme = html.dataset.theme === 'dark' ? 'light' : 'dark';
    try { localStorage.setItem(THEME_KEY, html.dataset.theme); } catch (e) { /* storage unavailable */ }
    paintThemeBtn();
    if (window.Chart) buildCharts(false);
  });

  /* ---------- charts ---------- */
  if (!window.Chart) return;

  const totalStock = STOCK.reduce((a, b) => a + b, 0);
  if ($('#donutLegend')) {
    $('#donutTotal').textContent = fmt(totalStock);
    $('#donutLegend').innerHTML = PLATFORMS.map((p, j) =>
      `<li><i style="background:var(--c${j + 1})"></i><span>${p}</span><b>${fmt(STOCK[j])}</b><em>${((STOCK[j] / totalStock) * 100).toFixed(1)}%</em></li>`).join('');
  }

  let donut, bar, trend;
  let current = 2;

  // Charts read their colours from CSS variables, so a theme switch rebuilds them.
  function buildCharts(animate) {
    [donut, bar, trend].forEach((c) => c && c.destroy());
    donut = bar = trend = null;
    const colors = [1, 2, 3, 4, 5].map((i) => css('--c' + i, '#888'));
    Chart.defaults.font.family = css('--font', 'Inter, sans-serif');
    Chart.defaults.color = css('--muted', '#888');
    Chart.defaults.animation.duration = animate ? 1000 : 0;
    Object.assign(Chart.defaults.plugins.tooltip, {
      backgroundColor: css('--tip-bg', '#111827'), titleColor: css('--tip-fg', '#fff'), bodyColor: css('--tip-fg', '#fff'),
      padding: 10, cornerRadius: num('--tip-radius', 8), boxPadding: 4, usePointStyle: true,
    });

    if ($('#donutChart')) {
      donut = new Chart($('#donutChart'), {
        type: 'doughnut',
        data: { labels: PLATFORMS, datasets: [{
          data: STOCK, backgroundColor: colors, borderColor: css('--donut-border', 'transparent'), borderWidth: num('--donut-bw', 0),
          borderRadius: num('--donut-radius', 0), spacing: num('--donut-spacing', 0), hoverOffset: 6,
        }] },
        options: { cutout: css('--donut-cutout', '72%'), maintainAspectRatio: false, layout: { padding: 6 }, plugins: { legend: { display: false } } },
      });
    }

    const stacked = css('--bar-stacked') === '1';
    if ($('#barChart')) {
      bar = new Chart($('#barChart'), {
        type: 'bar',
        data: { labels: [], datasets: PLATFORMS.map((p, j) => ({
          label: p, data: [], backgroundColor: colors[j], borderRadius: num('--bar-radius', 4),
          borderColor: css('--bar-border', 'transparent'), borderWidth: num('--bar-bw', 0),
          borderSkipped: stacked ? false : 'start', maxBarThickness: stacked ? 30 : 12,
        })) },
        options: {
          maintainAspectRatio: false, interaction: { mode: 'index', intersect: false },
          plugins: { legend: { position: 'top', align: 'end', labels: { usePointStyle: true, pointStyle: 'rectRounded', boxWidth: 8, boxHeight: 8, padding: 14 } } },
          scales: {
            x: { stacked, grid: { display: false }, border: { display: false } },
            y: { stacked, grid: { color: css('--grid', 'rgba(0,0,0,.06)') }, border: { display: false }, ticks: { maxTicksLimit: 6 } },
          },
        },
      });
    }

    if ($('#trendChart')) {
      const col = css('--trend', colors[0]);
      trend = new Chart($('#trendChart'), {
        type: 'line',
        data: { labels: [], datasets: [{
          data: [], borderColor: col, borderWidth: 3, tension: 0.4, pointRadius: 0, pointHoverRadius: 5, pointBackgroundColor: col, fill: true,
          backgroundColor: (ctx) => {
            const a = ctx.chart.chartArea;
            if (!a) return 'transparent';
            const g = ctx.chart.ctx.createLinearGradient(0, a.top, 0, a.bottom);
            g.addColorStop(0, alpha(col, 0.35));
            g.addColorStop(1, alpha(col, 0));
            return g;
          },
        }] },
        options: {
          maintainAspectRatio: false,
          plugins: { legend: { display: false }, tooltip: { callbacks: { label: (c) => ' ' + money(c.parsed.y) } } },
          scales: {
            x: { grid: { display: false }, border: { display: false }, ticks: { color: css('--trend-tick', css('--muted')) } },
            y: { grid: { color: css('--trend-grid', css('--grid')) }, border: { display: false },
                 ticks: { maxTicksLimit: 5, color: css('--trend-tick', css('--muted')), callback: (v) => money(v) } },
          },
        },
      });
    }
    setPeriod(current);
  }

  /* ---------- period switch ---------- */
  const periods = $('#periods');
  function setPeriod(i) {
    current = i;
    const p = PERIODS[i];
    const s = series(p);
    const totals = p.labels.map((_, k) => s.reduce((a, d) => a + d[k], 0));
    const orders = totals.reduce((a, b) => a + b, 0);
    if (bar) { bar.data.labels = p.labels; s.forEach((d, j) => (bar.data.datasets[j].data = d)); bar.update(); }
    if (trend) { trend.data.labels = p.labels; trend.data.datasets[0].data = totals.map((t) => t * AVG); trend.update(); }
    const set = (sel, v) => { const el = $(sel); if (el) el.textContent = v; };
    set('#ordersValue', fmt(orders));
    set('#trendTotal', money(orders * AVG));
    set('#dateRange', p.range);
    document.querySelectorAll('[data-period-name]').forEach((el) => (el.textContent = p.name.toLowerCase()));
    periods?.querySelectorAll('button').forEach((b, k) => b.classList.toggle('active', k === i));
  }
  if (periods) {
    periods.innerHTML = PERIODS.map((p) => `<button type="button">${p.name}</button>`).join('');
    periods.addEventListener('click', (e) => {
      const b = e.target.closest('button');
      if (b) setPeriod([...periods.children].indexOf(b));
    });
  }
  buildCharts(true);
})();
