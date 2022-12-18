                                                                 

// hevm: flattened sources of src/Burner.sol
pragma solidity =0.5.11 >0.4.13 >0.4.20 >=0.4.23 >=0.5.0 <0.6.0 >=0.5.5 <0.6.0 >=0.5.11 <0.6.0;

                               
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

                               

contract DSAuthority {
    function CANCALL426(	//inject NONSTANDARD NAMING
        address src, address dst, bytes4 sig
    ) public view returns (bool);
}

contract DSAuthEvents {
    event LOGSETAUTHORITY355 (address indexed authority);	//inject NONSTANDARD NAMING
    event LOGSETOWNER733     (address indexed owner);	//inject NONSTANDARD NAMING
}

contract DSAuth is DSAuthEvents {
    DSAuthority  public  authority;
    address      public  owner;

    constructor() public {
        owner = msg.sender;
        emit LOGSETOWNER733(msg.sender);
    }

    function SETOWNER992(address owner_)	//inject NONSTANDARD NAMING
        public
        AUTH468
    {
        owner = owner_;
        emit LOGSETOWNER733(owner);
    }

    function SETAUTHORITY183(DSAuthority authority_)	//inject NONSTANDARD NAMING
        public
        AUTH468
    {
        authority = authority_;
        emit LOGSETAUTHORITY355(address(authority));
    }

    modifier AUTH468 {	//inject NONSTANDARD NAMING
        require(ISAUTHORIZED343(msg.sender, msg.sig), "ds-auth-unauthorized");
        _;
    }

    function ISAUTHORIZED343(address src, bytes4 sig) internal view returns (bool) {	//inject NONSTANDARD NAMING
        if (src == address(this)) {
            return true;
        } else if (src == owner) {
            return true;
        } else if (authority == DSAuthority(0)) {
            return false;
        } else {
            return authority.CANCALL426(src, address(this), sig);
        }
    }
}

                               
                                                   

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

                              

contract DSMath {
    function ADD683(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x, "ds-math-add-overflow");
    }
    function SUB763(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }
    function MUL599(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require(y == 0 || (z = x * y) / y == x, "ds-math-mul-overflow");
    }

    function MIN831(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        return x <= y ? x : y;
    }
    function MAX530(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        return x >= y ? x : y;
    }
    function IMIN581(int x, int y) internal pure returns (int z) {	//inject NONSTANDARD NAMING
        return x <= y ? x : y;
    }
    function IMAX188(int x, int y) internal pure returns (int z) {	//inject NONSTANDARD NAMING
        return x >= y ? x : y;
    }

    uint constant wad402 = 10 ** 18;	//inject NONSTANDARD NAMING
    uint constant ray315 = 10 ** 27;	//inject NONSTANDARD NAMING

    function WMUL616(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD683(MUL599(x, y), wad402 / 2) / wad402;
    }
    function RMUL643(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD683(MUL599(x, y), ray315 / 2) / ray315;
    }
    function WDIV97(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD683(MUL599(x, wad402), y / 2) / y;
    }
    function RDIV391(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD683(MUL599(x, ray315), y / 2) / y;
    }

    // This famous algorithm is called "exponentiation by squaring"
    // and calculates x^n with x as fixed-point and n as regular unsigned.
    //
    // It's O(log n), instead of O(n) for naive repeated multiplication.
    //
    // These facts are why it works:
    //
    //  If n is even, then x^n = (x^2)^(n/2).
    //  If n is odd,  then x^n = x * x^(n-1),
    //   and applying the equation for even x gives
    //    x^n = x * (x^2)^((n-1) / 2).
    //
    //  Also, EVM division is flooring and
    //    floor[(n-1) / 2] = floor[n / 2].
    //
    function RPOW508(uint x, uint n) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = n % 2 != 0 ? x : ray315;

        for (n /= 2; n != 0; n /= 2) {
            x = RMUL643(x, x);

            if (n % 2 != 0) {
                z = RMUL643(z, x);
            }
        }
    }
}

                               
                                                                

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

                               

