// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // Before startBroadcast --> Not a real transaction
        HelperConfig helperConfig = new HelperConfig();
        address ethusdPrice = helperConfig.activeNetworkConfig();

        // After startBroadcast --> real tx
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethusdPrice);
        vm.stopBroadcast();
        return fundMe;
    }
}
