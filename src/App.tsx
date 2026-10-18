import { useEffect, useMemo, useRef, useState, type FormEvent, type ReactNode, type AnchorHTMLAttributes, type CSSProperties } from 'react';
import {
  Activity, ArrowDownRight, ArrowLeftRight, ArrowRight, ArrowUpRight, BarChart3, Check, ChevronDown, type LucideIcon,
  Clock3, Copy, Download, ExternalLink, Eye, FileClock, Filter, Heart, Info, Menu, Minus, Plus,
  RotateCcw, Search, Share2, ShieldCheck, SlidersHorizontal, Sparkles, Trash2, Upload, X,
} from 'lucide-react';
import { api, ApiError, loadDataset, type Dataset } from './api';
import { catalog, catalogById, rarityOrder } from './catalog';
import { calculateTrade, decodeTrade, encodeTrade, FAIR_TRADE_TOLERANCE_PERCENT } from './calculator';
import { GUIDES, SITE } from './config';
import type { Fruit, TradeLine, TradeResult } from './domain';

type AdminFruit = Fruit & { enabled: boolean; draft?: Partial<Fruit>; draftUpdatedAt?: string };
type HistoryEntry = { version: number; regularValue: number | null; previousRegularValue?: number | null; permanentValue: number | null; changedAt?: string; publishedAt?: string; trend?: string; confidence?: string; demand?: number | null; note?: string | null; changedBy?: string };
type Listing = { id: string; offer: TradeLine[]; wanted: TradeLine[]; contact: string; note: string; createdAt: string; updatedAt: string; expiresAt: string };
type FeedbackEntry = { id: number; category: string; message: string; createdAt: string };
type ReportTicket = { id: number; tradeId: string; reason: string; detail: string; status: 'open' | 'resolved' | 'dismissed'; createdAt: string; offer: TradeLine[]; wanted: TradeLine[]; contact: string; active: boolean };

const valueFmt = new Intl.NumberFormat('en-US', { maximumFractionDigits: 2 });
const fmt = (value: number | null | undefined) => value == null ? '—' : valueFmt.format(value);
const updatedText = (date: string | null | undefined) => date ? new Date(date).toLocaleString(undefined, { dateStyle: 'medium', timeStyle: 'short' }) : 'Not published';
const localGet = <T,>(key: string, fallback: T): T => { try { const value = localStorage.getItem(key); return value ? JSON.parse(value) as T : fallback; } catch { return fallback; } };

function Link({ to, navigate, children, className = '', ...rest }: AnchorHTMLAttributes<HTMLAnchorElement> & { to: string; navigate: (to: string) => void }) {
  return <a href={to} className={className} onClick={(event) => {
    if (event.metaKey || event.ctrlKey || event.shiftKey || event.altKey) return;
    event.preventDefault(); navigate(to);
  }} {...rest}>{children}</a>;
}

function FruitIcon({ fruit, size = 'md' }: { fruit: Pick<Fruit, 'id' | 'name'>; size?: 'sm' | 'md' | 'lg' }) {
  let seed = 0; for (const char of fruit.id) seed = (seed * 31 + char.charCodeAt(0)) % 360;
  return <span className={`fruit-icon fruit-icon-${size}`} style={{ '--hue': seed } as CSSProperties} aria-hidden="true"><i /></span>;
}

function Price({ value, small = false }: { value: number | null; small?: boolean }) {
  return <span className={`price ${small ? 'price-small' : ''}`}>{value === null ? <span className="unpublished">Unpublished</span> : fmt(value)}</span>;
}

function Button({ children, variant = 'secondary', className = '', ...props }: React.ButtonHTMLAttributes<HTMLButtonElement> & { variant?: 'primary' | 'secondary' | 'quiet' | 'danger' }) {
  return <button className={`button button-${variant} ${className}`} {...props}>{children}</button>;
}

function SectionTitle({ eyebrow, title, description, action }: { eyebrow?: string; title: string; description?: string; action?: ReactNode }) {
  return <div className="section-title"><div>{eyebrow && <div className="eyebrow">{eyebrow}</div>}<h2>{title}</h2>{description && <p>{description}</p>}</div>{action}</div>;
}

function EmptyState({ icon: Icon = Info, title, text, action }: { icon?: LucideIcon; title: string; text: string; action?: ReactNode }) {
  return <div className="empty-state"><span className="empty-icon"><Icon size={19} /></span><div><strong>{title}</strong><p>{text}</p>{action}</div></div>;
}

function App() {
  const [path, setPath] = useState(window.location.pathname);
  const [dataset, setDataset] = useState<Dataset>({ values: [], version: 0, lastUpdated: null, publishedAt: null });
  const [connected, setConnected] = useState(false);
  const [mobileOpen, setMobileOpen] = useState(false);
  const [search, setSearch] = useState('');
  const [theme, setTheme] = useState(localStorage.getItem('fruitforge-theme') || 'dark');
  const [favorites, setFavorites] = useState<string[]>(localGet('fruitforge-favorites', []));
  const [recent, setRecent] = useState<string[]>(localGet('fruitforge-recent', []));
  const [adConsent, setAdConsent] = useState(localStorage.getItem('fruitforge-ad-consent') || '');

  const navigate = (to: string) => {
    const target = new URL(to, window.location.origin);
    window.history.pushState({}, '', target.pathname + target.search + target.hash);
    setPath(target.pathname); setMobileOpen(false); setSearch(''); window.scrollTo({ top: 0, behavior: 'smooth' });
  };
  useEffect(() => {
    const pop = () => { setPath(window.location.pathname); setMobileOpen(false); };
    window.addEventListener('popstate', pop);
    return () => window.removeEventListener('popstate', pop);
  }, []);
  const refresh = async () => {
    const result = await loadDataset(); setDataset(result.dataset); setConnected(result.connected);
  };
  useEffect(() => { void refresh(); }, []);
  useEffect(() => {
    const focus = () => { void refresh(); };
    const timer = window.setInterval(() => { void refresh(); }, 60_000);
    window.addEventListener('focus', focus);
    return () => { window.clearInterval(timer); window.removeEventListener('focus', focus); };
  }, []);
  useEffect(() => { document.documentElement.dataset.theme = theme; localStorage.setItem('fruitforge-theme', theme); }, [theme]);
  const values = useMemo(() => dataset.values.length ? dataset.values : catalog.map((item) => ({ ...item, regularValue: null, permanentValue: null, demand: null, trend: 'unknown', confidence: 'unrated', note: null, lastUpdated: null, lastPublished: null, datasetVersion: 0 } as Fruit)), [dataset]);
  const byId = useMemo(() => new Map(values.map((item) => [item.id, item])), [values]);
  const searchMatches = search.trim() ? values.filter((item) => item.name.toLowerCase().includes(search.trim().toLowerCase())).slice(0, 6) : [];
  const favorite = (id: string) => {
    setFavorites((old) => { const next = old.includes(id) ? old.filter((item) => item !== id) : [...old, id]; localStorage.setItem('fruitforge-favorites', JSON.stringify(next)); return next; });
  };
  const viewed = (id: string) => {
    setRecent((old) => { const next = [id, ...old.filter((item) => item !== id)].slice(0, 8); localStorage.setItem('fruitforge-recent', JSON.stringify(next)); return next; });
  };

  useEffect(() => {
    const isPrivate = path === '/admin' || path === '/calculator' || path.startsWith('/trading');
    const title = path === '/' ? `${SITE.name} — ${SITE.tagline}` : `${titleForPath(path, values)} | ${SITE.name}`;
    document.title = title;
    const description = document.querySelector<HTMLMetaElement>('meta[name="description"]');
    if (description) description.content = `${title}. Browse the catalog, review published estimates, and compare trades using the current dataset.`;
    const canonical = document.querySelector<HTMLLinkElement>('link[rel="canonical"]') || document.head.appendChild(Object.assign(document.createElement('link'), { rel: 'canonical' }));
    canonical.href = `${window.location.origin}${window.location.pathname}`;
    const robots = document.querySelector<HTMLMetaElement>('meta[name="robots"]') || document.head.appendChild(Object.assign(document.createElement('meta'), { name: 'robots' }));
    const fruitSlug = path.match(/^\/fruit\/([^/]+)$/)?.[1];
    const item = fruitSlug ? values.find((value) => value.slug === fruitSlug) : undefined;
    robots.content = isPrivate || (item && item.regularValue === null && item.permanentValue === null) ? 'noindex,follow' : 'index,follow';
    if (item) viewed(item.id);
  }, [path, values]);

  let page: ReactNode;
  if (path === '/') page = <HomePage values={values} byId={byId} navigate={navigate} dataset={dataset} connected={connected} recent={recent} />;
  else if (path === '/calculator') page = <CalculatorPage values={values} byId={byId} dataset={dataset} navigate={navigate} />;
  else if (path === '/values') page = <ValuesPage values={values} favorites={favorites} favorite={favorite} navigate={navigate} />;
  else if (path.startsWith('/fruit/')) page = <FruitPage slug={decodeURIComponent(path.slice('/fruit/'.length))} values={values} byId={byId} favorite={favorite} favorites={favorites} navigate={navigate} />;
  else if (path === '/guides') page = <GuidesPage navigate={navigate} />;
  else if (path.startsWith('/guides/')) page = <GuidePage slug={path.slice('/guides/'.length)} navigate={navigate} />;
  else if (path === '/trading') page = <TradingPage values={values} byId={byId} />;
  else if (path === '/admin') page = <AdminPage />;
  else if (path === '/about') page = <InfoPage kind="about" />;
  else if (path === '/privacy') page = <InfoPage kind="privacy" />;
  else if (path === '/terms') page = <InfoPage kind="terms" />;
  else if (path === '/feedback') page = <FeedbackPage />;
  else page = <NotFound navigate={navigate} />;

  return <div className="app-shell">
    <header className="site-header"><div className="header-inner">
      <Link to="/" navigate={navigate} className="brand"><span className="brand-mark"><span /><span /><span /></span><span>{SITE.name}<small>TRADING DESK</small></span></Link>
      <nav className={`main-nav ${mobileOpen ? 'nav-open' : ''}`} aria-label="Main navigation">
        <Link to="/values" navigate={navigate} className={path === '/values' ? 'nav-active' : ''}>Values</Link>
        <Link to="/calculator" navigate={navigate} className={path === '/calculator' ? 'nav-active' : ''}>Calculator</Link>
        <Link to="/trading" navigate={navigate} className={path === '/trading' ? 'nav-active' : ''}>Trading hub</Link>
        <Link to="/guides" navigate={navigate} className={path.startsWith('/guides') ? 'nav-active' : ''}>Guides</Link>
      </nav>
      <div className="header-actions">
        <div className="global-search"><Search size={16} /><input value={search} onChange={(event) => setSearch(event.target.value)} placeholder="Search fruits…" aria-label="Search fruits" onKeyDown={(event) => { if (event.key === 'Enter' && searchMatches[0]) navigate(`/fruit/${searchMatches[0].slug}`); }} />{search && <button aria-label="Clear search" onClick={() => setSearch('')}><X size={14} /></button>}
          {searchMatches.length > 0 && <div className="search-results" role="listbox">{searchMatches.map((item) => <button key={item.id} onClick={() => navigate(`/fruit/${item.slug}`)}><FruitIcon fruit={item} size="sm" /><span>{item.name}</span><small>{item.regularValue === null ? 'No value' : fmt(item.regularValue)}</small></button>)}</div>}
        </div>
        <button className="theme-toggle" aria-label="Toggle light theme" onClick={() => setTheme(theme === 'dark' ? 'light' : 'dark')}>{theme === 'dark' ? '◐' : '◑'}</button>
        <Button variant="primary" className="header-cta" onClick={() => navigate('/calculator')}>Check a trade <ArrowRight size={15} /></Button>
        <button className="mobile-menu" aria-expanded={mobileOpen} aria-label="Toggle navigation" onClick={() => setMobileOpen(!mobileOpen)}>{mobileOpen ? <X /> : <Menu />}</button>
      </div>
    </div></header>
    <main>
      {!connected && <div className="connection-banner"><Info size={15} /> Published data is unavailable right now. The catalog is still visible; values will appear after the database is connected and an administrator publishes them.</div>}
      {page}
    </main>
    {path === '/' && <AdSlot slot={SITE.adSense.bannerSlot} client={SITE.adSense.publisherId} consent={adConsent} placement="banner" />}
    <Footer navigate={navigate} />
    {SITE.adSense.enabled && !adConsent && <AdConsent onChoose={(choice) => { localStorage.setItem('fruitforge-ad-consent', choice); setAdConsent(choice); }} />}
  </div>;
}