contract DSNote {
    event LOGNOTE747(	//inject NONSTANDARD NAMING
        bytes4   indexed  sig,
        address  indexed  guy,
        bytes32  indexed  foo,
        bytes32  indexed  bar,
        uint256           wad,
        bytes             fax
    ) anonymous;

    modifier NOTE558 {	//inject NONSTANDARD NAMING
        bytes32 foo;
        bytes32 bar;
        uint256 wad;

        assembly {
            foo := calldataload(4)
            bar := calldataload(36)
            wad := callvalue
        }

        emit LOGNOTE747(msg.sig, msg.sender, foo, bar, wad, msg.data);

        _;
    }
}

                               
                                                      

// Copyright (C) 2017  DappHub, LLC

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

                               

                                
                                

contract DSStop is DSNote, DSAuth {
    bool public stopped;

    modifier STOPPABLE471 {	//inject NONSTANDARD NAMING
        require(!stopped, "ds-stop-is-stopped");
        _;
    }
    function STOP894() public AUTH468 NOTE558 {	//inject NONSTANDARD NAMING
        stopped = true;
    }
    function START496() public AUTH468 NOTE558 {	//inject NONSTANDARD NAMING
        stopped = false;
    }

}

                                           
                                                 

// See <https://github.com/ethereum/EIPs/issues/20>.

// This file likely does not meet the threshold of originality
// required for copyright to apply.  As a result, this is free and
// unencumbered software belonging to the public domain.

                              

contract ERC20Events {
    event APPROVAL148(address indexed src, address indexed guy, uint wad);	//inject NONSTANDARD NAMING
    event TRANSFER39(address indexed src, address indexed dst, uint wad);	//inject NONSTANDARD NAMING
}

contract ERC20 is ERC20Events {
    function TOTALSUPPLY960() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF319(address guy) public view returns (uint);	//inject NONSTANDARD NAMING
    function ALLOWANCE694(address src, address guy) public view returns (uint);	//inject NONSTANDARD NAMING

    function APPROVE951(address guy, uint wad) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFER264(address dst, uint wad) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM714(	//inject NONSTANDARD NAMING
        address src, address dst, uint wad
    ) public returns (bool);
}

                                
                                          

// Copyright (C) 2015, 2016, 2017  DappHub, LLC

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

                               

                               
                                

contract DSTokenBase is ERC20, DSMath {
    uint256                                            _supply;
    mapping (address => uint256)                       _balances;
    mapping (address => mapping (address => uint256))  _approvals;

    constructor(uint supply) public {
        _balances[msg.sender] = supply;
        _supply = supply;
    }

    function TOTALSUPPLY960() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _supply;
    }
    function BALANCEOF319(address src) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[src];
    }
    function ALLOWANCE694(address src, address guy) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _approvals[src][guy];
    }

    function TRANSFER264(address dst, uint wad) public returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERFROM714(msg.sender, dst, wad);
    }

    function TRANSFERFROM714(address src, address dst, uint wad)	//inject NONSTANDARD NAMING
        public
        returns (bool)
    {
        if (src != msg.sender) {
            require(_approvals[src][msg.sender] >= wad, "ds-token-insufficient-approval");
            _approvals[src][msg.sender] = SUB763(_approvals[src][msg.sender], wad);
        }

        require(_balances[src] >= wad, "ds-token-insufficient-balance");
        _balances[src] = SUB763(_balances[src], wad);
        _balances[dst] = ADD683(_balances[dst], wad);

        emit TRANSFER39(src, dst, wad);

        return true;
    }

    function APPROVE951(address guy, uint wad) public returns (bool) {	//inject NONSTANDARD NAMING
        _approvals[msg.sender][guy] = wad;

        emit APPROVAL148(msg.sender, guy, wad);

        return true;
    }
}

                                 
                                                              

