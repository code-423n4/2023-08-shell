// SPDX-License-Identifier: MIT
// Cowri Labs Inc.

pragma solidity =0.8.10;

import "abdk-libraries-solidity/ABDKMath64x64.sol";
import {EvolvingProteus, LibConfig, Config} from "../proteus/EvolvingProteus.sol";
import {SpecifiedToken} from "../proteus/ILiquidityPoolImplementation.sol";

/**
  The test helper contract used for calling some internal methods in the evolving proteus contract & viewing some curve equation parameters
*/
contract EvolvingInstrumentedProteus is EvolvingProteus {
    using ABDKMath64x64 for int128;
    using ABDKMath64x64 for int256;
    using LibConfig for Config;

    int128 private constant ABDK_ONE = int128(int256(1 << 64));

    constructor(
        int128 py_init,
        int128 px_init,
        int128 py_final,
        int128 px_final,
        uint256 duration
    ) EvolvingProteus(py_init, px_init, py_final, px_final, duration) {}

    function swap(
        bool roundDirection,
        int256 specifiedAmount,
        int256 xi,
        int256 yi,
        SpecifiedToken specifiedToken
    ) public view returns (int256 computedAmount) {
        computedAmount = _swap(
            roundDirection,
            specifiedAmount,
            xi,
            yi,
            specifiedToken
        );
    }

    function getSwapMax(
        int256 xi, 
        int256 yi, 
        bool token
    ) public view returns (uint256 maxInput) {
        int256 utility = _getUtility(xi, yi); //call to config.a() and config.b()
        int256 xf;
        int256 yf;

        if (token) {
            (xf, yf) = getPointGivenYandUtility(MIN_BALANCE, utility);
        }
        else {
            (xf, yf) = getPointGivenXandUtility(MIN_BALANCE, utility);
        }
        int256 _max = token ? xf - xi : yf - yi;

        if (_max <= 0) {
            revert CurveError(_max);
        }
        maxInput = uint256(_max) * 10;
    }

    function tInit() view public returns (uint256) {
        return config.t_init;
    }
    function tFinal() view public returns (uint256) {
        return config.t_final;
    }
    function a() view public returns (int256) {
        return config.a();
    }
    function b() view public returns (int256) {
        return config.b();
    }
    function p_min() view public returns (int256) {
        return config.p_min();
    }
    function p_max() view public returns (int256) {
        return config.p_max();
    }

    function printConfig() view public returns (int128, int128, int128, int128) {
        return (config.py_init, config.px_init, config.py_final, config.px_final);
    }

    function reserveTokenSpecified(
        SpecifiedToken specifiedToken,
        int256 specifiedAmount,
        bool roundDirection,
        int256 si,
        int256 xi,
        int256 yi
    ) public view returns (int256 computedAmount) {
        computedAmount = _reserveTokenSpecified(
            specifiedToken,
            specifiedAmount,
            roundDirection,
            si,
            xi,
            yi
        );
    }

    function lpTokenSpecified(
        SpecifiedToken specifiedToken,
        int256 specifiedAmount,
        bool roundDirection,
        int256 si,
        int256 xi,
        int256 yi
    ) public view returns (int256 computedAmount) {
        computedAmount = _lpTokenSpecified(
            specifiedToken,
            specifiedAmount,
            roundDirection,
            si,
            xi,
            yi
        );
    }

    function getUtility(
        int256 x,
        int256 y
    ) public view returns (int256 utility) {
        utility = _getUtility(x, y);
    }

    function getPointGivenXandUtility(
        int256 x,
        int256 utility
    ) public view returns (int256 xf, int256 yf) {
        return _getPointGivenXandUtility(x, utility);
    }

    function getPointGivenYandUtility(
        int256 y,
        int256 utility
    ) public view returns (int256 xf, int256 yf) {
        return _getPointGivenYandUtility(y, utility);
    }

}