                                                                 

pragma solidity 0.5.16;

// File: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.3.0/contracts/ownership/Ownable.sol

                                                                                                                                                                                                                                                                                                                                                                       
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED735(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED735(address(0), _owner);
    }

                                                                     
    function OWNER79() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER828() {	//inject NONSTANDARD NAMING
        require(ISOWNER727(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER727() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                 
    function RENOUNCEOWNERSHIP899() public ONLYOWNER828 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED735(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP770(address newOwner) public ONLYOWNER828 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP209(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP209(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED735(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: browser/ExampleExchangeThief.sol

interface IFlashWETH {
    function DEPOSIT868() external payable;	//inject NONSTANDARD NAMING
    function WITHDRAW156(uint256) external;	//inject NONSTANDARD NAMING
    function FLASHMINT984(uint256) external;	//inject NONSTANDARD NAMING
    function TOTALSUPPLY684() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF550(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER734(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE621(address, address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE223(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM981(address, address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER546(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL270(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

interface IExchange {
    function DEPOSITETH315() external;	//inject NONSTANDARD NAMING
    function DEPOSITFWETH842(uint256) external;	//inject NONSTANDARD NAMING
    function WITHDRAWETH164(uint256) external;	//inject NONSTANDARD NAMING
    function WITHDRAWFWETH892(uint256) external;	//inject NONSTANDARD NAMING
    function INTERNALSWAPTOETH537(uint256) external;	//inject NONSTANDARD NAMING
    function INTERNALSWAPTOFWETH189(uint256) external;	//inject NONSTANDARD NAMING
    function ETHBALANCE508() external returns (uint256);	//inject NONSTANDARD NAMING
    function FWETHBALANCE908() external returns (uint256);	//inject NONSTANDARD NAMING
    function FWETH87() external returns (address);	//inject NONSTANDARD NAMING
}

// @title ExampleExchangeThief
// @notice An example contract that "exploits" the fact that the Exchange contract accepts
// unbacked fWETH during flash-mints in exchange for ETH.
// @dev This is just a boilerplate example to get bug-bounty hunters up and running.
// @dev This contract flash-mints unbacked fWETH and uses it to buy all of the Exchange's ETH.
// But since flash-minting requires burning the same number of fWETH that you minted, the fWETH held by the 
// Exchange end's up being fully backed by real ETH. So there is no actual "theft" happening here.
contract ExampleExchangeThief is Ownable {

    IExchange public exchange = IExchange(0x5d84fC93A6a8161873a315C233Fbd79A88280079); // address of Exchange contract
    IFlashWETH public fWETH = IFlashWETH(exchange.FWETH87()); // address of FlashWETH contract

    // required to receive ETH in case you want to `withdraw` some fWETH for real ETH during `executeOnFlashMint`
    function () external payable {}

    // call this function to fire off your flash mint
    function BEGINFLASHMINT192() public payable ONLYOWNER828 {	//inject NONSTANDARD NAMING
        // We are going to use a flash-mint to "steal" all the ETH from the exchange
        // First, rebalance the exchange so that it is holding the maximum amount of ETH:
        exchange.INTERNALSWAPTOETH537(exchange.FWETHBALANCE908());
        // Second, we'll flash-mint enough fWETH to "steal" all the ETH in the exchange:
        fWETH.FLASHMINT984(exchange.ETHBALANCE508()); // this triggers the `executeOnFlashMint` function below
    }

    // this is what executes during your flash mint
    function EXECUTEONFLASHMINT929(uint256 amount) external {	//inject NONSTANDARD NAMING
        // when this fires off, this contract holds `amount` new, unbacked fWETH
        require(msg.sender == address(fWETH), "only FlashWETH can execute");
        // Third, we'll deposit our unbacked fWETH into the exchange:
        fWETH.APPROVE223(address(exchange), amount);
        exchange.DEPOSITFWETH842(amount);
        // Fourth, we'll withdraw all the ETH from the exchange to this contract
        exchange.WITHDRAWETH164(amount);
        // YAY! We "stole" all the ETH from the exchange!!! Those suckers accepted unbacked fWETH and gave us all their ETH!
        // However, our transaction will fail unless we burn `amount` fWETH by the end of this transaction.
        // But we don't have any fWETH because we already sent it all to the exchange.
        // That's okay, we can get some more fWETH from the FlashWETH contract by sending it some of our ETH:
        fWETH.DEPOSIT868.value(amount)();
        // Cool, now this contract holds the amount of fWETH needed to complete the transaction.
        // (Unfortunately, it cost us all of the ETH we "stole" from the exchange contract, so we ended up breaking even)
        // (And now all the fWETH that the exchange contract is holding is backed by real ETH. So I guess we really didn't "steal" anything.)
    }

    // ========================
    //  BASIC WALLET FUNCTIONS
    // ========================

    function WITHDRAWMYETH182() public ONLYOWNER828 {	//inject NONSTANDARD NAMING
        msg.sender.transfer(address(this).balance);
    }

    function WITHDRAWMYFWETH419() public ONLYOWNER828 {	//inject NONSTANDARD NAMING
        fWETH.TRANSFER734(msg.sender, fWETH.BALANCEOF550(address(this)));
    }

    // =========
    //  GETTERS
    // =========

    function ETHBALANCE508() external view returns (uint256) { return address(this).balance; }	//inject NONSTANDARD NAMING
    function FWETHBALANCE908() external view returns (uint256) { return fWETH.BALANCEOF550(address(this)); }	//inject NONSTANDARD NAMING
}