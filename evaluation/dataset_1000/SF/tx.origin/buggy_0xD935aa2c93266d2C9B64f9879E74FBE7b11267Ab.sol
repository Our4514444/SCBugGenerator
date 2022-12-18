/**
 *Submitted for verification at Etherscan.io on 2020-04-02
*/

// File: contracts\interfaces\dss\IVat.sol

pragma solidity 0.5.17;

interface IVat {
    function hope(address usr) external;
    function gem(bytes32, address) external view returns (uint);
    function dai(address) external view returns (uint);
}

// File: contracts\interfaces\dss\IETHJoin.sol

pragma solidity 0.5.17;

interface IETHJoin {
    function join(address usr) external payable;
    function exit(address payable usr, uint wad) external;
}

// File: contracts\interfaces\dss\ITokenJoin.sol

pragma solidity 0.5.17;

interface ITokenJoin {
    function join(address usr, uint wad) external;
    function exit(address usr, uint wad) external;
}

// File: contracts\interfaces\dss\IFlip.sol

pragma solidity 0.5.17;

contract IFlip {
    function tick(uint id) external;
    function tend(uint id, uint lot, uint bid) external;
    function dent(uint id, uint lot, uint bid) external;
    function deal(uint id) external;
}

// File: contracts\interfaces\dss\IFlap.sol

pragma solidity 0.5.17;

contract IFlap {
    function tick(uint id) external;
    function tend(uint id, uint lot, uint bid) external;
    function deal(uint id) external;
}

// File: contracts\interfaces\dss\IFlop.sol

pragma solidity 0.5.17;

contract IFlop {
    function tick(uint id) external;
    function dent(uint id, uint lot, uint bid) external;
    function deal(uint id) external;
}

// File: contracts\interfaces\token\IERC20.sol

pragma solidity 0.5.17;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP. Does not include
 * the optional functions; to access them see {ERC20Detailed}.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: contracts\interfaces\proxy\IProxyActionsStorage.sol

pragma solidity 0.5.17;

interface IProxyActionsStorage  {

    function vat() external view returns (IVat);
    function flap() external view returns (IFlap);
    function flop() external view returns (IFlop);

    function tokens(bytes32) external view returns (IERC20);
    function decimals(bytes32) external view returns (uint);
    function ilks(bytes32) external view returns (bytes32);
    function tokenJoins(bytes32) external view returns (ITokenJoin);
    function flips(bytes32) external view returns (IFlip);
}

// File: contracts\interfaces\token\IWETH.sol

// Copyright (C) 2015, 2016, 2017 Dapphub

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

pragma solidity 0.5.17;

interface IWETH {
    function balanceOf(address) external view returns (uint);
    function deposit() external payable;
    function withdraw(uint wad) external;
    function approve(address guy, uint wad) external returns (bool);
    function transfer(address dst, uint wad) external returns (bool);
    function transferFrom(address src, address dst, uint wad) external returns (bool);
}

// File: contracts\proxy\ProxyActions.sol

pragma solidity 0.5.17;






