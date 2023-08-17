// SPDX-License-Identifier: MIT
// Cowri Labs Inc.

pragma solidity =0.8.10;
import "@openzeppelin/contracts/access/Ownable.sol";
import {LiquidityPool} from "./LiquidityPool.sol";
import {ILiquidityPoolImplementation, SpecifiedToken} from "./ILiquidityPoolImplementation.sol";

contract LiquidityPoolProxy is LiquidityPool, Ownable {
    ILiquidityPoolImplementation public implementation;
    bool public poolFrozen = false;

    event ImplementationChanged(
        address operator,
        address oldImplementation,
        address newImplementation
    );

    event PoolFrozen(
        address operator
    );

    modifier notFrozen() {
        require(poolFrozen == false, "Pool is frozen");
        _;
    }

    constructor(
        uint256 xToken_,
        uint256 yToken_,
        address ocean_,
        uint256 initialLpTokenSupply_
    )
        LiquidityPool(
            xToken_,
            yToken_,
            ocean_,
            initialLpTokenSupply_,
            address(0)
        )
    {
        // External calls with enums rely on both contracts using the same
        // mapping between enum fields and uint8 values.
        assert(uint8(SpecifiedToken.X) == 0);
        assert(uint8(SpecifiedToken.Y) == 1);
    }

    function setImplementation(address _implementation) external onlyOwner {
        emit ImplementationChanged(
            msg.sender,
            address(implementation),
            _implementation
        );
        implementation = ILiquidityPoolImplementation(_implementation);
    }

    function freezePool(bool freeze) external onlyOwner {
        emit PoolFrozen(msg.sender);
        poolFrozen = freeze;
    }

    /**
     * @dev this function should begin by calling _getBalances() to get the
     *  xBalance and yBalance
     */
    function swapGivenInputAmount(
        uint256 inputToken, 
        uint256 inputAmount)
    public view override notFrozen returns (uint256 outputAmount) {
        (uint256 xBalance, uint256 yBalance) = _getBalances();
        outputAmount = implementation.swapGivenInputAmount(
            xBalance,
            yBalance,
            inputAmount,
            _specifiedToken(inputToken)
        );
    }

    /**
     * @dev this function should begin by calling _getBalances() to get the
     *  xBalance and yBalance and _getTotalSupply to get the lpTokenSupply
     */
    function depositGivenInputAmount(
        uint256 depositToken,
        uint256 depositAmount
    ) public view override notFrozen returns (uint256 mintAmount) {
        (uint256 xBalance, uint256 yBalance) = _getBalances();
        uint256 totalSupply = _getTotalSupply();
        mintAmount = implementation.depositGivenInputAmount(
            xBalance,
            yBalance,
            totalSupply,
            depositAmount,
            _specifiedToken(depositToken)
        );
    }

    /**
     * @dev this function should begin by calling _getBalances() to get the
     *  xBalance and yBalance and _getTotalSupply to get the lpTokenSupply
     */
    function withdrawGivenInputAmount(
        uint256 withdrawnToken,
        uint256 burnAmount
    ) public view override notFrozen returns (uint256 withdrawnAmount) {
        (uint256 xBalance, uint256 yBalance) = _getBalances();
        uint256 totalSupply = _getTotalSupply();
        withdrawnAmount = implementation.withdrawGivenInputAmount(
            xBalance,
            yBalance,
            totalSupply,
            burnAmount,
            _specifiedToken(withdrawnToken)
        );
    }

    /**
     * @dev this function should begin by calling _getBalances() to get the
     *  xBalance and yBalance
     */
    function swapGivenOutputAmount(
        uint256 outputToken, 
        uint256 outputAmount
    ) public view override notFrozen returns (uint256 inputAmount) {
        (uint256 xBalance, uint256 yBalance) = _getBalances();
        inputAmount = implementation.swapGivenOutputAmount(
            xBalance,
            yBalance,
            outputAmount,
            _specifiedToken(outputToken)
        );
    }

    /**
     * @dev this function should begin by calling _getBalances() to get the
     *  xBalance and yBalance and _getTotalSupply() to get the lpTokenSupply
     */
    function depositGivenOutputAmount(
        uint256 depositToken, 
        uint256 mintAmount
    ) public view override notFrozen returns (uint256 depositAmount)
    {
        (uint256 xBalance, uint256 yBalance) = _getBalances();
        uint256 totalSupply = _getTotalSupply();
        depositAmount = implementation.depositGivenOutputAmount(
            xBalance,
            yBalance,
            totalSupply,
            mintAmount,
            _specifiedToken(depositToken)
        );
    }

    /**
     * @dev this function should begin by calling _getBalances() to get the
     *  xBalance and yBalance and _getTotalSupply() to get the lpTokenSupply
     */
    function withdrawGivenOutputAmount(
        uint256 withdrawnToken,
        uint256 withdrawnAmount
    ) public view override notFrozen returns (uint256 burnAmount) {
        (uint256 xBalance, uint256 yBalance) = _getBalances();
        uint256 totalSupply = _getTotalSupply();
        burnAmount = implementation.withdrawGivenOutputAmount(
            xBalance,
            yBalance,
            totalSupply,
            withdrawnAmount,
            _specifiedToken(withdrawnToken)
        );
    }

    function _specifiedToken(uint256 tokenId)
        private
        view
        returns (SpecifiedToken)
    {
        if (tokenId == xToken) {
            return SpecifiedToken.X;
        } else {
            assert(tokenId == yToken);
            return SpecifiedToken.Y;
        }
    }
}
