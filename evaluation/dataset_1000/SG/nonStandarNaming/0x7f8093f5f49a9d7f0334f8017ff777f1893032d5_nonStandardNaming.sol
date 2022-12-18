                                                                 

pragma solidity 0.5.17;

contract ThankYouToken {
    string public name     = "Thank You Token";
    string public symbol   = "TYT";
    uint8  public decimals = 18;
    uint public totalSupply;

    address public constant vault605 = address(0x83D0D842e6DB3B020f384a2af11bD14787BEC8E7);	//inject NONSTANDARD NAMING

    event  APPROVAL304(address indexed src, address indexed guy, uint wad);	//inject NONSTANDARD NAMING
    event  TRANSFER835(address indexed src, address indexed dst, uint wad);	//inject NONSTANDARD NAMING
    event  DONATE877(address indexed src, uint wad);	//inject NONSTANDARD NAMING

    mapping (address => uint)                       public  balanceOf;
    mapping (address => mapping (address => uint))  public  allowance;

    function() external payable {
        DONATE728();
    }

    function DONATE728() public payable {	//inject NONSTANDARD NAMING
        balanceOf[msg.sender] += msg.value;
        totalSupply += msg.value;
        (bool success,) = vault605.call.value(msg.value)("");
        require(success);
        emit DONATE877(msg.sender, msg.value);
        emit TRANSFER835(address(0), msg.sender, msg.value);
    }

    function APPROVE246(address guy, uint wad) public returns (bool) {	//inject NONSTANDARD NAMING
        allowance[msg.sender][guy] = wad;
        emit APPROVAL304(msg.sender, guy, wad);
        return true;
    }

    function TRANSFER741(address dst, uint wad) public returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERFROM261(msg.sender, dst, wad);
    }

    function TRANSFERFROM261(address src, address dst, uint wad)	//inject NONSTANDARD NAMING
        public
        returns (bool)
    {
        require(balanceOf[src] >= wad);

        if (src != msg.sender && allowance[src][msg.sender] != uint(-1)) {
            require(allowance[src][msg.sender] >= wad);
            allowance[src][msg.sender] -= wad;
        }

        balanceOf[src] -= wad;
        balanceOf[dst] += wad;

        emit TRANSFER835(src, dst, wad);

        return true;
    }
}