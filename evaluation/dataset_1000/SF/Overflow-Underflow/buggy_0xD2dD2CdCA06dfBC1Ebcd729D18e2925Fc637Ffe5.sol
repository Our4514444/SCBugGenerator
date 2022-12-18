/**
 *Submitted for verification at Etherscan.io on 2020-07-06
*/

/**
 *Submitted for verification at Etherscan.io on 2019-12-25
*/

// File: contracts/external/Dydx/lib/Monetary.sol

/*
    Copyright 2019 dYdX Trading Inc.
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

pragma solidity 0.5.7;
pragma experimental ABIEncoderV2;


/**
 * @title Monetary
 * @author dYdX
 *
 * Library for types involving money
 */
library Monetary {

    /*
     * The price of a base-unit of an asset.
     */
    struct Price {
        uint256 value;
    }

    /*
     * Total value of an some amount of an asset. Equal to (price * amount).
     */
    struct Value {
        uint256 value;
    }
}

// File: contracts/external/Dydx/interfaces/IDydxPriceOracle.sol

/*
    Copyright 2019 Set Labs Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

pragma solidity 0.5.7;


/**
 * @title IDydxPriceOracle
 * @author Set Protocol
 *
 * Interface that Price Oracles for Solo must implement in order to report prices.
 */
contract IDydxPriceOracle {
    function getPrice(
        address token
    )
        public
        view
        returns (Monetary.Price memory);
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
}

// File: contracts/meta-oracles/proxies/DydxOracleAdapter.sol

/*
    Copyright 2019 Set Labs Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

pragma solidity 0.5.7;




/**
 * @title DydxOracleAdapter
 * @author Set Protocol
 *
 * Returns output from dYdX's price oracles in uint256 for use in
 * Set OracleProxy system
 */
contract DydxOracleAdapter {

    /* ============ State Variables ============ */
  mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  IDydxPriceOracle public dYdXOracleInstance;
  mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
  address public erc20TokenAddress;

    /* ============ Constructor ============ */
    /*
     * Set address of dYdX price oracle being adapted to uint256
     *
     * @param  _dYdXOracleInstance    The address of dYdX oracle being adapted from struct to uint256
     * @param  _erc20TokenAddress     The address of underlying ERC20 token that the oracle is returning
     *                                a value for
     */
    constructor(
        IDydxPriceOracle _dYdXOracleInstance,
        address _erc20TokenAddress
    )
        public
    {
        dYdXOracleInstance = _dYdXOracleInstance;
        erc20TokenAddress = _erc20TokenAddress;
    }
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }

    /* ============ External ============ */

    /*
     * Reads value of struct and returns the value in uint256
     *
     * @returns         dYdX oracle price in uint256
     */
    function read()
        external
        view
        returns (uint256)
    {
        // Get struct and read value in uint256
        Monetary.Price memory price = dYdXOracleInstance.getPrice(erc20TokenAddress);
        return price.value;
    }
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
}