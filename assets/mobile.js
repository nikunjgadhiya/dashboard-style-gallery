/* Shared app for the mobile prototypes: builds the screens, handles navigation, charts and theme.
   Each style page only supplies CSS tokens (--bg, --surface, --accent, --c1..--c5, ...) and its own touches. */
(function () {
  const $ = (s, r = document) => r.querySelector(s);
  const $$ = (s, r = document) => [...r.querySelectorAll(s)];
  const html = document.documentElement;
  const css = (n, d = '') => getComputedStyle(html).getPropertyValue(n).trim().replace(/^(['"])(.*)\1$/, '$2') || d;
  const num = (n, d = 0) => { const v = parseFloat(css(n)); return isNaN(v) ? d : v; };
  const fmt = (n) => Math.round(n).toLocaleString('en-IN');
  const rupee = (n) => '₹' + fmt(n);
  const lakh = (n) => (n >= 1e7 ? (n / 1e7).toFixed(2) + ' Cr' : (n / 1e5).toFixed(1) + ' L');
  const rand = (k) => { const x = Math.sin(k * 127.1 + 311.7) * 43758.5453; return x - Math.floor(x); };

  const ICONS = {
    home: '<path d="M3 11 12 4l9 7"/><path d="M5 10v10h14V10"/><path d="M10 20v-5h4v5"/>',
    box: '<path d="M21 8 12 3 3 8v8l9 5 9-5z"/><path d="M3 8l9 5 9-5M12 13v8"/>',
    scan: '<path d="M4 8V5a1 1 0 0 1 1-1h3M16 4h3a1 1 0 0 1 1 1v3M20 16v3a1 1 0 0 1-1 1h-3M8 20H5a1 1 0 0 1-1-1v-3"/><path d="M7 9v6M10 9v6M13 9v6M17 9v6"/>',
    bag: '<path d="M5 8h14l-1 13H6z"/><path d="M9 8V6a3 3 0 0 1 6 0v2"/>',
    grid: '<rect x="4" y="4" width="7" height="7" rx="2"/><rect x="13" y="4" width="7" height="7" rx="2"/><rect x="4" y="13" width="7" height="7" rx="2"/><rect x="13" y="13" width="7" height="7" rx="2"/>',
    bell: '<path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9"/><path d="M10 21a2 2 0 0 0 4 0"/>',
    search: '<circle cx="11" cy="11" r="7"/><path d="m20 20-4-4"/>',
    back: '<path d="m15 18-6-6 6-6"/>',
    chev: '<path d="m9 6 6 6-6 6"/>',
    plus: '<path d="M12 5v14M5 12h14"/>',
    filter: '<path d="M4 6h16M7 12h10M10 18h4"/>',
    check: '<path d="m5 12 5 5 9-10"/>',
    alert: '<path d="M12 3 2 20h20z"/><path d="M12 10v4M12 17h.01"/>',
    clock: '<circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/>',
    truck: '<path d="M2 6h12v10H2zM14 10h4l4 4v2h-8"/><circle cx="6" cy="18" r="2"/><circle cx="18" cy="18" r="2"/>',
    user: '<circle cx="12" cy="8" r="4"/><path d="M4 21a8 8 0 0 1 16 0"/>',
    moon: '<path d="M21 12.8A9 9 0 1 1 11.2 3a7 7 0 0 0 9.8 9.8z"/>',
    sun: '<circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M4.9 4.9l1.4 1.4M17.7 17.7l1.4 1.4M2 12h2M20 12h2M4.9 19.1l1.4-1.4M17.7 6.3l1.4-1.4"/>',
    globe: '<circle cx="12" cy="12" r="9"/><path d="M3 12h18M12 3a14 14 0 0 1 0 18M12 3a14 14 0 0 0 0 18"/>',
    logout: '<path d="M15 4h4v16h-4M10 8l-4 4 4 4M6 12h10"/>',
    cart: '<circle cx="9" cy="20" r="1.5"/><circle cx="18" cy="20" r="1.5"/><path d="M2 3h3l2.5 12h12L22 7H6"/>',
    tag: '<path d="M3 3h8l10 10-8 8L3 11z"/><circle cx="7.5" cy="7.5" r="1.5"/>',
    file: '<path d="M14 3H6v18h12V7z"/><path d="M14 3v4h4M9 13h6M9 17h6"/>',
    x: '<path d="M6 6l12 12M18 6 6 18"/>',
    flash: '<path d="M13 2 4 14h7l-1 8 9-12h-7z"/>',
    more: '<circle cx="5" cy="12" r="1.5"/><circle cx="12" cy="12" r="1.5"/><circle cx="19" cy="12" r="1.5"/>',
    shirt: '<path d="M8 3 3 6l2 5 3-1v11h8V10l3 1 2-5-5-3a4 4 0 0 1-8 0z"/>',
    sliders: '<path d="M4 6h10M18 6h2M4 12h4M12 12h8M4 18h12M20 18h0"/><circle cx="16" cy="6" r="2"/><circle cx="10" cy="12" r="2"/><circle cx="18" cy="18" r="2"/>',
    help: '<circle cx="12" cy="12" r="9"/><path d="M9.5 9a2.5 2.5 0 1 1 3.5 2.3c-.6.3-1 .9-1 1.7M12 17h.01"/>',
    upload: '<path d="M12 15V3M7 8l5-5 5 5"/><path d="M4 15v5h16v-5"/>',
    calendar: '<rect x="3" y="5" width="18" height="16" rx="2"/><path d="M3 10h18M8 3v4M16 3v4"/>',
    trend: '<path d="m3 17 6-6 4 4 8-8"/><path d="M14 7h7v7"/>',
  };
  const icon = (n, c = '') => `<svg class="ic ${c}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round">${ICONS[n] || ''}</svg>`;

  /* ---------- data ---------- */
  const PLATFORMS = ['Amazon', 'Flipkart', 'Myntra', 'Ajio', 'FirstCry'];
  const STOCK = [58420, 31250, 27880, 16140, 11598];
  const SHARE = [0.38, 0.25, 0.18, 0.11, 0.08];
  const SKUS = [
    ['MC-14-BLACK-38', 'Classic T-Shirt', 'Mavic', '#262b36', 1794, 4483206, 412],
    ['MC-14-BLACK-30', 'Classic T-Shirt', 'Mavic', '#262b36', 1757, 4390743, 38],
    ['MC-14-KHAKHI-36', 'Classic T-Shirt', 'Mavic', '#b9a27a', 1646, 4113354, 260],
    ['MC-14-GREEN-32', 'Classic T-Shirt', 'Mavic', '#3f8f5a', 1609, 4020891, 0],
    ['MC-14-GREY-38', 'Classic T-Shirt', 'Mavic', '#9aa3ae', 1239, 3096261, 188],
    ['MC-14-BLACK-32', 'Classic T-Shirt', 'Mavic', '#262b36', 1105, 2761395, 24],
    ['MC-9-GREEN-36', 'Vooter Men Cargo', 'Vooter', '#4f7d4a', 1037, 1244400, 305],
    ['MDT-37-LIGHT-BROWN-L', 'Jeans', 'Tiffny Denim', '#a47551', 1023, 2455200, 61],
    ['MC-14-WHITE-34', 'Classic T-Shirt', 'Mavic', '#d9d5cc', 988, 2468012, 520],
    ['MC-22-NAVY-M', 'Polo Shirt', 'Mavic', '#24345c', 874, 1660600, 0],
    ['KD-05-PINK-6Y', 'Kids Frock', 'Tiny Tots', '#e88aa8', 652, 977348, 144],
    ['MDT-41-BLUE-XL', 'Slim Jeans', 'Tiffny Denim', '#3d5f9a', 610, 1524390, 17],
  ].map(([sku, name, brand, sw, sold, rev, stock], i) => ({
    sku, name, brand, sw, sold, rev, stock, i,
    status: stock === 0 ? 'out' : stock < 70 ? 'low' : 'in',
    split: SHARE.map((s, j) => Math.round(stock * s * (0.7 + 0.6 * rand(i * 9 + j)))),
  }));
  const STATUS_LABEL = { in: 'In stock', low: 'Low stock', out: 'Out of stock' };
  const ORDERS = [
    ['Today', '#OD-48213', 'Amazon', 3, 7497, 'Pending'], ['Today', '#OD-48212', 'Myntra', 1, 2499, 'Shipped'], ['Today', '#OD-48208', 'Flipkart', 2, 4998, 'Pending'],
    ['Today', '#OD-48201', 'Ajio', 4, 9996, 'Shipped'], ['Yesterday', '#OD-48190', 'Amazon', 1, 1200, 'Delivered'], ['Yesterday', '#OD-48187', 'FirstCry', 2, 2998, 'Delivered'],
    ['Yesterday', '#OD-48177', 'Flipkart', 1, 2400, 'Returned'], ['Mon, 5 Oct', '#OD-48152', 'Myntra', 5, 12495, 'Delivered'], ['Mon, 5 Oct', '#OD-48140', 'Amazon', 2, 4998, 'Delivered'],
  ];
  const POS = [
    ['PO-2026-0142', 'Shree Textiles', 18, 482000, 1], ['PO-2026-0141', 'Vooter Garments', 6, 124500, 2], ['PO-2026-0139', 'Denim Hub', 12, 310200, 3],
  ];
  const ALERTS = [
    ['out', 'alert', 'Out of stock', 'MC-14-GREEN-32 is out of stock on Amazon', '10m', 1],
    ['low', 'box', 'Low stock', 'MC-14-BLACK-30 has only 38 units left', '1h', 1],
    ['po', 'check', 'PO approved', 'PO-2026-0142 was approved by Accounts', '3h', 1],
    ['low', 'trend', 'Reorder reminder', '1,705 items are below reorder level', 'Today', 0],
    ['info', 'upload', 'Sync complete', 'Flipkart stock sync finished · 3,179 SKUs', 'Yesterday', 0],
    ['info', 'truck', 'Return received', '#OD-48177 returned to warehouse', 'Yesterday', 0],
  ];
  const PERIODS = [
    { name: 'Today', f: 0.034, labels: ['8a', '10a', '12p', '2p', '4p', '6p', '8p'] },
    { name: 'Week', f: 0.24, labels: ['T', 'F', 'S', 'S', 'M', 'T', 'W'] },
    { name: 'Month', f: 1, labels: ['W1', 'W2', 'W3', 'W4'] },
    { name: 'Quarter', f: 2.95, labels: ['Jul', 'Aug', 'Sep', 'Oct'] },
  ];
  let period = 2;
  let sel = 0;

  /* ---------- screens ---------- */
  const kpis = () => {
    const p = PERIODS[period];
    const orders = Math.round(6420 * p.f);
    return [
      ['k1', 'box', 'Total stock', fmt(145288), 12.5], ['k2', 'cart', 'Orders', fmt(orders), 18.7],
      ['k3', 'tag', 'Total SKU', fmt(3179), 9.3], ['k4', 'alert', 'Low stock', fmt(1705), -5.2],
    ].map(([k, ic, l, v, d]) => `<button class="kpi ${k}" ${k === 'k4' ? 'data-go="stock" data-filter-to="low"' : ''}><span class="kpi-i">${icon(ic)}</span><small>${l}</small><strong>${v}</strong><span class="delta ${d >= 0 ? 'up' : 'down'}">${d >= 0 ? '▲' : '▼'} ${Math.abs(d)}%</span></button>`).join('');
  };
  const skuRow = (s) => `<button class="row" data-sku="${s.i}" data-status="${s.status}" data-q="${(s.sku + ' ' + s.name + ' ' + s.brand).toLowerCase()}">
    <span class="thumb" style="--sw:${s.sw}">${icon('shirt')}</span>
    <span class="row-main"><b>${s.sku}</b><small>${s.name} · ${s.brand}</small></span>
    <span class="row-end"><b>${fmt(s.stock)}</b><em class="badge ${s.status}">${STATUS_LABEL[s.status]}</em></span></button>`;

  const totalStock = STOCK.reduce((a, b) => a + b, 0);
  const SCREENS = {
    home: () => `
      <header class="app-head"><div class="hello"><small>Good morning</small><h1>Ritesh</h1></div>
        <button class="icon-btn" data-go="alerts" aria-label="Alerts">${icon('bell')}<b>3</b></button>
        <button class="avatar" data-go="profile" aria-label="Profile">R</button></header>
      <div class="chips" data-role="period">${PERIODS.map((p, i) => `<button class="chip${i === period ? ' on' : ''}" data-period="${i}">${p.name}</button>`).join('')}</div>
      <div class="kpi-grid" data-role="kpis">${kpis()}</div>
      <div class="quick">
        <button data-go="scan"><span class="qi">${icon('scan')}</span>Scan</button>
        <button data-go="po-new"><span class="qi">${icon('plus')}</span>New PO</button>
        <button data-go="stock" data-filter-to="low"><span class="qi">${icon('alert')}</span>Low stock</button>
        <button data-go="orders"><span class="qi">${icon('truck')}</span>Orders</button></div>
      <section class="card"><div class="card-h"><h3>Stock by platform</h3><button class="link" data-go="stock">See all</button></div>
        <div class="donut-row"><div class="donut"><canvas data-chart="donut"></canvas><div class="donut-c"><b>${lakh(totalStock)}</b><span>units</span></div></div>
        <ul class="legend">${PLATFORMS.map((p, j) => `<li><i style="background:var(--c${j + 1})"></i><span>${p}</span><b>${Math.round((STOCK[j] / totalStock) * 100)}%</b></li>`).join('')}</ul></div></section>
      <section class="card"><div class="card-h"><h3>Orders</h3><span class="muted" data-role="plabel">${PERIODS[period].name}</span></div><div class="chart-sm"><canvas data-chart="bars"></canvas></div></section>
      <section class="card"><div class="card-h"><h3>Top sellers</h3><button class="link" data-go="stock">View all</button></div>
        <div class="list">${SKUS.slice(0, 3).map(skuRow).join('')}</div></section>`,

    stock: () => `
      <header class="app-head"><h1>Stock</h1><button class="icon-btn" aria-label="Filters">${icon('sliders')}</button></header>
      <label class="search">${icon('search')}<input type="search" placeholder="Search SKU, product, brand" data-role="q"></label>
      <div class="chips" data-role="filter">${[['all', 'All'], ['in', 'In stock'], ['low', 'Low'], ['out', 'Out']].map(([k, l], i) => `<button class="chip${i ? '' : ' on'}" data-filter="${k}">${l}</button>`).join('')}</div>
      <div class="list boxed" data-role="skus">${SKUS.map(skuRow).join('')}</div>`,

    sku: () => '',

    orders: () => {
      const groups = [...new Set(ORDERS.map((o) => o[0]))];
      return `<header class="app-head"><h1>Orders</h1><button class="icon-btn" aria-label="Calendar">${icon('calendar')}</button></header>
      <div class="chips" data-role="ofilter">${['All', 'Pending', 'Shipped', 'Delivered', 'Returned'].map((l, i) => `<button class="chip${i ? '' : ' on'}" data-ofilter="${l}">${l}</button>`).join('')}</div>
      ${groups.map((g) => `<div class="group" data-group><h4>${g}</h4><div class="list boxed">${ORDERS.filter((o) => o[0] === g).map(([, id, pl, n, amt, st]) => `
        <div class="row" data-ostatus="${st}"><span class="thumb" style="--sw:color-mix(in srgb,var(--accent) 16%,var(--surface));color:var(--accent)">${icon('bag')}</span>
        <span class="row-main"><b>${id}</b><small><span class="plat">${pl}</span> · ${n} item${n > 1 ? 's' : ''}</small></span>
        <span class="row-end"><b>${rupee(amt)}</b><em class="status ${st}">${st}</em></span></div>`).join('')}</div></div>`).join('')}`;
    },

    scan: () => `
      <header class="app-head"><button class="icon-btn" data-go="home" aria-label="Close">${icon('x')}</button><h2>Scan barcode</h2><button class="icon-btn" aria-label="Flash">${icon('flash')}</button></header>
      <div class="viewfinder"><div class="frame"><i class="c tl"></i><i class="c tr"></i><i class="c bl"></i><i class="c br"></i><div class="code"></div><i class="laser"></i></div></div>
      <p class="hint">Align the barcode inside the frame</p>
      <div class="sheet"><div class="grab"></div>
        <div class="row" style="border:0"><span class="thumb" style="--sw:${SKUS[0].sw}">${icon('shirt')}</span><span class="row-main"><b>${SKUS[0].sku}</b><small>EAN 8901234567891 · ${SKUS[0].name}</small></span><span class="row-end"><b>${fmt(SKUS[0].stock)}</b><em class="badge in">In stock</em></span></div>
        <div class="cta"><button class="btn primary" data-sku="0">View SKU</button><button class="btn" data-go="po-new">${icon('plus')}Add to PO</button></div></div>`,

    more: () => `
      <header class="app-head"><h1>More</h1></header>
      <div class="tiles">
        ${[['po', 'file', 'Purchase orders', '3 open'], ['alerts', 'bell', 'Alerts', '3 unread'], ['profile', 'user', 'Profile', 'Ritesh Patel'], ['stock', 'tag', 'Master SKU', '3,179 SKUs'], ['scan', 'scan', 'Barcodes', 'Scan & print'], ['orders', 'upload', 'Import history', 'Last: yesterday']]
          .map(([g, ic, t, s]) => `<button class="tile" data-go="${g}"><span class="ti">${icon(ic)}</span><span>${t}<small>${s}</small></span></button>`).join('')}
      </div>`,

    po: () => `
      <header class="app-head"><button class="icon-btn" data-back aria-label="Back">${icon('back')}</button><h2>Purchase orders</h2><button class="icon-btn" data-go="po-new" aria-label="New PO">${icon('plus')}</button></header>
      ${POS.map(([id, v, n, amt, step]) => `<section class="card po-card"><div class="po-top"><div><b>${id}</b><br><small>${v} · ${n} SKUs</small></div><b>${rupee(amt)}</b></div>
        <div class="steps">${['Created', 'Approved', 'Shipped', 'Received'].map((l, k) => `<div class="step ${k < step ? 'done' : k === step ? 'cur' : ''}"><i>${k < step ? icon('check') : ''}</i>${l}</div>`).join('')}</div></section>`).join('')}`,

    'po-new': () => `
      <header class="app-head"><button class="icon-btn" data-back aria-label="Back">${icon('back')}</button><h2>New purchase order</h2><span style="width:42px"></span></header>
      <div class="stepper"><span class="on"></span><span></span><span></span></div><p class="step-label">Step 1 of 3 · Vendor & items</p>
      <div class="field"><label>Vendor</label><div class="input">Shree Textiles ${icon('chev')}</div></div>
      <div class="field"><label>Platform</label><div class="chips" style="padding-bottom:0">${PLATFORMS.map((p, i) => `<button class="chip${i ? '' : ' on'}" data-pick>${p}</button>`).join('')}</div></div>
      <div class="field"><label>Expected delivery</label><div class="input">15 Oct 2026 ${icon('calendar')}</div></div>
      <div class="field"><label>Items</label><div class="list boxed">${SKUS.slice(1, 4).map((s, k) => `<div class="row"><span class="thumb" style="--sw:${s.sw}">${icon('shirt')}</span><span class="row-main"><b>${s.sku}</b><small>${s.name}</small></span><span class="qty"><button data-qty="-1">−</button><span>${[120, 80, 200][k]}</span><button data-qty="1">+</button></span></div>`).join('')}</div></div>
      <div class="cta"><button class="btn" data-back>Cancel</button><button class="btn primary" data-go="po">Continue</button></div>`,

    alerts: () => `
      <header class="app-head"><button class="icon-btn" data-back aria-label="Back">${icon('back')}</button><h2>Alerts</h2><button class="link" data-markread>Read all</button></header>
      <div class="list boxed">${ALERTS.map(([t, ic, title, text, time, un]) => `<div class="note ${t}${un ? ' unread' : ''}"><span class="ni">${icon(ic)}</span><div><b>${title}</b><p>${text}</p></div><time>${time}</time></div>`).join('')}</div>`,

    profile: () => `
      <header class="app-head"><button class="icon-btn" data-back aria-label="Back">${icon('back')}</button><h2>Profile</h2><span style="width:42px"></span></header>
      <section class="card profile-card"><span class="avatar">R</span><div><b>Ritesh Patel</b><small>Admin · TIFFNY Corporation</small></div></section>
      <div class="list boxed">
        <div class="set"><span class="si" style="--s:#5856d6">${icon('moon')}</span><span>Dark mode</span><button class="switch" data-theme-toggle aria-label="Dark mode"></button></div>
        <div class="set"><span class="si" style="--s:#ff3b30">${icon('bell')}</span><span>Push notifications</span><button class="switch on" data-switch aria-label="Notifications"></button></div>
        <button class="set"><span class="si" style="--s:#ff9500">${icon('alert')}</span><span>Low-stock threshold</span><em>70 units</em>${icon('chev', 'chev')}</button>
        <button class="set"><span class="si" style="--s:#34c759">${icon('globe')}</span><span>Language</span><em>English</em>${icon('chev', 'chev')}</button>
        <button class="set"><span class="si" style="--s:#007aff">${icon('help')}</span><span>Help & support</span>${icon('chev', 'chev')}</button></div>
      <div class="list boxed"><button class="set danger"><span class="si" style="--s:#ff3b30">${icon('logout')}</span><span>Log out</span></button></div>`,
  };

  const fillSku = () => {
    const s = SKUS[sel];
    const max = Math.max(...s.split, 1);
    $('[data-screen="sku"]').innerHTML = `
      <header class="app-head"><button class="icon-btn" data-back aria-label="Back">${icon('back')}</button><h2>SKU details</h2><button class="icon-btn" aria-label="More">${icon('more')}</button></header>
      <div class="hero-img" style="--sw:${s.sw}">${icon('shirt')}</div>
      <div class="sku-title"><h1>${s.sku}</h1><p>${s.name} · ${s.brand}</p><em class="badge ${s.status}">${STATUS_LABEL[s.status]}</em></div>
      <div class="stat-row"><div class="stat"><small>In stock</small><b>${fmt(s.stock)}</b></div><div class="stat"><small>Sold (30d)</small><b>${fmt(s.sold)}</b></div><div class="stat"><small>Revenue</small><b>${lakh(s.rev)}</b></div></div>
      <section class="card"><div class="card-h"><h3>Stock by platform</h3></div>
        ${PLATFORMS.map((p, j) => `<div class="pbar"><span>${p}</span><span class="track"><i style="width:${(s.split[j] / max) * 100}%;background:var(--c${j + 1})"></i></span><b>${fmt(s.split[j])}</b></div>`).join('')}</section>
      <section class="card"><div class="card-h"><h3>Sales trend</h3><span class="muted">Last 12 weeks</span></div><div class="chart-md"><canvas data-chart="line"></canvas></div></section>
      <div class="cta"><button class="btn" data-go="scan">${icon('scan')}Scan</button><button class="btn primary" data-go="po-new">${icon('cart')}Reorder</button></div>`;
  };

  /* ---------- shell ---------- */
  const app = $('#app');
  const SB = `<svg viewBox="0 0 18 12"><rect x="0" y="8" width="3" height="4" rx="1" fill="currentColor"/><rect x="5" y="5" width="3" height="7" rx="1" fill="currentColor"/><rect x="10" y="2.5" width="3" height="9.5" rx="1" fill="currentColor"/><rect x="15" y="0" width="3" height="12" rx="1" fill="currentColor"/></svg>
    <svg viewBox="0 0 16 12"><path d="M8 11.5 5.6 8.8a3.4 3.4 0 0 1 4.8 0zM3.5 6.6a6.4 6.4 0 0 1 9 0l-1.5 1.6a4.2 4.2 0 0 0-6 0zM1 4a10 10 0 0 1 14 0l-1.5 1.6a7.8 7.8 0 0 0-11 0z" fill="currentColor"/></svg>
    <svg viewBox="0 0 27 12"><rect x=".5" y=".5" width="23" height="11" rx="3.5" fill="none" stroke="currentColor" opacity=".4"/><rect x="2" y="2" width="17" height="8" rx="2" fill="currentColor"/><rect x="24.5" y="4" width="2" height="4" rx="1" fill="currentColor" opacity=".45"/></svg>`;
  const TABS = [['home', 'home', 'Home'], ['stock', 'box', 'Stock'], ['scan', 'scan', ''], ['orders', 'bag', 'Orders'], ['more', 'grid', 'More']];
  const TAB_OF = { home: 'home', stock: 'stock', sku: 'stock', scan: 'scan', orders: 'orders', more: 'more', po: 'more', 'po-new': 'more', alerts: 'more', profile: 'more' };
  app.innerHTML = `<div class="statusbar"><span class="time">9:41</span><span class="island"></span><span class="sb-icons">${SB}</span></div>
    <div class="screens">${Object.keys(SCREENS).map((k) => `<section class="screen${k === 'scan' ? ' scan' : ''}" data-screen="${k}">${SCREENS[k]()}</section>`).join('')}</div>
    <nav class="tabbar">${TABS.map(([k, ic, l]) => k === 'scan'
      ? `<button class="scan-tab" data-tab="scan" aria-label="Scan"><span class="si">${icon(ic)}</span></button>`
      : `<button data-tab="${k}">${icon(ic)}<span>${l}</span></button>`).join('')}</nav>
    <div class="home-ind"></div>`;

  /* ---------- charts ---------- */
  const alpha = (hex, a) => {
    let h = hex.replace('#', '');
    if (h.length === 3) h = h.split('').map((c) => c + c).join('');
    const n = parseInt(h.slice(0, 6), 16);
    return isNaN(n) ? hex : `rgba(${(n >> 16) & 255},${(n >> 8) & 255},${n & 255},${a})`;
  };
  let charts = [];
  function buildCharts(root) {
    charts.forEach((c) => c.destroy());
    charts = [];
    if (!window.Chart || !root) return;
    const colors = [1, 2, 3, 4, 5].map((i) => css('--c' + i, '#888'));
    Chart.defaults.font.family = css('--font', 'system-ui');
    Chart.defaults.color = css('--muted', '#888');
    Object.assign(Chart.defaults.plugins.tooltip, { backgroundColor: css('--tip-bg', '#1c1c1e'), titleColor: css('--tip-fg', '#fff'), bodyColor: css('--tip-fg', '#fff'), cornerRadius: num('--tip-radius', 10), padding: 8 });
    const grid = css('--grid', 'rgba(127,127,127,.15)');
    $$('canvas[data-chart]', root).forEach((cv) => {
      const kind = cv.dataset.chart;
      if (kind === 'donut') {
        charts.push(new Chart(cv, { type: 'doughnut', data: { labels: PLATFORMS, datasets: [{ data: STOCK, backgroundColor: colors, borderColor: css('--donut-border', css('--surface')), borderWidth: num('--donut-bw', 2), borderRadius: num('--donut-radius', 6), spacing: num('--donut-spacing', 1) }] },
          options: { cutout: css('--donut-cutout', '70%'), maintainAspectRatio: false, plugins: { legend: { display: false } } } }));
      } else if (kind === 'bars') {
        const p = PERIODS[period];
        const data = p.labels.map((_, i) => Math.round(((6420 * p.f) / p.labels.length) * (0.7 + 0.6 * rand(i + p.labels.length * 3))));
        const bar = css('--bar', css('--accent'));
        charts.push(new Chart(cv, { type: 'bar', data: { labels: p.labels, datasets: [{ data, backgroundColor: data.map((_, i) => (i === data.length - 1 ? bar : alpha(bar, 0.35))), borderRadius: num('--bar-radius', 8), borderSkipped: false, maxBarThickness: 26, borderColor: css('--bar-border', 'transparent'), borderWidth: num('--bar-bw', 0) }] },
          options: { maintainAspectRatio: false, plugins: { legend: { display: false } }, scales: { x: { grid: { display: false }, border: { display: false } }, y: { display: false } } } }));
      } else if (kind === 'line') {
        const s = SKUS[sel];
        const data = Array.from({ length: 12 }, (_, i) => Math.round((s.sold / 4) * (0.6 + 0.8 * rand(i + s.i * 13))));
        const col = css('--accent');
        charts.push(new Chart(cv, { type: 'line', data: { labels: data.map((_, i) => 'W' + (i + 1)), datasets: [{ data, borderColor: col, borderWidth: 2.5, tension: 0.4, pointRadius: 0, fill: true,
          backgroundColor: (ctx) => { const a = ctx.chart.chartArea; if (!a) return 'transparent'; const g = ctx.chart.ctx.createLinearGradient(0, a.top, 0, a.bottom); g.addColorStop(0, alpha(col, 0.3)); g.addColorStop(1, alpha(col, 0)); return g; } }] },
          options: { maintainAspectRatio: false, plugins: { legend: { display: false } }, scales: { x: { grid: { display: false }, border: { display: false }, ticks: { maxTicksLimit: 6 } }, y: { grid: { color: grid }, border: { display: false }, ticks: { maxTicksLimit: 4 } } } } }));
      }
    });
  }

  /* ---------- navigation ---------- */
  const history = [];
  let current = 'home';
  function go(name, push = true) {
    if (!SCREENS[name]) return;
    if (name === 'sku') fillSku();
    if (push && current !== name) history.push(current);
    current = name;
    $$('.screen', app).forEach((s) => s.classList.toggle('active', s.dataset.screen === name));
    $$('.tabbar [data-tab]', app).forEach((b) => b.classList.toggle('on', b.dataset.tab === TAB_OF[name]));
    const scr = $(`[data-screen="${name}"]`, app);
    scr.scrollTop = 0;
    buildCharts(scr);
    $$('.panel [data-jump]').forEach((b) => b.classList.toggle('on', b.dataset.jump === name));
    syncThemeUI();
  }
  function setFilter(k) {
    const scr = $('[data-screen="stock"]', app);
    $$('[data-filter]', scr).forEach((c) => c.classList.toggle('on', c.dataset.filter === k));
    applyStockFilter();
  }
  function applyStockFilter() {
    const scr = $('[data-screen="stock"]', app);
    const k = $('[data-filter].on', scr)?.dataset.filter || 'all';
    const q = ($('[data-role="q"]', scr).value || '').toLowerCase().trim();
    $$('[data-role="skus"] .row', scr).forEach((r) => { r.hidden = (k !== 'all' && r.dataset.status !== k) || (q && !r.dataset.q.includes(q)); });
  }

  app.addEventListener('click', (e) => {
    const t = e.target.closest('button,[data-go],[data-sku]');
    if (!t || !app.contains(t)) return;
    if (t.dataset.tab) { history.length = 0; go(t.dataset.tab, false); return; }
    if (t.hasAttribute('data-back')) { go(history.pop() || 'home', false); return; }
    if (t.dataset.sku !== undefined) { sel = +t.dataset.sku; go('sku'); return; }
    if (t.dataset.period !== undefined) {
      period = +t.dataset.period;
      const scr = $('[data-screen="home"]', app);
      $$('[data-period]', scr).forEach((c) => c.classList.toggle('on', +c.dataset.period === period));
      $('[data-role="kpis"]', scr).innerHTML = kpis();
      $('[data-role="plabel"]', scr).textContent = PERIODS[period].name;
      buildCharts(scr);
      return;
    }
    if (t.dataset.filter) { setFilter(t.dataset.filter); return; }
    if (t.dataset.ofilter) {
      const scr = $('[data-screen="orders"]', app), k = t.dataset.ofilter;
      $$('[data-ofilter]', scr).forEach((c) => c.classList.toggle('on', c === t));
      $$('[data-ostatus]', scr).forEach((r) => (r.hidden = k !== 'All' && r.dataset.ostatus !== k));
      $$('[data-group]', scr).forEach((g) => (g.hidden = !$$('[data-ostatus]:not([hidden])', g).length));
      return;
    }
    if (t.hasAttribute('data-pick')) { $$('[data-pick]', t.parentElement).forEach((c) => c.classList.toggle('on', c === t)); return; }
    if (t.dataset.qty) { const v = t.parentElement.querySelector('span'); v.textContent = Math.max(0, +v.textContent + +t.dataset.qty * 10); return; }
    if (t.hasAttribute('data-switch')) { t.classList.toggle('on'); return; }
    if (t.hasAttribute('data-markread')) { $$('.note.unread', app).forEach((n) => n.classList.remove('unread')); return; }
    if (t.hasAttribute('data-theme-toggle')) { toggleTheme(); return; }
    if (t.dataset.go) { go(t.dataset.go); if (t.dataset.filterTo) setFilter(t.dataset.filterTo); }
  });
  $('[data-role="q"]', app).addEventListener('input', applyStockFilter);

  /* ---------- theme ---------- */
  const KEY = 'mtheme:' + (location.pathname.split('/').pop() || 'index.html');
  function syncThemeUI() {
    const dark = html.dataset.theme === 'dark';
    $$('[data-theme-toggle]', app).forEach((s) => s.classList.toggle('on', dark));
    const pb = $('.panel .p-theme');
    if (pb) pb.innerHTML = `${icon(dark ? 'sun' : 'moon')}${dark ? 'Light mode' : 'Dark mode'}`;
  }
  function toggleTheme() {
    html.dataset.theme = html.dataset.theme === 'dark' ? 'light' : 'dark';
    try { localStorage.setItem(KEY, html.dataset.theme); } catch (e) { /* storage unavailable */ }
    if (window.Chart) Chart.defaults.animation.duration = 0;
    go(current, false);
  }

  /* ---------- desktop side panel ---------- */
  const panel = $('#panel');
  if (panel) {
    const b = document.body.dataset;
    const flutter = b.flutter ? `<p class="flutter">Flutter theme: <a href="${b.flutter}">${b.flutter.split('/').pop()}</a></p>` : '';
    panel.innerHTML = `<a class="back" href="mobile.html">← All mobile styles</a><h1>${b.name || document.title}</h1><p>${b.desc || ''}</p>
      <button class="p-theme" type="button"></button>${flutter}
      <h4>Jump to screen</h4><div class="jump">${[['home', 'Home'], ['stock', 'Stock'], ['sku', 'SKU detail'], ['orders', 'Orders'], ['scan', 'Scan'], ['po', 'Purchase orders'], ['po-new', 'New PO'], ['alerts', 'Alerts'], ['profile', 'Profile'], ['more', 'More']]
        .map(([k, l]) => `<button type="button" data-jump="${k}">${l}</button>`).join('')}</div>`;
    panel.addEventListener('click', (e) => {
      const t = e.target.closest('button');
      if (!t) return;
      if (t.classList.contains('p-theme')) toggleTheme();
      else if (t.dataset.jump) { history.length = 0; go(t.dataset.jump, false); }
    });
  }

  go('home', false);
})();