function titleForPath(path: string, values: Fruit[]) {
  const fruit = path.match(/^\/fruit\/([^/]+)/);
  if (fruit) return `${values.find((item) => item.slug === fruit[1])?.name || 'Fruit'} value`; 
  const routes: Record<string, string> = { '/values': 'Fruit values', '/calculator': 'Trade calculator', '/trading': 'Trading hub', '/guides': 'Trading guides', '/admin': 'Admin value manager', '/about': 'About', '/privacy': 'Privacy', '/terms': 'Terms', '/feedback': 'Feedback' };
  if (path.startsWith('/guides/')) return GUIDES.find((guide) => guide.slug === path.slice(8))?.title || 'Guide';
  return routes[path] || 'Page not found';
}

function Footer({ navigate }: { navigate: (to: string) => void }) {
  return <footer className="site-footer"><div className="footer-main"><div className="footer-brand"><Link to="/" navigate={navigate} className="brand"><span className="brand-mark"><span /><span /><span /></span><span>{SITE.name}<small>TRADING DESK</small></span></Link><p>An independent fan-made reference for more informed trades.</p></div><div><strong>Explore</strong><Link to="/values" navigate={navigate}>Fruit values</Link><Link to="/calculator" navigate={navigate}>Trade calculator</Link><Link to="/trading" navigate={navigate}>Trading hub</Link></div><div><strong>Learn</strong><Link to="/guides" navigate={navigate}>Guides</Link><Link to="/about" navigate={navigate}>About FruitForge</Link><Link to="/feedback" navigate={navigate}>Feedback</Link></div><div><strong>Policies</strong><Link to="/privacy" navigate={navigate}>Privacy</Link><Link to="/terms" navigate={navigate}>Terms & disclaimer</Link><Link to="/admin" navigate={navigate}>Admin</Link></div></div><div className="footer-bottom"><span>FruitForge is an independent fan site and is not affiliated with or endorsed by Gamer Robot Inc. or Roblox.</span><span>Values are advisory estimates, not official prices or a guarantee of acceptance.</span></div></footer>;
}

function HomePage({ values, byId, navigate, dataset, connected, recent }: { values: Fruit[]; byId: Map<string, Fruit>; navigate: (to: string) => void; dataset: Dataset; connected: boolean; recent: string[] }) {
  const published = values.filter((item) => item.regularValue !== null);
  const valued = [...published].sort((a, b) => (b.regularValue || 0) - (a.regularValue || 0)).slice(0, 6);
  const rising = published.filter((item) => item.trend === 'rising').slice(0, 4);
  const falling = published.filter((item) => item.trend === 'falling').slice(0, 4);
  const demand = published.filter((item) => item.demand !== null).sort((a, b) => (b.demand || 0) - (a.demand || 0)).slice(0, 4);
  const recentlyUpdated = [...published].filter((item) => item.lastUpdated).sort((a, b) => new Date(b.lastUpdated!).getTime() - new Date(a.lastUpdated!).getTime()).slice(0, 4);
  return <>
    <section className="hero"><div className="hero-grid"><div className="hero-copy"><div className="hero-kicker"><span className="live-dot" /> FRUIT VALUES · TRADE TOOLS · YOUR CALL</div><h1>Know your worth.<br /><em>Trade smarter.</em></h1><p>Compare fruit values, build a trade, and make a clearer call before you accept.</p><div className="hero-buttons"><Button variant="primary" onClick={() => navigate('/calculator')}>Check a trade <ArrowRight size={16} /></Button><Button onClick={() => navigate('/values')}>Explore values</Button></div><HeroSearch navigate={navigate} /><div className="hero-note"><ShieldCheck size={15} /> No invented quotes. Blank means we do not have a published value.</div></div>
      <div className="hero-board"><div className="board-top"><span><span className="board-led" /> VALUE DESK</span><span className="mono">DATASET v{dataset.version}</span></div><div className="board-head"><div><small>TRACKED FRUITS</small><strong>{values.length}</strong></div><div><small>PUBLISHED QUOTES</small><strong>{published.length}<i> / {values.length}</i></strong></div></div><div className="board-divider" /><div className="board-list-label"><span>TOP PUBLISHED VALUES</span><span>{published.length ? 'LIVE DATA' : 'WAITING FOR DATA'}</span></div>
        {valued.length ? valued.slice(0, 4).map((item, index) => <button className="board-row" key={item.id} onClick={() => navigate(`/fruit/${item.slug}`)}><span className="board-rank">0{index + 1}</span><FruitIcon fruit={item} size="sm" /><strong>{item.name}</strong><span>{fmt(item.regularValue)}</span></button>) : <div className="board-empty"><span className="board-empty-mark">···</span><div><strong>No published values yet</strong><small>Admin-entered estimates appear here after publication.</small></div></div>}
        <div className="board-foot"><span><Clock3 size={13} /> {dataset.publishedAt ? `Updated ${updatedText(dataset.publishedAt)}` : 'No publication yet'}</span><span className="confidence-pill">{connected ? 'SOURCE CONNECTED' : 'OFFLINE MODE'}</span></div>
      </div></div><div className="hero-glow" /></section>

    <section className="tool-strip"><button onClick={() => navigate('/calculator')}><span className="tool-icon violet"><ArrowLeftRight /></span><span><strong>Trade calculator</strong><small>Compare both sides instantly</small></span><ArrowRight size={16} /></button><button onClick={() => navigate('/values')}><span className="tool-icon cyan"><BarChart3 /></span><span><strong>Fruit values</strong><small>Search the full catalog</small></span><ArrowRight size={16} /></button><button onClick={() => navigate('/trading')}><span className="tool-icon blue"><Activity /></span><span><strong>Trading hub</strong><small>Browse community offers</small></span><ArrowRight size={16} /></button></section>

    <section className="content-section"><SectionTitle eyebrow="THE VALUE BOARD" title="Market snapshot" description="Only currently published values and editor assessments appear here." action={<Link to="/values" navigate={navigate} className="text-link">Browse all fruits <ArrowRight size={14} /></Link>} />
      <div className="snapshot-grid"><SnapshotBlock title="Highest published values" icon={BarChart3} items={valued} empty="No values have been published yet." navigate={navigate} byId={byId} /><SnapshotBlock title="Recently updated" icon={Clock3} items={recentlyUpdated} empty="Published updates will appear here." navigate={navigate} byId={byId} /><SnapshotBlock title="Rising trend" icon={ArrowUpRight} items={rising} empty="No fruits are marked as rising." navigate={navigate} byId={byId} /><SnapshotBlock title="High demand" icon={Sparkles} items={demand} empty="Demand ratings will appear after values are published." navigate={navigate} byId={byId} /></div>
      {falling.length > 0 && <SnapshotBlock title="Falling trend" icon={ArrowDownRight} items={falling} empty="No fruits are marked as falling." navigate={navigate} byId={byId} full />}
    </section>
    <AdSlot slot={SITE.adSense.contentSlot} client={SITE.adSense.publisherId} consent={localStorage.getItem('fruitforge-ad-consent') || ''} placement="in-content" />
    {recent.length > 0 && <section className="content-section compact-section"><SectionTitle eyebrow="ON THIS DEVICE" title="Recently viewed" /><div className="fruit-card-grid">{recent.map((id) => byId.get(id)).filter((item): item is Fruit => !!item).slice(0, 6).map((item) => <FruitCard key={item.id} item={item} navigate={navigate} />)}</div></section>}
    <section className="content-section guide-teaser"><SectionTitle eyebrow="MAKE AN INFORMED CALL" title="Tools, with context" description="A value is an estimate. These short guides explain what the numbers mean and how the calculator handles missing data." action={<Link to="/guides" navigate={navigate} className="text-link">All guides <ArrowRight size={14} /></Link>} /><div className="guide-grid">{GUIDES.map((guide, index) => <Link key={guide.slug} to={`/guides/${guide.slug}`} navigate={navigate} className="guide-card"><span className={`guide-index guide-index-${index}`}>0{index + 1}</span><span className="tag">{guide.tag}</span><h3>{guide.title}</h3><p>{guide.summary}</p><span className="guide-read">Read guide <ArrowRight size={14} /></span></Link>)}</div></section>
    <section className="content-section faq-section"><SectionTitle eyebrow="QUICK ANSWERS" title="A few things to know" /><FaqItem question="Are FruitForge values official game prices?" answer="No. Values are editorial trade estimates on a site-defined scale. They are not official prices and do not guarantee that another player will accept." /><FaqItem question="Why does a fruit show no value?" answer="No administrator has published a value for that item yet. FruitForge leaves it blank and marks any affected calculator result incomplete." /><FaqItem question="Does sharing a trade save my account or custom prices?" answer="No. A share link contains canonical fruit IDs and quantities. It uses the latest public dataset when opened and does not include account information or custom prices." /></section>
    <section className="disclaimer-card"><Info size={18} /><div><strong>Independent fan reference</strong><p>FruitForge is not affiliated with Roblox or the Blox Fruits developers. Values are editorial estimates and never guarantee that a player will accept a trade.</p></div><Link to="/terms" navigate={navigate}>Read the disclaimer <ArrowRight size={14} /></Link></section>
  </>;
}

function FaqItem({ question, answer }: { question: string; answer: string }) { return <details className="faq-item"><summary>{question}<ChevronDown size={15} /></summary><p>{answer}</p></details>; }

function HeroSearch({ navigate }: { navigate: (to: string) => void }) {
  const [query, setQuery] = useState('');
  return <form className="hero-search" onSubmit={(event) => { event.preventDefault(); navigate(`/values?q=${encodeURIComponent(query)}`); }}><Search size={17} /><input value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Search the fruit catalog…" aria-label="Search catalog" /><button type="submit">Search <ArrowRight size={14} /></button></form>;
}

function SnapshotBlock({ title, icon: Icon, items, empty, navigate, byId, full = false }: { title: string; icon: LucideIcon; items: Fruit[]; empty: string; navigate: (to: string) => void; byId: Map<string, Fruit>; full?: boolean }) {
  return <div className={`snapshot-card ${full ? 'snapshot-full' : ''}`}><div className="snapshot-heading"><span><Icon size={16} /> {title}</span><span className="snapshot-count">{items.length ? `${items.length} items` : '—'}</span></div>{items.length ? items.map((item) => <button className="snapshot-row" key={item.id} onClick={() => navigate(`/fruit/${item.slug}`)}><FruitIcon fruit={item} size="sm" /><span className="snapshot-name"><strong>{item.name}</strong><small>{item.demand === null ? item.rarity : `Demand ${item.demand}/10`}</small></span><span className="snapshot-value"><strong>{fmt(item.regularValue)}</strong><small>{item.trend !== 'unknown' ? item.trend : item.confidence}</small></span><ChevronDown className="snapshot-chevron" size={15} /></button>) : <p className="snapshot-empty">{empty}</p>}</div>;
}

function FruitCard({ item, navigate, onFavorite, isFavorite }: { item: Fruit; navigate: (to: string) => void; onFavorite?: () => void; isFavorite?: boolean }) {
  return <article className="fruit-card"><button className="fruit-card-main" onClick={() => navigate(`/fruit/${item.slug}`)}><div className="fruit-card-top"><FruitIcon fruit={item} size="lg" /><span className="rarity-chip">{item.rarity}</span></div><div className="fruit-card-info"><strong>{item.name}</strong><span>{item.type} · {item.category}</span></div><div className="fruit-card-value"><small>REGULAR VALUE</small><Price value={item.regularValue} /></div><div className="fruit-card-foot"><span>{item.demand === null ? 'Demand not rated' : `Demand ${item.demand}/10`}</span><span>{item.trend === 'unknown' ? '—' : item.trend}</span></div></button>{onFavorite && <button className={`favorite-button ${isFavorite ? 'is-favorite' : ''}`} aria-label={`${isFavorite ? 'Remove' : 'Add'} ${item.name} ${isFavorite ? 'from' : 'to'} favorites`} onClick={onFavorite}><Heart size={15} fill={isFavorite ? 'currentColor' : 'none'} /></button>}</article>;
}

