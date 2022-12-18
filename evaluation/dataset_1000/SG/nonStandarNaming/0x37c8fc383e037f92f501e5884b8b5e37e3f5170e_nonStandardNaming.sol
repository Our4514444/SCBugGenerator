                                                                 

pragma solidity ^0.5.16;

                                                                                                  
interface Artd {
    function APPROVE65(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function BALANCEOF315(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
}

interface Nftfactory {
    function CURRENTSTORE171( uint256 nftId ) external view returns (uint256);	//inject NONSTANDARD NAMING
}

interface Validfactory {
    function ISVALIDFACTORY594( address _factory ) external returns (bool);	//inject NONSTANDARD NAMING
}


contract Governance {

    address public _governance;

    constructor() public {
        _governance = tx.origin;
    }

    event GOVERNANCETRANSFERRED18(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

    modifier ONLYGOVERNANCE859 {	//inject NONSTANDARD NAMING
        require(msg.sender == _governance, "not governance");
        _;
    }

    function SETGOVERNANCE125(address governance)  public  ONLYGOVERNANCE859	//inject NONSTANDARD NAMING
    {
        require(governance != address(0), "new governance the zero address");
        emit GOVERNANCETRANSFERRED18(_governance, governance);
        _governance = governance;
    }

}


                                                                                          
library SafeMath {
    int256 constant private int256_min696 = -2**255;	//inject NONSTANDARD NAMING

                                                                                
    function MUL743(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                              
    function MUL743(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        require(!(a == -1 && b == int256_min696)); // This is the only case of overflow not detected by the check below

        int256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                         
    function DIV998(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                       
    function DIV998(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
        require(b != 0); // Solidity only automatically asserts when dividing by 0
        require(!(b == -1 && a == int256_min696)); // This is the only case of overflow

        int256 c = a / b;

        return c;
    }

                                                                                                                            
    function SUB980(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                             
    function SUB980(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
        int256 c = a - b;
        require((b >= 0 && c <= a) || (b < 0 && c > a));

        return c;
    }

                                                                          
    function ADD6(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                        
    function ADD6(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
        int256 c = a + b;
        require((b >= 0 && c >= a) || (b < 0 && c < a));

        return c;
    }

                                                                                                                                                 
    function MOD455(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

                                                           
library Address {
                                                                                                                                                                                                                                                                                                                                                                   
    function ISCONTRACT599(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint256 size;
        // XXX Currently there is no better way to check if there is a contract in an address
        // than to check the size of the code at that address.
        // See https://ethereum.stackexchange.com/a/14016/36603
        // for more details about how this works.
        // TODO Check this again before the Serenity release, because all addresses will be
        // contracts then.
        // solium-disable-next-line security/no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}


contract ARTDfundpool is Governance{
    using SafeMath for uint256;
    using Address for address;

    address public ARTDaddress =  address(0xA23F8462d90dbc60a06B9226206bFACdEAD2A26F);
    address public valider = address(0x58F62d9B184BE5D7eE6881854DD16898Afe0cf90);
    address private _factory = address(0);
    
    event APPROVE482(address newfactory, uint256 amount);	//inject NONSTANDARD NAMING
    event NEWFACTORY129(address newfactory);	//inject NONSTANDARD NAMING
      
    constructor() public {}

    function NEWFACTORY552(address factory) public ONLYGOVERNANCE859	//inject NONSTANDARD NAMING
    {
        Validfactory _valid = Validfactory(valider);
        require( _valid.ISVALIDFACTORY594(factory), "Invalid factory");
        
        _factory = factory;
        
        emit NEWFACTORY129(factory);
    }

    function APPROVE65(address factory, uint256 amount) public 	//inject NONSTANDARD NAMING
    {
        Validfactory _valid = Validfactory(valider);
        require( _valid.ISVALIDFACTORY594(factory), "Invalid factory");

        Artd _artd =  Artd( ARTDaddress );
        _artd.APPROVE65( factory, amount );
        
        emit APPROVE482(factory, amount);
    }
    
    function FACTORY534() external view returns (address) 	//inject NONSTANDARD NAMING
    {
        return _factory;   
    } 
    
                                                                         
    function STOREOF598(uint256 nftId) external view returns (uint256) 	//inject NONSTANDARD NAMING
    {
        Nftfactory factory_x =  Nftfactory( _factory );
        return factory_x.CURRENTSTORE171(nftId);
    }

                                                                   
    function TOTALBALANCE402() external view returns (uint256) 	//inject NONSTANDARD NAMING
    {
        Artd _artd =  Artd( ARTDaddress );
        return _artd.BALANCEOF315(address(this));
    }
    
}