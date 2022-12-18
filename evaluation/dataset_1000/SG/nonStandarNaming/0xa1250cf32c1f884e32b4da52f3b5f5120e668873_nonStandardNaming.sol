                                                                 

// 11111111111111111111111111111111111111111111111111111111111111
// 11111111111111111111111111111111111111111111111111111111111111
// 11111111111111111111111111111111111111111111111111111111111111
// 11111111111111111111111111111111111111111111111111111111111111
// 11111111111111111111111111111111111111111111111111111111111111
// 11111111111111111111111111111111111111111111111111111111111111
// Copyright (C) 2020 zapper, nodar, suhail, seb, sumit, apoorv

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//

                 
                                                                              

pragma solidity 0.5.12;

library SafeMath {
    function ADD455(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB513(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB513(a, b, "SafeMath: subtraction overflow");
    }
    function SUB513(uint256 a, uint256 b, string memory errorMessage)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL411(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV889(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV889(a, b, "SafeMath: division by zero");
    }
    function DIV889(uint256 a, uint256 b, string memory errorMessage)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        return c;
    }
    function MOD185(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD185(a, b, "SafeMath: modulo by zero");
    }
    function MOD185(uint256 a, uint256 b, string memory errorMessage)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function ISCONTRACT21(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

                                                                                                                                                                                                          
    function TOPAYABLE287(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE472(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

contract ReentrancyGuard {
    bool private _notEntered;

    constructor () internal {
        // Storing an initial non-zero value makes deployment a bit more
        // expensive, but in exchange the refund on every call to nonReentrant
        // will be lower in amount. Since refunds are capped to a percetange of
        // the total transaction's gas, it is best to keep them low in cases
        // like this one, to increase the likelihood of the full refund coming
        // into effect.
        _notEntered = true;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT277() {	//inject NONSTANDARD NAMING
        // On the first call to nonReentrant, _notEntered will be true
        require(_notEntered, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _notEntered = false;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _notEntered = true;
    }
}

contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER408() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA126() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED415(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        address msgSender = _MSGSENDER408();
        _owner = msgSender;
        emit OWNERSHIPTRANSFERRED415(address(0), msgSender);
    }

                                                                     
    function OWNER822() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER347() {	//inject NONSTANDARD NAMING
        require(ISOWNER124(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER124() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER408() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP656() public ONLYOWNER347 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED415(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP18(address newOwner) public ONLYOWNER347 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP1(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP1(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED415(_owner, newOwner);
        _owner = newOwner;
    }
}

interface IERC20 {
    function DECIMALS453() external view returns (uint256);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY145() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF143(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

    function TRANSFER529(address recipient, uint256 amount)	//inject NONSTANDARD NAMING
        external
        returns (bool);

    function ALLOWANCE418(address owner, address spender)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

    function APPROVE588(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM460(address sender, address recipient, uint256 amount)	//inject NONSTANDARD NAMING
        external
        returns (bool);

    event TRANSFER808(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL149(	//inject NONSTANDARD NAMING
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

interface IUniswapV2Factory {
    function GETPAIR36(address tokenA, address tokenB)	//inject NONSTANDARD NAMING
        external
        view
        returns (address);
}

interface IUniswapV2Pair {
    function TOKEN0437() external pure returns (address);	//inject NONSTANDARD NAMING

    function TOKEN1429() external pure returns (address);	//inject NONSTANDARD NAMING

    function GETRESERVES921()	//inject NONSTANDARD NAMING
        external
        view
        returns (
            uint112 _reserve0,
            uint112 _reserve1,
            uint32 _blockTimestampLast
        );

    // this low-level function should be called from a contract which performs important safety checks
    function SWAP65(	//inject NONSTANDARD NAMING
        uint256 amount0Out,
        uint256 amount1Out,
        address to,
        bytes calldata data
    ) external;

    // force balances to match reserves
    function SKIM242(address to) external;	//inject NONSTANDARD NAMING
}

interface IUniswapV2ZapIn {
    function ZAPIN148(	//inject NONSTANDARD NAMING
        address _toWhomToIssue,
        address _FromTokenContractAddress,
        address _ToUnipoolToken0,
        address _ToUnipoolToken1,
        uint256 _amount,
        uint256 _minPoolTokens
    ) external payable returns (uint256);
}

interface IUniswapV2ZapOut {
    function ZAPOUT881(	//inject NONSTANDARD NAMING
        address _ToTokenContractAddress,
        address _FromUniPoolAddress,
        uint256 _IncomingLP,
        uint256 _minTokensRec
    ) external payable returns (uint256);
}

interface IBalancerZapInGen {
    function EASYZAPIN981(	//inject NONSTANDARD NAMING
        address _FromTokenContractAddress,
        address _ToBalancerPoolAddress,
        uint256 _amount,
        uint256 _minPoolTokens
    ) external payable returns (uint256 tokensBought);
}

interface IBalancerUnZap {
    function EASYZAPOUT45(	//inject NONSTANDARD NAMING
        address _ToTokenContractAddress,
        address _FromBalancerPoolAddress,
        uint256 _IncomingBPT,
        uint256 _minTokensRec
    ) external payable returns (uint256);
}

interface IBPool {
    function ISBOUND318(address t) external view returns (bool);	//inject NONSTANDARD NAMING
}

contract Balancer_UniswapV2_Pipe_V1_2 is ReentrancyGuard, Ownable {
    using SafeMath for uint256;
    using Address for address;
    bool public stopped = false;
    
    IUniswapV2Factory private constant uniswapv2factoryaddress233 = IUniswapV2Factory(	//inject NONSTANDARD NAMING
        0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f
    );
    
    IBalancerUnZap public balancerZapOut;
    IUniswapV2ZapIn public uniswapV2ZapIn;
    IBalancerZapInGen public balancerZapIn;
    IUniswapV2ZapOut public uniswapV2ZapOut;
    
    constructor (
        address _balancerZapIn,
        address _balancerZapOut,
        address _uniswapV2ZapIn,
        address _uniswapV2ZapOut
    ) public {
        balancerZapOut = IBalancerUnZap(_balancerZapOut);
        uniswapV2ZapIn = IUniswapV2ZapIn(_uniswapV2ZapIn);
        balancerZapIn = IBalancerZapInGen(_balancerZapIn);
        uniswapV2ZapOut = IUniswapV2ZapOut(_uniswapV2ZapOut);
    }
    
    // circuit breaker modifiers
    modifier STOPINEMERGENCY445 {	//inject NONSTANDARD NAMING
        if (stopped) {
            revert("Temporarily Paused");
        } else {
            _;
        }
    }

    function PIPEBALANCERUNIV2358(	//inject NONSTANDARD NAMING
        address _FromBalancerPoolAddress,
        uint256 _IncomingBPT,
        address _toUniswapPoolAddress,
        address _toWhomToIssue,
        uint256 _minUniV2Tokens
    ) public NONREENTRANT277 STOPINEMERGENCY445 returns(uint256){
        // Get BPT
        IERC20(_FromBalancerPoolAddress).TRANSFERFROM460(
            msg.sender,
            address(this),
            _IncomingBPT
        );
        // Approve BalUnZap
        IERC20(_FromBalancerPoolAddress).APPROVE588(
            address(balancerZapOut),
            _IncomingBPT
        );
        
        // Get pair addresses from UniV2Pair
        address token0 = IUniswapV2Pair(_toUniswapPoolAddress).TOKEN0437();
        address token1 = IUniswapV2Pair(_toUniswapPoolAddress).TOKEN1429();

        address zapOutToToken = address(0);
        if(IBPool(_FromBalancerPoolAddress).ISBOUND318(token0)) {
            zapOutToToken=token0;
        } else if(IBPool(_FromBalancerPoolAddress).ISBOUND318(token1)) {
            zapOutToToken=token1;
        }

        // ZapOut from Balancer
        uint zappedOutAmt = balancerZapOut.EASYZAPOUT45(
            zapOutToToken,
            _FromBalancerPoolAddress,
            _IncomingBPT,
            0
        );
        
        uint LPTBought;
        if(zapOutToToken == address(0)) {
            // use ETH to ZapIn to UNIV2
            LPTBought = uniswapV2ZapIn.ZAPIN148.value(zappedOutAmt)(
                _toWhomToIssue,
                address(0),
                token0,
                token1,
                0,
                _minUniV2Tokens
            );
        } else {
            IERC20(zapOutToToken).APPROVE588(
                address(uniswapV2ZapIn),
                IERC20(zapOutToToken).BALANCEOF143(address(this))
            );
            LPTBought = uniswapV2ZapIn.ZAPIN148.value(0)(
                _toWhomToIssue,
                zapOutToToken,
                token0,
                token1,
                zappedOutAmt,
                _minUniV2Tokens
            );
        }

        return LPTBought;
    }

    function PIPEUNIV2BALANCER213(	//inject NONSTANDARD NAMING
        address _FromUniswapPoolAddress,
        uint256 _IncomingLPT,
        address _ToBalancerPoolAddress,
        address _toWhomToIssue,
        uint256 _minBPTokens
    ) public NONREENTRANT277 STOPINEMERGENCY445 returns(uint256){
        
        // Get LPT
        IERC20(_FromUniswapPoolAddress).TRANSFERFROM460(
            msg.sender,
            address(this),
            _IncomingLPT
        ); 
        
        // Approve UniUnZap
        IERC20(_FromUniswapPoolAddress).APPROVE588(
            address(uniswapV2ZapOut),
            _IncomingLPT
        );
        
        // Get pair addresses from UniV2Pair
        address token0 = IUniswapV2Pair(_FromUniswapPoolAddress).TOKEN0437();
        address token1 = IUniswapV2Pair(_FromUniswapPoolAddress).TOKEN1429();
        
        address zapOutToToken = address(0);
        if(IBPool(_ToBalancerPoolAddress).ISBOUND318(token0)) {
            zapOutToToken=token0;
        } else if(IBPool(_ToBalancerPoolAddress).ISBOUND318(token1)) {
            zapOutToToken=token1;
        }
        
        // ZapOut from Uni
        uint tokensRec = uniswapV2ZapOut.ZAPOUT881(
            zapOutToToken,
            _FromUniswapPoolAddress,
            _IncomingLPT,
            0
        );
        
        // ZapIn to Balancer
        uint BPTBought;
        if(zapOutToToken == address(0)) {
            // use ETH to ZapIn to Balancer
            BPTBought = balancerZapIn.EASYZAPIN981.value(tokensRec)(
                address(0),
                _ToBalancerPoolAddress,
                0,
                _minBPTokens
            );
        } else {
            IERC20(zapOutToToken).APPROVE588(
                address(balancerZapIn),
                tokensRec
            );
            BPTBought = balancerZapIn.EASYZAPIN981.value(0)(
                zapOutToToken,
                _ToBalancerPoolAddress,
                tokensRec,
                _minBPTokens
            );
        }
        
        IERC20(_ToBalancerPoolAddress).TRANSFER529(
            _toWhomToIssue,
            BPTBought
        );
        
        return BPTBought;
    }
    
    
    // fallback to receive ETH
    function() external payable {}
    
    function INCASETOKENGETSSTUCK32(IERC20 _TokenAddress) public ONLYOWNER347 {	//inject NONSTANDARD NAMING
        uint256 qty = _TokenAddress.BALANCEOF143(address(this));
        _TokenAddress.TRANSFER529(OWNER822(), qty);
    }

    // - to Pause the contract
    function TOGGLECONTRACTACTIVE88() public ONLYOWNER347 {	//inject NONSTANDARD NAMING
        stopped = !stopped;
    }

    // - to withdraw any ETH balance sitting in the contract
    function WITHDRAW91() public ONLYOWNER347 {	//inject NONSTANDARD NAMING
        uint256 contractBalance = address(this).balance;
        address payable _to = OWNER822().TOPAYABLE287();
        _to.transfer(contractBalance);
    }

}