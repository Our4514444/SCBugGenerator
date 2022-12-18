                                                                 

// File: contracts\interfaces\dss\IVat.sol

pragma solidity 0.5.17;

interface IVat {
    function HOPE882(address usr) external;	//inject NONSTANDARD NAMING
    function GEM874(bytes32, address) external view returns (uint);	//inject NONSTANDARD NAMING
    function DAI802(address) external view returns (uint);	//inject NONSTANDARD NAMING
}

// File: contracts\interfaces\dss\IETHJoin.sol

pragma solidity 0.5.17;

interface IETHJoin {
    function JOIN844(address usr) external payable;	//inject NONSTANDARD NAMING
    function EXIT362(address payable usr, uint wad) external;	//inject NONSTANDARD NAMING
}

// File: contracts\interfaces\dss\ITokenJoin.sol

pragma solidity 0.5.17;

interface ITokenJoin {
    function JOIN844(address usr, uint wad) external;	//inject NONSTANDARD NAMING
    function EXIT362(address usr, uint wad) external;	//inject NONSTANDARD NAMING
}

// File: contracts\interfaces\dss\IFlip.sol

pragma solidity 0.5.17;

contract IFlip {
    function TICK716(uint id) external;	//inject NONSTANDARD NAMING
    function TEND998(uint id, uint lot, uint bid) external;	//inject NONSTANDARD NAMING
    function DENT129(uint id, uint lot, uint bid) external;	//inject NONSTANDARD NAMING
    function DEAL4(uint id) external;	//inject NONSTANDARD NAMING
}

// File: contracts\interfaces\dss\IFlap.sol

pragma solidity 0.5.17;

contract IFlap {
    function TICK716(uint id) external;	//inject NONSTANDARD NAMING
    function TEND998(uint id, uint lot, uint bid) external;	//inject NONSTANDARD NAMING
    function DEAL4(uint id) external;	//inject NONSTANDARD NAMING
}

// File: contracts\interfaces\dss\IFlop.sol

pragma solidity 0.5.17;

contract IFlop {
    function TICK716(uint id) external;	//inject NONSTANDARD NAMING
    function DENT129(uint id, uint lot, uint bid) external;	//inject NONSTANDARD NAMING
    function DEAL4(uint id) external;	//inject NONSTANDARD NAMING
}

// File: contracts\interfaces\token\IERC20.sol

