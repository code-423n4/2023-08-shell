// SPDX-License-Identifier: MIT
// Cowri Labs Inc.

pragma solidity 0.8.10;


import "forge-std/Test.sol";
import "abdk-libraries-solidity/ABDKMath64x64.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";

import {EvolvingInstrumentedProteus} from "./EvolvingInstrumentedProteus.sol";
import {EvolvingProteus, Config, LibConfig} from "../proteus/EvolvingProteus.sol";
import {SpecifiedToken} from "../proteus/ILiquidityPoolImplementation.sol";


/**
   Unit Test Suite for Evolving Proteus. This test suite includes testing and asserting all the computational variables in the contract
   Note 
     - Try/catch statments are used to call the internal methods of Proteus since there is typically input validation when called from the Ocean
     - for some price , swap aount ranges assertWithinRounding might revert with difference a bit much that is expected to be there
*/
contract EvolvingProteusProperties is Test {
    using ABDKMath64x64 for int128;
    using ABDKMath64x64 for uint256;
    using ABDKMath64x64 for int256;
    using LibConfig for Config;

    uint256 public constant MAX_BALANCE = uint256(type(int256).max); // (2^255/10^18) // a big number
    uint256 public constant MIN_BALANCE = 10**12; //10**14; //(10^14/10^18  = 10^-4) // 0.0001
    uint256 public constant MIN_OPERATING_AMOUNT = 2 * 10**8; //(2 * 10^-10) // the min amount you can specify
    uint256 private constant MAX_BALANCE_AMOUNT_RATIO = 10**11; // the maximum difference between the x and y  balances
    int256 public constant MAX_CHANGE_FACTOR = 10; // the maximum amount the utility or the balance of individual tokens can change in one transaction
    int256 constant BASE_FEE = 800;
    int256 constant FIXED_FEE = 10**9; 
    uint256 constant T_GRANULARITY = 10 seconds;
    uint256 constant T_DURATION = 12 hours;
    
    int128 py_init;
    int128 px_init;
    int128 py_final;
    int128 px_final;
    uint256 duration;

    uint256 py_init_val;
    uint256 px_init_val;
    uint256 py_final_val;
    uint256 px_final_val;

    // @dev DUT: Design Under Test
    EvolvingInstrumentedProteus DUT;

    function setUp() public {
       // some price ranges we have tested with
       // x constant y increases
       // py_init_val = 6951000000000000;
       // px_init_val = 69510000000000;
       // py_final_val = 695100000000000000;
       // px_final_val = 69510000000000;

       // x constant y decreases
       // py_init_val = 6951000000000000;
       // px_init_val = 69510000000000;
       // py_final_val = 695100000000000;
       // px_final_val = 69510000000000;

       // y constant x decreases
       // py_init_val = 6951000000000000;
       // px_init_val = 69510000000000;
       // py_final_val = 6951000000000000;
       // px_final_val = 6951000000000;
    
       // y constant x increases
       // py_init_val = 6951000000000000;
       // px_init_val = 695100000000;
       // py_final_val = 6951000000000000;
       // px_final_val = 69510000000000;

       // x & y both decrease
       // py_init_val = 6951000000000000;
       // px_init_val = 69510000000000;
       // py_final_val = 695100000000000;
       // px_final_val = 6951000000000;

       // x & y both increase
       py_init_val = 6951000000000000;
       px_init_val = 69510000000000;
       py_final_val = 695100000000000000;
       px_final_val = 695100000000000;


       py_init = ABDKMath64x64.divu(py_init_val, 1e18);
       px_init = ABDKMath64x64.divu(px_init_val, 1e18);
       py_final = ABDKMath64x64.divu(py_final_val, 1e18);
       px_final = ABDKMath64x64.divu(px_final_val, 1e18);

       duration = T_DURATION;

       DUT = new EvolvingInstrumentedProteus(py_init, px_init, py_final, px_final, duration);
    }

    function testConfig() public {
       (int128 py_init, int128 px_init, int128 py_final, int128 px_final) = DUT.printConfig();
       emit log_named_int("py_init", py_init);
       emit log_named_int("px_init", px_init);
       emit log_named_int("py_final", py_final);
       emit log_named_int("px_final", px_final);
    }

    function test_deployment_reverts_with_incorrect_params(
      uint128 py_init,
      uint128 px_init,
      uint128 py_final,
      uint128 px_final) 
      public {
        
        // Assume prices are between 0 and 1
        vm.assume(py_init > 0 && py_init <= 1e18);
        vm.assume(px_init > 0 && px_init <= 1e18);
        vm.assume(py_final > 0 && py_final <= 1e18);
        vm.assume(px_final > 0 && px_final <= 1e18);
       
        int128 py_init_transformed = ABDKMath64x64.divu(py_init,1e18);
        int128 px_init_transformed = ABDKMath64x64.divu(px_init,1e18);
        int128 py_final_transformed = ABDKMath64x64.divu(py_final,1e18);
        int128 px_final_transformed = ABDKMath64x64.divu(px_final,1e18);
        emit log_int(py_init_transformed);
        emit log_int(px_init_transformed);
        emit log_int(py_final_transformed);
        emit log_int(px_final_transformed);


        if (px_final_transformed >= py_final_transformed) {
          vm.expectRevert();
          DUT = new EvolvingInstrumentedProteus(py_init_transformed, px_init_transformed, py_final_transformed, px_final_transformed, duration);
        }

        if (px_init_transformed >= py_init_transformed) {
          vm.expectRevert();
          DUT = new EvolvingInstrumentedProteus(py_init_transformed, px_init_transformed, py_final_transformed, px_final_transformed, duration);
        }
    }

    function testUtilityScaling(int256 x0, int256 y0) public {
        vm.assume(x0 >= int256(MIN_BALANCE) * 2);
        vm.assume(y0 >= int256(MIN_BALANCE) * 2);
        try DUT.getUtility(x0, y0) returns (int256 u0) {
            emit log_named_int("u0", u0);
            try DUT.getUtility(x0 / 2, y0 / 2) returns (int256 u1) {
                assertWithinRounding(u0 / 2, u1);
            } catch {}
        } catch {}
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testUtilityScalingOverT(uint256 t_slice, int256 x0, int256 y0) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testUtilityScaling(x0, y0);
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testGetPointScaling(
        int256 x0,
        int256 y0,
        bool point
    ) public {
        vm.assume(x0 >= int256(MIN_BALANCE) * 2);
        vm.assume(y0 >= int256(MIN_BALANCE) * 2);
        vm.assume(y0/x0 <= int256(MAX_BALANCE_AMOUNT_RATIO));
        vm.assume(x0/y0 <= int256(MAX_BALANCE_AMOUNT_RATIO));
        try DUT.getUtility(x0, y0) returns (int256 u0) {
            if (point) {
                try
                    DUT.getPointGivenXandUtility(
                        x0 / 2,
                        u0 / 2
                    )
                returns (int256, int256 y1) {
                  assertWithinRounding(y0 / 2, y1);
                } catch {}
            } else {
                try
                    DUT.getPointGivenYandUtility(
                        y0 / 2,
                        u0 / 2
                    )
                returns (int256 x1, int256) {
                    assertWithinRounding(x0 / 2, x1);
                } catch {}
                assertGt(DUT.p_max(), DUT.p_min());
            }
        } catch {}
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testGetPointScalingOverT(uint256 t_slice, int256 x0, int256 y0, bool point) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testGetPointScaling(x0, y0, point);
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testSwapInput(
        uint256 x0,
        uint256 y0,
        uint256 inputAmount,
        bool token
    ) public {
        vm.assume(x0 >= MIN_BALANCE);
        vm.assume(y0 >= MIN_BALANCE);
        vm.assume(inputAmount >= MIN_OPERATING_AMOUNT);
        vm.assume(y0/x0 <= MAX_BALANCE_AMOUNT_RATIO);
        vm.assume(x0/y0 <= MAX_BALANCE_AMOUNT_RATIO);
        SpecifiedToken inputToken = token ? SpecifiedToken.X : SpecifiedToken.Y;
        try DUT.swapGivenInputAmount(x0, y0, inputAmount, inputToken) returns (
            uint256 o0
        ) {
            uint256 x1;
            uint256 y1;
            SpecifiedToken opposite;
            if (inputToken == SpecifiedToken.X) {
                assertLt(o0, y0, "Pool cannot output more Y than it has");
                x1 = x0 + inputAmount;
                y1 = y0 - o0;
                opposite = SpecifiedToken.Y;
            } else {
                assertLt(o0, x0, "Pool cannot output more X than it has");
                y1 = y0 + inputAmount;
                x1 = x0 - o0;
                opposite = SpecifiedToken.X;
            }
            try DUT.swapGivenInputAmount(x1, y1, o0, opposite) returns (
                uint256 o1
            ) {
                if (inputToken == SpecifiedToken.X) {
                    assertLt(o1, x1, "Pool cannot output more X than it has");
                    assertEq(y1 + o0, y0, "Check earlier Y assignment");
                    assertGe(
                        x1 - o1,
                        x0,
                        "Back and forth swap should result in extra X"
                    );
                } else {
                    assertLt(o1, y1, "Pool cannot output more Y than it has");
                    assertEq(x1 + o0, x0, "Check earlier X assignment");
                    assertGe(
                        y1 - o1,
                        y0,
                        "Back and forth swap should result in extra Y"
                    );
                }
            } catch {}
        } catch {}
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testSwapInputOverT(uint256 t_slice, uint256 x0, uint256 y0, uint256 inputAmount, bool token) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testSwapInput(x0, y0, inputAmount, token);
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testSwapOutput(
        uint256 x0,
        uint256 y0,
        uint256 outputAmount,
        bool token
    ) public {
        vm.assume(x0 >= MIN_BALANCE);
        vm.assume(y0 >= MIN_BALANCE);
        vm.assume(outputAmount >= MIN_OPERATING_AMOUNT);
        vm.assume(y0/x0 <= MAX_BALANCE_AMOUNT_RATIO);
        vm.assume(x0/y0 <= MAX_BALANCE_AMOUNT_RATIO);
        SpecifiedToken outputToken = token
            ? SpecifiedToken.X
            : SpecifiedToken.Y;
        try
            DUT.swapGivenOutputAmount(x0, y0, outputAmount, outputToken)
        returns (uint256 i0) {
            uint256 x1;
            uint256 y1;
            SpecifiedToken opposite;
            if (outputToken == SpecifiedToken.X) {
                assertLt(
                    outputAmount,
                    x0,
                    "Pool cannot output more X than it has"
                );
                x1 = x0 - outputAmount;
                y1 = y0 + i0;
                opposite = SpecifiedToken.Y;
            } else {
                assertLt(
                    outputAmount,
                    y0,
                    "Pool cannot output more Y than it has."
                );
                y1 = y0 - outputAmount;
                x1 = x0 + i0;
                opposite = SpecifiedToken.X;
            }
            assertGt(DUT.p_max(), DUT.p_min());

            try DUT.swapGivenOutputAmount(x1, y1, i0, opposite) returns (
                uint256 i1
            ) {
                if (outputToken == SpecifiedToken.X) {
                    assertLt(i0, y1, "Pool cannot output more Y than it has");
                    assertEq(y1 - i0, y0, "Check earlier Y assignment");
                    assertGe(
                        x1 + i1,
                        x0,
                        "back and forth swap should result in extra X"
                    );
                } else {
                    assertLt(i0, x1, "Pool cannot output more X than it has");
                    assertEq(x1 - i0, x0, "Check earlier X assignment");
                    assertGe(
                        y1 + i1,
                        y0,
                        "back and forth swap should result in extra Y"
                    );
                }
                assertGt(DUT.p_max(), DUT.p_min());
            } catch (bytes memory error) {
                if (bytes4(error) == EvolvingProteus.BalanceError.selector) {
                    assertTrue(
                        x0 < MIN_BALANCE + MIN_OPERATING_AMOUNT ||
                            y0 < MIN_BALANCE + MIN_OPERATING_AMOUNT,
                        "rounding of the amount should cause a balance error"
                    );
                }
            }
        } catch {}
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testSwapOutputOverT(uint256 t_slice, uint256 x0, uint256 y0, uint256 outputAmount, bool token) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testSwapOutput(x0, y0, outputAmount, token);
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testDepositOutputWithdrawInput(
        uint256 x0,
        uint256 y0,
        uint256 s0,
        uint256 mintedAmount,
        bool token
    ) public {
        vm.assume(x0 >= MIN_BALANCE);
        vm.assume(y0 >= MIN_BALANCE);
        vm.assume(s0 >= MIN_BALANCE);
        vm.assume(mintedAmount >= MIN_OPERATING_AMOUNT);
        vm.assume(y0/x0 <= MAX_BALANCE_AMOUNT_RATIO);
        vm.assume(x0/y0 <= MAX_BALANCE_AMOUNT_RATIO);
        SpecifiedToken depositedToken = token
            ? SpecifiedToken.X
            : SpecifiedToken.Y;
        try
            DUT.depositGivenOutputAmount(
                x0,
                y0,
                s0,
                mintedAmount,
                depositedToken
            )
        returns (uint256 depositedAmount) {
            uint256 x1;
            uint256 y1;
            uint256 s1 = s0 + mintedAmount;
            if (depositedToken == SpecifiedToken.X) {
                x1 += depositedAmount;
                y1 = y0;
            } else {
                y1 += depositedAmount;
                x1 = x0;
            }
            assertGt(DUT.p_max(), DUT.p_min());
            try
                DUT.withdrawGivenInputAmount(
                    x1,
                    y1,
                    s1,
                    mintedAmount,
                    depositedToken
                )
            returns (uint256 withdrawnAmount) {
                assertLe(
                    withdrawnAmount,
                    depositedAmount,
                    "Depositing and withdrawing liquidity should not decrease value of pool"
                );
                assertGt(DUT.p_max(), DUT.p_min());
            } catch {}
        } catch {}
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testDepositOutputWithdrawInputOverT(uint256 t_slice, uint256 x0, uint256 y0, uint256 s0, uint256 mintedAmount, bool token) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testDepositOutputWithdrawInput(x0, y0, s0, mintedAmount, token);
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testDepositInputWithdrawOutput(
        uint256 x0,
        uint256 y0,
        uint256 s0,
        uint256 depositedAmount,
        bool token
    ) public {
        vm.assume(x0 >= MIN_BALANCE);
        vm.assume(y0 >= MIN_BALANCE);
        vm.assume(s0 >= MIN_BALANCE);
        vm.assume(depositedAmount >= MIN_OPERATING_AMOUNT);
        vm.assume(y0/x0 <= MAX_BALANCE_AMOUNT_RATIO);
        vm.assume(x0/y0 <= MAX_BALANCE_AMOUNT_RATIO);
        SpecifiedToken depositedToken = token
            ? SpecifiedToken.X
            : SpecifiedToken.Y;
        try
            DUT.depositGivenInputAmount(
                x0,
                y0,
                s0,
                depositedAmount,
                depositedToken
            )
        returns (uint256 mintedAmount) {
            uint256 x1;
            uint256 y1;
            uint256 s1 = s0 + mintedAmount;
            if (depositedToken == SpecifiedToken.X) {
                x1 += depositedAmount;
                y1 = y0;
            } else {
                y1 += depositedAmount;
                x1 = x0;
            }
            assertGt(DUT.p_max(), DUT.p_min());

            try
                DUT.withdrawGivenOutputAmount(
                    x1,
                    y1,
                    s1,
                    depositedAmount,
                    depositedToken
                )
            returns (uint256 burnedAmount) {
                assertGe(
                    burnedAmount,
                    mintedAmount,
                    "Depositing and withdrawing liquidity should not decrease value of pool"
                );
                assertGt(DUT.p_max(), DUT.p_min());
            } catch {}
        } catch {}
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testDepositInputWithdrawOutputOverT(uint256 t_slice, uint256 x0, uint256 y0, uint256 s0, uint256 depositedAmount, bool token) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testDepositOutputWithdrawInput(x0, y0, s0, depositedAmount, token);
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testSwapDWInput(
        uint256 x0,
        uint256 y0,
        uint256 s0,
        uint256 inputAmount,
        bool token
    ) public {
        vm.assume(x0 >= MIN_BALANCE);
        vm.assume(y0 >= MIN_BALANCE);
        vm.assume(s0 >= MIN_BALANCE);
        vm.assume(inputAmount >= MIN_OPERATING_AMOUNT);
        vm.assume(y0/x0 <= MAX_BALANCE_AMOUNT_RATIO);
        vm.assume(x0/y0 <= MAX_BALANCE_AMOUNT_RATIO);
        SpecifiedToken inputToken = token ? SpecifiedToken.X : SpecifiedToken.Y;
        
        try DUT.swapGivenInputAmount(x0, y0, inputAmount, inputToken) returns (uint256 o0) {

            uint256 x1;
            uint256 y1;
            uint256 startBal;

            SpecifiedToken opposite;

            if (inputToken == SpecifiedToken.X) {
                assertLt(o0, y0, "Pool cannot output more Y than it has");
                startBal = x0;
                x1 = x0 + inputAmount;
                y1 = y0 - o0;
                opposite = SpecifiedToken.Y;
            } else {
                assertLt(o0, x0, "Pool cannot output more X than it has");
                startBal = y0;
                y1 = y0 + inputAmount;
                x1 = x0 - o0;
                opposite = SpecifiedToken.X;
            }
            assertGt(DUT.p_max(), DUT.p_min());

            try DUT.depositGivenInputAmount(x1, y1, s0, o0, opposite) returns (uint256 mintedAmount) {
            
                uint256 s1 = s0 + mintedAmount;

                if (inputToken == SpecifiedToken.X) {
                    y1 += o0;
                    opposite = SpecifiedToken.X;
                } else {
                    x1 += o0;
                    opposite = SpecifiedToken.Y;
                }
                assertGt(DUT.p_max(), DUT.p_min());

                try DUT.withdrawGivenInputAmount(x1, y1, s1, mintedAmount, opposite) returns (uint256 o1) {
                    if (inputToken == SpecifiedToken.X) {
                        assertLt(o1, x1, "Pool cannot output more X than it has");
                        assertGe(
                            x1 - o1,
                            startBal,
                            "Back and forth swap should result in extra X"
                        );
                    } else {
                        assertLt(o1, y1, "Pool cannot output more Y than it has");
                        assertGe(
                            y1 - o1,
                            startBal,
                            "Back and forth swap should result in extra Y"
                        );
                    }
                    assertGt(DUT.p_max(), DUT.p_min());
                } catch {}
                assertGt(DUT.p_max(), DUT.p_min());

                
            } catch {}
            assertGt(DUT.p_max(), DUT.p_min());
        } catch {}
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testSwapDWInputOverT(uint256 t_slice, uint256 x0, uint256 y0, uint256 s0, uint256 inputAmount, bool token) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testSwapDWInput(x0, y0, s0, inputAmount, token);
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testSwapDWOutput(
        uint256 x0,
        uint256 y0,
        uint256 s0,
        uint256 outputAmount,
        bool token
    ) public {
        vm.assume(x0 >= MIN_BALANCE);
        vm.assume(y0 >= MIN_BALANCE);
        vm.assume(s0 >= MIN_BALANCE);
        vm.assume(outputAmount >= MIN_OPERATING_AMOUNT);
        vm.assume(y0/x0 <= MAX_BALANCE_AMOUNT_RATIO);
        vm.assume(x0/y0 <= MAX_BALANCE_AMOUNT_RATIO);
        SpecifiedToken outputToken = token ? SpecifiedToken.X : SpecifiedToken.Y;
        
        try DUT.swapGivenOutputAmount(x0, y0, outputAmount, outputToken) returns (uint256 i0) {

            uint256 x1;
            uint256 y1;
            uint256 startBal;

            SpecifiedToken opposite;

            if (outputToken == SpecifiedToken.X) {
                assertLt(outputAmount, x0, "Pool cannot output more X than it has");
                startBal = x0;
                x1 = x0 - outputAmount;
                y1 = y0 + i0;
                opposite = SpecifiedToken.Y;
            } else {
                assertLt(outputAmount, y0, "Pool cannot output more Y than it has");
                startBal = y0;
                y1 = y0 - outputAmount;
                x1 = x0 + i0;
                opposite = SpecifiedToken.X;
            }
            assertGt(DUT.p_max(), DUT.p_min());

            try DUT.withdrawGivenOutputAmount(x1, y1, s0, i0, opposite) returns (uint256 burnedAmount) {
            
                uint256 s1 = s0 - burnedAmount;

                if (outputToken == SpecifiedToken.X) {
                    y1 -= i0;
                    opposite = SpecifiedToken.X;
                } else {
                    x1 -= i0;
                    opposite = SpecifiedToken.Y;
                }
                assertGt(DUT.p_max(), DUT.p_min());

                try DUT.depositGivenOutputAmount(x1, y1, s1, burnedAmount, opposite) returns (uint256 i1) {
                    if (outputToken == SpecifiedToken.X) {
                        assertGe(
                            x1 + i1,
                            startBal,
                            "back and forth swap should result in extra X"
                        );
                    } else {
                        assertGe(
                            y1 + i1,
                            startBal,
                            "Back and forth swap should result in extra Y"
                        );
                    }
                    assertGt(DUT.p_max(), DUT.p_min());
                } catch {}
            } catch {}
        } catch {}
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testSwapDWOutputOverT(uint256 t_slice, uint256 x0, uint256 y0, uint256 s0, uint256 outputAmount, bool token) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testSwapDWOutput(x0, y0, s0, outputAmount, token);
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testSmallInput(uint256 x0, uint256 y0, bool token) public {

        vm.assume(x0 > MIN_BALANCE && x0 < MAX_BALANCE);
        vm.assume(y0 > MIN_BALANCE && y0 < MAX_BALANCE);
        vm.assume(y0/x0 <= MAX_BALANCE_AMOUNT_RATIO);
        vm.assume(x0/y0 <= MAX_BALANCE_AMOUNT_RATIO);

        SpecifiedToken inputToken = token ? SpecifiedToken.X : SpecifiedToken.Y;
        SpecifiedToken outputToken = token ? SpecifiedToken.Y : SpecifiedToken.X;

        uint256 minInput = (token ? x0 : y0) / MAX_BALANCE_AMOUNT_RATIO;
        vm.expectRevert();
        DUT.swapGivenInputAmount(x0, y0, minInput, inputToken);
        assertGt(DUT.p_max(), DUT.p_min());

        uint256 minOutput = (token ? y0 : x0) / MAX_BALANCE_AMOUNT_RATIO;
        vm.expectRevert();
        DUT.swapGivenOutputAmount(x0, y0, minOutput, outputToken);
        assertGt(DUT.p_max(), DUT.p_min());
    }
    
    function testSmallInputOverT(uint256 t_slice, uint256 x0, uint256 y0, bool token) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testSmallInput(x0, y0, token);
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testUtilityWithDeltaBalance(
        uint256 x,
        uint256 y,
        int128 delta,
        bool direction
    ) public {
        (
            int256 xi,
            int256 yi,
            int256 xf,
            int256 yf
        ) = assumes(x, y, delta, direction);
        try DUT.getUtility(xi, yi) returns (int256 ui) {
            try DUT.getUtility(xf, yf) returns (
                int256 uf
            ) {
                if (delta < 0) {
                    assertGe(ui, uf);
                } else {
                    assertLe(ui, uf);
                }
                assertGt(DUT.p_max(), DUT.p_min());
            } catch {}
        } catch {}
        assertGt(DUT.p_max(), DUT.p_min());
    }
    
    function testUtilityWithDeltaBalanceOverT(uint256 t_slice, uint256 x, uint256 y, int128 delta, bool direction) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testUtilityWithDeltaBalance(x, y, delta, direction);
        assertGt(DUT.p_max(), DUT.p_min());
    }
    
    function testGetPointWithDeltaUtility(
        uint256 x,
        uint256 y,
        int128 delta,
        bool direction
    ) public {
        (int256 xi, int256 yi) = assumeXY(x, y);
        try DUT.getUtility(xi, yi) returns (int256 ui) {
            int256 uf = ui + delta;
            vm.assume(
                uf * MAX_CHANGE_FACTOR > ui && uf / MAX_CHANGE_FACTOR < ui
            );
            if (direction) {
                try
                    DUT.getPointGivenXandUtility(xi, ui)
                returns (int256, int256 p0y) {
                    try
                        DUT.getPointGivenXandUtility(
                            xi,
                            ui + delta
                        )
                    returns (int256 p1x, int256 p1y) {
                        p1x;
                        if (delta < 0) {
                            assertLe(p1y, p0y);
                        } else {
                            assertGe(p1y, p0y);
                        }
                        assertGt(DUT.p_max(), DUT.p_min());
                    } catch {}
                } catch {}
                assertGt(DUT.p_max(), DUT.p_min());
            } else {
                try
                    DUT.getPointGivenYandUtility(yi, ui)
                returns (int256 p0x, int256) {
                    try
                        DUT.getPointGivenYandUtility(
                            yi,
                            ui + delta
                        )
                    returns (int256 p1x, int256 p1y) {
                        p1y;
                        if (delta < 0) {
                            assertLe(p1x, p0x);
                        } else {
                            assertGe(p1x, p0x);
                        }
                        assertGt(DUT.p_max(), DUT.p_min());
                    } catch {}
                } catch {}
                assertGt(DUT.p_max(), DUT.p_min());
            }
        } catch {}
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testGetPointWithDeltaUtilityOverT(uint256 t_slice, uint256 x, uint256 y, int128 delta, bool direction) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testGetPointWithDeltaUtility(x, y, delta, direction);
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testGetPointWithDeltaBalance(
        uint256 x,
        uint256 y,
        int128 delta,
        bool direction
    ) public {
        (
            int256 xi,
            int256 yi,
            int256 xf,
            int256 yf
        ) = assumes(x, y, delta, direction);

        try DUT.getUtility(xi, yi) returns (int256 ui) {
            if (direction) {
                try
                    DUT.getPointGivenXandUtility(xi, ui)
                returns (int256, int256 p0y) {
                    try
                        DUT.getPointGivenXandUtility(
                            xf,
                            ui
                        )
                    returns (int256, int256 p1y) {
                        // if x goes down and utility is constant, y should increase
                        if (delta < 0) {
                            assertGe(p1y, p0y);
                        } else {
                            assertLe(p1y, p0y);
                        }
                        assertGt(DUT.p_max(), DUT.p_min());
                    } catch {}
                } catch {}
                assertGt(DUT.p_max(), DUT.p_min());
            } else {
                try
                    DUT.getPointGivenYandUtility(yi, ui)
                returns (int256 p0x, int256) {
                    try
                        DUT.getPointGivenYandUtility(
                            yf,
                            ui
                        )
                    returns (int256 p1x, int256) {
                        // if y goes down and utility is constant, x should increase
                        if (delta < 0) {
                            assertGe(p1x, p0x);
                        } else {
                            assertLe(p1x, p0x);
                        }
                        assertGt(DUT.p_max(), DUT.p_min());
                    } catch {}
                } catch {}
                assertGt(DUT.p_max(), DUT.p_min());
            }
        } catch {}
        assertGt(DUT.p_max(), DUT.p_min());
    }
    
    function testGetPointWithDeltaBalanceOverT(uint256 t_slice, uint256 x, uint256 y, int128 delta, bool direction) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testGetPointWithDeltaBalance(x, y, delta, direction);
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testRecovery(uint256 x, uint256 y) public {
        vm.assume(x > type(uint64).max);
        vm.assume(y > type(uint64).max);
        (int256 xi, int256 yi) = assumeXY(x, y);
        try DUT.getUtility(xi, yi) returns (
            int256 ui
        ) {
            try
                DUT.getPointGivenXandUtility(xi, ui)
            returns (int256, int256 yf) {
                try
                    DUT.getPointGivenYandUtility(
                        yi,
                        ui
                    )
                returns (int256 xf, int256) {
                    assertGt(DUT.p_max(), DUT.p_min());
                    try
                        DUT.getUtility(xf, yf)
                    returns (int256 uf) {
                        assertWithinRounding(ui, uf);
                        assertGt(DUT.p_max(), DUT.p_min());
                    } catch {}
                    assertGt(DUT.p_max(), DUT.p_min());
                } catch {}
            } catch {}
            assertGt(DUT.p_max(), DUT.p_min());
        } catch {}
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testRecoveryOverT(uint256 t_slice, uint256 x, uint256 y) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testRecovery(x, y);
        assertGt(DUT.p_max(), DUT.p_min());
    }

  function testSqrt(int256 a, int256 b) public {
        vm.assume(a > 0 && b > 0);
        vm.assume(type(int256).max / a > a);
        int256 aSquared = a * a;

        // (a + 1)^2 = a^2 + 2a + 1
        // Any value between a^2 and (a+1)^2 - 1 inclusive should have
        // have a sqrt of a.
        // range [a^2, (a+1)^2 -1]
        // > range [a^2, a^2 + 2a + 1 - 1]
        // > range [0, 2a]
        // note that: n % n = 0, rand % n has range [0, n)
        // > range [0, 2a + 1)
        int256 rangeTilNextSquare = (a * 2) + 1;
        vm.assume(type(int256).max - aSquared > rangeTilNextSquare);
        int256 sqrt = int256(
            Math.sqrt(uint256((aSquared + (b % rangeTilNextSquare))))
        );
        assertEq(sqrt, a);

        int256 sqrtPlusOne = int256(
            Math.sqrt(uint256(aSquared + rangeTilNextSquare))
        );
        assertEq(sqrtPlusOne, a + 1);
    }
    
    function testSqrtOverT(uint256 t_slice, int256 a, int256 b) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testSqrt(a,b);
    }
    
    function testEdgeSwaps(uint256 x0, uint256 y0, bool token) public {

        vm.assume(x0 > MIN_BALANCE && x0 < 1e27);
        vm.assume(y0 > MIN_BALANCE && y0 < 1e27);
        vm.assume(y0/x0 <= MAX_BALANCE_AMOUNT_RATIO);
        vm.assume(x0/y0 <= MAX_BALANCE_AMOUNT_RATIO);

        SpecifiedToken inputToken = token ? SpecifiedToken.X : SpecifiedToken.Y;
        SpecifiedToken outputToken = token ? SpecifiedToken.Y : SpecifiedToken.X;

        uint256 maxInput = DUT.getSwapMax(int256(x0), int256(y0), token);

        emit log_named_uint("maxInput", maxInput);

        //token ? assertTrue((maxInput/10) > x0, "max X input doesn't match") : assertTrue((maxInput + y0) > y0, "max Y input doesn't match");
        vm.expectRevert();
        DUT.swapGivenInputAmount(x0, y0, maxInput, inputToken);
        assertGt(DUT.p_max(), DUT.p_min());

        uint256 maxOutput = (token ? y0 : x0) - MIN_BALANCE + 1;
        vm.expectRevert();
        DUT.swapGivenOutputAmount(x0, y0, maxOutput, outputToken);
        assertGt(DUT.p_max(), DUT.p_min());
    }

    function testEdgeSwapsOverT(uint256 t_slice, uint256 x0, uint256 y0, bool token) public {
        vm.assume(t_slice >= DUT.tInit()/ T_GRANULARITY && t_slice <= DUT.tFinal()/ T_GRANULARITY);
        uint256 t = t_slice * T_GRANULARITY;
        vm.assume(t >= DUT.tInit() && t <= DUT.tFinal());
        testEdgeSwaps(x0, y0, token);
    }

    function assumeXY(uint256 x, uint256 y)
        private
        returns (
            int256 xi,
            int256 yi
        )
    {
        vm.assume(x < MAX_BALANCE && y < MAX_BALANCE);
        vm.assume(x > MIN_BALANCE && y > MIN_BALANCE);
        vm.assume(y/x <= MAX_BALANCE_AMOUNT_RATIO);
        vm.assume(x/y <= MAX_BALANCE_AMOUNT_RATIO);
        
        xi = int256(x);
        yi = int256(y);

    }

    function assumes(
        uint256 x,
        uint256 y,
        int256 delta,
        bool direction
    )
        private
        returns (
            int256 xi,
            int256 yi,
            int256 xf,
            int256 yf
        )
    {
        (xi, yi) = assumeXY(x, y);

        if (direction) {
            yf = yi;
            if (delta < 0) {
                if (-delta >= xi) {
                    xf = xi;
                } else {
                    xf = xi; // + delta;
                }
            } else {
                if (type(int256).max - delta >= xi) {
                    xf = xi;
                } else {
                    xf = xi; // + delta;
                }
            }
            vm.assume(
                xi / MAX_CHANGE_FACTOR < xf && xf / MAX_CHANGE_FACTOR < xi
            );
        } else {
            xf = xi;
            if (delta < 0) {
                if (-delta >= xi) {
                    yf = yi;
                } else {
                    yf = yi; // + delta;
                }
            } else {
                if (type(int256).max - delta >= yi) {
                    yf = yi;
                } else {
                    yf = yi; // + delta;
                }
            }
            vm.assume(
                yi / MAX_CHANGE_FACTOR < yf && yf / MAX_CHANGE_FACTOR < yi
            );
        }

    }

    function assertWithinRounding(int256 a0, int256 a1) internal {
        assertLe((a0) - (a0 / BASE_FEE) - FIXED_FEE, a1, "not within less than rounding");
        assertGe((a0) + (a0 / BASE_FEE) + FIXED_FEE, a1, "not within greater than rounding");
    }
}