function ValuesPage({ values, favorites, favorite, navigate }: { values: Fruit[]; favorites: string[]; favorite: (id: string) => void; navigate: (to: string) => void }) {
  const [query, setQuery] = useState(new URLSearchParams(window.location.search).get('q') || '');
  const [rarity, setRarity] = useState('all'); const [type, setType] = useState('all'); const [sort, setSort] = useState('name'); const [showFavs, setShowFavs] = useState(false); const [view, setView] = useState<'grid' | 'table'>('grid');
  const filtered = useMemo(() => {
    const result = values.filter((item) => item.enabled && item.name.toLowerCase().includes(query.trim().toLowerCase()) && (rarity === 'all' || item.rarity === rarity) && (type === 'all' || item.type === type) && (!showFavs || favorites.includes(item.id)));
    return result.sort((a, b) => {
      if (sort === 'regular') return (b.regularValue ?? -1) - (a.regularValue ?? -1) || a.name.localeCompare(b.name);
      if (sort === 'permanent') return (b.permanentValue ?? -1) - (a.permanentValue ?? -1) || a.name.localeCompare(b.name);
      if (sort === 'demand') return (b.demand ?? -1) - (a.demand ?? -1) || a.name.localeCompare(b.name);
      if (sort === 'updated') return (b.lastUpdated || '').localeCompare(a.lastUpdated || '') || a.name.localeCompare(b.name);
      return a.name.localeCompare(b.name);
    });
  }, [values, query, rarity, type, sort, showFavs, favorites]);
  return <div className="page-wrap"><PageIntro eyebrow="THE CATALOG" title="Fruit values" description="Search canonical fruit names and compare the latest published estimates. A dash means there is no published quote yet." /><div className="catalog-toolbar"><label className="field-search"><Search size={17} /><input value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Search fruit names…" autoFocus /></label><label className="select-wrap"><Filter size={14} /><select value={rarity} onChange={(event) => setRarity(event.target.value)}><option value="all">All rarities</option>{rarityOrder.map((value) => <option key={value}>{value}</option>)}</select><ChevronDown size={14} /></label><label className="select-wrap"><SlidersHorizontal size={14} /><select value={type} onChange={(event) => setType(event.target.value)}><option value="all">All types</option><option>Natural</option><option>Elemental</option><option>Beast</option></select><ChevronDown size={14} /></label><label className="select-wrap"><select value={sort} onChange={(event) => setSort(event.target.value)}><option value="name">Sort: Name</option><option value="regular">Regular value</option><option value="permanent">Permanent value</option><option value="demand">Demand</option><option value="updated">Recently updated</option></select><ChevronDown size={14} /></label><Button className={showFavs ? 'filter-active' : ''} onClick={() => setShowFavs(!showFavs)} aria-pressed={showFavs}><Heart size={15} fill={showFavs ? 'currentColor' : 'none'} /> Favorites</Button><div className="view-toggle"><button aria-label="Grid view" aria-pressed={view === 'grid'} onClick={() => setView('grid')}>▦</button><button aria-label="Table view" aria-pressed={view === 'table'} onClick={() => setView('table')}>☷</button></div></div>
    <div className="catalog-meta"><span>{filtered.length} fruits</span><span>Dataset values are refreshed when a new publication is available.</span></div>
    {filtered.length ? view === 'grid' ? <div className="fruit-card-grid">{filtered.map((item) => <FruitCard key={item.id} item={item} navigate={navigate} isFavorite={favorites.includes(item.id)} onFavorite={() => favorite(item.id)} />)}</div> : <div className="data-table-wrap"><table className="data-table"><thead><tr><th>Fruit</th><th>Type / rarity</th><th>Regular</th><th>Permanent</th><th>Demand</th><th>Trend</th><th>Updated</th><th /></tr></thead><tbody>{filtered.map((item) => <tr key={item.id}><td><button className="table-fruit" onClick={() => navigate(`/fruit/${item.slug}`)}><FruitIcon fruit={item} size="sm" /><strong>{item.name}</strong></button></td><td>{item.type} · {item.rarity}</td><td>{fmt(item.regularValue)}</td><td>{fmt(item.permanentValue)}</td><td>{item.demand ?? '—'}</td><td>{item.trend === 'unknown' ? '—' : item.trend}</td><td>{item.lastUpdated ? new Date(item.lastUpdated).toLocaleDateString() : '—'}</td><td><button className={`table-favorite ${favorites.includes(item.id) ? 'is-favorite' : ''}`} aria-label={`Favorite ${item.name}`} onClick={() => favorite(item.id)}><Heart size={15} fill={favorites.includes(item.id) ? 'currentColor' : 'none'} /></button></td></tr>)}</tbody></table></div> : <EmptyState icon={Search} title="No fruits match those filters" text="Try a different name, rarity, or type filter." action={<Button onClick={() => { setQuery(''); setRarity('all'); setType('all'); setShowFavs(false); }}>Clear filters</Button>} />}
    <p className="catalog-disclaimer">Values use FruitForge’s editorial scale. They are not Beli or Robux prices and do not guarantee a trade outcome.</p>
  </div>;
}

function PageIntro({ eyebrow, title, description, children }: { eyebrow: string; title: string; description: string; children?: ReactNode }) {
  return <div className="page-intro"><div><div className="eyebrow">{eyebrow}</div><h1>{title}</h1><p>{description}</p></div>{children}</div>;
}

function SidePicker({ label, side, lines, values, onAdd, onUpdate, onClear }: { label: string; side: 'give' | 'receive'; lines: TradeLine[]; values: Fruit[]; onAdd: (id: string) => void; onUpdate: (id: string, quantity: number) => void; onClear: () => void }) {
  const [query, setQuery] = useState(''); const [open, setOpen] = useState(false);
  const matches = values.filter((item) => item.enabled && item.name.toLowerCase().includes(query.toLowerCase())).slice(0, 7);
  const byId = useMemo(() => new Map(values.map((item) => [item.id, item])), [values]);
  const total = lines.reduce((sum, line) => sum + ((byId.get(line.id)?.regularValue ?? 0) * line.quantity), 0);
  const hasMissing = lines.some((line) => !byId.get(line.id) || byId.get(line.id)?.regularValue === null);
  return <section className={`trade-side trade-side-${side}`}><div className="side-heading"><div><span className={`side-symbol side-symbol-${side}`}>{side === 'give' ? '↗' : '↙'}</span><span><strong>{label}</strong><small>{lines.length} {lines.length === 1 ? 'fruit' : 'fruits'}</small></span></div>{lines.length > 0 && <button className="text-button" onClick={onClear}><Trash2 size={13} /> Clear</button>}</div>
    <div className="picker-search"><Search size={16} /><input value={query} onFocus={() => setOpen(true)} onChange={(event) => { setQuery(event.target.value); setOpen(true); }} placeholder="Add a fruit…" aria-label={`Search fruit to ${side}`} onKeyDown={(event) => { if (event.key === 'Enter' && matches[0]) { onAdd(matches[0].id); setQuery(''); setOpen(false); } if (event.key === 'Escape') setOpen(false); }} /><kbd>↵</kbd>{open && <button className="picker-dismiss" aria-label="Close fruit search" onClick={() => setOpen(false)}><X size={13} /></button>}{open && <div className="picker-results">{matches.map((item) => <button key={item.id} onClick={() => { onAdd(item.id); setQuery(''); setOpen(false); }}><FruitIcon fruit={item} size="sm" /><span><strong>{item.name}</strong><small>{item.demand == null ? item.rarity : `Demand ${item.demand}/10`}</small></span><span className="picker-price">{fmt(item.regularValue)}</span><Plus size={14} /></button>)}{!matches.length && <div className="picker-empty">No matching fruits.</div>}</div>}</div>
    <div className="trade-lines">{lines.map((line) => { const fruit = byId.get(line.id); if (!fruit) return null; return <div className="trade-line" key={line.id}><FruitIcon fruit={fruit} size="sm" /><div className="trade-line-name"><strong>{fruit.name}</strong><small>{fruit.regularValue === null ? 'No published value' : `${fmt(fruit.regularValue)} × ${line.quantity}`}</small></div><div className="quantity-control"><button aria-label={`Decrease ${fruit.name}`} onClick={() => onUpdate(line.id, line.quantity - 1)} disabled={line.quantity <= 1}><Minus size={13} /></button><output>{line.quantity}</output><button aria-label={`Increase ${fruit.name}`} onClick={() => onUpdate(line.id, line.quantity + 1)} disabled={line.quantity >= 99}><Plus size={13} /></button></div><strong className="line-total">{fruit.regularValue === null ? '—' : fmt(fruit.regularValue * line.quantity)}</strong><button className="remove-line" aria-label={`Remove ${fruit.name}`} onClick={() => onUpdate(line.id, 0)}><X size={14} /></button></div>; })}
      {!lines.length && <div className="trade-empty"><span className={`empty-glyph empty-${side}`}>{side === 'give' ? '＋' : '↙'}</span><strong>{side === 'give' ? 'Add what you’re giving' : 'Add what you’re receiving'}</strong><small>Search the catalog above to start building your side.</small></div>}
    </div>
    <div className="side-total"><span>Total value</span><strong>{hasMissing ? '—' : fmt(total)}</strong></div>
  </section>;
}