pragma solidity 0.5.17;

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY939() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF364(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER13(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE529(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE652(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM154(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER214(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL581(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: contracts\interfaces\proxy\IProxyActionsStorage.sol

pragma solidity 0.5.17;

interface IProxyActionsStorage  {

    function VAT27() external view returns (IVat);	//inject NONSTANDARD NAMING
    function FLAP573() external view returns (IFlap);	//inject NONSTANDARD NAMING
    function FLOP848() external view returns (IFlop);	//inject NONSTANDARD NAMING

    function TOKENS252(bytes32) external view returns (IERC20);	//inject NONSTANDARD NAMING
    function DECIMALS727(bytes32) external view returns (uint);	//inject NONSTANDARD NAMING
    function ILKS143(bytes32) external view returns (bytes32);	//inject NONSTANDARD NAMING
    function TOKENJOINS759(bytes32) external view returns (ITokenJoin);	//inject NONSTANDARD NAMING
    function FLIPS305(bytes32) external view returns (IFlip);	//inject NONSTANDARD NAMING
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
    function BALANCEOF364(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function DEPOSIT399() external payable;	//inject NONSTANDARD NAMING
    function WITHDRAW297(uint wad) external;	//inject NONSTANDARD NAMING
    function APPROVE652(address guy, uint wad) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFER13(address dst, uint wad) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM154(address src, address dst, uint wad) external returns (bool);	//inject NONSTANDARD NAMING
}

// File: contracts\proxy\ProxyActions.sol

pragma solidity 0.5.17;






                                                                                                                                                                                                                                                                 
contract ProxyActions {

                                                                                                                                                                                                                                                         

    // proxyManager is the manager address in Proxy
    address private proxyManager;
    // proxyActionsStorage set by ctor in Proxy
    IProxyActionsStorage private store;

    // owner is the owner address in Proxy
    address public owner;

    uint public version;

    modifier ONLYOWNER549 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "ProxyActions / onlyOwner: not allowed");
        _;
    }

                                                                                                                                  
    function SETUP505() external {	//inject NONSTANDARD NAMING
        require(msg.sender == proxyManager, "ProxyActions / setup: not allowed");

        version = 1;

        IVat vat = store.VAT27();
        address daiJoin = address(store.TOKENJOINS759("DAI"));
        address flap = address(store.FLAP573());
        address flop = address(store.FLOP848());

        vat.HOPE882(daiJoin);

        vat.HOPE882(address(store.FLIPS305("ETH")));
        vat.HOPE882(address(store.FLIPS305("BAT")));
        vat.HOPE882(address(store.FLIPS305("USDC")));

        vat.HOPE882(flap);
        vat.HOPE882(flop);

        //solium-disable-next-line error-reason
        require(store.TOKENS252("ETH").APPROVE652(address(store.TOKENJOINS759("ETH")), uint(-1)));
        //solium-disable-next-line error-reason
        require(store.TOKENS252("DAI").APPROVE652(daiJoin, uint(-1)));
        //solium-disable-next-line error-reason
        require(store.TOKENS252("BAT").APPROVE652(address(store.TOKENJOINS759("BAT")), uint(-1)));
        //solium-disable-next-line error-reason
        require(store.TOKENS252("USDC").APPROVE652(address(store.TOKENJOINS759("USDC")), uint(-1)));

        //solium-disable-next-line error-reason
        require(store.TOKENS252("MKR").APPROVE652(flap, uint(-1)));
        //solium-disable-next-line error-reason
        require(store.TOKENS252("DAI").APPROVE652(flop, uint(-1)));
    }

                                  

                                                                      
    function FLIPCLAIMANDEXIT224(bytes32 what, uint id) external ONLYOWNER549 {	//inject NONSTANDARD NAMING
        uint claimed = FLIPCLAIMINTERNAL772(what, id);
        EXITINTERNAL492(what, owner, claimed);
    }

                                               
    function FLIPCLAIM382(bytes32 what, uint id) external ONLYOWNER549 {	//inject NONSTANDARD NAMING
        FLIPCLAIMINTERNAL772(what, id);
    }

    function FLIPCLAIMINTERNAL772(bytes32 what, uint id) private returns (uint) {	//inject NONSTANDARD NAMING
        IFlip flip = store.FLIPS305(what);
        require(address(flip) != address(0), "ProxyActions / flipClaimInternal: invalid what");

        uint decimals = store.DECIMALS727(what);
        uint beforeBalance = store.VAT27().GEM874(store.ILKS143(what), address(this)) / (10**(18 - decimals));
        flip.DEAL4(id);
        uint afterBalance = store.VAT27().GEM874(store.ILKS143(what), address(this)) / (10**(18 - decimals));

        require(afterBalance >= beforeBalance, "ProxyActions / flipClaimInternal: overflow");
        return afterBalance - beforeBalance;
    }

                                                                                                                                                                                                                                                             
    function FLIPREDUCELOT685(bytes32 what, uint id, uint pull, uint bid, uint lot) external ONLYOWNER549 {	//inject NONSTANDARD NAMING

        // pull: 10**18
        // lot: 10**45

        IFlip flip = store.FLIPS305(what);
        require(address(flip) != address(0), "ProxyActions / flipReduceLotInternal: invalid what");

        if(pull > 0) {
            JOININTERNAL478("DAI", pull);
        }

        flip.DENT129(id, lot, bid);
    }

                                                                                                                                                                                                                                                      
    function FLIPBIDDAI839(bytes32 what, uint id, uint pull, uint bid, uint lot) external ONLYOWNER549 {	//inject NONSTANDARD NAMING

        // pull: 10**18
        // lot: 10**45

        IFlip flip = store.FLIPS305(what);
        require(address(flip) != address(0), "ProxyActions / flipBidDai: invalid what");

        if(pull > 0) {
            JOININTERNAL478("DAI", pull);
        }

        flip.TEND998(id, lot, bid);
    }

                                  

                                                                      
    function FLAPCLAIMANDEXIT907(uint id) external ONLYOWNER549 {	//inject NONSTANDARD NAMING
        uint claimed = FLAPCLAIMINTERNAL318(id);
        EXITINTERNAL492("DAI", owner, claimed);
    }

                                               
    function FLAPCLAIM452(uint id) external ONLYOWNER549 {	//inject NONSTANDARD NAMING
        FLAPCLAIMINTERNAL318(id);
    }

    function FLAPCLAIMINTERNAL318(uint id) private returns (uint) {	//inject NONSTANDARD NAMING
        // dai is stored as 10**45 in the vat
        uint beforeBalance = store.VAT27().DAI802(address(this)) / (10**27);
        store.FLAP573().DEAL4(id);
        uint afterBalance = store.VAT27().DAI802(address(this)) / (10**27);

        require(afterBalance >= beforeBalance, "ProxyActions / flapClaimInternal: overflow");
        return afterBalance - beforeBalance;
    }

                                                                                                                                                                                                                                                              
    function FLAPBIDMKR266(uint id, uint pull, uint bid, uint lot) external ONLYOWNER549 {	//inject NONSTANDARD NAMING

        if(pull > 0) {
            JOININTERNAL478("MKR", pull);
        }

        store.FLAP573().TEND998(id, lot, bid);
    }

                                  

                                                                      
    function FLOPCLAIMANDEXIT547(uint id) external ONLYOWNER549 {	//inject NONSTANDARD NAMING
        uint claimed = FLOPCLAIMINTERNAL887(id);
        EXITINTERNAL492("MKR", owner, claimed);
    }

                                               
    function FLOPCLAIM652(uint id) external ONLYOWNER549 {	//inject NONSTANDARD NAMING
        FLOPCLAIMINTERNAL887(id);
    }

    function FLOPCLAIMINTERNAL887(uint id) private returns (uint) {	//inject NONSTANDARD NAMING
        uint beforeBalance = store.TOKENS252("MKR").BALANCEOF364(address(this));
        store.FLOP848().DEAL4(id);
        uint afterBalance = store.TOKENS252("MKR").BALANCEOF364(address(this));

        require(afterBalance >= beforeBalance, "ProxyActions / flopClaim: overflow");
        return afterBalance - beforeBalance;
    }

                                                                                                                                                                                                                                                                        
    function FLOPREDUCEMKR812(uint id, uint pull, uint bid, uint lot) external ONLYOWNER549 {	//inject NONSTANDARD NAMING

        // pull: 10**18
        // bid: 10**45

        if(pull > 0) {
            JOININTERNAL478("DAI", pull);
        }

        store.FLOP848().DENT129(id, lot, bid);
    }

                                  

                                                                                                                                                                                                       
    function JOIN844(bytes32 what, uint amount) public payable ONLYOWNER549 {	//inject NONSTANDARD NAMING
        JOININTERNAL478(what, amount);
    }

    function JOININTERNAL478(bytes32 what, uint amount) private {	//inject NONSTANDARD NAMING
        require(what == bytes32("ETH") || msg.value == 0, "ProxyActions / join: either eth or no value");

        IERC20 token = store.TOKENS252(what);
        if(what == bytes32("ETH")) {
            require(amount == msg.value, "ProxyActions / join: msg.value and amount do not match");
            IWETH(address(token)).DEPOSIT399.gas(gasleft()).value(msg.value)();
        } else if(what == bytes32("MKR")) {
            require(store.TOKENS252("MKR").TRANSFERFROM154(owner, address(this), amount), "ProxyActions / join: MKR transfer failed");
            return;
        }

        ITokenJoin tokenJoin = store.TOKENJOINS759(what);
        require(address(tokenJoin) != address(0) && address(token) != address(0), "ProxyActions / join: invalid what");

        if(what != bytes32("ETH")) {
            require(token.TRANSFERFROM154(owner, address(this), amount), "ProxyActions / joinTokenInternal: token transfer failed");
        }

        tokenJoin.JOIN844(address(this), amount);
    }

                                  

                                                                                                                                                                                                     
    function EXIT362(bytes32 what, address receiver, uint amount) public ONLYOWNER549 {	//inject NONSTANDARD NAMING
        EXITINTERNAL492(what, receiver, amount);
    }

    function EXITINTERNAL492(bytes32 what, address receiver, uint amount) private {	//inject NONSTANDARD NAMING
        if(what == bytes32("MKR")) {
            store.TOKENS252("MKR").TRANSFER13(receiver, amount);
            return;
        }

        ITokenJoin tokenJoin = store.TOKENJOINS759(what);
        require(address(tokenJoin) != address(0), "ProxyActions / exit: invalid what");

        if(what == bytes32("ETH")) {
            tokenJoin.EXIT362(address(this), amount);
            IWETH(address(store.TOKENS252(what))).WITHDRAW297(amount);
            address(uint160(receiver)).transfer(amount);
        } else {
            tokenJoin.EXIT362(receiver, amount);
        }
    }
}