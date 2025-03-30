;; Title: BitFolio - Automated Bitcoin-Centric Portfolio Management on Stacks L2
;; Summary: A non-custodial, automated portfolio management protocol for Bitcoin-based assets with dynamic rebalancing
;; Description: 
;; BitFolio enables trustless management of token portfolios through smart contract automation, optimized for Stacks L2
;; and Bitcoin ecosystem compliance. Features include:
;; - 24-hour threshold-based portfolio rebalancing
;; - Multi-sig compatible non-custodial asset management
;; - Dynamic allocation adjustments with basis point precision
;; - Protocol fee structure with basis point granularity
;; - Bitcoin-native asset support through Stacks L2 security
;; - Gas-efficient portfolio storage (max 20 portfolios/user, 10 assets/portfolio)
;; - Robust error handling with 11 distinct error states
;; - Immutable audit trail of portfolio operations via Bitcoin settlement

;; Error codes - Structured operational failure states
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-INVALID-PORTFOLIO (err u101))
(define-constant ERR-INSUFFICIENT-BALANCE (err u102))
(define-constant ERR-INVALID-TOKEN (err u103))
(define-constant ERR-REBALANCE-FAILED (err u104))
(define-constant ERR-PORTFOLIO-EXISTS (err u105))
(define-constant ERR-INVALID-PERCENTAGE (err u106))
(define-constant ERR-MAX-TOKENS-EXCEEDED (err u107))
(define-constant ERR-LENGTH-MISMATCH (err u108))
(define-constant ERR-USER-STORAGE-FAILED (err u109))
(define-constant ERR-INVALID-TOKEN-ID (err u110))

;; Protocol Configuration - Immutable settings
(define-data-var protocol-owner principal tx-sender)
(define-data-var portfolio-counter uint u0)
(define-data-var protocol-fee uint u25)  ;; 0.25% fee in basis points (1 BP = 0.01%)
(define-constant MAX-TOKENS-PER-PORTFOLIO u10)
(define-constant BASIS-POINTS u10000)