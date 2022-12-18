                                                                 

// File: src/lib/BytesLib.sol

pragma solidity 0.5.16;

// https://github.com/GNSPS/solidity-bytes-utils/blob/b1b22d1e9c4de64defb811f4c65a391630f220d7/contracts/BytesLib.sol

contract BytesLibLite {
    // A lite version of the ByteLib, containing only the "slice" function we need

    function SLICETOEND19(	//inject NONSTANDARD NAMING
        bytes memory _bytes,
        uint256 _start
    ) internal pure returns (bytes memory) {
        require(_start < _bytes.length, "bytes-read-out-of-bounds");

        return SLICE664(
            _bytes,
            _start,
            _bytes.length - _start
        );
    }
    
    function SLICE664(	//inject NONSTANDARD NAMING
        bytes memory _bytes,
        uint256 _start,
        uint256 _length
    )
        internal
        pure
        returns (bytes memory)
    {
        require(_bytes.length >= (_start + _length), "bytes-read-out-of-bounds");

        bytes memory tempBytes;

        assembly {
            switch iszero(_length)
            case 0 {
                // Get a location of some free memory and store it in tempBytes as
                // Solidity does for memory variables.
                tempBytes := mload(0x40)

                // The first word of the slice result is potentially a partial
                // word read from the original array. To read it, we calculate
                // the length of that partial word and start copying that many
                // bytes into the array. The first word we copy will start with
                // data we don't care about, but the last `lengthmod` bytes will
                // land at the beginning of the contents of the new array. When
                // we're done copying, we overwrite the full first word with
                // the actual length of the slice.
                let lengthmod := and(_length, 31)

                // The multiplication in the next line is necessary
                // because when slicing multiples of 32 bytes (lengthmod == 0)
                // the following copy loop was copying the origin's length
                // and then ending prematurely not copying everything it should.
                let mc := add(add(tempBytes, lengthmod), mul(0x20, iszero(lengthmod)))
                let end := add(mc, _length)

                for {
                    // The multiplication in the next line has the same exact purpose
                    // as the one above.
                    let cc := add(add(add(_bytes, lengthmod), mul(0x20, iszero(lengthmod))), _start)
                } lt(mc, end) {
                    mc := add(mc, 0x20)
                    cc := add(cc, 0x20)
                } {
                    mstore(mc, mload(cc))
                }

                mstore(tempBytes, _length)

                //update free-memory pointer
                //allocating the array padded to 32 bytes like the compiler does now
                mstore(0x40, and(add(mc, 31), not(31)))
            }
            //if we want a zero-length slice let's just return a zero-length array
            default {
                tempBytes := mload(0x40)

                mstore(0x40, add(tempBytes, 0x20))
            }
        }

        return tempBytes;
    }

    function BYTESTOADDRESS878(bytes memory _bytes, uint256 _start) internal pure returns (address) {	//inject NONSTANDARD NAMING
        require(_bytes.length >= (_start + 20), "Read out of bounds");
        address tempAddress;

        assembly {
            tempAddress := div(mload(add(add(_bytes, 0x20), _start)), 0x1000000000000000000000000)
        }

        return tempAddress;
    }
}

// File: src/interfaces/IERC20.sol

pragma solidity 0.5.16;

interface IERC20 {
                                                                      
