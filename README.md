# TikCoin - Creator Economy on Solana

![TikCoin Banner](https://placekitten.com/800/200)

[![Solana](https://img.shields.io/badge/Solana-black?logo=solana)](https://solana.com/)
[![Anchor](https://img.shields.io/badge/Anchor-Framework-blue)](https://www.anchor-lang.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Sonic Mobius Hackathon](https://img.shields.io/badge/Sonic%20Mobius-Hackathon-blueviolet)](https://sonic.game)

## 🏆 Sonic Mobius Hackathon

**TikCoin is being built for the Sonic Mobius Hackathon's Attention Capital Markets track!**

We're excited to be participating in this innovative hackathon that focuses on building the future of creator economy and attention markets on the Sonic blockchain. Our project aims to revolutionize how creators monetize their content and engage with their communities through tokenization.

## 🚀 About TikCoin

TikCoin is a revolutionary platform built on the Solana blockchain where content creators can launch their own tokens and reward their communities. Similar to PumpFun, TikCoin enables direct monetization between creators and their fans through personalized creator coins.

Each creator token operates on a bonding curve, allowing early supporters to benefit as the creator's popularity grows. This creates a symbiotic relationship where fans are incentivized to discover and support emerging talent early, while creators can reward their most loyal community members.

## ✨ Key Features

- **Creator Token Launch**: Creators can mint their own personalized tokens with custom branding
- **Bonding Curve Economics**: Token prices increase as supply grows, rewarding early supporters
- **Community Rewards**: Creators can distribute rewards, exclusive content, and experiences to token holders
- **Tokenized Engagement**: Social actions like likes, shares, and comments can earn token rewards
- **Solana Speed & Economy**: Ultra-fast transactions with minimal fees (< $0.001 per transaction)
- **Cross-Platform Integration**: Connect with popular social media platforms to tokenize existing audiences
- **Token Marketplace**: Buy, sell, and trade creator tokens in a seamless marketplace
- **Creator Analytics**: Detailed insights into community growth and token performance

## 🔧 Technology Stack

TikCoin leverages the power of the Solana blockchain for its speed, low costs, and scalability:

- **Backend**: Solana Programs (Smart Contracts) written with Anchor Framework
- **Frontend**: React.js with TypeScript
- **State Management**: Redux with middleware for blockchain interactions
- **Styling**: Tailwind CSS with custom components
- **Wallet Integration**: Solana wallet adapters (Phantom, Solflare, etc.)
- **Indexing**: Custom indexing solution for efficient data querying

## 📊 How it Works

1. **Creator Registration**: Creators join the platform and launch their token
2. **Token Configuration**: Set initial price, bonding curve parameters, and token branding
3. **Community Building**: Fans purchase tokens to support creators and gain platform benefits
4. **Rewards Distribution**: Creators distribute rewards to token holders through various mechanisms
5. **Secondary Market**: Fans can trade tokens on the built-in marketplace
6. **Value Growth**: As creator popularity increases, token value potentially increases based on the bonding curve

## 📈 Bonding Curve Economics

TikCoin uses a linear bonding curve model where:

- Token price increases as more tokens are purchased
- Early supporters get lower prices
- Token sales follow the same curve in reverse
- Creator and platform fees are applied to transactions

```
Price = BasePrice + (Slope * Supply)
```

This creates a fair and transparent pricing mechanism that rewards early supporters.

## 💰 Benefits

**For Creators:**
- New monetization stream independent of platform algorithms
- Direct relationship with most loyal fans
- Capital for content creation without intermediaries
- Community incentives to promote content
- Data ownership and audience portability

**For Communities:**
- Potential financial upside from early support
- Access to exclusive creator content and experiences
- Direct impact on creator success
- Participation in a creator's journey from the beginning
- Community governance opportunities

## 🛠️ Installation

### Prerequisites
- Node.js v16+ and npm/yarn
- Rust and Solana CLI tools
- Anchor Framework
- Solana wallet with SOL for deployment

### Setup
```bash
# Clone the repository
git clone https://github.com/username/tikcoin.git
cd tikcoin

# Install dependencies for the frontend
cd app
npm install

# Install dependencies for the blockchain program
cd ../
yarn install

# Build the Solana program
anchor build
```

## 🚀 Deployment

### Solana Program Deployment
```bash
# Deploy to Solana testnet
anchor deploy --provider.cluster testnet

# Deploy to Solana mainnet
anchor deploy --provider.cluster mainnet
```

### Frontend Deployment
```bash
cd app
npm run build
npm run deploy
```

## 📝 Contributing

We welcome contributions to the TikCoin platform! Please see our [Contributing Guidelines](CONTRIBUTING.md) for more details.

## 📄 License

TikCoin is released under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🔗 Links

- [Solana](https://solana.com/)
- [Anchor Framework](https://project-serum.github.io/anchor/)
- [Phantom Wallet](https://phantom.app/)

---

Built with ❤️ on Solana

