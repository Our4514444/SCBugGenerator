                                                                 

pragma solidity ^0.5.4;

                                    
contract ERC20 {
    function TOTALSUPPLY128() public view returns (uint);	//inject NONSTANDARD NAMING
    function DECIMALS460() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF379(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
    function ALLOWANCE978(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFER448(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE779(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM129(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
}

contract KyberNetwork {

    function GETEXPECTEDRATE368(	//inject NONSTANDARD NAMING
        ERC20 src,
        ERC20 dest,
        uint srcQty
    )
        public
        view
        returns (uint expectedRate, uint slippageRate);

    function TRADE66(	//inject NONSTANDARD NAMING
        ERC20 src,
        uint srcAmount,
        ERC20 dest,
        address payable destAddress,
        uint maxDestAmount,
        uint minConversionRate,
        address walletId
    )
        public
        payable
        returns(uint);
}

                                                                                         
library SafeMath {

                                                                      
    function MUL133(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                               
    function DIV534(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                  
    function SUB608(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                
    function ADD835(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                       
    function MOD294(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }

                                              
    function CEIL297(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a / b;
        if(a % b == 0) {
            return c;
        }
        else {
            return c + 1;
        }
    }
}

                                                                                                               
contract Owned {

    // The owner
    address public owner;

    event OWNERCHANGED38(address indexed _newOwner);	//inject NONSTANDARD NAMING

                                                                  
    modifier ONLYOWNER779 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Must be owner");
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

                                                                                                                                    
    function CHANGEOWNER786(address _newOwner) external ONLYOWNER779 {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "Address must not be null");
        owner = _newOwner;
        emit OWNERCHANGED38(_newOwner);
    }
}

                                                                                                                                                                     
contract Managed is Owned {

    // The managers
    mapping (address => bool) public managers;

                                                                  
    modifier ONLYMANAGER345 {	//inject NONSTANDARD NAMING
        require(managers[msg.sender] == true, "M: Must be manager");
        _;
    }

    event MANAGERADDED947(address indexed _manager);	//inject NONSTANDARD NAMING
    event MANAGERREVOKED192(address indexed _manager);	//inject NONSTANDARD NAMING

                                                                                            
    function ADDMANAGER405(address _manager) external ONLYOWNER779 {	//inject NONSTANDARD NAMING
        require(_manager != address(0), "M: Address must not be null");
        if(managers[_manager] == false) {
            managers[_manager] = true;
            emit MANAGERADDED947(_manager);
        }        
    }

                                                                                              
    function REVOKEMANAGER390(address _manager) external ONLYOWNER779 {	//inject NONSTANDARD NAMING
        require(managers[_manager] == true, "M: Target must be an existing manager");
        delete managers[_manager];
        emit MANAGERREVOKED192(_manager);
    }
}

contract TokenPriceProvider is Managed {

    // Mock token address for ETH
    address constant internal eth_token_address478 = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;	//inject NONSTANDARD NAMING

    using SafeMath for uint256;

    mapping(address => uint256) public cachedPrices;

    // Address of the KyberNetwork contract
    KyberNetwork public kyberNetwork;

    constructor(KyberNetwork _kyberNetwork) public {
        kyberNetwork = _kyberNetwork;
    }

    function SETPRICE955(ERC20 _token, uint256 _price) public ONLYMANAGER345 {	//inject NONSTANDARD NAMING
        cachedPrices[address(_token)] = _price;
    }

    function SETPRICEFORTOKENLIST421(ERC20[] calldata _tokens, uint256[] calldata _prices) external ONLYMANAGER345 {	//inject NONSTANDARD NAMING
        for(uint16 i = 0; i < _tokens.length; i++) {
            SETPRICE955(_tokens[i], _prices[i]);
        }
    }

                                                                                                                                                                                                                                                                                   
    function GETETHERVALUE113(uint256 _amount, address _token) external view returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 decimals = ERC20(_token).DECIMALS460();
        uint256 price = cachedPrices[_token];
        return price.MUL133(_amount).DIV534(10**decimals);
    }

    //
    // The following is added to be backward-compatible with Argent's old backend
    //

    function SETKYBERNETWORK390(KyberNetwork _kyberNetwork) external ONLYMANAGER345 {	//inject NONSTANDARD NAMING
        kyberNetwork = _kyberNetwork;
    }

    function SYNCPRICE712(ERC20 _token) external {	//inject NONSTANDARD NAMING
        require(address(kyberNetwork) != address(0), "Kyber sync is disabled");
        (uint256 expectedRate,) = kyberNetwork.GETEXPECTEDRATE368(_token, ERC20(eth_token_address478), 10000);
        cachedPrices[address(_token)] = expectedRate;
    }

    function SYNCPRICEFORTOKENLIST421(ERC20[] calldata _tokens) external {	//inject NONSTANDARD NAMING
        require(address(kyberNetwork) != address(0), "Kyber sync is disabled");
        for(uint16 i = 0; i < _tokens.length; i++) {
            (uint256 expectedRate,) = kyberNetwork.GETEXPECTEDRATE368(_tokens[i], ERC20(eth_token_address478), 10000);
            cachedPrices[address(_tokens[i])] = expectedRate;
        }
    }
}