    function TOTALSUPPLY342() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF566(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER64(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE210(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE461(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM740(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER332(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL778(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

    function DECIMALS186() external view returns (uint8);	//inject NONSTANDARD NAMING
    function SYMBOL57() external view returns (string memory);	//inject NONSTANDARD NAMING
    function NAME924() external view returns (string memory);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts/math/SafeMath.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD845(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB42(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB42(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB42(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL528(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV323(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV323(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV323(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD163(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD163(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD163(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/utils/Address.sol

pragma solidity ^0.5.5;

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function ISCONTRACT626(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

                                                                                                                                                                                                          
    function TOPAYABLE76(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE226(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: src/interfaces/ISafeERC20.sol

pragma solidity 0.5.16;




                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER299(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN336(token, abi.encodeWithSelector(token.TRANSFER64.selector, to, value));
    }

    function SAFETRANSFERFROM177(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN336(token, abi.encodeWithSelector(token.TRANSFERFROM740.selector, from, to, value));
    }

    function SAFEAPPROVE825(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE210(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN336(token, abi.encodeWithSelector(token.APPROVE461.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE507(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE210(address(this), spender).ADD845(value);
        CALLOPTIONALRETURN336(token, abi.encodeWithSelector(token.APPROVE461.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE792(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE210(address(this), spender).SUB42(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN336(token, abi.encodeWithSelector(token.APPROVE461.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN336(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT626(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: src/interfaces/aave/IFlashLoanReceiver.sol

pragma solidity 0.5.16;

                                                                                                                                                                                                                  
interface IFlashLoanReceiver {
    function EXECUTEOPERATION428(address _reserve, uint256 _amount, uint256 _fee, bytes calldata _params) external;	//inject NONSTANDARD NAMING
}

// File: src/interfaces/aave/ILendingPoolAddressesProvider.sol

pragma solidity 0.5.16;

                                                                                                                          

contract ILendingPoolAddressesProvider {

    function GETLENDINGPOOL716() public view returns (address);	//inject NONSTANDARD NAMING
    function SETLENDINGPOOLIMPL18(address _pool) public;	//inject NONSTANDARD NAMING

    function GETLENDINGPOOLCORE643() public view returns (address payable);	//inject NONSTANDARD NAMING
    function SETLENDINGPOOLCOREIMPL470(address _lendingPoolCore) public;	//inject NONSTANDARD NAMING

    function GETLENDINGPOOLCONFIGURATOR150() public view returns (address);	//inject NONSTANDARD NAMING
    function SETLENDINGPOOLCONFIGURATORIMPL376(address _configurator) public;	//inject NONSTANDARD NAMING

    function GETLENDINGPOOLDATAPROVIDER362() public view returns (address);	//inject NONSTANDARD NAMING
    function SETLENDINGPOOLDATAPROVIDERIMPL844(address _provider) public;	//inject NONSTANDARD NAMING

    function GETLENDINGPOOLPARAMETERSPROVIDER980() public view returns (address);	//inject NONSTANDARD NAMING
    function SETLENDINGPOOLPARAMETERSPROVIDERIMPL706(address _parametersProvider) public;	//inject NONSTANDARD NAMING

    function GETTOKENDISTRIBUTOR426() public view returns (address);	//inject NONSTANDARD NAMING
    function SETTOKENDISTRIBUTOR462(address _tokenDistributor) public;	//inject NONSTANDARD NAMING

    function GETFEEPROVIDER849() public view returns (address);	//inject NONSTANDARD NAMING
    function SETFEEPROVIDERIMPL779(address _feeProvider) public;	//inject NONSTANDARD NAMING

    function GETLENDINGPOOLLIQUIDATIONMANAGER975() public view returns (address);	//inject NONSTANDARD NAMING
    function SETLENDINGPOOLLIQUIDATIONMANAGER51(address _manager) public;	//inject NONSTANDARD NAMING

    function GETLENDINGPOOLMANAGER506() public view returns (address);	//inject NONSTANDARD NAMING
    function SETLENDINGPOOLMANAGER193(address _lendingPoolManager) public;	//inject NONSTANDARD NAMING

    function GETPRICEORACLE522() public view returns (address);	//inject NONSTANDARD NAMING
    function SETPRICEORACLE715(address _priceOracle) public;	//inject NONSTANDARD NAMING

    function GETLENDINGRATEORACLE682() public view returns (address);	//inject NONSTANDARD NAMING
    function SETLENDINGRATEORACLE298(address _lendingRateOracle) public;	//inject NONSTANDARD NAMING

}

// File: src/lib/aave/FlashLoanReceiverBase.sol

pragma solidity 0.5.16;





contract FlashLoanReceiverBase is IFlashLoanReceiver {
    using SafeMath for uint256;

    address constant ethaddress527 = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;	//inject NONSTANDARD NAMING

    ILendingPoolAddressesProvider public addressesProvider = ILendingPoolAddressesProvider(0x24a42fD28C976A61Df5D00D0599C34c4f90748c8);

    function () external payable {    }

    function TRANSFERFUNDSBACKTOPOOLINTERNAL397(address _reserve, uint256 _amount) internal {	//inject NONSTANDARD NAMING
        address payable core = addressesProvider.GETLENDINGPOOLCORE643();
        TRANSFERINTERNAL426(core,_reserve, _amount);
    }

    function TRANSFERINTERNAL426(address payable _destination, address _reserve, uint256  _amount) internal {	//inject NONSTANDARD NAMING
        if(_reserve == ethaddress527) {
            //solium-disable-next-line
            _destination.call.value(_amount)("");
            return;
        }

        IERC20(_reserve).TRANSFER64(_destination, _amount);
    }

    function GETBALANCEINTERNAL359(address _target, address _reserve) internal view returns(uint256) {	//inject NONSTANDARD NAMING
        if(_reserve == ethaddress527) {

            return _target.balance;
        }

        return IERC20(_reserve).BALANCEOF566(_target);
    }
}

// File: src/lib/dapphub/Auth.sol

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

pragma solidity 0.5.16;

contract DSAuthority {
    function CANCALL420(	//inject NONSTANDARD NAMING
        address src, address dst, bytes4 sig
    ) public view returns (bool);
}

contract DSAuthEvents {
    event LOGSETAUTHORITY934 (address indexed authority);	//inject NONSTANDARD NAMING
    event LOGSETOWNER549     (address indexed owner);	//inject NONSTANDARD NAMING
}

contract DSAuth is DSAuthEvents {
    DSAuthority  public  authority;
    address      public  owner;

    constructor() public {
        owner = msg.sender;
        emit LOGSETOWNER549(msg.sender);
    }

    function SETOWNER895(address owner_)	//inject NONSTANDARD NAMING
        public
        AUTH912
    {
        owner = owner_;
        emit LOGSETOWNER549(owner);
    }

    function SETAUTHORITY309(DSAuthority authority_)	//inject NONSTANDARD NAMING
        public
        AUTH912
    {
        authority = authority_;
        emit LOGSETAUTHORITY934(address(authority));
    }

    modifier AUTH912 {	//inject NONSTANDARD NAMING
        require(ISAUTHORIZED598(msg.sender, msg.sig), "ds-auth-unauthorized");
        _;
    }

    function ISAUTHORIZED598(address src, bytes4 sig) internal view returns (bool) {	//inject NONSTANDARD NAMING
        if (src == address(this)) {
            return true;
        } else if (src == owner) {
            return true;
        } else if (address(authority) == address(0)) {
            return false;
        } else {
            return authority.CANCALL420(src, address(this), sig);
        }
    }
}

// File: src/lib/dapphub/Note.sol

                                                                

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

pragma solidity 0.5.16;

contract DSNote {
    event LOGNOTE995(	//inject NONSTANDARD NAMING
        bytes4   indexed  sig,
        address  indexed  guy,
        bytes32  indexed  foo,
        bytes32  indexed  bar,
        uint256           wad,
        bytes             fax
    ) anonymous;

    modifier NOTE134 {	//inject NONSTANDARD NAMING
        bytes32 foo;
        bytes32 bar;
        uint256 wad;

        assembly {
            foo := calldataload(4)
            bar := calldataload(36)
            wad := callvalue
        }

        emit LOGNOTE995(msg.sig, msg.sender, foo, bar, wad, msg.data);

        _;
    }
}

// File: src/lib/dapphub/Proxy.sol

// proxy.sol - execute actions atomically through the proxy's identity

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

pragma solidity >=0.5.0 <0.6.0;



// DSProxy
// Allows code execution using a persistant identity This can be very
// useful to execute a sequence of atomic actions. Since the owner of
// the proxy can be changed, this allows for dynamic ownership models
// i.e. a multisig
contract DSProxy is DSAuth, DSNote {
    DSProxyCache public cache;  // global cache for contracts

    constructor(address _cacheAddr) public {
        SETCACHE811(_cacheAddr);
    }

    function() external payable {
    }

    // use the proxy to execute calldata _data on contract _code
    function EXECUTE294(bytes memory _code, bytes memory _data)	//inject NONSTANDARD NAMING
        public
        payable
        returns (address target, bytes memory response)
    {
        target = cache.READ681(_code);
        if (target == address(0)) {
            // deploy contract & store its address in cache
            target = cache.WRITE920(_code);
        }

        response = EXECUTE294(target, _data);
    }

    function EXECUTE294(address _target, bytes memory _data)	//inject NONSTANDARD NAMING
        public
        AUTH912
        NOTE134
        payable
        returns (bytes memory response)
    {
        require(_target != address(0), "ds-proxy-target-address-required");

        // call contract in current context
        assembly {
            let succeeded := delegatecall(sub(gas, 5000), _target, add(_data, 0x20), mload(_data), 0, 0)
            let size := returndatasize

            response := mload(0x40)
            mstore(0x40, add(response, and(add(add(size, 0x20), 0x1f), not(0x1f))))
            mstore(response, size)
            returndatacopy(add(response, 0x20), 0, size)

            switch iszero(succeeded)
            case 1 {
                // throw if delegatecall failed
                revert(add(response, 0x20), size)
            }
        }
    }

    //set new cache
    function SETCACHE811(address _cacheAddr)	//inject NONSTANDARD NAMING
        public
        AUTH912
        NOTE134
        returns (bool)
    {
        require(_cacheAddr != address(0), "ds-proxy-cache-address-required");
        cache = DSProxyCache(_cacheAddr);  // overwrite cache
        return true;
    }
}

// DSProxyFactory
// This factory deploys new proxy instances through build()
// Deployed proxy addresses are logged
contract DSProxyFactory {
    event CREATED257(address indexed sender, address indexed owner, address proxy, address cache);	//inject NONSTANDARD NAMING
    mapping(address=>address) public proxies;
    DSProxyCache public cache;

    constructor() public {
        cache = new DSProxyCache();
    }

    // deploys a new proxy instance
    // sets owner of proxy to caller
    function BUILD59() public returns (address payable proxy) {	//inject NONSTANDARD NAMING
        proxy = BUILD59(msg.sender);
    }

    // deploys a new proxy instance
    // sets custom owner of proxy
    function BUILD59(address owner) public returns (address payable proxy) {	//inject NONSTANDARD NAMING
        proxy = address(new DSProxy(address(cache)));
        emit CREATED257(msg.sender, owner, address(proxy), address(cache));
        DSProxy(proxy).SETOWNER895(owner);
        proxies[owner] = proxy;
    }
}

// DSProxyCache
// This global cache stores addresses of contracts previously deployed
// by a proxy. This saves gas from repeat deployment of the same
// contracts and eliminates blockchain bloat.

// By default, all proxies deployed from the same factory store
// contracts in the same cache. The cache a proxy instance uses can be
// changed.  The cache uses the sha3 hash of a contract's bytecode to
// lookup the address
contract DSProxyCache {
    mapping(bytes32 => address) cache;

    function READ681(bytes memory _code) public view returns (address) {	//inject NONSTANDARD NAMING
        bytes32 hash = keccak256(_code);
        return cache[hash];
    }

    function WRITE920(bytes memory _code) public returns (address target) {	//inject NONSTANDARD NAMING
        assembly {
            target := create(0, add(_code, 0x20), mload(_code))
            switch iszero(extcodesize(target))
            case 1 {
                // throw if contract failed to deploy
                revert(0, 0)
            }
        }
        bytes32 hash = keccak256(_code);
        cache[hash] = target;
    }
}

// File: src/proxies/DACProxy.sol

                                                                                                           

pragma solidity 0.5.16;
pragma experimental ABIEncoderV2;





contract DACProxy is
    DSProxy(address(1)),
    FlashLoanReceiverBase,
    BytesLibLite
{
    // TODO: Change this value
    address payable constant protocolfeepayoutaddress140 = 0x773CCbFB422850617A5680D40B1260422d072f41;	//inject NONSTANDARD NAMING
    address payable constant protocolfeepayoutaddress2818 = 0xAbcCB8f0a3c206Bb0468C52CCc20f3b81077417B;	//inject NONSTANDARD NAMING

    constructor(address _cacheAddr) public {
        SETCACHE811(_cacheAddr);
    }

    function() external payable {}

    // This is for Aave flashloans
    function EXECUTEOPERATION428(	//inject NONSTANDARD NAMING
        address _reserve,
        uint256 _amount,
        uint256 _fee,
        bytes calldata _params
    ) external
        AUTH912
    {
        // Assumes that once the action(s) are performed
        // we will have totalDebt would of _reserve to repay
        // aave and the protocol
        uint protocolFee = _fee.DIV323(2);

        // Re-encodes new data 
        // Function signature should conform to:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
        address targetAddress = BYTESTOADDRESS878(_params, 12);
        bytes memory fSig     = SLICE664(_params, 32, 4);
        bytes memory data     = SLICETOEND19(_params, 132);

        // Re-encodes function signature and injects new
        // _amount, _fee, and _protocolFee into _data
        bytes memory newData = abi.encodePacked(
            fSig,
            abi.encode(_amount),
            abi.encode(_fee),
            abi.encode(protocolFee),
            data
        );

        // Executes new target
        EXECUTE294(targetAddress, newData);

        // Repays protocol fee
        if (_reserve == 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE) {
            protocolfeepayoutaddress140.call.value(protocolFee.DIV323(2))("");
            protocolfeepayoutaddress2818.call.value(protocolFee.DIV323(2))("");
        } else {
            IERC20(_reserve).TRANSFER64(protocolfeepayoutaddress140, protocolFee.DIV323(2));
            IERC20(_reserve).TRANSFER64(protocolfeepayoutaddress2818, protocolFee.DIV323(2));
        }

        // Repays aave
        TRANSFERFUNDSBACKTOPOOLINTERNAL397(_reserve, _amount.ADD845(_fee));
    }
}

// File: src/lib/dapphub/Guard.sol

// guard.sol -- simple whitelist implementation of DSAuthority

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

pragma solidity 0.5.16;


contract DSGuardEvents {
    event LOGPERMIT94(	//inject NONSTANDARD NAMING
        bytes32 indexed src,
        bytes32 indexed dst,
        bytes32 indexed sig
    );

    event LOGFORBID2(	//inject NONSTANDARD NAMING
        bytes32 indexed src,
        bytes32 indexed dst,
        bytes32 indexed sig
    );
}

contract DSGuard is DSAuth, DSAuthority, DSGuardEvents {
    bytes32 constant public any121 = bytes32(uint(-1));	//inject NONSTANDARD NAMING

    mapping (bytes32 => mapping (bytes32 => mapping (bytes32 => bool))) acl;

    function CANCALL420(	//inject NONSTANDARD NAMING
        address src_, address dst_, bytes4 sig
    ) public view returns (bool) {
        bytes32 src = bytes32(bytes20(src_));
        bytes32 dst = bytes32(bytes20(dst_));

        return acl[src][dst][sig]
            || acl[src][dst][any121]
            || acl[src][any121][sig]
            || acl[src][any121][any121]
            || acl[any121][dst][sig]
            || acl[any121][dst][any121]
            || acl[any121][any121][sig]
            || acl[any121][any121][any121];
    }

    function PERMIT814(bytes32 src, bytes32 dst, bytes32 sig) public AUTH912 {	//inject NONSTANDARD NAMING
        acl[src][dst][sig] = true;
        emit LOGPERMIT94(src, dst, sig);
    }

    function FORBID61(bytes32 src, bytes32 dst, bytes32 sig) public AUTH912 {	//inject NONSTANDARD NAMING
        acl[src][dst][sig] = false;
        emit LOGFORBID2(src, dst, sig);
    }

    function PERMIT814(address src, address dst, bytes32 sig) public {	//inject NONSTANDARD NAMING
        PERMIT814(bytes32(bytes20(src)), bytes32(bytes20(dst)), sig);
    }
    function FORBID61(address src, address dst, bytes32 sig) public {	//inject NONSTANDARD NAMING
        FORBID61(bytes32(bytes20(src)), bytes32(bytes20(dst)), sig);
    }

}

contract DSGuardFactory {
    mapping (address => bool)  public  isGuard;

    function NEWGUARD328() public returns (DSGuard guard) {	//inject NONSTANDARD NAMING
        guard = new DSGuard();
        guard.SETOWNER895(msg.sender);
        isGuard[address(guard)] = true;
    }
}

// File: src/interfaces/compound/IComptroller.sol

pragma solidity 0.5.16;

interface IComptroller {
                                                                                                                                                                                             
    function ISCOMPTROLLER875() external view returns (bool);	//inject NONSTANDARD NAMING

                               

    function ENTERMARKETS971(address[] calldata cTokens) external returns (uint[] memory);	//inject NONSTANDARD NAMING
    function EXITMARKET349(address cToken) external returns (uint);	//inject NONSTANDARD NAMING

                          

    function GETACCOUNTLIQUIDITY587(address account) external view returns (uint, uint, uint);	//inject NONSTANDARD NAMING
    function GETASSETSIN216(address account) external view returns (address[] memory);	//inject NONSTANDARD NAMING

    function MINTALLOWED994(address cToken, address minter, uint mintAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function MINTVERIFY129(address cToken, address minter, uint mintAmount, uint mintTokens) external;	//inject NONSTANDARD NAMING

    function REDEEMALLOWED450(address cToken, address redeemer, uint redeemTokens) external returns (uint);	//inject NONSTANDARD NAMING
    function REDEEMVERIFY487(address cToken, address redeemer, uint redeemAmount, uint redeemTokens) external;	//inject NONSTANDARD NAMING

    function BORROWALLOWED409(address cToken, address borrower, uint borrowAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function BORROWVERIFY516(address cToken, address borrower, uint borrowAmount) external;	//inject NONSTANDARD NAMING

    function REPAYBORROWALLOWED411(	//inject NONSTANDARD NAMING
        address cToken,
        address payer,
        address borrower,
        uint repayAmount) external returns (uint);
    function REPAYBORROWVERIFY726(	//inject NONSTANDARD NAMING
        address cToken,
        address payer,
        address borrower,
        uint repayAmount,
        uint borrowerIndex) external;

    function LIQUIDATEBORROWALLOWED934(	//inject NONSTANDARD NAMING
        address cTokenBorrowed,
        address cTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount) external returns (uint);
    function LIQUIDATEBORROWVERIFY680(	//inject NONSTANDARD NAMING
        address cTokenBorrowed,
        address cTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount,
        uint seizeTokens) external;

    function SEIZEALLOWED273(	//inject NONSTANDARD NAMING
        address cTokenCollateral,
        address cTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external returns (uint);
    function SEIZEVERIFY930(	//inject NONSTANDARD NAMING
        address cTokenCollateral,
        address cTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external;

    function TRANSFERALLOWED256(address cToken, address src, address dst, uint transferTokens) external returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFERVERIFY884(address cToken, address src, address dst, uint transferTokens) external;	//inject NONSTANDARD NAMING

                                                

    function LIQUIDATECALCULATESEIZETOKENS590(	//inject NONSTANDARD NAMING
        address cTokenBorrowed,
        address cTokenCollateral,
        uint repayAmount) external view returns (uint, uint);
}

// File: src/proxies/DACProxyFactory.sol

pragma solidity 0.5.16;




contract DACProxyFactory {
    event CREATED257(address indexed sender, address indexed owner, address proxy, address cache);	//inject NONSTANDARD NAMING

    mapping(address=>address) public proxies;

    DSProxyCache public cache;
    DSGuardFactory public dsGuardFactory;

    constructor() public {
        cache = new DSProxyCache();
        dsGuardFactory = new DSGuardFactory();
    }

    // deploys a new proxy instance
    // sets owner of proxy to caller
    function BUILD59() public returns (address payable proxy) {	//inject NONSTANDARD NAMING
        proxy = BUILD59(msg.sender);
    }

    // deploys a new proxy instance
    // creates a new guard
    // sets custom owner of proxy
    function BUILD59(address owner) public returns (address payable) {	//inject NONSTANDARD NAMING
        // If user already has a proxy build, return that instead
        if (proxies[owner] != address(0)) {
            return address(uint160(proxies[owner]));
        }

        address payable proxy = address(new DACProxy(address(cache)));
        emit CREATED257(msg.sender, owner, address(proxy), address(cache));

        DSGuard guard = dsGuardFactory.NEWGUARD328();
        guard.SETOWNER895(proxy);  // Guard belongs to proxy

        DACProxy(proxy).SETAUTHORITY309(guard);
        DACProxy(proxy).SETOWNER895(owner);

        proxies[owner] = proxy;

        return proxy;
    }

    // Compound-specific code to enter markets upon proxy creation
    // So user has to perform less TX
    function BUILDANDENTERMARKETS520(	//inject NONSTANDARD NAMING
        address dedgeCompoundManager,
        bytes memory enterMarketCalldata
    ) public returns (address payable) {
        return BUILDANDENTERMARKETS520(msg.sender, dedgeCompoundManager, enterMarketCalldata);
    }

    function BUILDANDENTERMARKETS520(	//inject NONSTANDARD NAMING
        address owner,
        address dedgeCompoundManager,
        bytes memory enterMarketCalldata
    ) public returns (address payable) {
        // If user already has a proxy build, return that instead
        if (proxies[owner] != address(0)) {
            return address(uint160(proxies[owner]));
        }

        address payable proxy = address(new DACProxy(address(cache)));
        emit CREATED257(msg.sender, owner, address(proxy), address(cache));

        DSGuard guard = dsGuardFactory.NEWGUARD328();
        guard.SETOWNER895(proxy);  // Guard belongs to proxy

        // Enter markets via proxy
        DACProxy(proxy).EXECUTE294(
            dedgeCompoundManager,
            enterMarketCalldata
        );

        DACProxy(proxy).SETAUTHORITY309(guard);
        DACProxy(proxy).SETOWNER895(owner);

        proxies[owner] = proxy;

        return proxy;
    }
}