function CalculatorPage({ values, byId, dataset, navigate }: { values: Fruit[]; byId: Map<string, Fruit>; dataset: Dataset; navigate: (to: string) => void }) {
  const [give, setGive] = useState<TradeLine[]>([]), [receive, setReceive] = useState<TradeLine[]>([]);
  const [notice, setNotice] = useState(''); const [undo, setUndo] = useState<{ give: TradeLine[]; receive: TradeLine[] } | null>(null);
  const [recentTrades, setRecentTrades] = useState<string[]>(() => localGet('fruitforge-recent-trades', []));
  const setBoth = (newGive: TradeLine[], newReceive: TradeLine[]) => { setUndo({ give, receive }); setGive(newGive); setReceive(newReceive); };
  const add = (side: 'give' | 'receive', id: string) => {
    const curr = side === 'give' ? give : receive; const existing = curr.find((line) => line.id === id);
    const next = existing ? curr.map((line) => line.id === id ? { ...line, quantity: Math.min(99, line.quantity + 1) } : line) : curr.length < 8 ? [...curr, { id, quantity: 1 }] : curr;
    setBoth(side === 'give' ? next : give, side === 'receive' ? next : receive);
  };
  const update = (side: 'give' | 'receive', id: string, quantity: number) => {
    const curr = side === 'give' ? give : receive;
    const next = quantity <= 0 ? curr.filter((line) => line.id !== id) : curr.map((line) => line.id === id ? { ...line, quantity: Math.min(99, quantity) } : line);
    setBoth(side === 'give' ? next : give, side === 'receive' ? next : receive);
  };
  const clear = () => setBoth([], []);
  useEffect(() => {
    const params = new URLSearchParams(window.location.search), shared = params.get('trade');
    if (shared) {
      const decoded = decodeTrade(shared, new Set(values.map((item) => item.id)));
      if (decoded) { setGive(decoded.give); setReceive(decoded.receive); setNotice('Shared trade loaded. Values were recalculated with the current published dataset.'); }
      else setNotice('This trade link is invalid or includes an unknown fruit ID.');
    }
    const pending = sessionStorage.getItem('fruitforge-add-to-trade');
    if (pending && catalogById.has(pending)) { sessionStorage.removeItem('fruitforge-add-to-trade'); setGive([{ id: pending, quantity: 1 }]); }
  }, []);
  const trade = useMemo(() => calculateTrade(give, receive, byId), [give, receive, byId]);
  const allSelected = [...give, ...receive].map((line) => byId.get(line.id)).filter((item): item is Fruit => !!item);
  const demands = allSelected.filter((item) => item.demand !== null);
  const demandMean = demands.length ? Math.round(demands.reduce((sum, item) => sum + (item.demand || 0), 0) / demands.length * 10) / 10 : null;
  const share = async () => {
    const tradeParam = encodeTrade(give, receive), url = `${window.location.origin}/calculator?trade=${encodeURIComponent(tradeParam)}`;
    try { await navigator.clipboard.writeText(url); setNotice('Share link copied. It contains fruit IDs and quantities, not prices.'); }
    catch { window.history.replaceState({}, '', `/calculator?trade=${encodeURIComponent(tradeParam)}`); setNotice('Share link is in the address bar. Copy it to share.'); }
    const history = [tradeParam, ...recentTrades.filter((item) => item !== tradeParam)].slice(0, 5); setRecentTrades(history); localStorage.setItem('fruitforge-recent-trades', JSON.stringify(history));
  };
  const copySummary = async () => {
    const lines = (items: TradeLine[]) => items.map((line) => `${line.quantity} × ${byId.get(line.id)?.name || line.id}`).join(', ') || 'Nothing selected';
    const result = trade.verdict === 'incomplete' ? 'Incomplete data' : trade.verdict === 'unavailable' ? 'Unavailable' : trade.verdict;
    try { await navigator.clipboard.writeText(`YOU GIVE: ${lines(give)}\nYOU RECEIVE: ${lines(receive)}\nValues: ${fmt(trade.give.total)} vs ${fmt(trade.receive.total)}\nResult: ${result}\nFruitForge estimates are advisory.`); setNotice('Trade summary copied.'); } catch { setNotice('Clipboard permission is unavailable in this browser.'); }
  };
  return <div className="page-wrap calculator-wrap"><PageIntro eyebrow="INSTANT TRADE CHECK" title="Trade calculator" description="Add fruits to each side. Totals update in your browser using the current published dataset." ><span className="dataset-chip"><span className="live-dot" /> DATASET v{dataset.version}</span></PageIntro>
    {dataset.version > 0 && dataset.publishedAt && Date.now() - new Date(dataset.publishedAt).getTime() > 7 * 86_400_000 && <div className="inline-notice stale-notice"><Clock3 size={15} /><span>This dataset has not changed in over seven days. Check the publication time before relying on it.</span></div>}
    {notice && <div className="inline-notice"><Info size={15} /><span>{notice}</span><button aria-label="Dismiss notice" onClick={() => setNotice('')}><X size={14} /></button></div>}
    <div className="calculator-toolbar"><span><span className="calc-dot" /> Calculations stay on this device</span><div><Button onClick={() => { setBoth(receive, give); setNotice('Both trade sides have been swapped.'); }}><ArrowLeftRight size={15} /> Swap sides</Button><Button onClick={() => { if (undo) { setGive(undo.give); setReceive(undo.receive); setUndo(null); } }} disabled={!undo}><RotateCcw size={14} /> Undo</Button><Button onClick={clear}><Trash2 size={14} /> Clear</Button></div></div>
    <div className="trade-board"><SidePicker label="YOU GIVE" side="give" lines={give} values={values} onAdd={(id) => add('give', id)} onUpdate={(id, quantity) => update('give', id, quantity)} onClear={() => setBoth([], receive)} /><div className="trade-center"><span className="versus-mark"><ArrowLeftRight size={18} /></span><span>VS</span></div><SidePicker label="YOU RECEIVE" side="receive" lines={receive} values={values} onAdd={(id) => add('receive', id)} onUpdate={(id, quantity) => update('receive', id, quantity)} onClear={() => setBoth(give, [])} /></div>
    <VerdictCard result={trade} dataset={dataset} values={values} demandMean={demandMean} hasItems={!!(give.length || receive.length)} />
    <div className="calculator-actions"><Button variant="primary" onClick={() => void copySummary()}><Copy size={15} /> Copy summary</Button><Button onClick={() => void share()}><Share2 size={15} /> Share trade</Button><Button onClick={() => window.print()}><Eye size={15} /> Print summary</Button><span>Share links recalculate with today’s published values.</span></div>
    {recentTrades.length > 0 && <div className="recent-trades"><div><strong>Recent trades on this device</strong><small>Saved locally when you copy a share link</small></div>{recentTrades.map((saved, index) => <button key={`${saved}-${index}`} onClick={() => { const decoded = decodeTrade(saved, new Set(values.map((item) => item.id))); if (decoded) { setBoth(decoded.give, decoded.receive); setNotice('Recent trade restored and recalculated using current published values.'); } }}><span>Trade {index + 1}</span><ArrowRight size={13} /></button>)}<button className="clear-recent" onClick={() => { setRecentTrades([]); localStorage.removeItem('fruitforge-recent-trades'); }}>Clear history</button></div>}
    <div className="method-note"><Info size={16} /><p><strong>How the comparison works:</strong> each side is the sum of regular value × quantity. The percentage uses your give total as its denominator. A difference within ±{FAIR_TRADE_TOLERANCE_PERCENT}% is shown as Fair. An empty give side cannot produce a percentage. Values are advisory estimates, and another player may still decline.</p></div>
  </div>;
}

function VerdictCard({ result, dataset, values, demandMean, hasItems }: { result: TradeResult; dataset: Dataset; values: Fruit[]; demandMean: number | null; hasItems: boolean }) {
  const labels: Record<TradeResult['verdict'], string> = { win: 'Win for you', fair: 'Fair trade', lose: 'Loss for you', incomplete: 'Incomplete data', unavailable: 'Add value to compare' };
  const description = !hasItems ? 'Add fruits to both sides to see a comparison.' : result.verdict === 'incomplete' ? `Publish values for ${[...result.give.missing, ...result.receive.missing].join(', ') || 'every selected fruit'} before comparing this trade.` : result.verdict === 'unavailable' ? 'Your give total is zero, so a percentage comparison is unavailable.' : result.verdict === 'fair' && result.give.total === 0 ? 'Both sides currently total zero based on published values.' : result.percentage === null ? 'The receive total is higher, but the percentage is outside the calculator’s display range.' : `The receive side is ${Math.abs(result.percentage)}% ${result.percentage >= 0 ? 'higher' : 'lower'} than the give side using published values.`;
  const styles: Record<TradeResult['verdict'], string> = { win: 'result-win', fair: 'result-fair', lose: 'result-lose', incomplete: 'result-incomplete', unavailable: 'result-incomplete' };
  return <div className={`verdict-card ${styles[result.verdict]}`}><div className="verdict-main"><span className="verdict-icon">{result.verdict === 'win' ? <ArrowUpRight /> : result.verdict === 'lose' ? <ArrowDownRight /> : result.verdict === 'incomplete' || result.verdict === 'unavailable' ? <Info /> : <Check />}</span><div><span className="eyebrow">TRADE CHECK</span><h2>{labels[result.verdict]}</h2><p>{description}</p></div></div><div className="verdict-numbers"><div><small>YOU GIVE</small><strong>{fmt(result.give.total)}</strong></div><span className="number-divider"><ArrowRight size={15} /></span><div><small>YOU RECEIVE</small><strong>{fmt(result.receive.total)}</strong></div><div className="difference"><small>DIFFERENCE</small><strong>{result.difference === null ? '—' : `${result.difference > 0 ? '+' : ''}${fmt(result.difference)}`}</strong><small>{result.percentage === null ? 'No percentage' : `${result.percentage > 0 ? '+' : ''}${result.percentage}%`}</small></div></div><div className="verdict-foot"><span><Clock3 size={13} /> Dataset v{dataset.version} · {dataset.publishedAt ? updatedText(dataset.publishedAt) : 'No values published'}</span><span>{demandMean === null ? 'Demand not rated' : `Selected fruit demand average ${demandMean}/10`}</span></div></div>;
}

function FruitPage({ slug, values, byId, favorites, favorite, navigate }: { slug: string; values: Fruit[]; byId: Map<string, Fruit>; favorites: string[]; favorite: (id: string) => void; navigate: (to: string) => void }) {
  const item = values.find((fruit) => fruit.slug === slug); const [history, setHistory] = useState<HistoryEntry[]>([]); const [historyError, setHistoryError] = useState('');
  useEffect(() => { if (!item) return; let active = true; api<{ history: HistoryEntry[] }>(`/api/values/${item.id}/history`).then((data) => active && setHistory(data.history)).catch(() => active && setHistoryError('Value history is currently unavailable.')); return () => { active = false; }; }, [item?.id]);
  if (!item) return <NotFound navigate={navigate} />;
  const add = () => { sessionStorage.setItem('fruitforge-add-to-trade', item.id); navigate('/calculator'); };
  const trendStyle = item.trend === 'rising' ? 'trend-up' : item.trend === 'falling' ? 'trend-down' : '';
  return <div className="page-wrap item-page"><div className="breadcrumbs"><Link to="/values" navigate={navigate}>Fruit values</Link><span>/</span><span>{item.name}</span></div><div className="item-hero"><div className="item-hero-main"><FruitIcon fruit={item} size="lg" /><div><div className="eyebrow">{item.type} · {item.rarity}{item.enabled ? '' : ' · INACTIVE CATALOG ITEM'}</div><h1>{item.name}</h1><p>Current editorial trading estimate and change history for the {item.name} fruit.</p>{!item.enabled && <p className="inactive-note">This item is inactive for new listings and calculator picks. Its stable ID and published history remain available.</p>}<div className="item-actions">{item.enabled && <Button variant="primary" onClick={add}><ArrowLeftRight size={15} /> Add to calculator</Button>}<Button onClick={() => favorite(item.id)}><Heart size={15} fill={favorites.includes(item.id) ? 'currentColor' : 'none'} /> {favorites.includes(item.id) ? 'Saved' : 'Save fruit'}</Button></div></div></div><div className="item-current"><span className="eyebrow">CURRENT REGULAR VALUE</span><strong>{fmt(item.regularValue)}</strong><small>{item.regularValue === null ? 'No value published yet' : `Dataset version ${item.datasetVersion}`}</small></div></div>
    <div className="item-stats-grid"><ItemStat label="Regular value" value={fmt(item.regularValue)} sub="FruitForge scale" /><ItemStat label="Permanent value" value={fmt(item.permanentValue)} sub="When published" /><ItemStat label="Demand" value={item.demand === null ? '—' : `${item.demand} / 10`} sub="Editorial rating" /><ItemStat label="Trend" value={item.trend === 'unknown' ? 'Not rated' : item.trend} sub={item.confidence === 'unrated' ? 'Confidence not rated' : `${item.confidence} confidence`} extra={trendStyle} /></div>{item.note && <div className="editor-note"><strong>Editor’s note</strong><br />{item.note}</div>}
    <section className="item-history panel"><div className="panel-heading"><div><div className="eyebrow">VALUE TIMELINE</div><h2>Published history</h2></div><span className="updated-pill"><Clock3 size={14} /> {updatedText(item.lastUpdated)}</span></div>{history.length > 1 ? <HistoryChart history={history} /> : <EmptyState icon={FileClock} title="History builds with publications" text={historyError || 'There is not enough published history to draw a chart yet. Each future value publication will be recorded here.'} />}{history.length > 0 && <div className="history-table"><div className="history-row history-header"><span>Version</span><span>Regular</span><span>Permanent</span><span>Demand</span><span>Published</span></div>{history.map((entry) => <div className="history-row" key={entry.version}><span>v{entry.version}</span><span>{fmt(entry.regularValue)}</span><span>{fmt(entry.permanentValue)}</span><span>{entry.demand ?? '—'}</span><span>{updatedText(entry.changedAt)}</span></div>)}</div>}</section>
    <section className="context-card"><Info size={17} /><div><strong>Use this value as context, not a promise.</strong><p>FruitForge publishes editorial estimates. In-game availability, player preference, and timing can affect what someone is willing to trade.</p></div></section><div className="related-section"><SectionTitle eyebrow="CONTINUE COMPARING" title="Related fruits" /><div className="fruit-card-grid">{values.filter((other) => other.id !== item.id && other.rarity === item.rarity).slice(0, 4).map((other) => <FruitCard key={other.id} item={other} navigate={navigate} />)}</div></div>
  </div>;
}
function ItemStat({ label, value, sub, extra = '' }: { label: string; value: string; sub: string; extra?: string }) { return <div className={`item-stat ${extra}`}><small>{label}</small><strong>{value}</strong><span>{sub}</span></div>; }
function HistoryChart({ history }: { history: HistoryEntry[] }) {
  const points = [...history].reverse().map((entry) => entry.regularValue).filter((value): value is number => value !== null && Number.isFinite(value));
  if (points.length < 2) return <EmptyState icon={FileClock} title="History builds with publications" text="There are not yet two numeric regular values to draw a trend line." />;
  const low = Math.min(...points), high = Math.max(...points), range = high - low || 1;
  const coordinates = points.map((value, index) => `${24 + index * (652 / (points.length - 1))},${174 - ((value - low) / range) * 138}`).join(' ');
  return <div className="chart-shell"><svg viewBox="0 0 700 200" role="img" aria-label={`Published value history. Low ${fmt(low)}, high ${fmt(high)}.`}><defs><linearGradient id="chartFill" x1="0" x2="0" y1="0" y2="1"><stop offset="0%" stopColor="var(--accent)" stopOpacity=".25" /><stop offset="100%" stopColor="var(--accent)" stopOpacity="0" /></linearGradient></defs><polygon points={`24,174 ${coordinates} 676,174`} fill="url(#chartFill)" /><polyline points={coordinates} fill="none" stroke="var(--accent)" strokeWidth="3" strokeLinejoin="round" strokeLinecap="round" />{points.map((value, index) => <circle key={index} cx={24 + index * (652 / (points.length - 1))} cy={174 - ((value - low) / range) * 138} r="4" fill="var(--accent)" />)}</svg><div className="chart-labels"><span>Lowest {fmt(low)}</span><span>Highest {fmt(high)}</span></div></div>;
}

