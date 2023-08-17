// SPDX-License-Identifier: MIT
pragma solidity =0.8.10;

import '../proteus/EvolvingProteus.sol';
import 'forge-std/Script.sol';


contract DeployEvolvingProteus is Script {

    EvolvingProteus _evolvingProteus;

    function run() external {
      vm.startBroadcast();

    int128 price_y_init = ABDKMath64x64.divu(15900000000000000, 1e18);
    int128 price_x_init = ABDKMath64x64.divu(159000000000000, 1e18);
    int128 price_y_final = ABDKMath64x64.divu(15900000000000000, 1e18);
    int128 price_x_final = ABDKMath64x64.divu(1590000000000, 1e18);

      _evolvingProteus = new EvolvingProteus(
        price_y_init,
        price_x_init,
        price_y_final,
        price_x_final,
        3 days
      );
      console.log(address(_evolvingProteus));
    }
}
