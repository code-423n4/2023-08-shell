

```bash
# # # # # # # # # # # # # # # # # # # # # #
#                                         #
#             |\_/|                       #
#             | O O                       #
#             |   <>              _       #
#             |  _/\------____ ((| |))    #
#             |               `--' |      #
#         ____|_       ___|   |___.'      #
#        /_/_____/____/_______|           #
#    _   _                           _    #
#   | | | |                         | |   #
#   | |_| |  ___   _   _  _ __    __| |   #
#   |  _  | / _ \ | | | || '_ \  / _` |   #
#   | | | || (_) || |_| || | | || (_| |   #
#   \_| |_/ \___/  \__,_||_| |_| \__,_|   #
#                                         #
# # # # # # # # # # # # # # # # # # # # # #
```


## Summary

---

### Low Risk Issues
|Id|Title|Instances|
|:--:|:-------|:--:|
|[[L-01]](#l-01-avoid-double-casting)| Avoid double casting | 2 |
|[[L-02]](#l-02-missing-checks-in-constructorinitialize)| Missing checks in constructor/initialize | 1 |
|[[L-03]](#l-03-unsafe-uint-to-int-conversion)| Unsafe `uint` to `int` conversion | 26 |
|[[L-04]](#l-04-subtraction-may-underflow-if-multiplication-is-too-large)| Subtraction may underflow if multiplication is too large | 1 |
|[[L-05]](#l-05-possible-division-by-0-is-not-prevented)| Possible division by 0 is not prevented | 3 |
|[[L-06]](#l-06-loss-of-precision-on-division)| Loss of precision on division | 11 |
|[[L-07]](#l-07-using-a-vulnerable-dependency-from-some-libraries)| Using a vulnerable dependency from some libraries | 1 |

Total: 45 instances over 7 issues.

### Non Critical Issues
|Id|Title|Instances|
|:--:|:-------|:--:|
|[[NC-01]](#nc-01-custom-error-should-be-used-rather-than-requireassert)| Custom `error` should be used rather than `require`/`assert` | 16 |
|[[NC-02]](#nc-02-unused-named-return)| Unused named `return` | 1 |
|[[NC-03]](#nc-03-openzeppelin-libraries-should-be-upgraded-to-a-newer-version)| OpenZeppelin libraries should be upgraded to a newer version | 1 |
|[[NC-04]](#nc-04-variable-initialization-with-default-value)| Variable initialization with default value | 1 |
|[[NC-05]](#nc-05-duplicated-requireif-statements-should-be-refactored)| Duplicated `require/if` statements should be refactored | 3 |
|[[NC-06]](#nc-06-inconsistent-usage-of-requireerror)| Inconsistent usage of `require`/`error` | 1 |
|[[NC-07]](#nc-07-public-functions-not-called-internally)| Public functions not called internally | 3 |
|[[NC-08]](#nc-08-internal-functions-not-called-by-the-contract-should-be-removed)| `internal` functions not called by the contract should be removed | 1 |
|[[NC-09]](#nc-09-use-of-exponentiation-instead-of-scientific-notation)| Use of exponentiation instead of scientific notation | 4 |
|[[NC-10]](#nc-10-missingmalformed-underscores-for-large-numeric-literals)| Missing/malformed underscores for large numeric literals | 2 |
|[[NC-11]](#nc-11-use-of-non-named-numeric-constants)| Use of non-named numeric constants | 5 |
|[[NC-12]](#nc-12-complex-math-should-be-split-into-multiple-steps)| Complex math should be split into multiple steps | 2 |
|[[NC-13]](#nc-13-control-structures-do-not-comply-with-best-practices)| Control structures do not comply with best practices | 18 |
|[[NC-14]](#nc-14-variable-names-dont-follow-the-solidity-naming-convention)| Variable names don't follow the Solidity naming convention | 18 |
|[[NC-15]](#nc-15-contract-functions-should-use-an-interface)| Contract functions should use an `interface` | 14 |
|[[NC-16]](#nc-16-requirerevert-without-any-message)| `require`/`revert` without any message | 16 |
|[[NC-17]](#nc-17-lack-of-specific-import-identifier)| Lack of specific `import` identifier | 2 |
|[[NC-18]](#nc-18-custom-error-without-details)| Custom `error` without details | 5 |
|[[NC-19]](#nc-19-use-a-ternary-statement-instead-of-ifelse-when-appropriate)| Use a ternary statement instead of `if`/`else` when appropriate | 2 |
|[[NC-20]](#nc-20-lines-are-too-long)| Lines are too long | 7 |
|[[NC-21]](#nc-21-some-variables-have-a-implicit-default-visibility)| Some variables have a implicit default visibility | 13 |
|[[NC-22]](#nc-22-typos-in-comments)| Typos in comments | 8 |
|[[NC-23]](#nc-23-contracts-should-have-full-test-coverage)| Contracts should have full test coverage | 1 |
|[[NC-24]](#nc-24-large-or-complicated-code-bases-should-implement-invariant-tests)| Large or complicated code bases should implement invariant tests | 1 |
|[[NC-25]](#nc-25-codebase-should-implement-formal-verification-testing)| Codebase should implement formal verification testing | 1 |
|[[NC-26]](#nc-26-inconsistent-spacing-in-comments)| Inconsistent spacing in comments | 1 |
|[[NC-27]](#nc-27-state-variables-should-include-comments)| State variables should include comments | 5 |
|[[NC-28]](#nc-28-missing-natspec-from-contract-declarations)| Missing NatSpec from contract declarations | 1 |
|[[NC-29]](#nc-29-missing-natspec-title)| Missing NatSpec `@title` | 1 |
|[[NC-30]](#nc-30-missing-natspec-author)| Missing NatSpec `@author` | 1 |
|[[NC-31]](#nc-31-missing-natspec-param)| Missing NatSpec `@param` | 16 |
|[[NC-32]](#nc-32-incomplete-natspec-return)| Incomplete NatSpec `@return` | 23 |

Total: 194 instances over 32 issues.

### Gas Optimizations
|Id|Title|Instances|Gas Saved|
|:--:|:-------|:--:|-----:|
|[[G-01]](#g-01-custom-errors-cost-less-than-requireassert)| Custom `error`s cost less than `require`/`assert` | 16 | 464 |
|[[G-02]](#g-02-state-variables-only-set-in-the-constructor-should-be-declared-immutable)| State variables only set in the constructor should be declared `immutable` | 1 | 20,000 |
|[[G-03]](#g-03-cache-state-variables-with-stack-variables)| Cache state variables with stack variables | 3 | 600 |
|[[G-04]](#g-04-use-at-least-solidity-version-0819-to-gain-some-gas-boost)| Use at least Solidity version `0.8.19` to gain some gas boost | 1 | - |
|[[G-05]](#g-05-using-private-for-constants-saves-gas)| Using `private` for constants saves gas | 1 | 8,406 |
|[[G-06]](#g-06-consider-activating-via-ir-for-deploying)| Consider activating `via-ir` for deploying | 1 | - |
|[[G-07]](#g-07-function-calls-should-be-cached-instead-of-re-calling-the-function)| Function calls should be cached instead of re-calling the function | 1 | - |
|[[G-08]](#g-08-add-unchecked-blocks-for-divisions-where-the-operands-cannot-overflow)| Add `unchecked` blocks for divisions where the operands cannot overflow | 11 | 1,749 |
|[[G-09]](#g-09-usage-of-uintsints-smaller-than-32-bytes-256-bits-incurs-overhead)| Usage of `uints`/`ints` smaller than 32 bytes (256 bits) incurs overhead | 26 | 156 |
|[[G-10]](#g-10-some-ternary-operators-are-unnecessary)| Some ternary operators are unnecessary | 1 | 18 |
|[[G-11]](#g-11--costs-less-gas-than)| `>=`/`<=` costs less gas than `>`/`<` | 47 | 141 |
|[[G-12]](#g-12-internalprivate-functions-only-called-once-can-be-inlined-to-save-gas)| `internal/private` functions only called once can be inlined to save gas | 1 | 20 |
|[[G-13]](#g-13-internal-functions-not-called-by-the-contract-should-be-removed-to-save-deployment-gas)| `internal` functions not called by the contract should be removed to save deployment gas | 1 | 150 |
|[[G-14]](#g-14-unused-named-return-variables-without-optimizer-waste-gas)| Unused named return variables without optimizer waste gas | 1 | 6 |
|[[G-15]](#g-15-function-names-can-be-optimized)| Function names can be optimized | 2 | 44 |
|[[G-16]](#g-16-multiplicationdivision-by-two-should-use-bit-shifting)| Multiplication/division by two should use bit shifting | 1 | 20 |
|[[G-17]](#g-17-constructors-can-be-marked-payable)| Constructors can be marked `payable` | 1 | 21 |
|[[G-18]](#g-18-splitting-require-statements-that-use--saves-gas)| Splitting `require` statements that use `&&` saves gas | 6 | 18 |
|[[G-19]](#g-19-nesting-if-statements-that-use--saves-gas)| Nesting `if` statements that use `&&` saves gas | 1 | 30 |

Total: 123 instances over 19 issues with an estimate of **31,843 gas** saved.

## Low Risk Issues

---

### [L-01] Avoid double casting

Consider refactoring the following code, as double casting may introduce unexpected truncations and/or rounding issues.

Furthermore, double type casting can make the code less readable and harder to maintain, increasing the likelihood of errors and misunderstandings during development and debugging.

*There are 2 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

// @audit int128(int256)
49: 		    int128 constant ABDK_ONE = int128(int256(1 << 64));

// @audit int128(int256)
49: 		    int128 constant ABDK_ONE = int128(int256(1 << 64));
```
[[49](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L49), [49](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L49)]


