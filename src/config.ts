export const SITE = {
  name: 'FruitForge',
  tagline: 'Know your worth. Trade smarter.',
  description: 'Fruit values, transparent market updates, and an instant Blox Fruits trade calculator.',
  publicUrl: 'https://fruitforge.example',
  fairTradeTolerancePercent: 5,
  adSense: { enabled: false, publisherId: '', bannerSlot: '', contentSlot: '', guideSlot: '', sidebarSlot: '' },
};

export const GUIDES = [
  { slug: 'using-the-calculator', title: 'How to use the trade calculator', tag: 'Calculator', summary: 'Add the fruits on each side, set quantities, and compare totals from the latest published dataset.', body: ['Choose each fruit from the searchable picker. Add more than one fruit to either side and use quantity controls for duplicates.', 'The calculator multiplies the current published value by each quantity in your browser. It does not send a request for every change.', 'A missing value makes the comparison incomplete. FruitForge leaves unknown values blank instead of treating them as zero. Share links contain item IDs and quantities, so they always use the latest published data.'] },
  { slug: 'value-methodology', title: 'How FruitForge values work', tag: 'Methodology', summary: 'A clear explanation of where values come from and how updates are published.', body: ['FruitForge values are editorial estimates maintained by the site administrator. They are not official prices from the game and do not guarantee what another player will accept.', 'A value is shown only after it has been entered and published. Each publication records the previous value, author, timestamp, and dataset version. New installations begin with no market quotes.', 'Demand, trend, and confidence are separate context fields. They describe the editor’s assessment; they do not change the arithmetic used by the calculator.'] },
  { slug: 'demand-and-trading', title: 'Reading demand and trade context', tag: 'Trading basics', summary: 'Use demand as context, not a substitute for checking the other player’s offer.', body: ['Demand is a 1–10 editorial signal. It can help explain how readily traders may seek an item, but it is not a promise of a completed trade.', 'A fruit’s published value and demand can tell different stories. Check the timestamp, confidence, and explanation before relying on a number.', 'Discuss the exact items in game before accepting. Be cautious of pressure, impersonation, suspicious links, and requests for account details.'] },
];
