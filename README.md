# BitFolio - Automated Portfolio Management Protocol

**A Stacks L2 Smart Contract for Non-Custodial Token Portfolio Management**

## Overview

BitFolio is a Clarity smart contract enabling automated management of token portfolios on the Stacks blockchain (Layer 2). It implements Bitcoin-compliant asset management strategies with programmable rebalancing and allocation controls.

## Key Features

- 🛡️ **Non-Custodial Architecture** - Users maintain full control of assets
- ⚖️ **Dynamic Rebalancing** - 24-hour threshold-based portfolio adjustments
- 📊 **Basis Point Precision** - 0.01% granularity in allocation percentages
- 💼 **Multi-Portfolio Support** - Up to 20 portfolios per user with 10 assets each
- 📈 **Value Tracking** - Real-time portfolio valuation in satoshi equivalents
- 🔐 **Bitcoin Compliance** - Designed for seamless integration with Bitcoin-based assets
- ⏱️ **Time-Locked Operations** - Blockchain timestamp-based execution controls

## Technical Specifications

- **Contract Language**: Clarity v2.1
- **Blockchain**: Stacks Layer 2
- **Token Standard**: SIP-010 compliant assets
- **Data Structures**:
  - Portfolio NFTs with ownership metadata
  - Asset allocation maps with percentage targets
  - User-portfolio relationship tracking
- **Error Handling**: 11 distinct error states with unique codes

## Getting Started

### Prerequisites

- Clarinet v2.0.0+
- Node.js v18+
- Stacks.js SDK
- Testnet STX tokens (for deployment)

## Core Functionality

### Portfolio Management

```clarity
;; Create new portfolio with initial allocations
(create-portfolio
  (list 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ6SV.token-a 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ6SV.token-b)
  (list u5000 u5000) ;; 50%/50% allocation
)

;; Rebalance portfolio assets
(rebalance-portfolio u1)

;; Update asset allocation
(update-portfolio-allocation u1 u0 u6000) ;; 60% allocation to token 0
```

### Query Operations

```clarity
;; Get portfolio metadata
(get-portfolio u1)

;; Retrieve asset details
(get-portfolio-asset u1 u0)

;; List user portfolios
(get-user-portfolios 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ6SV)
```

## Error Handling

| Code | Constant                 | Description                      |
| ---- | ------------------------ | -------------------------------- |
| u100 | ERR-NOT-AUTHORIZED       | Unauthorized operation attempt   |
| u101 | ERR-INVALID-PORTFOLIO    | Nonexistent portfolio reference  |
| u102 | ERR-INSUFFICIENT-BALANCE | Insufficient funds for operation |
| ...  | ...                      | ...                              |

Full error code documentation available in [ERRORS.md](docs/ERRORS.md)

## Security Considerations

- ✅ Reentrancy protection through state checks
- 🔒 Principal validation on all state-modifying functions
- ⚠️ 0.25% protocol fee on rebalancing operations
- 🛑 Maximum asset limit enforcement (10 tokens/portfolio)
- 🔄 Time-lock mechanism for rebalancing (144 blocks)