---

### [L-02] Missing checks in constructor/initialize

There are some missing checks in these functions, and this could lead to unexpected scenarios. Consider always adding a sanity check for state variables.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

// @audit px_init, px_final, duration, py_init, py_final
243: 		    constructor(
244: 		        int128 py_init,
245: 		        int128 px_init,
246: 		        int128 py_final,
247: 		        int128 px_final,
248: 		        uint256 duration
```
[[243-248](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L243-L248)]


---

### [L-03] Unsafe `uint` to `int` conversion

The `int` type in Solidity uses the [two's complement system](https://en.wikipedia.org/wiki/Two%27s_complement), so it is possible to accidentally overflow a very large `uint` to an `int`, even if they share the same number of bytes (e.g. a `uint256 number > type(uint128).max` will overflow a `int256` cast).

Consider using the [SafeCast](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeCast.sol) library to prevent any overflows.

*There are 26 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/proteus/EvolvingProteus.sol

// @audit uint256 inputAmount downcasted to int256
290: 		            int256(inputAmount),

// @audit uint256 xBalance downcasted to int256
291: 		            int256(xBalance),

// @audit uint256 yBalance downcasted to int256
292: 		            int256(yBalance),

// @audit uint256 outputAmount downcasted to int256
329: 		            -int256(outputAmount),

// @audit uint256 xBalance downcasted to int256
330: 		            int256(xBalance),

// @audit uint256 yBalance downcasted to int256
331: 		            int256(yBalance),

// @audit uint256 depositedAmount downcasted to int256
370: 		            int256(depositedAmount),

// @audit uint256 totalSupply downcasted to int256
372: 		            int256(totalSupply),

// @audit uint256 xBalance downcasted to int256
373: 		            int256(xBalance),

// @audit uint256 yBalance downcasted to int256
374: 		            int256(yBalance)

// @audit uint256 mintedAmount downcasted to int256
406: 		            int256(mintedAmount),

// @audit uint256 totalSupply downcasted to int256
408: 		            int256(totalSupply),

// @audit uint256 xBalance downcasted to int256
409: 		            int256(xBalance),

// @audit uint256 yBalance downcasted to int256
410: 		            int256(yBalance)

// @audit uint256 withdrawnAmount downcasted to int256
443: 		            -int256(withdrawnAmount),

// @audit uint256 totalSupply downcasted to int256
445: 		            int256(totalSupply),

// @audit uint256 xBalance downcasted to int256
446: 		            int256(xBalance),

// @audit uint256 yBalance downcasted to int256
447: 		            int256(yBalance)

// @audit uint256 burnedAmount downcasted to int256
480: 		            -int256(burnedAmount),

// @audit uint256 totalSupply downcasted to int256
482: 		            int256(totalSupply),

// @audit uint256 xBalance downcasted to int256
483: 		            int256(xBalance),

// @audit uint256 yBalance downcasted to int256
484: 		            int256(yBalance)

// @audit uint256 result downcasted to int256
591: 		        int256 sf = int256(result);

// @audit uint256 result downcasted to int256
662: 		        uf = int256(result);

// @audit uint256 roundedAbsoluteAmount downcasted to int256
850: 		            ? -int256(roundedAbsoluteAmount)

// @audit uint256 roundedAbsoluteAmount downcasted to int256
851: 		            : int256(roundedAbsoluteAmount);
```
[[290](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L290), [291](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L291), [292](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L292), [329](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L329), [330](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L330), [331](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L331), [370](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L370), [372](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L372), [373](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L373), [374](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L374), [406](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L406), [408](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L408), [409](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L409), [410](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L410), [443](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L443), [445](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L445), [446](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L446), [447](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L447), [480](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L480), [482](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L482), [483](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L483), [484](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L484), [591](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L591), [662](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L662), [850](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L850), [851](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L851)]

</details>

---

### [L-04] Subtraction may underflow if multiplication is too large

The following expressions may underflow, as the subtrahend could be greater than the minuend in case the former is multiplied by a large number.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

718: 		        int256 r1 = (-bQuad*MULTIPLIER - disc*MULTIPLIER) / aQuad.mul(two).muli(MULTIPLIER);
```
[[718](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L718)]


---

### [L-05] Possible division by 0 is not prevented

These functions can be called with 0 value in the input and this value is not checked for being bigger than 0, that means in some scenarios this can potentially trigger a division by zero.

*There are 3 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

// @audit utility
750: 		        int256 f_0 = ((( x0  * MULTIPLIER ) / utility) + a_convert);

// @audit utility
781: 		        int256 f_0 = (( y0  * MULTIPLIER ) / utility) + b_convert;

// @audit amount
800: 		        if (balance / amount >= MAX_BALANCE_AMOUNT_RATIO) revert AmountError();
```
[[750](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L750), [781](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L781), [800](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L800)]


---

### [L-06] Loss of precision on division

Solidity doesn't support fractions, so divisions by large numbers could result in the quotient being zero.

To avoid this, it's recommended to require a minimum numerator amount to ensure that it is always greater than the denominator.

*There are 11 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

717: 		        int256 r0 = (-bQuad*MULTIPLIER + disc*MULTIPLIER) / aQuad.mul(two).muli(MULTIPLIER);

718: 		        int256 r1 = (-bQuad*MULTIPLIER - disc*MULTIPLIER) / aQuad.mul(two).muli(MULTIPLIER);

750: 		        int256 f_0 = ((( x0  * MULTIPLIER ) / utility) + a_convert);

751: 		        int256 f_1 = ((MULTIPLIER * MULTIPLIER / f_0) -  b_convert);

752: 		        int256 f_2 = (f_1 * utility) / MULTIPLIER; 

781: 		        int256 f_0 = (( y0  * MULTIPLIER ) / utility) + b_convert;

782: 		        int256 f_1 = ( ((MULTIPLIER)*(MULTIPLIER) / f_0) - a_convert );

783: 		        int256 f_2 = (f_1 * utility) / (MULTIPLIER); 

800: 		        if (balance / amount >= MAX_BALANCE_AMOUNT_RATIO) revert AmountError();

840: 		                (absoluteValue / BASE_FEE) +

846: 		                (absoluteValue / BASE_FEE) -
```
[[717](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L717), [718](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L718), [750](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L750), [751](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L751), [752](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L752), [781](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L781), [782](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L782), [783](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L783), [800](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L800), [840](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L840), [846](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L846)]


---

### [L-07] Using a vulnerable dependency from some libraries

This project is using a vulnerable version of some libraries, which have the following issues:

Current `@openzeppelin/contracts` version: ^4.7.3

|Risk|Title|Min Version|Max Version|
|------|-------|-------------|-------------|
|LOW|[Denial of Service (DoS)](https://security.snyk.io/vuln/SNYK-JS-OPENZEPPELINCONTRACTS-5425827)|>=3.2.0|<4.8.3|
|MEDIUM|[Improper Input Validation](https://security.snyk.io/vuln/SNYK-JS-OPENZEPPELINCONTRACTS-5425051)|>=3.3.0|<4.8.3|

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

7: 		import "@openzeppelin/contracts/utils/math/Math.sol";
```
[[7](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L7)]


#### **Recommended Mitigation Steps**

Consider upgrading all the impacted libraries to a newer version.

---

## Non Critical Issues

---

### [NC-01] Custom `error` should be used rather than `require`/`assert`

Custom errors are available from solidity version 0.8.4. Custom errors are more easily processed in try-catch blocks, and are easier to re-use and maintain.

*There are 16 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/proteus/EvolvingProteus.sol

279: 		        require(
280: 		            inputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX
281: 		        );

296: 		        require(result < 0);

319: 		        require(
320: 		            outputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX
321: 		        );

336: 		        require(result > 0);

361: 		        require(
362: 		            depositedAmount < INT_MAX &&
363: 		                xBalance < INT_MAX &&
364: 		                yBalance < INT_MAX &&
365: 		                totalSupply < INT_MAX
366: 		        );

378: 		        require(result > 0);

397: 		        require(
398: 		            mintedAmount < INT_MAX &&
399: 		                xBalance < INT_MAX &&
400: 		                yBalance < INT_MAX &&
401: 		                totalSupply < INT_MAX
402: 		        );

414: 		        require(result > 0);

434: 		        require(
435: 		            withdrawnAmount < INT_MAX &&
436: 		                xBalance < INT_MAX &&
437: 		                yBalance < INT_MAX &&
438: 		                totalSupply < INT_MAX
439: 		        );

451: 		        require(result < 0);

471: 		        require(
472: 		            burnedAmount < INT_MAX &&
473: 		                xBalance < INT_MAX &&
474: 		                yBalance < INT_MAX &&
475: 		                totalSupply < INT_MAX
476: 		        );

488: 		        require(result < 0);

590: 		        require(result < INT_MAX);   

658: 		        require(sf >= MIN_BALANCE);

661: 		        require(result < INT_MAX);

842: 		            require(roundedAbsoluteAmount < INT_MAX);
```
[[279-281](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L279-L281), [296](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L296), [319-321](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L319-L321), [336](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L336), [361-366](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L361-L366), [378](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L378), [397-402](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L397-L402), [414](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L414), [434-439](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L434-L439), [451](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L451), [471-476](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L471-L476), [488](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L488), [590](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L590), [658](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L658), [661](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L661), [842](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L842)]

</details>

---

### [NC-02] Unused named `return`

Declaring named returns, but not using them, is confusing to the reader. Consider either completely removing them (by declaring just the type without a name), or remove the return statement and do a variable assignment.

This would improve the readability of the code, and it may also help reduce regressions during future code refactors.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

687: 		    ) internal view returns (int256 xf, int256 yf) {
688: 		        return getPoint(fixedCoordinate, utility);
```
[[687](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L687)]


---

### [NC-03] OpenZeppelin libraries should be upgraded to a newer version

These contracts import some OpenZeppelin libraries, but they are using an old version.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

7: 		import "@openzeppelin/contracts/utils/math/Math.sol";
```
[[7](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L7)]


#### **Recommended Mitigation Steps**

Consider upgrading from version `^4.7.3` to at least version `4.9.0`.

---

### [NC-04] Variable initialization with default value

It's not necessary to initialize a variable with its default value, and it's actually worse in gas terms as it adds an overhead.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

211: 		    bool constant FEE_DOWN = false;
```
[[211](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L211)]


---

### [NC-05] Duplicated `require/if` statements should be refactored

These statements should be refactored to a separate function, as there are multiple parts of the codebase that use the same logic, to improve the code readability and reduce code duplication.

*There are 3 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

// @audit this require is duplicated on line 451, 488
296: 		        require(result < 0);

// @audit this require is duplicated on line 378, 414
336: 		        require(result > 0);

// @audit this require is duplicated on line 661
590: 		        require(result < INT_MAX);
```
[[296](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L296), [336](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L336), [590](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L590)]


---

### [NC-06] Inconsistent usage of `require`/`error`

Some parts of the codebase use `require` statements, while others use custom `error`s. Consider refactoring the code to use the same approach: the following findings represent the minority of `require` vs `error`, and they show the first occurance in each file, for brevity.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

279: 		        require(
280: 		            inputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX
281: 		        );
```
[[279-281](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L279-L281)]


---

### [NC-07] Public functions not called internally

Those functions should be declared as `external` instead of `public`, as they are never called internally by the contract.

Contracts are allowed to override their parents' functions and change the visibility from external to public.

*There are 3 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

59: 		    function newConfig(

115: 		    function a(Config storage self) public view returns (int128) {

123: 		    function b(Config storage self) public view returns (int128) {
```
[[59](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L59), [115](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L115), [123](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L123)]


---

### [NC-08] `internal` functions not called by the contract should be removed

All unused code should be removed to improve the readability and the quality of the codebase.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

739: 		    function _getPointGivenXandUtility(

770: 		    function _getPointGivenYandUtility(
```
[[739](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L739)]


---

### [NC-09] Use of exponentiation instead of scientific notation

Use a scientific notation rather than exponentiation (e.g. `1e18` instead of `10**18`): although the compiler is capable of optimizing it, it is considered good coding practice to utilize idioms that don't rely on compiler optimization, whenever possible.

*There are 4 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

151: 		    int256 constant MIN_BALANCE = 10**12;

181: 		    uint256 constant MAX_BALANCE_AMOUNT_RATIO = 10**11;

191: 		    uint256 constant FIXED_FEE = 10**9;

201: 		    int256 constant MAX_PRICE_RATIO = 10**4; // to be comparable with the prices calculated through abdk math
```
[[151](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L151), [181](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L181), [191](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L191), [201](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L201)]


---

### [NC-10] Missing/malformed underscores for large numeric literals

Large hardcoded numbers in code can be difficult to read. Consider using underscores for number literals to improve readability (e.g `1234567` -> `1_234_567`). Consider using an underscore for every third digit from the right.

*There are 2 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

169: 		    int256 constant MAX_PRICE_VALUE = 1844674407370955161600000000;

175: 		    int256 constant MIN_PRICE_VALUE = 184467440737;
```
[[169](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L169), [175](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L175)]


---

### [NC-11] Use of non-named numeric constants

Constants should be defined instead of using magic numbers.

*There are 5 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

151: 		    int256 constant MIN_BALANCE = 10**12;

181: 		    uint256 constant MAX_BALANCE_AMOUNT_RATIO = 10**11;

191: 		    uint256 constant FIXED_FEE = 10**9;

201: 		    int256 constant MAX_PRICE_RATIO = 10**4; // to be comparable with the prices calculated through abdk math

716: 		        int256 disc = int256(Math.sqrt(uint256((bQuad**2 - (aQuad.muli(cQuad)*4)))));
```
[[151](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L151), [181](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L181), [191](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L191), [201](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L201), [716](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L716)]


---

### [NC-12] Complex math should be split into multiple steps

Consider splitting long arithmetic calculations into multiple steps to improve the code readability.

*There are 2 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

717: 		        int256 r0 = (-bQuad*MULTIPLIER + disc*MULTIPLIER) / aQuad.mul(two).muli(MULTIPLIER);

718: 		        int256 r1 = (-bQuad*MULTIPLIER - disc*MULTIPLIER) / aQuad.mul(two).muli(MULTIPLIER);
```
[[717](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L717), [718](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L718)]


---

### [NC-13] Control structures do not comply with best practices

This is a [best practice](https://docs.soliditylang.org/en/latest/style-guide.html#control-structures) that should be followed. 

*There are 18 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

98: 		        if (t(self) > ABDK_ONE) return self.px_final;

107: 		        if (t(self) > ABDK_ONE) return self.py_final;

251: 		        if (py_init >= MAX_PRICE_VALUE || py_final >= MAX_PRICE_VALUE) revert MaximumAllowedPriceExceeded();

252: 		        if (px_init <= MIN_PRICE_VALUE || px_final <= MIN_PRICE_VALUE) revert MinimumAllowedPriceExceeded();

255: 		        if (py_init <= px_init) revert InvalidPrice();

256: 		        if (py_final <= px_final) revert InvalidPrice();

259: 		        if (py_init.div(py_init.sub(px_init)) > ABDKMath64x64.divu(uint(MAX_PRICE_RATIO), 1)) revert MaximumAllowedPriceRatioExceeded();

260: 		        if (py_final.div(py_final.sub(px_final)) > ABDKMath64x64.divu(uint(MAX_PRICE_RATIO), 1)) revert MaximumAllowedPriceRatioExceeded();

626: 		        if (specifiedToken == SpecifiedToken.X)

720: 		        if(a < 0 && b < 0) utility = (r0 > r1) ? r1 : r0;

723: 		        if (utility < 0) revert CurveError(utility);

755: 		        if (y0 < 0) revert CurveError(y0);

786: 		        if (x0 < 0) revert CurveError(x0);

800: 		        if (balance / amount >= MAX_BALANCE_AMOUNT_RATIO) revert AmountError();

810: 		        if (x < MIN_BALANCE || y < MIN_BALANCE) revert BalanceError(x,y);

812: 		        if (finalBalanceRatio < MIN_M) revert BoundaryError(x,y);

813: 		        else if (MAX_M <= finalBalanceRatio) revert BoundaryError(x,y);

834: 		        if (absoluteValue < FIXED_FEE * 2) revert AmountError();
```
[[98](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L98), [107](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L107), [251](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L251), [252](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L252), [255](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L255), [256](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L256), [259](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L259), [260](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L260), [626](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L626), [720](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L720), [723](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L723), [755](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L755), [786](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L786), [800](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L800), [810](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L810), [812](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L812), [813](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L813), [834](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L834)]


---

### [NC-14] Variable names don't follow the Solidity naming convention

Use `mixedCase` for local and state variables that are not constants, and add a trailing underscore for internal variables. [Documentation](https://docs.soliditylang.org/en/latest/style-guide.html#local-and-state-variable-names)

*There are 18 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

60: 		        int128 py_init,

61: 		        int128 px_init,

62: 		        int128 py_final,

63: 		        int128 px_final,

244: 		        int128 py_init,

245: 		        int128 px_init,

246: 		        int128 py_final,

247: 		        int128 px_final,

746: 		        int256 a_convert = a.muli(MULTIPLIER);

747: 		        int256 b_convert = b.muli(MULTIPLIER);

750: 		        int256 f_0 = ((( x0  * MULTIPLIER ) / utility) + a_convert);

751: 		        int256 f_1 = ((MULTIPLIER * MULTIPLIER / f_0) -  b_convert);

752: 		        int256 f_2 = (f_1 * utility) / MULTIPLIER; 

777: 		        int256 a_convert = a.muli(MULTIPLIER);

778: 		        int256 b_convert = b.muli(MULTIPLIER);

781: 		        int256 f_0 = (( y0  * MULTIPLIER ) / utility) + b_convert;

782: 		        int256 f_1 = ( ((MULTIPLIER)*(MULTIPLIER) / f_0) - a_convert );

783: 		        int256 f_2 = (f_1 * utility) / (MULTIPLIER);
```
[[60](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L60), [61](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L61), [62](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L62), [63](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L63), [244](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L244), [245](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L245), [246](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L246), [247](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L247), [746](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L746), [747](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L747), [750](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L750), [751](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L751), [752](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L752), [777](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L777), [778](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L778), [781](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L781), [782](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L782), [783](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L783)]


---

### [NC-15] Contract functions should use an `interface`

All `external`/`public` functions should extend an `interface`. This is useful to make sure that the whole API is extracted.

*There are 14 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

59: 		    function newConfig(

81: 		    function elapsed(Config storage self) public view returns (uint256) {

89: 		    function t(Config storage self) public view returns (int128) {

97: 		    function p_min(Config storage self) public view returns (int128) {

106: 		    function p_max(Config storage self) public view returns (int128) {

115: 		    function a(Config storage self) public view returns (int128) {

123: 		    function b(Config storage self) public view returns (int128) {

132: 		    function duration(Config storage self) public view returns (uint256) {

272: 		    function swapGivenInputAmount(

312: 		    function swapGivenOutputAmount(

353: 		    function depositGivenInputAmount(

389: 		    function depositGivenOutputAmount(

426: 		    function withdrawGivenOutputAmount(

463: 		    function withdrawGivenInputAmount(
```
[[59](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L59), [81](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L81), [89](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L89), [97](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L97), [106](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L106), [115](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L115), [123](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L123), [132](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L132), [272](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L272), [312](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L312), [353](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L353), [389](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L389), [426](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L426), [463](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L463)]


---

### [NC-16] `require`/`revert` without any message

If a transaction reverts, it can be confusing to debug if there aren't any messages. Add a descriptive message to all `require`/`revert` statements.

*There are 16 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/proteus/EvolvingProteus.sol

279: 		        require(
280: 		            inputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX
281: 		        );

296: 		        require(result < 0);

319: 		        require(
320: 		            outputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX
321: 		        );

336: 		        require(result > 0);

361: 		        require(
362: 		            depositedAmount < INT_MAX &&
363: 		                xBalance < INT_MAX &&
364: 		                yBalance < INT_MAX &&
365: 		                totalSupply < INT_MAX
366: 		        );

378: 		        require(result > 0);

397: 		        require(
398: 		            mintedAmount < INT_MAX &&
399: 		                xBalance < INT_MAX &&
400: 		                yBalance < INT_MAX &&
401: 		                totalSupply < INT_MAX
402: 		        );

414: 		        require(result > 0);

434: 		        require(
435: 		            withdrawnAmount < INT_MAX &&
436: 		                xBalance < INT_MAX &&
437: 		                yBalance < INT_MAX &&
438: 		                totalSupply < INT_MAX
439: 		        );

451: 		        require(result < 0);

471: 		        require(
472: 		            burnedAmount < INT_MAX &&
473: 		                xBalance < INT_MAX &&
474: 		                yBalance < INT_MAX &&
475: 		                totalSupply < INT_MAX
476: 		        );

488: 		        require(result < 0);

590: 		        require(result < INT_MAX);   

658: 		        require(sf >= MIN_BALANCE);

661: 		        require(result < INT_MAX);

842: 		            require(roundedAbsoluteAmount < INT_MAX);
```
[[279-281](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L279-L281), [296](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L296), [319-321](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L319-L321), [336](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L336), [361-366](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L361-L366), [378](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L378), [397-402](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L397-L402), [414](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L414), [434-439](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L434-L439), [451](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L451), [471-476](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L471-L476), [488](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L488), [590](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L590), [658](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L658), [661](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L661), [842](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L842)]

</details>

---

### [NC-17] Lack of specific `import` identifier

It is better to use `import {<identifier>} from "<file.sol>"` instead of `import "<file.sol>"` to improve readability and speed up the compilation time.

*There are 2 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

6: 		import "abdk-libraries-solidity/ABDKMath64x64.sol";

7: 		import "@openzeppelin/contracts/utils/math/Math.sol";
```
[[6](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L6), [7](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L7)]


---

### [NC-18] Custom `error` without details

Consider adding some parameters to the error to indicate which user or values caused the failure.

*There are 5 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

222: 		    error AmountError();

226: 		    error InvalidPrice();

227: 		    error MinimumAllowedPriceExceeded();

228: 		    error MaximumAllowedPriceExceeded();

229: 		    error MaximumAllowedPriceRatioExceeded();
```
[[222](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L222), [226](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L226), [227](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L227), [228](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L228), [229](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L229)]


---

### [NC-19] Use a ternary statement instead of `if`/`else` when appropriate

The `if`/`else` statement can be written in a shorthand way using the ternary operator, as it increases readability and reduces the number of lines of code.

*There are 2 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

98: 		        if (t(self) > ABDK_ONE) return self.px_final;
99: 		        else return self.px_init.mul(ABDK_ONE.sub(t(self))).add(self.px_final.mul(t(self)));

107: 		        if (t(self) > ABDK_ONE) return self.py_final;
108: 		        else return self.py_init.mul(ABDK_ONE.sub(t(self))).add(self.py_final.mul(t(self)));
```
[[98-99](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L98-L99), [107-108](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L107-L108)]


---

### [NC-20] Lines are too long

Maximum suggested line length is 120 characters according to the [documentation](https://docs.soliditylang.org/en/latest/style-guide.html#maximum-line-length).

*There are 7 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

25: 		     time: the total duration of the curve's evolution (e.g. the amount of time it should take to evolve from the initial to the final prices)

37: 		     Note: To mitigate rounding errors, which if too large could result in liquidity provider losses, we enforce certain constraints on the algorithm.

38: 		           Min transaction amount: A transaction amount cannot be too small relative to the size of the reserves in the pool. A transaction amount either as an input into the pool or an output from the pool will result in a transaction failure

40: 		           Min reserve ratio: The ratio between the two reserves cannot fall below a certain ratio. Any transaction that would result in the pool going above or below this ratio will fail.

41: 		           Max reserve ratio: the ratio between the two reserves cannot go above a certain ratio. Any transaction that results in the reserves going beyond this ratio will fall.

259: 		        if (py_init.div(py_init.sub(px_init)) > ABDKMath64x64.divu(uint(MAX_PRICE_RATIO), 1)) revert MaximumAllowedPriceRatioExceeded();

260: 		        if (py_final.div(py_final.sub(px_final)) > ABDKMath64x64.divu(uint(MAX_PRICE_RATIO), 1)) revert MaximumAllowedPriceRatioExceeded();
```
[[25](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L25), [37](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L37), [38](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L38), [40](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L40), [41](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L41), [259](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L259), [260](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L260)]


---

### [NC-21] Some variables have a implicit default visibility

Consider always adding an explicit visibility modifier for variables, as the default is `internal`.

*There are 13 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

49: 		    int128 constant ABDK_ONE = int128(int256(1 << 64));

146: 		    uint256 constant INT_MAX = uint256(type(int256).max);

151: 		    int256 constant MIN_BALANCE = 10**12;

157: 		    int128 constant MAX_M = 0x5f5e1000000000000000000;

163: 		    int128 constant MIN_M = 0x00000000000002af31dc461;

169: 		    int256 constant MAX_PRICE_VALUE = 1844674407370955161600000000;

175: 		    int256 constant MIN_PRICE_VALUE = 184467440737;

181: 		    uint256 constant MAX_BALANCE_AMOUNT_RATIO = 10**11;

191: 		    uint256 constant FIXED_FEE = 10**9;

196: 		    int256 constant MULTIPLIER = 1e18;

201: 		    int256 constant MAX_PRICE_RATIO = 10**4; // to be comparable with the prices calculated through abdk math

206: 		    bool constant FEE_UP = true;

211: 		    bool constant FEE_DOWN = false;
```
[[49](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L49), [146](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L146), [151](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L151), [157](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L157), [163](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L163), [169](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L169), [175](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L175), [181](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L181), [191](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L191), [196](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L196), [201](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L201), [206](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L206), [211](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L211)]


---

### [NC-22] Typos in comments

Avoid typos, and proper nouns should be capitalized.

*There are 8 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

// @audit abdk
167: 		     The maximum price value calculated with abdk library equivalent to 10^26(wei)

// @audit abdk
173: 		     The minimum price value calculated with abdk library equivalent to 10^12(wei)

// @audit abdk
201: 		    int256 constant MAX_PRICE_RATIO = 10**4; // to be comparable with the prices calculated through abdk math

// @audit xf, yf, tf, uf
670: 		     *      xf or yf. In swaps we know the specified token (ti + amount == tf).
671: 		     *      In deposits or withdrawals, we know the non-specified token
672: 		     *      (ti == tf).
673: 		     *   2. There is always a known utility. During swaps utility is invariant
674: 		     *      (ui == uf).  During deposits or withdrawals, utility varies linearly

// @audit xy
697: 		     *  k(ab - 1)u**2 + (ay + bx)u + xy/k = 0

// @audit abdk
706: 		        int128 a = config.a(); //these are abdk numbers representing the a and b values

// @audit ku, xf
731: 		     *  ((x / (ku)) + a) ((y / (ku)) + b) = 1 (see _getUtility notes)
732: 		     * @dev Isolating y in the equation above gives us the equation:
733: 		     *  y = (k^2 u^2)/(a k u + x) - b k u
734: 		     * @dev This function returns x as xf because we want to be able to call

// @audit ku, yf
763: 		     *  ((x / (ku)) + a) ((y / (ku)) + b) = 1 (see _getUtility notes)
764: 		     * @dev Isolating y in the equation above gives us the equation:
765: 		     *  x = (k^2 u^2)/(b k u + y) - a k u
766: 		     * @dev This function returns y as yf because we want to be able to call
```
[[167](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L167), [173](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L173), [201](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L201), [670-674](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L670-L674), [697](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L697), [706](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L706), [731-734](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L731-L734), [763-766](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L763-L766)]


---

### [NC-23] Contracts should have full test coverage

A 100% test coverage is not foolproof, but it helps immensely in reducing the amount of bugs that may occur.



---

### [NC-24] Large or complicated code bases should implement invariant tests

This includes: large code bases, or code with lots of inline-assembly, complicated math, or complicated interactions between multiple contracts.

Invariant fuzzers such as Echidna require the test writer to come up with invariants which should not be violated under any circumstances, and the fuzzer tests various inputs and function calls to ensure that the invariants always hold.

Even code with 100% code coverage can still have bugs due to the order of the operations a user performs, and invariant fuzzers may help significantly.



---

### [NC-25] Codebase should implement formal verification testing

Formal verification is the act of proving or disproving the correctness of intended algorithms underlying a system with respect to a certain formal specification/property/invariant, using formal methods of mathematics.

Some tools that are currently available to perform these tests on smart contracts are [SMTChecker](https://docs.soliditylang.org/en/latest/smtchecker.html) and [Certora Prover](https://www.certora.com/).



---

### [NC-26] Inconsistent spacing in comments

Some lines use `// x` and some use `//x`. The instances below point out the usages that don't follow the majority, within each file.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

706: 		        int128 a = config.a(); //these are abdk numbers representing the a and b values
```
[[706](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L706)]


---

### [NC-27] State variables should include comments

Consider adding some comments on critical state variables to explain what they are supposed to do: this will help for future code reviews.

*There are 5 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

49: 		    int128 constant ABDK_ONE = int128(int256(1 << 64));

163: 		    int128 constant MIN_M = 0x00000000000002af31dc461;

169: 		    int256 constant MAX_PRICE_VALUE = 1844674407370955161600000000;

175: 		    int256 constant MIN_PRICE_VALUE = 184467440737;

216: 		    Config public config;
```
[[49](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L49), [163](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L163), [169](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L169), [175](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L175), [216](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L216)]


---

### [NC-28] Missing NatSpec from contract declarations

Some contracts miss a `@dev/@notice` NatSpec, which should be a [best practice](https://docs.soliditylang.org/en/latest/natspec-format.html) to add as a documentation.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

44: 		library LibConfig {
```
[[44](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L44)]


---

### [NC-29] Missing NatSpec `@title`

Some contract definitions have an incomplete NatSpec: add a `@title` notation to describe the contract to improve the code documentation.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

19: 		/**
```
[[19](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L19)]


---

### [NC-30] Missing NatSpec `@author`

Some contract definitions have an incomplete NatSpec: add a `@author` notation to improve the code documentation.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

19: 		/**
```
[[19](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L19)]


---

### [NC-31] Missing NatSpec `@param`

Some functions have an incomplete NatSpec: add a `@param` notation to describe the function parameters to improve the code documentation.

*There are 16 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/proteus/EvolvingProteus.sol

// @audit missing xBalance, yBalance, inputAmount, inputToken
266: 		    /**
267: 		     * @dev Given an input amount of one reserve token, we compute the output
268: 		     *  amount of the other reserve token, keeping utility invariant.
269: 		     * @dev We use FEE_DOWN because we want to decrease the perceived
270: 		     *  input amount and decrease the observed output amount.
271: 		     */
272: 		    function swapGivenInputAmount(

// @audit missing xBalance, yBalance, outputAmount, outputToken
306: 		    /**
307: 		     * @dev Given an output amount of a reserve token, we compute the input
308: 		     *  amount of the other reserve token, keeping utility invariant.
309: 		     * @dev We use FEE_UP because we want to increase the perceived output
310: 		     *  amount and increase the observed input amount.
311: 		     */
312: 		    function swapGivenOutputAmount(

// @audit missing xBalance, yBalance, totalSupply, depositedAmount, depositedToken
346: 		    /**
347: 		     * @dev Given an input amount of a reserve token, we compute the output
348: 		     *  amount of LP tokens, scaling the total supply of the LP tokens with the
349: 		     *  utility of the pool.
350: 		     * @dev We use FEE_DOWN because we want to decrease the perceived amount
351: 		     *  deposited and decrease the amount of LP tokens minted.
352: 		     */
353: 		    function depositGivenInputAmount(

// @audit missing xBalance, yBalance, totalSupply, mintedAmount, depositedToken
382: 		    /**
383: 		     * @dev Given an output amount of the LP token, we compute an amount of
384: 		     *  a reserve token that must be deposited to scale the utility of the pool
385: 		     *  in proportion to the change in total supply of the LP token.
386: 		     * @dev We use FEE_UP because we want to increase the perceived change in
387: 		     *  total supply and increase the observed amount deposited.
388: 		     */
389: 		    function depositGivenOutputAmount(

// @audit missing xBalance, yBalance, totalSupply, withdrawnAmount, withdrawnToken
418: 		    /**
419: 		     * @dev Given an output amount of a reserve token, we compute an amount of
420: 		     *  LP tokens that must be burned in order to decrease the total supply in
421: 		     *  proportion to the decrease in utility.
422: 		     * @dev We use FEE_UP because we want to increase the perceived amount
423: 		     *  withdrawn from the pool and increase the observed decrease in total
424: 		     *  supply.
425: 		     */
426: 		    function withdrawGivenOutputAmount(

// @audit missing xBalance, yBalance, totalSupply, burnedAmount, withdrawnToken
455: 		    /**
456: 		     * @dev Given an input amount of the LP token, we compute an amount of
457: 		     *  a reserve token that must be output to decrease the pool's utility in
458: 		     *  proportion to the pool's decrease in total supply of the LP token.
459: 		     * @dev We use FEE_UP because we want to increase the perceived amount of
460: 		     *  reserve tokens leaving the pool and to increase the observed amount of
461: 		     *  LP tokens being burned.
462: 		     */
463: 		    function withdrawGivenInputAmount(

// @audit missing feeDirection, specifiedAmount, xi, yi, specifiedToken
492: 		    /**
493: 		     * @dev From a starting point (xi, yi), we can begin a swap in four ways:
494: 		     *  [+x, -x, +y, -y]. This function abstracts over those four ways using
495: 		     *  the specifiedToken parameter and the sign of the specifiedAmount
496: 		     *  integer.
497: 		     * @dev A starting coordinate can be combined with the specified amount
498: 		     *  to find a known final coordinate. A final coordinate and a final
499: 		     *  utility can be used to determine the final point.
500: 		     * @dev Using the final point and the initial point, we can find how much
501: 		     *  of the non-specified token must enter or leave the pool in order to
502: 		     *  keep utility invariant.
503: 		     * @dev see notes above _findFinalPoint for information on direction
504: 		     *  and other variables declared in this scope.
505: 		     */
506: 		    function _swap(

// @audit missing specifiedToken, specifiedAmount, feeDirection, si, xi, yi
556: 		    /**
557: 		     * @dev When performing a deposit given an input amount or a withdraw
558: 		     *  given an output amount, we know the initial point and final point,
559: 		     *  which allows us to find the initial utility and final utility.
560: 		     * @dev With the initial utility and final utility, we need to change
561: 		     *  the total supply in proportion to the change in utility.
562: 		     */
563: 		    function _reserveTokenSpecified(

// @audit missing specifiedToken, specifiedAmount, feeDirection, si, xi, yi
597: 		    /**
598: 		     * @dev When performing a deposit given an output amount or a withdraw
599: 		     *  given an input amount, we know the initial total supply and the final
600: 		     *  total supply.
601: 		     * @dev Given the change in total supply, we need to find how much of a
602: 		     *  reserve token we need to take in or give out in order to change the
603: 		     *  pool's utility in proportion to the pool's change in total supply.
604: 		     * @dev see notes above _findFinalPoint for information on direction
605: 		     *  and other variables declared in this scope.
606: 		     */
607: 		    function _lpTokenSpecified(

// @audit missing si, sf, xi, yi
649: 		    /**
650: 		     * @dev Calculate utility when lp token amount is specified while depositing/withdrawing liquidity
651: 		    */
652: 		    function _getUtilityFinalLp(

// @audit missing x, y
697: 		     *  k(ab - 1)u**2 + (ay + bx)u + xy/k = 0
698: 		     * @dev isolate u in the equation using the quadratic formula above gives us two solutions. 
699: 		     *  We always want the larger solution
700: 		     */
701: 		    function _getUtility(

// @audit missing x, utility
731: 		     *  ((x / (ku)) + a) ((y / (ku)) + b) = 1 (see _getUtility notes)
732: 		     * @dev Isolating y in the equation above gives us the equation:
733: 		     *  y = (k^2 u^2)/(a k u + x) - b k u
734: 		     * @dev This function returns x as xf because we want to be able to call
735: 		     *  getPointGivenX and getPointGivenY and handle the returned values
736: 		     *  without caring about which particular function is was called.
737: 		     */
738: 		
739: 		    function _getPointGivenXandUtility(

// @audit missing y, utility
763: 		     *  ((x / (ku)) + a) ((y / (ku)) + b) = 1 (see _getUtility notes)
764: 		     * @dev Isolating y in the equation above gives us the equation:
765: 		     *  x = (k^2 u^2)/(b k u + y) - a k u
766: 		     * @dev This function returns y as yf because we want to be able to call
767: 		     *  getPointGivenX and getPointGivenY and handle the returned values
768: 		     *  without caring about which particular function is was called.
769: 		     */
770: 		    function _getPointGivenYandUtility(

// @audit missing balance, amount
790: 		    /**
791: 		     * @dev this limits the ratio between a starting balance and an input
792: 		     *  or output amount.
793: 		     * @dev when we swap very small amounts against a very large pool,
794: 		     *  precision errors can cause the pool to lose a small amount of value.
795: 		     */
796: 		    function _checkAmountWithBalance(uint256 balance, uint256 amount)

// @audit missing x, y
803: 		    /**
804: 		     * @dev The pool's balances of the x reserve and y reserve tokens must be
805: 		     *  greater than the MIN_BALANCE
806: 		     * @dev The pool's ratio of y to x must be within the interval
807: 		     *  [MIN_M, MAX_M)
808: 		     */
809: 		    function _checkBalances(int256 x, int256 y) private pure {

// @audit missing amount, feeUp
816: 		    /**
817: 		     * @dev Rounding and fees are equivalent concepts
818: 		     * @dev We charge fees by rounding values in directions that are beneficial
819: 		     *  to the pool.
820: 		     * @dev the BASE_FEE and FIXED_FEE values were chosen such that round
821: 		     *  enough to cover numerical stability issues that arise from using a
822: 		     *  fixed precision math library and piecewise bonding curves.
823: 		     */
824: 		    function _applyFeeByRounding(int256 amount, bool feeUp)
```
[[266-272](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L266-L272), [306-312](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L306-L312), [346-353](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L346-L353), [382-389](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L382-L389), [418-426](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L418-L426), [455-463](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L455-L463), [492-506](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L492-L506), [556-563](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L556-L563), [597-607](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L597-L607), [649-652](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L649-L652), [697-701](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L697-L701), [731-739](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L731-L739), [763-770](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L763-L770), [790-796](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L790-L796), [803-809](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L803-L809), [816-824](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L816-L824)]

</details>

---

### [NC-32] Incomplete NatSpec `@return`

Some functions have an incomplete NatSpec: add a `@return` notation to describe the function return value to improve the code documentation.

*There are 23 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/proteus/EvolvingProteus.sol

// @audit missing @return
51: 		    /**
52: 		       @notice Calculates the equation parameters "a" & "b" described above & returns the config instance
53: 		       @param py_init The initial price at the y axis
54: 		       @param px_init The initial price at the x axis
55: 		       @param py_final The final price at the y axis
56: 		       @param px_final The final price at the x axis
57: 		       @param _duration duration over which the curve will evolve
58: 		     */
59: 		    function newConfig(

// @audit missing @return
77: 		    /**
78: 		       @notice Calculates the time that has passed since deployment
79: 		       @param self config instance
80: 		    */
81: 		    function elapsed(Config storage self) public view returns (uint256) {

// @audit missing @return
85: 		    /**
86: 		       @notice Calculates the time as a percent of total duration
87: 		       @param self config instance
88: 		    */
89: 		    function t(Config storage self) public view returns (int128) {

// @audit missing @return
93: 		    /**
94: 		       @notice The minimum price (at the x asymptote) at the current block
95: 		       @param self config instance
96: 		    */
97: 		    function p_min(Config storage self) public view returns (int128) {

// @audit missing @return
102: 		    /**
103: 		       @notice The maximum price (at the y asymptote) at the current block
104: 		       @param self config instance
105: 		    */
106: 		    function p_max(Config storage self) public view returns (int128) {

// @audit missing @return
111: 		    /**
112: 		       @notice Calculates the a variable in the curve eq which is basically a sq. root of the inverse of y instantaneous price
113: 		       @param self config instance
114: 		    */
115: 		    function a(Config storage self) public view returns (int128) {

// @audit missing @return
119: 		    /**
120: 		       @notice Calculates the b variable in the curve eq which is basically a sq. root of the inverse of x instantaneous price
121: 		       @param self config instance
122: 		    */
123: 		    function b(Config storage self) public view returns (int128) {

// @audit missing @return
128: 		    /**
129: 		       @notice Calculates the duration of the curve evolution
130: 		       @param self config instance
131: 		    */
132: 		    function duration(Config storage self) public view returns (uint256) {

// @audit missing @return
266: 		    /**
267: 		     * @dev Given an input amount of one reserve token, we compute the output
268: 		     *  amount of the other reserve token, keeping utility invariant.
269: 		     * @dev We use FEE_DOWN because we want to decrease the perceived
270: 		     *  input amount and decrease the observed output amount.
271: 		     */
272: 		    function swapGivenInputAmount(

// @audit missing @return
306: 		    /**
307: 		     * @dev Given an output amount of a reserve token, we compute the input
308: 		     *  amount of the other reserve token, keeping utility invariant.
309: 		     * @dev We use FEE_UP because we want to increase the perceived output
310: 		     *  amount and increase the observed input amount.
311: 		     */
312: 		    function swapGivenOutputAmount(

// @audit missing @return
346: 		    /**
347: 		     * @dev Given an input amount of a reserve token, we compute the output
348: 		     *  amount of LP tokens, scaling the total supply of the LP tokens with the
349: 		     *  utility of the pool.
350: 		     * @dev We use FEE_DOWN because we want to decrease the perceived amount
351: 		     *  deposited and decrease the amount of LP tokens minted.
352: 		     */
353: 		    function depositGivenInputAmount(

// @audit missing @return
382: 		    /**
383: 		     * @dev Given an output amount of the LP token, we compute an amount of
384: 		     *  a reserve token that must be deposited to scale the utility of the pool
385: 		     *  in proportion to the change in total supply of the LP token.
386: 		     * @dev We use FEE_UP because we want to increase the perceived change in
387: 		     *  total supply and increase the observed amount deposited.
388: 		     */
389: 		    function depositGivenOutputAmount(

// @audit missing @return
418: 		    /**
419: 		     * @dev Given an output amount of a reserve token, we compute an amount of
420: 		     *  LP tokens that must be burned in order to decrease the total supply in
421: 		     *  proportion to the decrease in utility.
422: 		     * @dev We use FEE_UP because we want to increase the perceived amount
423: 		     *  withdrawn from the pool and increase the observed decrease in total
424: 		     *  supply.
425: 		     */
426: 		    function withdrawGivenOutputAmount(

// @audit missing @return
455: 		    /**
456: 		     * @dev Given an input amount of the LP token, we compute an amount of
457: 		     *  a reserve token that must be output to decrease the pool's utility in
458: 		     *  proportion to the pool's decrease in total supply of the LP token.
459: 		     * @dev We use FEE_UP because we want to increase the perceived amount of
460: 		     *  reserve tokens leaving the pool and to increase the observed amount of
461: 		     *  LP tokens being burned.
462: 		     */
463: 		    function withdrawGivenInputAmount(

// @audit missing @return
492: 		    /**
493: 		     * @dev From a starting point (xi, yi), we can begin a swap in four ways:
494: 		     *  [+x, -x, +y, -y]. This function abstracts over those four ways using
495: 		     *  the specifiedToken parameter and the sign of the specifiedAmount
496: 		     *  integer.
497: 		     * @dev A starting coordinate can be combined with the specified amount
498: 		     *  to find a known final coordinate. A final coordinate and a final
499: 		     *  utility can be used to determine the final point.
500: 		     * @dev Using the final point and the initial point, we can find how much
501: 		     *  of the non-specified token must enter or leave the pool in order to
502: 		     *  keep utility invariant.
503: 		     * @dev see notes above _findFinalPoint for information on direction
504: 		     *  and other variables declared in this scope.
505: 		     */
506: 		    function _swap(

// @audit missing @return
556: 		    /**
557: 		     * @dev When performing a deposit given an input amount or a withdraw
558: 		     *  given an output amount, we know the initial point and final point,
559: 		     *  which allows us to find the initial utility and final utility.
560: 		     * @dev With the initial utility and final utility, we need to change
561: 		     *  the total supply in proportion to the change in utility.
562: 		     */
563: 		    function _reserveTokenSpecified(

// @audit missing @return
597: 		    /**
598: 		     * @dev When performing a deposit given an output amount or a withdraw
599: 		     *  given an input amount, we know the initial total supply and the final
600: 		     *  total supply.
601: 		     * @dev Given the change in total supply, we need to find how much of a
602: 		     *  reserve token we need to take in or give out in order to change the
603: 		     *  pool's utility in proportion to the pool's change in total supply.
604: 		     * @dev see notes above _findFinalPoint for information on direction
605: 		     *  and other variables declared in this scope.
606: 		     */
607: 		    function _lpTokenSpecified(

// @audit missing @return
649: 		    /**
650: 		     * @dev Calculate utility when lp token amount is specified while depositing/withdrawing liquidity
651: 		    */
652: 		    function _getUtilityFinalLp(

// @audit missing @return
670: 		     *      xf or yf. In swaps we know the specified token (ti + amount == tf).
671: 		     *      In deposits or withdrawals, we know the non-specified token
672: 		     *      (ti == tf).
673: 		     *   2. There is always a known utility. During swaps utility is invariant
674: 		     *      (ui == uf).  During deposits or withdrawals, utility varies linearly
675: 		     *      with the known change in total supply of the LP token.
676: 		     * @param fixedCoordinate Known coordinate
677: 		     * @param utility Known utility
678: 		     * @param getPoint Function that uses the known coordinate and the known
679: 		     *  utility to compute the unknown coordinate. Returns a point (x, y).
680: 		*/
681: 		    function _findFinalPoint(

// @audit missing @return
697: 		     *  k(ab - 1)u**2 + (ay + bx)u + xy/k = 0
698: 		     * @dev isolate u in the equation using the quadratic formula above gives us two solutions. 
699: 		     *  We always want the larger solution
700: 		     */
701: 		    function _getUtility(

// @audit missing @return
731: 		     *  ((x / (ku)) + a) ((y / (ku)) + b) = 1 (see _getUtility notes)
732: 		     * @dev Isolating y in the equation above gives us the equation:
733: 		     *  y = (k^2 u^2)/(a k u + x) - b k u
734: 		     * @dev This function returns x as xf because we want to be able to call
735: 		     *  getPointGivenX and getPointGivenY and handle the returned values
736: 		     *  without caring about which particular function is was called.
737: 		     */
738: 		
739: 		    function _getPointGivenXandUtility(

// @audit missing @return
763: 		     *  ((x / (ku)) + a) ((y / (ku)) + b) = 1 (see _getUtility notes)
764: 		     * @dev Isolating y in the equation above gives us the equation:
765: 		     *  x = (k^2 u^2)/(b k u + y) - a k u
766: 		     * @dev This function returns y as yf because we want to be able to call
767: 		     *  getPointGivenX and getPointGivenY and handle the returned values
768: 		     *  without caring about which particular function is was called.
769: 		     */
770: 		    function _getPointGivenYandUtility(

// @audit missing @return
816: 		    /**
817: 		     * @dev Rounding and fees are equivalent concepts
818: 		     * @dev We charge fees by rounding values in directions that are beneficial
819: 		     *  to the pool.
820: 		     * @dev the BASE_FEE and FIXED_FEE values were chosen such that round
821: 		     *  enough to cover numerical stability issues that arise from using a
822: 		     *  fixed precision math library and piecewise bonding curves.
823: 		     */
824: 		    function _applyFeeByRounding(int256 amount, bool feeUp)
```
[[51-59](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L51-L59), [77-81](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L77-L81), [85-89](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L85-L89), [93-97](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L93-L97), [102-106](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L102-L106), [111-115](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L111-L115), [119-123](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L119-L123), [128-132](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L128-L132), [266-272](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L266-L272), [306-312](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L306-L312), [346-353](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L346-L353), [382-389](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L382-L389), [418-426](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L418-L426), [455-463](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L455-L463), [492-506](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L492-L506), [556-563](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L556-L563), [597-607](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L597-L607), [649-652](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L649-L652), [670-681](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L670-L681), [697-701](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L697-L701), [731-739](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L731-L739), [763-770](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L763-L770), [816-824](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L816-L824)]

</details>

---

## Gas Optimizations

---

### [G-01] Custom `error`s cost less than `require`/`assert`

Consider the use of a custom `error`, as it leads to a cheaper deploy cost and run time cost. The run time cost is only relevant when the revert condition is met.

*There are 16 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/proteus/EvolvingProteus.sol

279: 		        require(
280: 		            inputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX
281: 		        );

296: 		        require(result < 0);

319: 		        require(
320: 		            outputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX
321: 		        );

336: 		        require(result > 0);

361: 		        require(
362: 		            depositedAmount < INT_MAX &&
363: 		                xBalance < INT_MAX &&
364: 		                yBalance < INT_MAX &&
365: 		                totalSupply < INT_MAX
366: 		        );

378: 		        require(result > 0);

397: 		        require(
398: 		            mintedAmount < INT_MAX &&
399: 		                xBalance < INT_MAX &&
400: 		                yBalance < INT_MAX &&
401: 		                totalSupply < INT_MAX
402: 		        );

414: 		        require(result > 0);

434: 		        require(
435: 		            withdrawnAmount < INT_MAX &&
436: 		                xBalance < INT_MAX &&
437: 		                yBalance < INT_MAX &&
438: 		                totalSupply < INT_MAX
439: 		        );

451: 		        require(result < 0);

471: 		        require(
472: 		            burnedAmount < INT_MAX &&
473: 		                xBalance < INT_MAX &&
474: 		                yBalance < INT_MAX &&
475: 		                totalSupply < INT_MAX
476: 		        );

488: 		        require(result < 0);

590: 		        require(result < INT_MAX);   

658: 		        require(sf >= MIN_BALANCE);

661: 		        require(result < INT_MAX);

842: 		            require(roundedAbsoluteAmount < INT_MAX);
```
[[279-281](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L279-L281), [296](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L296), [319-321](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L319-L321), [336](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L336), [361-366](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L361-L366), [378](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L378), [397-402](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L397-L402), [414](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L414), [434-439](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L434-L439), [451](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L451), [471-476](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L471-L476), [488](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L488), [590](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L590), [658](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L658), [661](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L661), [842](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L842)]

</details>

---

### [G-02] State variables only set in the constructor should be declared `immutable`

Accessing state variables within a function involves an SLOAD operation, but `immutable` variables can be accessed directly without the need of it, thus reducing gas costs. As these state variables are assigned only in the constructor, consider declaring them `immutable`.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

216: 		    Config public config;
```
[[216](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L216)]


---

### [G-03] Cache state variables with stack variables

Caching of a state variable replaces each Gwarmaccess (**100 gas**) with a cheaper stack read. Other less obvious fixes/optimizations include having local memory caches of state variable structs, or having local caches of state variable contracts/addresses.

*There are 3 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

// @audit config on line 706
707: 		        int128 b = config.b(); 

// @audit config on line 743
744: 		        int128 b = config.b();

// @audit config on line 774
775: 		        int128 b = config.b();
```
[[707](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L707), [744](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L744), [775](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L775)]


---

### [G-04] Use at least Solidity version `0.8.19` to gain some gas boost

Upgrade to at least solidity version 0.8.19 to get additional gas savings. Check the [documentation](https://blog.soliditylang.org/2023/02/22/solidity-0.8.19-release-announcement/) for reference.

Some additional details:
> In earlier releases and in the default legacy code generation, when an internal library function or a free function accessed via a module was called only during contract creation, e.g. only in the constructor, a copy of the function still also occurred in the contract’s runtime bytecode.
>
>So a function pointer in creation code also refers to the offset of the function in runtime code, which requires the function to actually be present in runtime code.
>
>For direct calls to internal contract functions the full encoding of the function expression is bypassed by the compiler. However, this bypassing did not happen for internal library functions and for free functions called via modules, causing the undesirable behaviour that is now fixed in this release.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

4: 		pragma solidity =0.8.10;
```
[[4](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L4)]


---

### [G-05] Using `private` for constants saves gas

Saves deployment gas due to the compiler not having to create non-payable getter functions for deployment calldata, not having to store the bytes of the value outside of where it's used, and not adding another entry to the method ID table.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

186: 		    uint256 public constant BASE_FEE = 800;
```
[[186](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L186)]


---

### [G-06] Consider activating `via-ir` for deploying

The IR-based code generator was developed to make code generation more performant by enabling optimization passes that can be applied across functions.

It is possible to activate the IR-based code generator through the command line by using the flag `--via-ir` or by including the option `{"viaIR": true}`.

Keep in mind that compiling with this option may take longer. However, you can simply test it before deploying your code. If you find that it provides better performance, you can add the `--via-ir` flag to your deploy command.



---

### [G-07] Function calls should be cached instead of re-calling the function

Consider caching the result instead of re-calling the function when possible. Note: this also includes casts, which cost between 42-46 gas, depending on the type.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

// @audit aQuad.mul(two).muli(MULTIPLIER) is duplicated on line 718
717: 		        int256 r0 = (-bQuad*MULTIPLIER + disc*MULTIPLIER) / aQuad.mul(two).muli(MULTIPLIER);
```
[717](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L717)]


---

### [G-08] Add `unchecked` blocks for divisions where the operands cannot overflow

`uint` divisions can't overflow, while `int` divisions can overflow only in [one specific case](https://docs.soliditylang.org/en/latest/types.html#division).

Consider adding an `unchecked` block to have some [gas savings](https://gist.github.com/DadeKuma/3bc597338ae774b8b3bd43280d55271f).

*There are 11 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

717: 		        int256 r0 = (-bQuad*MULTIPLIER + disc*MULTIPLIER) / aQuad.mul(two).muli(MULTIPLIER);

718: 		        int256 r1 = (-bQuad*MULTIPLIER - disc*MULTIPLIER) / aQuad.mul(two).muli(MULTIPLIER);

750: 		        int256 f_0 = ((( x0  * MULTIPLIER ) / utility) + a_convert);

751: 		        int256 f_1 = ((MULTIPLIER * MULTIPLIER / f_0) -  b_convert);

752: 		        int256 f_2 = (f_1 * utility) / MULTIPLIER; 

781: 		        int256 f_0 = (( y0  * MULTIPLIER ) / utility) + b_convert;

782: 		        int256 f_1 = ( ((MULTIPLIER)*(MULTIPLIER) / f_0) - a_convert );

783: 		        int256 f_2 = (f_1 * utility) / (MULTIPLIER); 

800: 		        if (balance / amount >= MAX_BALANCE_AMOUNT_RATIO) revert AmountError();

840: 		                (absoluteValue / BASE_FEE) +

846: 		                (absoluteValue / BASE_FEE) -
```
[[717](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L717), [718](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L718), [750](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L750), [751](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L751), [752](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L752), [781](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L781), [782](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L782), [783](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L783), [800](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L800), [840](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L840), [846](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L846)]


---

### [G-09] Usage of `uints`/`ints` smaller than 32 bytes (256 bits) incurs overhead

Citing the [documentation](https://docs.soliditylang.org/en/latest/internals/layout_in_storage.html):

> When using elements that are smaller than 32 bytes, your contract’s gas usage may be higher.This is because the EVM operates on 32 bytes at a time.Therefore, if the element is smaller than that, the EVM must use more operations in order to reduce the size of the element from 32 bytes to the desired size.

For example, each operation involving a `uint8` costs an extra ** 22 - 28 gas ** (depending on whether the other operand is also a variable of type `uint8`) as compared to ones involving`uint256`, due to the compiler having to clear the higher bits of the memory word before operating on the`uint8`, as well as the associated stack operations of doing so.

Note that it might be beneficial to use reduced-size types when dealing with storage values because the compiler will pack multiple elements into one storage slot, but if not, it will have the opposite effect.

*There are 26 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

49: 		    int128 constant ABDK_ONE = int128(int256(1 << 64));

60: 		        int128 py_init,

61: 		        int128 px_init,

62: 		        int128 py_final,

63: 		        int128 px_final,

89: 		    function t(Config storage self) public view returns (int128) {

97: 		    function p_min(Config storage self) public view returns (int128) {

106: 		    function p_max(Config storage self) public view returns (int128) {

115: 		    function a(Config storage self) public view returns (int128) {

123: 		    function b(Config storage self) public view returns (int128) {

157: 		    int128 constant MAX_M = 0x5f5e1000000000000000000;

163: 		    int128 constant MIN_M = 0x00000000000002af31dc461;

244: 		        int128 py_init,

245: 		        int128 px_init,

246: 		        int128 py_final,

247: 		        int128 px_final,

706: 		        int128 a = config.a(); //these are abdk numbers representing the a and b values

707: 		        int128 b = config.b(); 

709: 		        int128 two = ABDKMath64x64.divu(uint256(2 * MULTIPLIER), uint256(MULTIPLIER));

710: 		        int128 one = ABDKMath64x64.divu(uint256(MULTIPLIER), uint256(MULTIPLIER));

712: 		        int128 aQuad = (a.mul(b).sub(one));

743: 		        int128 a = config.a();

744: 		        int128 b = config.b();

774: 		        int128 a = config.a();

775: 		        int128 b = config.b();

811: 		        int128 finalBalanceRatio = y.divi(x);
```
[[49](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L49), [60](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L60), [61](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L61), [62](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L62), [63](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L63), [89](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L89), [97](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L97), [106](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L106), [115](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L115), [123](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L123), [157](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L157), [163](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L163), [244](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L244), [245](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L245), [246](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L246), [247](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L247), [706](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L706), [707](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L707), [709](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L709), [710](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L710), [712](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L712), [743](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L743), [744](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L744), [774](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L774), [775](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L775), [811](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L811)]


---

### [G-10] Some ternary operators are unnecessary

Consider assigning the value of the comparison directly instead of performing an additional operation
(e.g.) `z = (x == y) ? true : false -> z = (x == y)`

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

829: 		        bool negative = amount < 0 ? true : false;
```
[[829](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L829)]


---

### [G-11] `>=`/`<=` costs less gas than `>`/`<`

The compiler uses opcodes `GT` and `ISZERO` for code that uses `>`, but only requires `LT` for `>=`. A similar behaviour applies for `>`, which uses opcodes `LT` and `ISZERO`, but only requires `GT` for `<=`.

*There are 47 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/proteus/EvolvingProteus.sol

98: 		        if (t(self) > ABDK_ONE) return self.px_final;

107: 		        if (t(self) > ABDK_ONE) return self.py_final;

259: 		        if (py_init.div(py_init.sub(px_init)) > ABDKMath64x64.divu(uint(MAX_PRICE_RATIO), 1)) revert MaximumAllowedPriceRatioExceeded();

260: 		        if (py_final.div(py_final.sub(px_final)) > ABDKMath64x64.divu(uint(MAX_PRICE_RATIO), 1)) revert MaximumAllowedPriceRatioExceeded();

280: 		            inputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX

280: 		            inputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX

280: 		            inputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX

296: 		        require(result < 0);

320: 		            outputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX

320: 		            outputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX

320: 		            outputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX

336: 		        require(result > 0);

362: 		            depositedAmount < INT_MAX &&

363: 		                xBalance < INT_MAX &&

364: 		                yBalance < INT_MAX &&

365: 		                totalSupply < INT_MAX

378: 		        require(result > 0);

398: 		            mintedAmount < INT_MAX &&

399: 		                xBalance < INT_MAX &&

400: 		                yBalance < INT_MAX &&

401: 		                totalSupply < INT_MAX

414: 		        require(result > 0);

435: 		            withdrawnAmount < INT_MAX &&

436: 		                xBalance < INT_MAX &&

437: 		                yBalance < INT_MAX &&

438: 		                totalSupply < INT_MAX

451: 		        require(result < 0);

472: 		            burnedAmount < INT_MAX &&

473: 		                xBalance < INT_MAX &&

474: 		                yBalance < INT_MAX &&

475: 		                totalSupply < INT_MAX

488: 		        require(result < 0);

590: 		        require(result < INT_MAX);   

661: 		        require(result < INT_MAX);

720: 		        if(a < 0 && b < 0) utility = (r0 > r1) ? r1 : r0;

720: 		        if(a < 0 && b < 0) utility = (r0 > r1) ? r1 : r0;

720: 		        if(a < 0 && b < 0) utility = (r0 > r1) ? r1 : r0;

721: 		        else utility = (r0 > r1) ? r0 : r1;

723: 		        if (utility < 0) revert CurveError(utility);

755: 		        if (y0 < 0) revert CurveError(y0);

786: 		        if (x0 < 0) revert CurveError(x0);

810: 		        if (x < MIN_BALANCE || y < MIN_BALANCE) revert BalanceError(x,y);

810: 		        if (x < MIN_BALANCE || y < MIN_BALANCE) revert BalanceError(x,y);

812: 		        if (finalBalanceRatio < MIN_M) revert BoundaryError(x,y);

829: 		        bool negative = amount < 0 ? true : false;

834: 		        if (absoluteValue < FIXED_FEE * 2) revert AmountError();

842: 		            require(roundedAbsoluteAmount < INT_MAX);
```
[[98](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L98), [107](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L107), [259](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L259), [260](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L260), [280](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L280), [280](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L280), [280](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L280), [296](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L296), [320](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L320), [320](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L320), [320](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L320), [336](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L336), [362](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L362), [363](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L363), [364](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L364), [365](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L365), [378](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L378), [398](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L398), [399](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L399), [400](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L400), [401](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L401), [414](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L414), [435](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L435), [436](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L436), [437](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L437), [438](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L438), [451](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L451), [472](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L472), [473](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L473), [474](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L474), [475](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L475), [488](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L488), [590](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L590), [661](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L661), [720](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L720), [720](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L720), [720](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L720), [721](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L721), [723](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L723), [755](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L755), [786](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L786), [810](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L810), [810](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L810), [812](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L812), [829](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L829), [834](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L834), [842](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L842)]

</details>

---

### [G-12] `internal/private` functions only called once can be inlined to save gas

Consider removing those internal functions and to put the logic directly where they are called, as they are called only once.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

652: 		    function _getUtilityFinalLp(
```
[[652](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L652)]


---

### [G-13] `internal` functions not called by the contract should be removed to save deployment gas

All unused code should be removed to save deployment gas.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

739: 		    function _getPointGivenXandUtility(

770: 		    function _getPointGivenYandUtility(
```
[[739](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L739)]


---

### [G-14] Unused named return variables without optimizer waste gas

Consider changing the variable to be an unnamed one, since the variable is never assigned, nor is it returned by name. If the optimizer is not turned on, leaving the code as it is will also waste gas for the stack variable.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

687: 		    ) internal view returns (int256 xf, int256 yf) {
```
[[687](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L687)]


---

### [G-15] Function names can be optimized

Function that are `public`/`external` and `public` state variable names can be optimized to save gas.

Method IDs that have two leading zero bytes can save **128 gas** each during deployment, and renaming functions to have lower method IDs will save **22 gas** per call, per sorted position shifted. [Reference](https://blog.emn178.cc/en/post/solidity-gas-optimization-function-name/)

*There are 2 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

44: 		library LibConfig {

137: 		contract EvolvingProteus is ILiquidityPoolImplementation {
```
[[44](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L44), [137](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L137)]


---

### [G-16] Multiplication/division by two should use bit shifting

`X * 2` is equivalent to `X << 1` and `X / 2` is the same as `X >> 1`.

The `MUL` and `DIV` opcodes cost 5 gas, whereas `SHL` and `SHR` only cost 3 gas.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

834: 		        if (absoluteValue < FIXED_FEE * 2) revert AmountError();
```
[[834](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L834)]


---

### [G-17] Constructors can be marked `payable`

`payable` functions cost less gas to execute, since the compiler does not have to add extra checks to ensure that a payment wasn't provided.

A `constructor` can safely be marked as `payable`, since only the deployer would be able to pass funds, and the project itself would not pass any funds.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

243: 		    constructor(
```
[[243](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L243)]


---

### [G-18] Splitting `require` statements that use `&&` saves gas

Using operator && on a single require costs more gas than using two require.

```solidity
//expensive
require(version == 1 && index == 2);

//cheaper
require(version == 1);
require(index == 2 == bytes1(0));
```

*There are 6 instances of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

279: 		        require(
280: 		            inputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX
281: 		        );

319: 		        require(
320: 		            outputAmount < INT_MAX && xBalance < INT_MAX && yBalance < INT_MAX
321: 		        );

361: 		        require(
362: 		            depositedAmount < INT_MAX &&
363: 		                xBalance < INT_MAX &&
364: 		                yBalance < INT_MAX &&
365: 		                totalSupply < INT_MAX
366: 		        );

397: 		        require(
398: 		            mintedAmount < INT_MAX &&
399: 		                xBalance < INT_MAX &&
400: 		                yBalance < INT_MAX &&
401: 		                totalSupply < INT_MAX
402: 		        );

434: 		        require(
435: 		            withdrawnAmount < INT_MAX &&
436: 		                xBalance < INT_MAX &&
437: 		                yBalance < INT_MAX &&
438: 		                totalSupply < INT_MAX
439: 		        );

471: 		        require(
472: 		            burnedAmount < INT_MAX &&
473: 		                xBalance < INT_MAX &&
474: 		                yBalance < INT_MAX &&
475: 		                totalSupply < INT_MAX
476: 		        );
```
[[279-281](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L279-L281), [319-321](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L319-L321), [361-366](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L361-L366), [397-402](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L397-L402), [434-439](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L434-L439), [471-476](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L471-L476)]


---

### [G-19] Nesting `if` statements that use `&&` saves gas

Using the `&&` operator on a single `if` [costs more gas](https://gist.github.com/DadeKuma/931ce6794a050201ec6544dbcc31316c) than using two nested `if`.

*There is 1 instance of this issue.*


```solidity
File: src/proteus/EvolvingProteus.sol

720: 		        if(a < 0 && b < 0) utility = (r0 > r1) ? r1 : r0;
```
[[720](https://github.com/code-423n4/2023-08-shell/blob/3710196ff36f90e588e05588546aaabb0e941cf4/src/proteus/EvolvingProteus.sol#L720)]


---
