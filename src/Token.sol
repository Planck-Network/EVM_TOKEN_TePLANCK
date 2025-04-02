// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20, Ownable {
    uint256 public constant INITIAL_SUPPLY = 1_000_0_000_00 * 10 ** 18; // 1 billion tokens，ERC20 decimals is 18 by default

    event TokensMinted(address indexed to, uint256 amount);

    constructor(
        address initialOwner
    ) ERC20("TePLANCK Token", "TePLANCK") Ownable() {
        require(
            initialOwner != address(0),
            "Initial owner cannot be the zero address"
        );
        super._mint(initialOwner, INITIAL_SUPPLY); // 1 billion tokens
        emit TokensMinted(initialOwner, INITIAL_SUPPLY);
    }

    // Disable minting function to ensure no further tokens can be created
    function _mint(address account, uint256 amount) internal override {
        revert("Minting is disabled");
    }
}