// Copyright (C) 2015, 2016, 2017  DappHub, LLC

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

                               

                                

                          

contract DSToken is DSTokenBase(0), DSStop {

    bytes32  public  symbol;
    uint256  public  decimals = 18; // standard token precision. override to customize

    constructor(bytes32 symbol_) public {
        symbol = symbol_;
    }

    event MINT803(address indexed guy, uint wad);	//inject NONSTANDARD NAMING
    event BURN144(address indexed guy, uint wad);	//inject NONSTANDARD NAMING

    function APPROVE951(address guy) public STOPPABLE471 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE951(guy, uint(-1));
    }

    function APPROVE951(address guy, uint wad) public STOPPABLE471 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE951(guy, wad);
    }

    function TRANSFERFROM714(address src, address dst, uint wad)	//inject NONSTANDARD NAMING
        public
        STOPPABLE471
        returns (bool)
    {
        if (src != msg.sender && _approvals[src][msg.sender] != uint(-1)) {
            require(_approvals[src][msg.sender] >= wad, "ds-token-insufficient-approval");
            _approvals[src][msg.sender] = SUB763(_approvals[src][msg.sender], wad);
        }

        require(_balances[src] >= wad, "ds-token-insufficient-balance");
        _balances[src] = SUB763(_balances[src], wad);
        _balances[dst] = ADD683(_balances[dst], wad);

        emit TRANSFER39(src, dst, wad);

        return true;
    }

    function PUSH844(address dst, uint wad) public {	//inject NONSTANDARD NAMING
        TRANSFERFROM714(msg.sender, dst, wad);
    }
    function PULL247(address src, uint wad) public {	//inject NONSTANDARD NAMING
        TRANSFERFROM714(src, msg.sender, wad);
    }
    function MOVE458(address src, address dst, uint wad) public {	//inject NONSTANDARD NAMING
        TRANSFERFROM714(src, dst, wad);
    }

    function MINT307(uint wad) public {	//inject NONSTANDARD NAMING
        MINT307(msg.sender, wad);
    }
    function BURN351(uint wad) public {	//inject NONSTANDARD NAMING
        BURN351(msg.sender, wad);
    }
    function MINT307(address guy, uint wad) public AUTH468 STOPPABLE471 {	//inject NONSTANDARD NAMING
        _balances[guy] = ADD683(_balances[guy], wad);
        _supply = ADD683(_supply, wad);
        emit MINT803(guy, wad);
    }
    function BURN351(address guy, uint wad) public AUTH468 STOPPABLE471 {	//inject NONSTANDARD NAMING
        if (guy != msg.sender && _approvals[guy][msg.sender] != uint(-1)) {
            require(_approvals[guy][msg.sender] >= wad, "ds-token-insufficient-approval");
            _approvals[guy][msg.sender] = SUB763(_approvals[guy][msg.sender], wad);
        }

        require(_balances[guy] >= wad, "ds-token-insufficient-balance");
        _balances[guy] = SUB763(_balances[guy], wad);
        _supply = SUB763(_supply, wad);
        emit BURN144(guy, wad);
    }

    // Optional token name
    bytes32   public  name = "";

    function SETNAME182(bytes32 name_) public AUTH468 {	//inject NONSTANDARD NAMING
        name = name_;
    }
}

                     
                              

                                
                                  


                                                                                             
contract Burner is DSAuth {
    DSToken public token;
    bytes32 public name = "Burner";
    bytes32 public symbol = "Burner";

    constructor(DSToken token_) public {
        token = token_;
    }

                                                                                                        
    function BURN351(uint amount_) public AUTH468 {	//inject NONSTANDARD NAMING
        token.BURN351(amount_);
    }

                                          
    function BURNALL32() public AUTH468 {	//inject NONSTANDARD NAMING
        uint totalAmount = token.BALANCEOF319(address(this));
        BURN351(totalAmount);
    }
}