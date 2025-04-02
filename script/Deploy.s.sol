// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Token.sol";

contract Deploy is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address initialOwner = ;

        require(
            initialOwner != address(0),
            "Initial owner cannot be the zero address"
        );

        vm.startBroadcast(deployerPrivateKey);

        Token token = new Token(initialOwner);

        console.log("Token deployed at:", address(token));
        console.log("Tokens minted to:", initialOwner);

        vm.stopBroadcast();
    }
}