/*
    The actions to be performed by user's proxies.
    User's proxies delegatecall into this contract.

    This contract should never be called directly.

    When reading the contract code below, remember
    that it will be executed inside a Proxy.
*/
contract ProxyActions {

    /*
        !! IMPORTANT !!
        - The ordering of variables must not be modified
        - The types of variables must not be modified
        - Existing variables must not be removed
        - New variables must be appended at the end
    */

    // proxyManager is the manager address in Proxy
  function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
  address private proxyManager;
    // proxyActionsStorage set by ctor in Proxy
  function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
  IProxyActionsStorage private store;

    // owner is the owner address in Proxy
  function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
  address public owner;

  function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  uint public version;

    modifier onlyOwner {
        require(msg.sender == owner, "ProxyActions / onlyOwner: not allowed");
        _;
    }

    /*
        Called after a new proxy has been deployed.
        Sets up all necessary allowances and 'hopes' in the vat.
    */
    function setup() external {
        require(msg.sender == proxyManager, "ProxyActions / setup: not allowed");

        version = 1;

        IVat vat = store.vat();
        address daiJoin = address(store.tokenJoins("DAI"));
        address flap = address(store.flap());
        address flop = address(store.flop());

        vat.hope(daiJoin);

        vat.hope(address(store.flips("ETH")));
        vat.hope(address(store.flips("BAT")));
        vat.hope(address(store.flips("USDC")));

        vat.hope(flap);
        vat.hope(flop);

        //solium-disable-next-line error-reason
        require(store.tokens("ETH").approve(address(store.tokenJoins("ETH")), uint(-1)));
        //solium-disable-next-line error-reason
        require(store.tokens("DAI").approve(daiJoin, uint(-1)));
        //solium-disable-next-line error-reason
        require(store.tokens("BAT").approve(address(store.tokenJoins("BAT")), uint(-1)));
        //solium-disable-next-line error-reason
        require(store.tokens("USDC").approve(address(store.tokenJoins("USDC")), uint(-1)));

        //solium-disable-next-line error-reason
        require(store.tokens("MKR").approve(flap, uint(-1)));
        //solium-disable-next-line error-reason
        require(store.tokens("DAI").approve(flop, uint(-1)));
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}

    /*
        FLIP methods
    */

    /*
        Claim a won flip auction and withdraw to wallet.
    */
    function flipClaimAndExit(bytes32 what, uint id) external onlyOwner {
        uint claimed = flipClaimInternal(what, id);
        exitInternal(what, owner, claimed);
    }
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}

    /*
        Claim a won flip auction.
    */
    function flipClaim(bytes32 what, uint id) external onlyOwner {
        flipClaimInternal(what, id);
    }
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }

    function flipClaimInternal(bytes32 what, uint id) private returns (uint) {
        IFlip flip = store.flips(what);
        require(address(flip) != address(0), "ProxyActions / flipClaimInternal: invalid what");

        uint decimals = store.decimals(what);
        uint beforeBalance = store.vat().gem(store.ilks(what), address(this)) / (10**(18 - decimals));
        flip.deal(id);
        uint afterBalance = store.vat().gem(store.ilks(what), address(this)) / (10**(18 - decimals));

        require(afterBalance >= beforeBalance, "ProxyActions / flipClaimInternal: overflow");
        return afterBalance - beforeBalance;
    }
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}

    /*
        Reduce the lot on a flip auction.
        If the Dai balance in the vat is not enough
        (has to be calculated outside the contract)
        `pull` amount of Dai will be moved from wallet to vat
        before placing the bid.
    */
    function flipReduceLot(bytes32 what, uint id, uint pull, uint bid, uint lot) external onlyOwner {

        // pull: 10**18
        // lot: 10**45

        IFlip flip = store.flips(what);
        require(address(flip) != address(0), "ProxyActions / flipReduceLotInternal: invalid what");

        if(pull > 0) {
            joinInternal("DAI", pull);
        }

        flip.dent(id, lot, bid);
    }
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }

    /*
        Bid Dai on a flip auction.
        If the Dai balance in the vat is not enough
        (has to be calculated outside the contract)
        `pull` amount of Dai will be moved from wallet to vat
        before placing the bid.
    */
    function flipBidDai(bytes32 what, uint id, uint pull, uint bid, uint lot) external onlyOwner {

        // pull: 10**18
        // lot: 10**45

        IFlip flip = store.flips(what);
        require(address(flip) != address(0), "ProxyActions / flipBidDai: invalid what");

        if(pull > 0) {
            joinInternal("DAI", pull);
        }

        flip.tend(id, lot, bid);
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}

    /*
        FLAP methods
    */

    /*
        Claim a won flap auction and withdraw to wallet.
    */
    function flapClaimAndExit(uint id) external onlyOwner {
        uint claimed = flapClaimInternal(id);
        exitInternal("DAI", owner, claimed);
    }
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}

    /*
        Claim a won flap auction.
    */
    function flapClaim(uint id) external onlyOwner {
        flapClaimInternal(id);
    }
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }

    function flapClaimInternal(uint id) private returns (uint) {
        // dai is stored as 10**45 in the vat
        uint beforeBalance = store.vat().dai(address(this)) / (10**27);
        store.flap().deal(id);
        uint afterBalance = store.vat().dai(address(this)) / (10**27);

        require(afterBalance >= beforeBalance, "ProxyActions / flapClaimInternal: overflow");
        return afterBalance - beforeBalance;
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

    /*
        Bid MKR on a flap auction.
        If the MKR balance in the proxy is not enough
        (has to be calculated outside the contract)
        `pull` amount of MKR will be moved from wallet to the proxy
        before placing the bid.
    */
    function flapBidMkr(uint id, uint pull, uint bid, uint lot) external onlyOwner {

        if(pull > 0) {
            joinInternal("MKR", pull);
        }

        store.flap().tend(id, lot, bid);
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    /*
        FLOP methods
    */

    /*
        Claim a won flop auction and withdraw to wallet.
    */
    function flopClaimAndExit(uint id) external onlyOwner {
        uint claimed = flopClaimInternal(id);
        exitInternal("MKR", owner, claimed);
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}

    /*
        Claim a won flop auction.
    */
    function flopClaim(uint id) external onlyOwner {
        flopClaimInternal(id);
    }
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }

    function flopClaimInternal(uint id) private returns (uint) {
        uint beforeBalance = store.tokens("MKR").balanceOf(address(this));
        store.flop().deal(id);
        uint afterBalance = store.tokens("MKR").balanceOf(address(this));

        require(afterBalance >= beforeBalance, "ProxyActions / flopClaim: overflow");
        return afterBalance - beforeBalance;
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

    /*
        Reduce the MKR amount on a flop auction.
        If the DAI balance in the vat is not enough
        (has to be calculated outside the contract)
        `pull` amount of Dai will be moved from wallet to the vat
        before placing the bid.
    */
    function flopReduceMkr(uint id, uint pull, uint bid, uint lot) external onlyOwner {

        // pull: 10**18
        // bid: 10**45

        if(pull > 0) {
            joinInternal("DAI", pull);
        }

        store.flop().dent(id, lot, bid);
    }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}

    /*
        JOIN methods
    */

    /*
        Deposit funds from wallet to the vat.
        Incase of MKR funds will be moved to the proxy
        instead of the vat.
        ETH will be converted to WETH before depositing.
    */
    function join(bytes32 what, uint amount) public payable onlyOwner {
        joinInternal(what, amount);
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }

    function joinInternal(bytes32 what, uint amount) private {
        require(what == bytes32("ETH") || msg.value == 0, "ProxyActions / join: either eth or no value");

        IERC20 token = store.tokens(what);
        if(what == bytes32("ETH")) {
            require(amount == msg.value, "ProxyActions / join: msg.value and amount do not match");
            IWETH(address(token)).deposit.gas(gasleft()).value(msg.value)();
        } else if(what == bytes32("MKR")) {
            require(store.tokens("MKR").transferFrom(owner, address(this), amount), "ProxyActions / join: MKR transfer failed");
            return;
        }

        ITokenJoin tokenJoin = store.tokenJoins(what);
        require(address(tokenJoin) != address(0) && address(token) != address(0), "ProxyActions / join: invalid what");

        if(what != bytes32("ETH")) {
            require(token.transferFrom(owner, address(this), amount), "ProxyActions / joinTokenInternal: token transfer failed");
        }

        tokenJoin.join(address(this), amount);
    }
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}

    /*
        EXIT methods
    */

    /*
        Withdraw funds from vat to receiver.
        Incase of MKR funds will be moved from the proxy
        instead of the vat.
        WETH will be converted to ETH before sending.
    */
    function exit(bytes32 what, address receiver, uint amount) public onlyOwner {
        exitInternal(what, receiver, amount);
    }
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}

    function exitInternal(bytes32 what, address receiver, uint amount) private {
        if(what == bytes32("MKR")) {
            store.tokens("MKR").transfer(receiver, amount);
            return;
        }

        ITokenJoin tokenJoin = store.tokenJoins(what);
        require(address(tokenJoin) != address(0), "ProxyActions / exit: invalid what");

        if(what == bytes32("ETH")) {
            tokenJoin.exit(address(this), amount);
            IWETH(address(store.tokens(what))).withdraw(amount);
            address(uint160(receiver)).transfer(amount);
        } else {
            tokenJoin.exit(receiver, amount);
        }
    }
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
}