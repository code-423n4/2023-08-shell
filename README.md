# Shell Protocol audit details
- Total Prize Pool: $36,500 USDC (Notion: Total award pool)
  - HM awards: $24,750 USDC (Notion: HM (main) pool)
  - Analysis awards: $1,500 USDC (Notion: Analysis pool)
  - QA awards: $750 USDC (Notion: QA pool)
  - Bot Race awards: $2,250 USDC (Notion: Bot Race pool)
  - Gas awards: $750 USDC (Notion: Gas pool)
  - Judge awards: $3,600 USDC (Notion: Judge Fee)
  - Lookout awards: $2,400 USDC (Notion: Sum of Pre-sort fee + Pre-sort early bonus)
  - Scout awards: $500 USDC (Notion: Scout fee - but usually $500 USDC)
- Join [C4 Discord](https://discord.gg/code4rena) to register
- Submit findings [using the C4 form](https://code4rena.com/contests/2023-08-shell-protocol/submit)
- [Read our guidelines for more details](https://docs.code4rena.com/roles/wardens)
- Starts August 21, 2023 20:00 UTC
- Ends August 28, 2023 20:00 UTC

## Automated Findings / Publicly Known Issues

Automated findings output for the audit can be found [here](https://github.com/code-423n4/2023-08-shell/blob/main/bot-report.md) within 24 hours of audit opening.

*Note for C4 wardens: Anything included in the automated findings output is considered a publicly known issue and is ineligible for awards.*

# Scope


| Contract | SLOC | Purpose | Libraries used |  
| ----------- | ----------- | ----------- | ----------- |
| [src/proteus/EvolvingProteus.sol](https://github.com/code-423n4/2023-08-shell/blob/main/src/proteus/EvolvingProteus.sol) | 460 | This amm primitive contract can passively update liquidity concentration over time | [`@openzeppelin/*`](https://openzeppelin.com/contracts/) & [`abdk-libraries-solidity/*`](https://github.com/abdk-consulting/abdk-libraries-solidity) |

## Out of scope

* All contracts under `src/ocean`
* All contracts under `src/mocks`
* [src/proteus/LiquidityPoolProxy.sol](https://github.com/code-423n4/2023-08-shell/blob/main/src/proteus/LiquidityPoolProxy.sol)
* [src/proteus/LiquidityPool](https://github.com/code-423n4/2023-08-shell/blob/main/src/proteus/LiquidityPool.sol)

## Links

- **Website** : https://shellprotocol.io/
- **Documentation** : https://wiki.shellprotocol.io/getting-started/overview
- **Twitter** : https://twitter.com/CowriLabs
- **Discord** : https://discord.com/invite/S5EU5zmqxP

---


## What does Evolving Proteus do?

This primitive can passively update liquidity concentration over time. You can think of it like a hybrid between a Balancer liquidity bootstrapping pool and Uniswap v3. The pool creator picks a starting liquidity concentration and an ending liquidity concentration. The creator also sets a starting timestamp and an ending timestamp during which liquidity concentration evolves. Every block, the primitive will update its concentration. 

## Use cases for Evolving Proteus

There are two primary use cases for this primitive:

1. Dutch auctions
2. Dynamic pools

Dutch auctions work by setting the initial liquidity concentration at a high price range and setting the ending liquidity concentration at a low price range. This is similar to liquidity bootstrapping pools. In addition to facilitating price discovery and liquidity for newly created tokens, evolving proteus can also be used to execute large buy or sell orders. For example, if Alice wants to sell 100,000 ETH, but wants to avoid price impact, she can put her ETH into an Evolving Proteus pool and let the pool gradually sell her ETH over a specified time duration

Dynamic pools are AMMs that update their liquidity concentration dynamically in response to external variables. For example, a dynamic pool could continually update its liquidity concentration so that liquidity was always allocated near the current spot price. Large, discontinuous updates to liquidity concentration can result in losses for LPs. Small changes between each block can help mitigate these losses. 

## Key terminology

Evolving Proteus pools have two reserve tokens. One token will be designated as the *numeraire*, or the standard measure of value in the pool. Typically, ETH or stablecoins will serve as the numeraire token, but the decision is arbitrary. When we refer to prices in Evolving Proteus, assume these are based on the pool’s numeraire unless otherwise specified. For example, consider a pool of ETH and ARB. ETH would be the numeraire token. The price of an ARB token in the pool would be around 0.001 ETH.

Additionally, in the mathematical model underpinning Evolving Proteus, we refer abstractly to the two reserve tokens as token_x and token_y. Token_y is assumed to be the numeraire token. Hence, prices refer to the value of token_x in terms of token_y. 

The algorithm does not quote an infinite range of prices. There is a *maximum price* and a *minimum price*. When the pool has 100% token_y and 0% token_x, that means the internal price of the pool is at its maximum. When the pool has 100% token_x and 0% token_y, the internal price of the pool is at its minimum. Graphically, the maximum price occurs when the bonding curve is at the y-intercept. The minimum price occurs when the bonding curve is at the x-intercept.

Lastly, the algorithm uses a concept called *utility*, which is the pool’s internal measure of value. See the [Proteus white paper](https://shell-protocol.notion.site/Proteus-AMM-Engine-Update-3-7f33b7e1561347b696874a8ba02b9782) for more information about utility. Utility is an important invariant for fuzz tests.

## How does the algorithm work?

Evolving Proteus has the ability to passively update liquidity concentration every block. The algorithm has six parameters that determine liquidity concentration:

1. `int128 p_max_init`: the maximum price at the initial block 
2. `int128 p_min_init`: the minimum price at the initial block
3. `int128 p_max_final`: the maximum price at the final block
4. `int128 p_min_final`: the minimum price at the final block
5. `uint256 t_init`: the block the AMM starts evolving
6. `uint256 t_fina`l: the block the AMM stops evolving


Variables (1) - (4) are calculated using the ABDK math library and are originally passed as uint256 variables. For every transaction, the algorithm uses the six parameters plus the current block time to calculate the following two variables:

1. `int128 p_min_current` - the maximum price (at the y asymptote) at the current block
2. `int128 p_max_current` - the minimum price (at the x asymptote) at the current block

The current high and low prices determine the liquidity concentration for the current block and hence the swap rates. The current prices are calculated according to this formula:

  `p_current = p_init*(1-t()) + p_final*(t())`
  `t() = (t_current - t_init) / (t_final - t_init)`

The algorithm does a time-weighted interpolation between the starting prices and the ending prices. The current high and low price range is used to derive the equation of the bonding curve. This bonding curve equation is then used to calculate swaps, deposits and withdrawals. The bonding curve parameters and equation is given as follows:

  `(x/utility + a)(y/utility + b) = 1`

  `a = sqrt(1/p_max_current)`

  `b = sqrt(p_min_current)`

When the algorithm has reached the final timeslice, `t_final`, it will stop evolving but remain open to trading. 

## Type of errors

Primarily to mitigate rounding errors, which if too large could result in liquidity provider losses, we enforce certain constraints on the state of the pool, the size of the transaction amount, and the output of the algorithm. The following list of errors will occur if these constraints are violated: 

* `BoundaryError` - The ratio between the y- and x-balances must remain between a minimum and maximum level, denoted by `MIN_M` and `MAX_M`. 
* `AmountError` - The swap amount must not be too small relative to the size of the balances. This critical ratio is set by `MAX_BALANCE_AMOUNT_RATIO`. Additionally, the swap amount must not be smaller than 2x the minimum fee (`FIXED_FEE`).
* `CurveError` - When computing a swap, deposit, or withdrawal, the following variables should never be negative: the calculated x balance (`x0`), the calculated y balance (`y0`), and `utility`.
* `BalanceError` - Pool balances must stay above a minimum threshold, `MIN_BALANCE`.
* `InvalidPrice` - The x_init/final price cannot be less than y_init/final
* `MinimumAllowedPriceExceeded` - The x_init/final price cannot be less than 10^-8
* `MaximumAllowedPriceExceeded` - The y_init/final price cannot be more than 10^8
* `MaximumAllowedPriceRatioExceeded` - The price ratio i.e `py/(py-px)` cannot be more than 10000

## Price ranges

There are also constraints on the price ranges and liquidity concentration:

* `p_max_init / (p_max_init - p_min_init) <= 10000`
* `p_max_final / (p_max_final - p_min_final) <= 10000`
* `p_max_init < 10^8`
* `p_max_final < 10^8`
* `p_min_init > 10^-8`
* `p_min_final > 10^-8`
* `p_min_init < p_max_init`
* `p_min_final < p_max_final`

If liquidity is too concentrated or prices are too extreme, then rounding errors may occur. We are not sure where the critical threshold is located, so we advise caution when setting extreme price parameters. 

## Invariants

The following invariants should never be violated under any circumstances:

* `p_min_current < p_max_current`
* Within a timeslice (a single block), no set of transactions (swaps, deposits, withdrawals) should result in a decrease of the utility per LP token (`utility / lp`). 
* The swap amount must be the same as the change in the user’s and pool’s balances:
  * `_amount = _traderBalanceBeforeSwap - _traderBalanceAfterSwap`
  * `_amount = balanceAfterSwap - balanceBeforeSwap`

Note: the utility per LP token invariant does not necessarily hold between multiple timeslices. Utility per LP token can vary between timeslices, even in the absence of any transactions.

There are also “soft” invariants. In an idealized mathematical model of the Evolving Proteus algorithm, these invariants should hold. However, due to fees and rounding errors, these invariants may be technically violated during fuzz tests. A violation of these soft invariants is not necessarily evidence of a vulnerability or exploit. We include these invariants to be used as a rule of thumb.

These invariants concern the behavior of the pool between timeslices. What happens when a user swaps delta_x for delta_y at the initial timeslice? Then in the next timeslice, the user reverses the swap and inputs delta_y back into the pool? Will they receive more or less than they started out with? The expected, idealized behavior depends on whether the price range is evolving higher or lower. [Here is a link to a datatable of expected behavior.](https://docs.google.com/spreadsheets/d/1wNjNZgiVNHpF-bbZ70BJw-v07Jyl5iIRV5IXdiyxJpw/edit?usp=sharing)

Note: when the min and max prices are evolving in opposite directions, we are unable to specify the expected behavior. The user executing the swap can either end up with more or fewer tokens than they started with.

## Known behaviors which are out of scope for the audit(automated findings / publicly known issues)

* Errors already described
  * Failure when deploying a pool with incorrect prices (see above)
  * any findings around "permissionless" deployment, although contract deployment is permissionless but in the near/distant future only the shell team will deploy this contract
  * BoundaryError
  * AmountError
  * CurveError
  * BalanceError
* Utility per LP token decreases between timeslices
* Failure on try/catch unit tests
* Failure of soft invariants (see above), especially those where the user is expected to net more tokens than they started with, but don’t.


## Architecture
All interactions of the user with the user with the evolving proteus contract happen through the **Ocean** which is our accounting layer, the ocean related contracts are out of scope for this audit but you can find more details [here](https://wiki.shellprotocol.io/how-shell-works/the-ocean-accounting-hub)

Evolving Proteus has 6 methods that are called via the ocean:
* `swapGivenInputAmount` computes the amount of output tokens after a swap is executed
* `swapGivenOutputAmount` computes the amount of input tokens required to do the swap when output token amount is provided
* `depositGivenInputAmount` computes the amount of lp tokens to be minted after providing liquidity
* `depositGivenOutputAmount` computes the amount of pool reserve tokens to be deposited when the desired lp amount is provided
* `withdrawGivenOutputAmount` computes the amount of lp tokens to be burnt when reserve token amount is provided
* `withdrawGivenInputAmount` computes the amount of reserve tokens to be sent to the user when amount of lp tokens to burn is provided

## Scoping Details 
```
- If you have a public code repo, please share it here:  
- How many contracts are in scope?:  1 
- Total SLoC for these contracts?:  458
- How many external imports are there?: 1  
- How many separate interfaces and struct definitions are there for the contracts within scope?:  1
- Does most of your code generally use composition or inheritance?:   Composition
- How many external calls?:   0
- What is the overall line coverage percentage provided by your tests?:  99%
- Is there a need to understand a separate part of the codebase / get context in order to audit this part of the protocol?:   True
- Please describe required context:   The contract we want to get audited is a amm primitive & https://wiki.shellprotocol.io/how-shell-works/the-ocean-accounting-hub is our accounting layer which is already audited before and is out of scope for this audit maintains accounting for all primitives we have so all the swaps for eg are initiated through the ocean contract and then the flow at the end goes to the primitive that we want to get audited for the computation
- Does it use an oracle?:  No
- Does the token conform to the ERC20 standard?:  
- Are there any novel or unique curve logic or mathematical models?: The amm primitive we want to get audited is a time evolving bonding curve so we set the price ranges on x & y axis depending on how the curve will evolve and a duration till which the curve will evolve over time. Curve evolution is accomplished through linear interpolation of the parameters with respect to time. The evolving parameters are "a" and "b", which determine the horizontal and vertical translation of the curve, respectively. Parameters "a" and "b" can be derived from points along the curve; as long as the price(derivative) of a curve is known, they are easy to calculate with basic arithmetic.  The current high and low prices determine the liquidity concentration for the current block and hence the swap rates. The current prices are calculated according to this formula:      p_current = p_initial*(1-T) + p_final*(T) T = (T_current - T_initial) / (T_final - T_initial) & a, b are respective calculated with the following equations b = px(self).sqrt() & a = (py(self).inv()).sqrt() where px and py are instantaneous price points at a specific time during the curve evolution
- Does it use a timelock function?:  
- Is it an NFT?: 
- Does it have an AMM?:   True
- Is it a fork of a popular project?: False
- Does it use rollups?:   
- Is it multi-chain?:  
- Does it use a side-chain?: false
- Areas to focus on/break: main areas would be if the computation logic of the primitive can be broken and taken advantage of terms of swaps, deposits & withdrawals or any scenario in terms of the computation where funds get stuck etc
```

## Testing
The tests are located [here](https://github.com/code-423n4/2023-08-shell/tree/main/src/test)

You need foundry to run the tests, which you can install [here](https://onbjerg.github.io/foundry-book/getting-started/installation.html)

To compile the contracts run
```shell
forge build
```
For running tests run
```shell
forge test
```

## Coverage
```shell
forge coverage
```

<img width="983" alt="Screenshot 2023-08-17 at 9 07 41 PM" src="https://github.com/cowri/shell-protocol-v2-contracts/assets/26670962/18f84132-9d41-48dd-9d8b-f899cbb6cd3f">
<br>
<img width="1022" alt="Screenshot 2023-08-17 at 9 05 36 PM" src="https://github.com/cowri/shell-protocol-v2-contracts/assets/26670962/fd7c3302-ccb5-4109-ba20-a6b31fb0cd42">


## Static Analysis

We have used slither for static analysis here is the command you need to run
```shell
forge build --build-info --skip '*/test/**' --skip '*/script/**' --force && slither . --filter-path "openzeppelin|test|ocean|lib|scripts|abdk-libraries-solidity"  --ignore-compile  
```