function GuidesPage({ navigate }: { navigate: (to: string) => void }) {
  return <div className="page-wrap"><PageIntro eyebrow="TRADING NOTES" title="Guides that show their work" description="Original, practical notes on the dataset and the tools. Values remain estimates; the guidance explains how to read them." /><div className="guide-grid guide-grid-page">{GUIDES.map((guide, index) => <Link key={guide.slug} to={`/guides/${guide.slug}`} navigate={navigate} className="guide-card"><span className={`guide-index guide-index-${index}`}>0{index + 1}</span><span className="tag">{guide.tag}</span><h3>{guide.title}</h3><p>{guide.summary}</p><span className="guide-read">Read guide <ArrowRight size={14} /></span></Link>)}</div><section className="safety-panel"><ShieldCheck size={20} /><div><h2>Keep your account safe</h2><p>Never share a Roblox password, session cookie, or verification code. FruitForge does not need your password to calculate a trade.</p></div></section></div>;
}
function GuidePage({ slug, navigate }: { slug: string; navigate: (to: string) => void }) {
  const guide = GUIDES.find((item) => item.slug === slug); if (!guide) return <NotFound navigate={navigate} />;
  return <article className="page-wrap article-page"><div className="breadcrumbs"><Link to="/guides" navigate={navigate}>Guides</Link><span>/</span><span>{guide.title}</span></div><div className="eyebrow">{guide.tag}</div><h1>{guide.title}</h1><p className="article-lede">{guide.summary}</p><div className="article-body">{guide.body.map((paragraph, index) => <p key={index}>{paragraph}</p>)}<h2>Use the tools</h2><p>Open the <Link to="/calculator" navigate={navigate}>trade calculator</Link> to compare two sides using published estimates, or browse the <Link to="/values" navigate={navigate}>fruit catalog</Link> to check an individual item.</p><div className="article-callout"><Info size={17} /><span>FruitForge is independent. Estimates are informational and do not promise a trade outcome.</span></div><AdSlot slot={SITE.adSense.guideSlot} client={SITE.adSense.publisherId} consent={localStorage.getItem('fruitforge-ad-consent') || ''} placement="guide" /></div></article>;
}

declare global { interface Window { adsbygoogle?: unknown[] } }
function AdSlot({ slot, client, consent, placement }: { slot: string; client: string; consent: string; placement: 'banner' | 'in-content' | 'sidebar' | 'guide' }) {
  const valid = SITE.adSense.enabled && consent === 'accepted' && /^ca-pub-\d+$/.test(client) && /^\d+$/.test(slot);
  useEffect(() => {
    if (!valid) return;
    if (!document.querySelector<HTMLScriptElement>('#fruitforge-adsense')) {
      const script = document.createElement('script'); script.id = 'fruitforge-adsense'; script.async = true; script.crossOrigin = 'anonymous';
      script.src = `https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=${encodeURIComponent(client)}`;
      document.head.appendChild(script);
    }
    try { (window.adsbygoogle = window.adsbygoogle || []).push({}); } catch { /* The network can be unavailable without affecting the tools. */ }
  }, [valid, client, slot]);
  if (!valid) return null;
  return <div className={`ad-placement ad-${placement}`} aria-label="Advertisement"><span>ADVERTISEMENT</span><ins className="adsbygoogle" style={{ display: 'block' }} data-ad-client={client} data-ad-slot={slot} data-ad-format="auto" data-full-width-responsive="true" />{placement === 'sidebar' && <small>Advertisement</small>}</div>;
}
function AdConsent({ onChoose }: { onChoose: (choice: string) => void }) {
  const [open, setOpen] = useState(!localStorage.getItem('fruitforge-ad-consent'));
  if (!SITE.adSense.enabled) return null;
  if (!open) return <button className="ad-preferences" onClick={() => setOpen(true)}>Advertising preferences</button>;
  return <div className="ad-consent"><div><strong>Advertising choices</strong><p>Advertising is optional. If enabled for this site, AdSense resources load only after you allow advertising. Your choice is stored in this browser.</p></div><Button onClick={() => { onChoose('denied'); setOpen(false); }}>Decline</Button><Button variant="primary" onClick={() => { onChoose('accepted'); setOpen(false); }}>Allow ads</Button></div>;
}

function InfoPage({ kind }: { kind: 'about' | 'privacy' | 'terms' }) {
  const content = {
    about: { eyebrow: 'ABOUT', title: 'An independent trading reference', lead: 'FruitForge is a fan-made Blox Fruits values and trade tool built to make its assumptions visible.', parts: [['What the numbers mean', 'FruitForge’s regular and permanent values are editorial estimates on a site-defined scale. They are not in-game Beli or Robux prices, and they are not official game data. Values begin blank and only appear after an administrator reviews and publishes them.'], ['How updates work', 'An administrator saves drafts, checks a preview, and publishes a version. Earlier values remain in item history. Demand, trend, and confidence are editor assessments and do not alter calculator arithmetic.'], ['Contact and corrections', 'Use the feedback form to suggest a correction or report a problem. The trading hub is community-submitted and listings are not identity-verified.']] },
    privacy: { eyebrow: 'PRIVACY', title: 'Privacy at FruitForge', lead: 'This project is designed to work without a public account or a Roblox login.', parts: [['Calculator data', 'Fruit selections and recent trades stay in your browser unless you copy or share a trade link. Shared links contain canonical fruit IDs and quantities, not account details or custom prices. Favorites and recently viewed items are saved in local browser storage.'], ['Community submissions', 'If you post a listing, the site stores the listed fruit IDs, your public Roblox username, an optional note, and a private random owner token hash so you can edit or remove your listing. Listings expire after seven days. Feedback and reports are stored for site maintenance and moderation. Do not include passwords, verification codes, or sensitive personal information.'], ['Security and service logs', 'Cloudflare processes requests to serve the site. Submission endpoints use a salted hash of the connecting IP address for short-window abuse limits; raw IP addresses are not stored in the FruitForge database. Cloudflare may process request information under its own terms.'], ['Ads and cookies', 'Advertising is disabled until valid publisher configuration and any required consent process are supplied. This deployment does not claim AdSense approval. If advertising is enabled later, update this notice and implement a consent platform appropriate to the regions served.'], ['Contact', 'Use the feedback page for privacy questions or requests. A production operator should replace this section with a monitored contact address before launch.']] },
    terms: { eyebrow: 'TERMS & DISCLOSURE', title: 'Use estimates thoughtfully', lead: 'FruitForge is an independent fan reference. Using the site means you understand these limits.', parts: [['Independent status', 'FruitForge is not affiliated with, endorsed by, or sponsored by Roblox Corporation or Gamer Robot Inc. “Blox Fruits” is used to identify the game this fan site discusses. Game names and marks belong to their respective owners.'], ['Estimates are advisory', 'Values, demand, trend, and confidence are community-facing editorial estimates, not official prices or guaranteed trade outcomes. The other player may decline, and game conditions may change after publication. Check the timestamp and use your own judgment.'], ['Trading safety', 'Never share Roblox passwords, session cookies, verification codes, or payment details. Verify the exact items in the game trade window before confirming. Community listings are user-submitted and have not been verified. Report suspicious listings.'], ['Availability', 'The service and published data are provided as-is. The site may correct or remove listings and may change its features. Do not use FruitForge to automate game activity or bypass Roblox rules.']] },
  }[kind];
  return <article className="page-wrap article-page"><div className="eyebrow">{content.eyebrow}</div><h1>{content.title}</h1><p className="article-lede">{content.lead}</p><div className="article-body">{content.parts.map(([heading, text]) => <section key={heading}><h2>{heading}</h2><p>{text}</p></section>)}</div></article>;
}

function FeedbackPage() {
  const [category, setCategory] = useState('feedback'), [message, setMessage] = useState(''), [status, setStatus] = useState(''), [busy, setBusy] = useState(false);
  const submit = async (event: FormEvent) => { event.preventDefault(); setBusy(true); setStatus(''); try { await api('/api/feedback', { method: 'POST', body: JSON.stringify({ category, message }) }); setMessage(''); setStatus('Thanks. Your feedback was received.'); } catch (error) { setStatus(error instanceof Error ? error.message : 'Could not send feedback.'); } finally { setBusy(false); } };
  return <div className="page-wrap"><PageIntro eyebrow="HELP IMPROVE THE SITE" title="Feedback and corrections" description="Report a broken page, suggest a correction, or share a usability note. Do not include passwords or private account details." /><form className="form-panel feedback-form" onSubmit={submit}><label>Topic<select value={category} onChange={(event) => setCategory(event.target.value)}><option value="feedback">General feedback</option><option value="bug">Bug report</option><option value="correction">Value or catalog correction</option></select></label><label>Message<textarea required minLength={8} maxLength={1500} rows={6} value={message} onChange={(event) => setMessage(event.target.value)} placeholder="Tell us what you noticed…" /></label><div className="form-foot"><span>{message.length}/1,500 characters</span><Button type="submit" variant="primary" disabled={busy}>{busy ? 'Sending…' : 'Send feedback'} <ArrowRight size={15} /></Button></div>{status && <p className="form-status" role="status">{status}</p>}</form></div>;
}

function NotFound({ navigate }: { navigate: (to: string) => void }) { return <div className="page-wrap not-found"><span className="not-found-code">404</span><div className="eyebrow">NOT IN THE CATALOG</div><h1>That page isn’t here.</h1><p>The link may have changed. The canonical fruit list is always available.</p><div><Button variant="primary" onClick={() => navigate('/values')}>Browse fruit values</Button><Button onClick={() => navigate('/')}>Back home</Button></div></div>; }

function TradingPage({ values, byId }: { values: Fruit[]; byId: Map<string, Fruit> }) {
  const [listings, setListings] = useState<Listing[]>([]), [loadError, setLoadError] = useState(''), [busy, setBusy] = useState(false);
  const [offer, setOffer] = useState<TradeLine[]>([]), [wanted, setWanted] = useState<TradeLine[]>([]);
  const [offerPick, setOfferPick] = useState(''), [wantedPick, setWantedPick] = useState('');
  const [contact, setContact] = useState(''), [note, setNote] = useState(''), [status, setStatus] = useState(''), [editId, setEditId] = useState('');
  const [filterOffer, setFilterOffer] = useState(''), [filterWant, setFilterWant] = useState('');
  const [ageFilter, setAgeFilter] = useState('all');
  const [owned, setOwned] = useState<Record<string, string>>(() => localGet('fruitforge-owned-trades', {}));
  const [reporting, setReporting] = useState(''), [reportReason, setReportReason] = useState('scam');
  const refresh = async () => {
    try { const params = new URLSearchParams({ limit: '60' }); if (filterOffer) params.set('offer', filterOffer); if (filterWant) params.set('want', filterWant); const data = await api<{ listings: Listing[] }>(`/api/trades?${params}`); setListings(data.listings); setLoadError(''); }
    catch (error) { setLoadError(error instanceof Error ? error.message : 'Could not load trade listings.'); }
  };
  useEffect(() => { void refresh(); }, [filterOffer, filterWant]);
  const ageLimit = ageFilter === 'day' ? 86_400_000 : ageFilter === 'three-days' ? 3 * 86_400_000 : ageFilter === 'week' ? 7 * 86_400_000 : Infinity;
  const visibleListings = listings.filter((listing) => Date.now() - new Date(listing.createdAt).getTime() <= ageLimit);
  const addLine = (side: 'offer' | 'wanted') => {
    const id = side === 'offer' ? offerPick : wantedPick; if (!id) return;
    const lines = side === 'offer' ? offer : wanted; const existing = lines.find((line) => line.id === id);
    const next = existing ? lines.map((line) => line.id === id ? { ...line, quantity: Math.min(99, line.quantity + 1) } : line) : lines.length < 8 ? [...lines, { id, quantity: 1 }] : lines;
    if (side === 'offer') setOffer(next); else setWanted(next);
  };
  const resetForm = () => { setOffer([]); setWanted([]); setContact(''); setNote(''); setEditId(''); setStatus(''); };
  const submit = async (event: FormEvent) => {
    event.preventDefault(); setBusy(true); setStatus('');
    try {
      if (editId) {
        await api(`/api/trades/${editId}`, { method: 'PATCH', body: JSON.stringify({ ownerToken: owned[editId], offer, wanted, contact, note }) });
        setStatus('Your listing was updated.');
      } else {
        const bytes = crypto.getRandomValues(new Uint8Array(32)), token = [...bytes].map((byte) => byte.toString(16).padStart(2, '0')).join('');
        const result = await api<{ id: string }>('/api/trades', { method: 'POST', body: JSON.stringify({ offer, wanted, contact, note, ownerToken: token, company: '' }) });
        const nextOwned = { ...owned, [result.id]: token }; setOwned(nextOwned); localStorage.setItem('fruitforge-owned-trades', JSON.stringify(nextOwned)); setStatus('Listing posted. This browser saved the private owner key so you can edit or remove it later.');
      }
      resetForm(); await refresh();
    } catch (error) { setStatus(error instanceof Error ? error.message : 'Could not save your listing.'); }
    finally { setBusy(false); }
  };
  const startEdit = (listing: Listing) => { setEditId(listing.id); setOffer(listing.offer); setWanted(listing.wanted); setContact(listing.contact); setNote(listing.note); setStatus('Editing your listing.'); document.getElementById('trade-form')?.scrollIntoView({ behavior: 'smooth', block: 'start' }); };
  const remove = async (listing: Listing) => {
    if (!window.confirm('Remove this listing from the trading hub?')) return;
    try { await api(`/api/trades/${listing.id}`, { method: 'DELETE', body: JSON.stringify({ ownerToken: owned[listing.id] }) }); const next = { ...owned }; delete next[listing.id]; setOwned(next); localStorage.setItem('fruitforge-owned-trades', JSON.stringify(next)); await refresh(); }
    catch (error) { setStatus(error instanceof Error ? error.message : 'Could not remove the listing.'); }
  };
  const report = async (listing: Listing) => {
    try { await api(`/api/trades/${listing.id}/report`, { method: 'POST', body: JSON.stringify({ reason: reportReason, detail: '' }) }); setStatus('Report sent to the moderation queue.'); setReporting(''); }
    catch (error) { setStatus(error instanceof Error ? error.message : 'Could not submit the report.'); }
  };
  return <div className="page-wrap trading-page"><PageIntro eyebrow="COMMUNITY TRADING" title="Trading hub" description="Browse community-submitted offers or post your own. Listings are not verified; always check the exact trade in game." />
    <div className="community-notice"><ShieldCheck size={17} /><span>Never share a Roblox password or verification code. FruitForge does not verify player identity or guarantee an offer.</span></div>
    <form id="trade-form" className="trade-form panel" onSubmit={submit}><div className="panel-heading"><div><div className="eyebrow">{editId ? 'MANAGE YOUR LISTING' : 'CREATE A LISTING'}</div><h2>{editId ? 'Edit offer' : 'What are you trading?'}</h2></div>{editId && <Button type="button" onClick={resetForm}><X size={14} /> Cancel edit</Button>}</div>
      <div className="listing-sides"><ListingEditorSide label="YOU OFFER" lines={offer} selected={offerPick} setSelected={setOfferPick} add={addLine} setLines={setOffer} values={values} side="offer" /><span className="listing-exchange"><ArrowLeftRight size={18} /></span><ListingEditorSide label="YOU WANT" lines={wanted} selected={wantedPick} setSelected={setWantedPick} add={addLine} setLines={setWanted} values={values} side="wanted" /></div>
      <div className="form-row"><label>Roblox username<input value={contact} onChange={(event) => setContact(event.target.value)} minLength={3} maxLength={20} pattern="[A-Za-z0-9_]{3,20}" required placeholder="Your username" /><small>Shown publicly so traders can find you. Never enter a password.</small></label><label>Note <span className="optional">optional</span><input value={note} onChange={(event) => setNote(event.target.value)} maxLength={240} placeholder="Add context about your offer" /></label></div>
      <div className="form-foot"><span>{note.length}/240 · Listings expire after 7 days.</span><Button type="submit" variant="primary" disabled={busy}>{busy ? 'Saving…' : editId ? 'Save changes' : 'Post listing'} <ArrowRight size={15} /></Button></div>{status && <p className="form-status" role="status">{status}</p>}
    </form>
    <div className="listing-toolbar"><div><div className="eyebrow">OPEN OFFERS</div><h2>Browse listings</h2><p>Newest first · listings expire after seven days</p></div><div className="listing-filters"><label><span>Offering</span><select value={filterOffer} onChange={(event) => setFilterOffer(event.target.value)}><option value="">Any fruit</option>{values.filter((item) => item.enabled).map((item) => <option key={item.id} value={item.id}>{item.name}</option>)}</select></label><label><span>Looking for</span><select value={filterWant} onChange={(event) => setFilterWant(event.target.value)}><option value="">Any fruit</option>{values.filter((item) => item.enabled).map((item) => <option key={item.id} value={item.id}>{item.name}</option>)}</select></label><label><span>Age</span><select value={ageFilter} onChange={(event) => setAgeFilter(event.target.value)}><option value="all">Any age</option><option value="day">Last 24 hours</option><option value="three-days">Last 3 days</option><option value="week">Last 7 days</option></select></label></div></div>
    {loadError ? <EmptyState icon={Info} title="Listings are unavailable" text={loadError} action={<Button onClick={() => void refresh()}>Try again</Button>} /> : visibleListings.length ? <div className="listing-grid">{visibleListings.map((listing) => <ListingCard key={listing.id} listing={listing} byId={byId} owned={!!owned[listing.id]} editing={editId === listing.id} reporting={reporting === listing.id} reason={reportReason} setReason={setReportReason} startEdit={() => startEdit(listing)} remove={() => void remove(listing)} onReport={() => setReporting(reporting === listing.id ? '' : listing.id)} submitReport={() => void report(listing)} />)}</div> : <EmptyState icon={Activity} title="No listings yet" text="There are no offers matching those filters. Be the first to post one." />}
  </div>;
}

function ListingEditorSide({ label, lines, selected, setSelected, add, setLines, values, side }: { label: string; lines: TradeLine[]; selected: string; setSelected: (id: string) => void; add: (side: 'offer' | 'wanted') => void; setLines: (lines: TradeLine[]) => void; values: Fruit[]; side: 'offer' | 'wanted' }) {
  return <div className="listing-editor"><label>{label}</label><div className="listing-add"><select value={selected} onChange={(event) => setSelected(event.target.value)}><option value="">Choose a fruit…</option>{values.filter((item) => item.enabled).map((item) => <option value={item.id} key={item.id}>{item.name}</option>)}</select><Button type="button" onClick={() => add(side)} disabled={!selected}><Plus size={15} /> Add</Button></div><div className="listing-chips">{lines.map((line) => <span className="listing-chip" key={line.id}><FruitIcon fruit={catalogById.get(line.id)!} size="sm" />{line.quantity} × {catalogById.get(line.id)?.name}<button type="button" aria-label={`Remove ${catalogById.get(line.id)?.name}`} onClick={() => setLines(lines.filter((item) => item.id !== line.id))}><X size={13} /></button></span>)}{!lines.length && <small>No fruit added yet.</small>}</div></div>;
}

function ListingCard({ listing, byId, owned, editing, reporting, reason, setReason, startEdit, remove, onReport, submitReport }: { listing: Listing; byId: Map<string, Fruit>; owned: boolean; editing: boolean; reporting: boolean; reason: string; setReason: (reason: string) => void; startEdit: () => void; remove: () => void; onReport: () => void; submitReport: () => void }) {
  const names = (items: TradeLine[]) => items.length ? items.map((line) => `${line.quantity > 1 ? `${line.quantity} × ` : ''}${byId.get(line.id)?.name || 'Unavailable fruit'}`).join(', ') : 'Open to offers';
  const ageMs = Date.now() - new Date(listing.createdAt).getTime(), age = ageMs < 3_600_000 ? 'Just posted' : ageMs < 86_400_000 ? `${Math.floor(ageMs / 3_600_000)}h ago` : `${Math.floor(ageMs / 86_400_000)}d ago`;
  return <article className="listing-card"><div className="listing-card-top"><span className="listing-age"><Clock3 size={12} /> {age}</span>{owned ? <span className="mine-badge"><Check size={12} /> Your listing</span> : <span className="unverified-badge">Community post</span>}</div><div className="listing-row"><span className="listing-label">OFFER</span><strong>{names(listing.offer)}</strong></div><div className="listing-swap"><ArrowDownRight size={15} /></div><div className="listing-row"><span className="listing-label">WANTS</span><strong>{names(listing.wanted)}</strong></div>{listing.note && <p className="listing-note">“{listing.note}”</p>}<div className="listing-contact"><span>CONTACT</span><strong>@{listing.contact}</strong><button onClick={() => void navigator.clipboard?.writeText(listing.contact)} aria-label="Copy username"><Copy size={14} /></button></div>{reporting && <div className="report-inline"><label>Reason<select value={reason} onChange={(event) => setReason(event.target.value)}><option value="scam">Suspicious or scam</option><option value="spam">Spam</option><option value="abusive">Abusive</option><option value="other">Other</option></select></label><Button variant="danger" onClick={submitReport}>Send report</Button></div>}<div className="listing-card-actions">{owned ? <><Button onClick={startEdit} disabled={editing}><SlidersHorizontal size={14} /> Edit</Button><Button variant="danger" onClick={remove}><Trash2 size={14} /> Remove</Button></> : <Button onClick={onReport}><ShieldCheck size={14} /> {reporting ? 'Cancel report' : 'Report listing'}</Button>}<span>Not verified</span></div></article>;
}

type DraftEditable = 'regularValue' | 'permanentValue' | 'demand' | 'trend' | 'confidence' | 'note';
type PreviewChange = { id: string; name: string; from: Record<string, unknown>; to: Record<string, unknown>; changed: boolean };
const adminEditable: DraftEditable[] = ['regularValue', 'permanentValue', 'demand', 'trend', 'confidence', 'note'];
const csvHeaders = ['id', 'regularValue', 'permanentValue', 'demand', 'trend', 'confidence', 'note'];
function csvCell(value: unknown) { const text = value == null ? '' : String(value); return /[",\r\n]/.test(text) ? `"${text.replaceAll('"', '""')}"` : text; }
function saveFile(name: string, text: string) { const url = URL.createObjectURL(new Blob([text], { type: 'text/csv;charset=utf-8' })); const link = document.createElement('a'); link.href = url; link.download = name; link.click(); URL.revokeObjectURL(url); }

function AdminPage() {
  const [items, setItems] = useState<AdminFruit[]>([]), [connected, setConnected] = useState(false), [loading, setLoading] = useState(true);
  const [edits, setEdits] = useState<Record<string, Partial<Record<DraftEditable, string>>>>({});
  const [search, setSearch] = useState(''), [rarity, setRarity] = useState('all'), [sort, setSort] = useState('name');
  const [type, setType] = useState('all'), [demandFilter, setDemandFilter] = useState('all');
  const [message, setMessage] = useState(''), [errorDetail, setErrorDetail] = useState(''), [busy, setBusy] = useState(false);
  const [preview, setPreview] = useState<{ changes: PreviewChange[]; changedCount: number; draftCount: number } | null>(null);
  const [history, setHistory] = useState<Record<string, HistoryEntry[]>>({}), [expanded, setExpanded] = useState('');
  const [audit, setAudit] = useState<Record<string, unknown>[]>([]);
  const [feedback, setFeedback] = useState<FeedbackEntry[]>([]), [reports, setReports] = useState<ReportTicket[]>([]);
  const [filter, setFilter] = useState<'all' | 'drafts' | 'disabled'>('all');
  const fileRef = useRef<HTMLInputElement>(null);
  const refresh = async () => {
    setLoading(true);
    try {
      const data = await api<{ items: AdminFruit[] }>('/api/admin/values'); setItems(data.items); setConnected(true); setEdits({}); setMessage('');
      const [logs, feedbackData, reportData] = await Promise.all([
        api<{ entries: Record<string, unknown>[] }>('/api/admin/audit-log?limit=8'),
        api<{ entries: FeedbackEntry[] }>('/api/admin/feedback?limit=40'),
        api<{ entries: ReportTicket[] }>('/api/admin/reports'),
      ]);
      setAudit(logs.entries); setFeedback(feedbackData.entries); setReports(reportData.entries);
    } catch (error) { setConnected(false); setMessage(error instanceof Error ? error.message : 'Could not load the admin dashboard.'); }
    finally { setLoading(false); }
  };
  useEffect(() => { void refresh(); }, []);
  const setEdit = (id: string, field: DraftEditable, value: string) => { setEdits((old) => ({ ...old, [id]: { ...old[id], [field]: value } })); setPreview(null); };
  const displayed = (item: AdminFruit, field: DraftEditable) => {
    const local = edits[item.id]?.[field]; if (local !== undefined) return local;
    const published = item[field]; const savedDraft = item.draft?.[field];
    const value = item.draft ? savedDraft : published;
    return value == null ? '' : String(value);
  };
  const parseDraft = (item: AdminFruit, fields: Partial<Record<DraftEditable, string>>): Record<string, unknown> | string => {
    const result: Record<string, unknown> = {};
    for (const [field, raw] of Object.entries(fields) as [DraftEditable, string][]) {
      const clean = raw.trim();
      if (field === 'regularValue' || field === 'permanentValue') {
        if (clean === '') { result[field] = null; continue; }
        if (!/^(?:\d+\.?\d*|\.\d+)$/.test(clean) || !Number.isFinite(Number(clean))) return `${item.name}: ${field === 'regularValue' ? 'regular' : 'permanent'} value must be a non-negative number.`;
        result[field] = Number(clean);
      } else if (field === 'demand') {
        if (clean === '') { result[field] = null; continue; }
        const number = Number(clean); if (!/^\d+$/.test(clean) || !Number.isInteger(number) || number < 1 || number > 10) return `${item.name}: demand must be a whole number from 1 to 10.`;
        result[field] = number;
      } else if (field === 'trend') result[field] = clean;
      else if (field === 'confidence') result[field] = clean;
      else {
        if (field === 'note' && clean.length > 240) return `${item.name}: note must be 240 characters or fewer.`;
        result[field] = clean || null;
      }
    }
    return result;
  };
  const saveRow = async (item: AdminFruit) => {
    const changes = edits[item.id]; if (!changes || !Object.keys(changes).length) return true;
    const parsed = parseDraft(item, changes); if (typeof parsed === 'string') { setMessage(parsed); return false; }
    try { await api(`/api/admin/values/${item.id}`, { method: 'PATCH', body: JSON.stringify(parsed) }); return true; }
    catch (error) { setMessage(error instanceof Error ? error.message : `Could not save ${item.name}.`); return false; }
  };
  const saveAll = async () => {
    setBusy(true); setMessage('');
    for (const item of items.filter((row) => edits[row.id] && Object.keys(edits[row.id]).length)) {
      const ok = await saveRow(item); if (!ok) { setBusy(false); return; }
    }
    await refresh(); setMessage('Drafts saved. Preview the changes before publishing.'); setPreview(null); setBusy(false);
  };
  const discardDrafts = async () => {
    if (!window.confirm('Discard all saved drafts? This does not change published values.')) return;
    setBusy(true); try { const data = await api<{ discarded: number }>('/api/admin/drafts', { method: 'DELETE' }); setMessage(`${data.discarded} draft${data.discarded === 1 ? '' : 's'} discarded.`); setPreview(null); await refresh(); }
    catch (error) { setMessage(error instanceof Error ? error.message : 'Could not discard drafts.'); } finally { setBusy(false); }
  };
  const previewPublish = async () => {
    setBusy(true); setMessage('');
    try {
      const unsaved = items.filter((item) => edits[item.id] && Object.keys(edits[item.id]).length);
      for (const item of unsaved) { const ok = await saveRow(item); if (!ok) { setBusy(false); return; } }
      if (unsaved.length) await refresh();
      const data = await api<{ changes: PreviewChange[]; changedCount: number; draftCount: number }>('/api/admin/values/preview', { method: 'POST', body: JSON.stringify({ confirm: true }) });
      setPreview(data); setMessage(data.changedCount ? `${data.changedCount} fruit${data.changedCount === 1 ? '' : 's'} will change in the next published dataset.` : 'No changes to publish.');
    } catch (error) { setMessage(error instanceof Error ? error.message : 'Could not preview publication.'); }
    finally { setBusy(false); }
  };
  const publish = async () => {
    if (!preview?.changedCount || !window.confirm(`Publish ${preview.changedCount} reviewed value change${preview.changedCount === 1 ? '' : 's'} for every visitor?`)) return;
    setBusy(true); try { const data = await api<{ version: number; changedCount: number }>('/api/admin/values/publish', { method: 'POST', body: JSON.stringify({ confirm: true }) }); setMessage(`Published dataset v${data.version} with ${data.changedCount} changed fruit${data.changedCount === 1 ? '' : 's'}.`); setPreview(null); await refresh(); }
    catch (error) { setMessage(error instanceof Error ? error.message : 'Publication failed. No partial dataset should be visible.'); }
    finally { setBusy(false); }
  };
  const importCsv = async (file?: File) => {
    if (!file) return; setBusy(true); setMessage(''); setErrorDetail('');
    try { const csv = await file.text(); const data = await api<{ imported: number; message: string }>('/api/admin/values/import', { method: 'POST', body: JSON.stringify({ csv }) }); setMessage(data.message); setPreview(null); await refresh(); }
    catch (error) { setMessage(error instanceof Error ? error.message : 'CSV import failed.'); if (error instanceof ApiError && error.details) setErrorDetail(JSON.stringify(error.details, null, 2)); }
    finally { setBusy(false); if (fileRef.current) fileRef.current.value = ''; }
  };
  const exportCsv = () => {
    const rows = items.map((item) => [item.id, item.regularValue, item.permanentValue, item.demand, item.trend, item.confidence, item.note].map(csvCell).join(','));
    saveFile('fruitforge-current-values.csv', [csvHeaders.join(','), ...rows].join('\r\n'));
  };
  const importTemplate = () => saveFile('fruitforge-values-template.csv', `${csvHeaders.join(',')}\r\nfruit-rocket,,,,,,\r\n`);
  const toggleEnabled = async (item: AdminFruit) => {
    setBusy(true); try { await api('/api/admin/catalog', { method: 'PATCH', body: JSON.stringify({ id: item.id, enabled: !item.enabled }) }); await refresh(); setMessage(`${item.name} ${item.enabled ? 'disabled' : 'enabled'} in the public catalog.`); }
    catch (error) { setMessage(error instanceof Error ? error.message : 'Could not update catalog status.'); } finally { setBusy(false); }
  };
  const showHistory = async (item: AdminFruit) => {
    if (expanded === item.id) { setExpanded(''); return; }
    setExpanded(item.id);
    if (!history[item.id]) { try { const data = await api<{ history: HistoryEntry[] }>(`/api/admin/history/${item.id}`); setHistory((old) => ({ ...old, [item.id]: data.history })); } catch (error) { setMessage(error instanceof Error ? error.message : 'Could not load history.'); } }
  };
  const rollback = async (item: AdminFruit, version: number) => {
    try { await api('/api/admin/values/rollback', { method: 'POST', body: JSON.stringify({ id: item.id, version }) }); setMessage(`Rollback to v${version} saved as a new draft for ${item.name}. Review, then publish it.`); await refresh(); await showHistory(item); }
    catch (error) { setMessage(error instanceof Error ? error.message : 'Could not prepare rollback.'); }
  };
  const reviewReport = async (report: ReportTicket, status: 'resolved' | 'dismissed') => {
    try { await api(`/api/admin/reports/${report.id}`, { method: 'PATCH', body: JSON.stringify({ status }) }); setReports((old) => old.map((item) => item.id === report.id ? { ...item, status } : item)); setMessage(`Report marked ${status}.`); }
    catch (error) { setMessage(error instanceof Error ? error.message : 'Could not update this report.'); }
  };
  const moderateListing = async (report: ReportTicket) => {
    if (!window.confirm('Remove this reported listing from the public trading hub?')) return;
    try { await api(`/api/admin/trades/${report.tradeId}`, { method: 'PATCH', body: JSON.stringify({ active: false }) }); setReports((old) => old.map((item) => item.tradeId === report.tradeId ? { ...item, active: false } : item)); setMessage('Listing removed from public browse and recorded in the audit log.'); }
    catch (error) { setMessage(error instanceof Error ? error.message : 'Could not moderate this listing.'); }
  };
  const filtered = items.filter((item) => item.name.toLowerCase().includes(search.trim().toLowerCase()) && (rarity === 'all' || item.rarity === rarity) && (type === 'all' || item.type === type) && (demandFilter === 'all' || (demandFilter === 'unrated' && item.demand === null) || (demandFilter === 'high' && item.demand !== null && item.demand >= 7) || (demandFilter === 'low' && item.demand !== null && item.demand <= 4)) && (filter !== 'drafts' || !!item.draft || !!edits[item.id]) && (filter !== 'disabled' || !item.enabled));
  filtered.sort((a, b) => sort === 'value' ? (b.regularValue ?? -1) - (a.regularValue ?? -1) || a.name.localeCompare(b.name) : a.name.localeCompare(b.name));
  if (loading && !items.length) return <div className="page-wrap admin-wrap"><PageIntro eyebrow="ADMIN" title="Values manager" description="Manage the canonical fruit catalog and publish reviewed value updates." /><div className="admin-locked"><ShieldCheck size={26} /><h2>Checking administrator access…</h2><p>FruitForge uses Cloudflare Access and validates your identity on every administrative request.</p></div></div>;
  if (!connected) return <div className="page-wrap admin-wrap"><PageIntro eyebrow="ADMIN" title="Values manager" description="Manage the canonical fruit catalog and publish reviewed value updates." /><div className="admin-locked"><ShieldCheck size={28} /><h2>Administrator access required</h2><p>{message || 'Sign in with an email approved in the Cloudflare Access configuration. Access is checked by the server for each admin request.'}</p><p>There is no browser-only password and no public sign-in shortcut. Configure Cloudflare Access and the administrator email allowlist before opening this dashboard.</p><Button variant="primary" onClick={() => void refresh()}>Check access again <ArrowRight size={15} /></Button></div></div>;
  const draftCount = items.filter((item) => item.draft).length + items.filter((item) => !item.draft && edits[item.id] && Object.keys(edits[item.id]).length).length;
  const renderRow = (item: AdminFruit, mobile = false) => <div className={`admin-fruit-row ${mobile ? 'admin-fruit-card' : ''}`} key={`${mobile ? 'm' : 'd'}-${item.id}`}>
    <div className="admin-fruit-name"><FruitIcon fruit={item} size="sm" /><div><strong>{item.name}</strong><small>{item.id} · {item.rarity}</small></div><button className={`catalog-status ${item.enabled ? 'enabled' : ''}`} title={item.enabled ? 'Disable catalog item' : 'Enable catalog item'} onClick={() => void toggleEnabled(item)}>{item.enabled ? 'Active' : 'Disabled'}</button></div>
    <label className="admin-input-label"><span>Regular value</span><input type="number" min="0" step="any" inputMode="decimal" aria-label={`${item.name} regular value`} value={displayed(item, 'regularValue')} onChange={(event) => setEdit(item.id, 'regularValue', event.target.value)} placeholder="—" /></label>
    <label className="admin-input-label"><span>Permanent value</span><input type="number" min="0" step="any" inputMode="decimal" aria-label={`${item.name} permanent value`} value={displayed(item, 'permanentValue')} onChange={(event) => setEdit(item.id, 'permanentValue', event.target.value)} placeholder="—" /></label>
    <label className="admin-input-label"><span>Demand / 10</span><input type="number" min="1" max="10" step="1" inputMode="numeric" aria-label={`${item.name} demand`} value={displayed(item, 'demand')} onChange={(event) => setEdit(item.id, 'demand', event.target.value)} placeholder="—" /></label>
    <label className="admin-input-label"><span>Trend</span><select value={displayed(item, 'trend') || 'unknown'} onChange={(event) => setEdit(item.id, 'trend', event.target.value)}><option value="unknown">Not rated</option><option value="rising">Rising</option><option value="stable">Stable</option><option value="falling">Falling</option></select></label>
    <label className="admin-input-label"><span>Confidence</span><select value={displayed(item, 'confidence') || 'unrated'} onChange={(event) => setEdit(item.id, 'confidence', event.target.value)}><option value="unrated">Not rated</option><option value="high">High</option><option value="medium">Medium</option><option value="low">Low</option></select></label>
    <label className="admin-input-label admin-note-field"><span>Explanation note</span><input type="text" maxLength={240} aria-label={`${item.name} value explanation`} value={displayed(item, 'note')} onChange={(event) => setEdit(item.id, 'note', event.target.value)} placeholder="Optional context" /></label>
    <div className="admin-last"><span className="admin-mobile-label">Last published</span><strong>{fmt(item.regularValue)}</strong><small>{updatedText(item.lastPublished)}</small></div>
    <div className="admin-row-actions">{edits[item.id] && Object.keys(edits[item.id]).length ? <span className="save-state unsaved">Unsaved</span> : item.draft ? <span className="save-state draft-state">Draft saved</span> : <span className="save-state">Up to date</span>}<Button className="row-save" onClick={() => void saveRow(item).then(async (ok) => { if (ok) await refresh(); })} disabled={busy || !(edits[item.id] && Object.keys(edits[item.id]).length)}><Check size={13} /> Save</Button><button className="history-action" onClick={() => void showHistory(item)} aria-label={`Show ${item.name} value history`}><FileClock size={15} /></button></div>
    {expanded === item.id && <div className="admin-history">{(history[item.id] || []).length ? <>{(history[item.id] || []).map((entry) => <div className="admin-history-row" key={entry.version}><span>v{entry.version} · {updatedText(entry.changedAt)}</span><span>{fmt(entry.previousRegularValue)} <ArrowRight size={12} /> {fmt(entry.regularValue)}</span><span>{entry.changedBy}</span><Button onClick={() => void rollback(item, entry.version)}>Restore previous as draft</Button></div>)}</> : <span>No published history for this fruit yet.</span>}</div>}
  </div>;
  return <div className="page-wrap admin-wrap"><PageIntro eyebrow="ADMIN · VALUES MANAGER" title="Values manager" description="Edit the fixed catalog’s numbers, save drafts, review the impact, and publish one dataset version." ><span className="dataset-chip">{items.length} canonical fruits</span></PageIntro>
    <div className="admin-security"><ShieldCheck size={17} /><span>Server-verified Cloudflare Access · Only approved administrator emails can save or publish.</span><span>Fruit names are fixed by the catalog.</span></div>
    <div className="admin-toolbar"><label className="field-search"><Search size={16} /><input value={search} onChange={(event) => setSearch(event.target.value)} placeholder="Find a fruit…" /></label><label className="select-wrap"><select value={rarity} onChange={(event) => setRarity(event.target.value)}><option value="all">All rarities</option>{rarityOrder.map((value) => <option key={value}>{value}</option>)}</select><ChevronDown size={14} /></label><label className="select-wrap"><select value={type} onChange={(event) => setType(event.target.value)}><option value="all">All fruit types</option><option>Natural</option><option>Elemental</option><option>Beast</option></select><ChevronDown size={14} /></label><label className="select-wrap"><select value={demandFilter} onChange={(event) => setDemandFilter(event.target.value)}><option value="all">Any demand</option><option value="high">High · 7–10</option><option value="low">Low · 1–4</option><option value="unrated">Unrated</option></select><ChevronDown size={14} /></label><label className="select-wrap"><select value={filter} onChange={(event) => setFilter(event.target.value as typeof filter)}><option value="all">All catalog items</option><option value="drafts">Drafts and unsaved</option><option value="disabled">Disabled items</option></select><ChevronDown size={14} /></label><label className="select-wrap"><select value={sort} onChange={(event) => setSort(event.target.value)}><option value="name">Sort: Name</option><option value="value">Sort: Current value</option></select><ChevronDown size={14} /></label><div className="admin-toolbar-buttons"><Button onClick={exportCsv}><Download size={14} /> Export values</Button><Button onClick={importTemplate}><Download size={14} /> CSV template</Button><Button onClick={() => fileRef.current?.click()} disabled={busy}><Upload size={14} /> Import CSV</Button><input ref={fileRef} className="visually-hidden" type="file" accept=".csv,text/csv" onChange={(event) => void importCsv(event.target.files?.[0])} /></div></div>
    <div className="admin-bulk-bar"><span><strong>{draftCount}</strong> saved or unsaved drafts <small>· {filtered.length} fruits shown</small></span><div><Button onClick={() => void saveAll()} disabled={busy || !Object.keys(edits).length}><Check size={14} /> Save drafts</Button><Button onClick={() => void discardDrafts()} disabled={busy || !draftCount}><Trash2 size={14} /> Discard drafts</Button><Button variant="primary" onClick={() => void previewPublish()} disabled={busy || !draftCount}><Eye size={14} /> Preview changes</Button></div></div>
    {message && <div className="admin-message" role="status"><Info size={15} /><span>{message}{errorDetail && <pre>{errorDetail}</pre>}</span><button onClick={() => { setMessage(''); setErrorDetail(''); }} aria-label="Dismiss"><X size={14} /></button></div>}
    {preview && <div className="publish-preview"><div className="preview-title"><span className="tool-icon violet"><Eye size={17} /></span><div><strong>Publication preview</strong><small>{preview.changedCount} actual value changes · {preview.draftCount} fruit drafts checked</small></div><Button onClick={() => setPreview(null)}><X size={14} /> Close</Button></div>{preview.changedCount > 0 && <div className="preview-list">{preview.changes.filter((change) => change.changed).map((change) => <div key={change.id}><strong>{change.name}</strong><span>{fmt(change.from.regularValue as number | null)} <ArrowRight size={13} /> {fmt(change.to.regularValue as number | null)}</span><small>Permanent {fmt(change.from.permanentValue as number | null)} → {fmt(change.to.permanentValue as number | null)}</small></div>)}</div>}<div className="preview-foot"><span>One explicit confirmation publishes these values together and records history.</span><Button variant="primary" disabled={!preview.changedCount || busy} onClick={() => void publish()}><Check size={15} /> Publish dataset</Button></div></div>}
    <div className="admin-table-head"><span>FRUIT · FIXED NAME</span><span>REGULAR VALUE</span><span>PERMANENT</span><span>DEMAND</span><span>TREND</span><span>CONFIDENCE</span><span>VALUE NOTE</span><span>LAST PUBLISHED</span><span>STATUS</span></div>
    <div className="admin-rows admin-desktop-rows">{filtered.map((item) => renderRow(item))}{!filtered.length && <EmptyState icon={Search} title="No matching fruit" text="Adjust the name or catalog filters." />}</div>
    <div className="admin-mobile-rows">{filtered.map((item) => renderRow(item, true))}</div>
    <section className="moderation-panel"><div className="panel-heading"><div><div className="eyebrow">COMMUNITY SAFETY</div><h2>Reported listings</h2></div><span className="updated-pill">{reports.filter((report) => report.status === 'open').length} open</span></div>{reports.length ? reports.map((report) => <div className="moderation-row" key={report.id}><div><strong>{report.reason.replaceAll('_', ' ')}</strong><small>{report.contact ? `@${report.contact} · ` : ''}{updatedText(report.createdAt)}</small><p>{report.detail || 'No additional report details.'}</p><span className="moderation-fruits">Offer: {report.offer.map((line) => `${line.quantity} × ${catalogById.get(line.id)?.name || line.id}`).join(', ') || '—'} · Wants: {report.wanted.map((line) => `${line.quantity} × ${catalogById.get(line.id)?.name || line.id}`).join(', ') || '—'}</span></div><div className="moderation-actions">{report.active && <Button variant="danger" onClick={() => void moderateListing(report)}><Trash2 size={13} /> Remove listing</Button>}{report.status === 'open' ? <><Button onClick={() => void reviewReport(report, 'resolved')}>Resolve</Button><Button onClick={() => void reviewReport(report, 'dismissed')}>Dismiss</Button></> : <span className="save-state">{report.status}</span>}</div></div>) : <p className="snapshot-empty">No community reports have been submitted.</p>}</section>
    <section className="audit-panel feedback-inbox"><div className="panel-heading"><div><div className="eyebrow">SITE INBOX</div><h2>Feedback and corrections</h2></div><span className="updated-pill">{feedback.length} recent</span></div>{feedback.length ? feedback.map((entry) => <div className="feedback-entry" key={entry.id}><div><span className="tag">{entry.category}</span><small>{updatedText(entry.createdAt)}</small></div><p>{entry.message}</p></div>) : <p className="snapshot-empty">Feedback form submissions will appear here.</p>}</section>
    <section className="audit-panel"><div className="panel-heading"><div><div className="eyebrow">CHANGE RECORD</div><h2>Recent admin activity</h2></div><span className="updated-pill"><ShieldCheck size={13} /> Audited</span></div>{audit.length ? audit.map((entry, index) => <div className="audit-row" key={String(entry.id ?? index)}><span className="audit-action">{String(entry.action).replaceAll('_', ' ')}</span><span>{String(entry.adminEmail)}</span><span>{String(entry.createdAt)}</span><small>{Array.isArray(entry.affectedIds) ? `${entry.affectedIds.length} affected` : ''}</small></div>) : <p className="snapshot-empty">Admin changes will appear here after the first save.</p>}</section>
  </div>;
}

export default App;



