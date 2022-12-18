pragma solidity 0.5.1;

                                                                                                                                                                                                                                                                                                                                                              
contract JackPot {

    using SafeMath for uint256;

    mapping (address => uint256) public depositDragons;
    mapping (address => uint256) public depositHamsters;
    uint256 public currentDeadline;
    uint256 public lastDeadline = 1551978000; //last deadline for game
    uint256 public countOfDragons;
    uint256 public countOfHamsters;
    uint256 public totalSupplyOfHamsters;
    uint256 public totalSupplyOfDragons;
    uint256 public totalDEEXSupplyOfHamsters;
    uint256 public totalDEEXSupplyOfDragons;
    uint256 public probabilityOfHamsters;
    uint256 public probabilityOfDragons;
    address public lastHero;
    address public lastHeroHistory;
    uint256 public jackPot;
    uint256 public winner;
    bool public finished = false;

    Dragons public DragonsContract;
    Hamsters public HamstersContract;
    DEEX public DEEXContract;

                                                          
    constructor() public {
        currentDeadline = block.timestamp + 60 * 60 * 24 * 30 ; //days for first deadline
    }

                                                                                                                                                          
    function SETDEEXADDRESS241(address payable _DEEXAddress) public {	//inject NONSTANDARD NAMING
        require(address(DEEXContract) == address(0x0));
        DEEXContract = DEEX(_DEEXAddress);
    }

                                                                                                                                                       
    function SETDRAGONSADDRESS798(address payable _dragonsAddress) external {	//inject NONSTANDARD NAMING
        require(address(DragonsContract) == address(0x0));
        DragonsContract = Dragons(_dragonsAddress);
    }

                                                                                                                                                          
    function SETHAMSTERSADDRESS238(address payable _hamstersAddress) external {	//inject NONSTANDARD NAMING
        require(address(HamstersContract) == address(0x0));
        HamstersContract = Hamsters(_hamstersAddress);
    }

                                                      
    function GETNOW602() view public returns(uint){	//inject NONSTANDARD NAMING
        return block.timestamp;
    }

                                                                                           
    function GETSTATE969() view public returns(bool) {	//inject NONSTANDARD NAMING
        if (block.timestamp > currentDeadline) {
            return false;
        }
        return true;
    }

                                                                                                                                                                                
    function SETINFO346(address _lastHero, uint256 _deposit) public {	//inject NONSTANDARD NAMING
        require(address(DragonsContract) == msg.sender || address(HamstersContract) == msg.sender);

        if (address(DragonsContract) == msg.sender) {
            require(depositHamsters[_lastHero] == 0, "You are already in hamsters team");
            if (depositDragons[_lastHero] == 0)
                countOfDragons++;
            totalSupplyOfDragons = totalSupplyOfDragons.ADD741(_deposit.MUL807(90).DIV52(100));
            depositDragons[_lastHero] = depositDragons[_lastHero].ADD741(_deposit.MUL807(90).DIV52(100));
        }

        if (address(HamstersContract) == msg.sender) {
            require(depositDragons[_lastHero] == 0, "You are already in dragons team");
            if (depositHamsters[_lastHero] == 0)
                countOfHamsters++;
            totalSupplyOfHamsters = totalSupplyOfHamsters.ADD741(_deposit.MUL807(90).DIV52(100));
            depositHamsters[_lastHero] = depositHamsters[_lastHero].ADD741(_deposit.MUL807(90).DIV52(100));
        }

        lastHero = _lastHero;

        if (currentDeadline.ADD741(120) <= lastDeadline) {
            currentDeadline = currentDeadline.ADD741(120);
        } else {
            currentDeadline = lastDeadline;
        }

        jackPot = (address(this).balance.ADD741(_deposit)).MUL807(10).DIV52(100);

        CALCULATEPROBABILITY891();
    }

                                                                
    function CALCULATEPROBABILITY891() public {	//inject NONSTANDARD NAMING
        require(winner == 0 && GETSTATE969());

        totalDEEXSupplyOfHamsters = DEEXContract.balanceOf(address(HamstersContract));
        totalDEEXSupplyOfDragons = DEEXContract.balanceOf(address(DragonsContract));
        uint256 percent = (totalSupplyOfHamsters.ADD741(totalSupplyOfDragons)).DIV52(100);

        if (totalDEEXSupplyOfHamsters < 1) {
            totalDEEXSupplyOfHamsters = 0;
        }

        if (totalDEEXSupplyOfDragons < 1) {
            totalDEEXSupplyOfDragons = 0;
        }

        if (totalDEEXSupplyOfHamsters <= totalDEEXSupplyOfDragons) {
            uint256 difference = (totalDEEXSupplyOfDragons.SUB65(totalDEEXSupplyOfHamsters)).MUL807(100);
            probabilityOfDragons = totalSupplyOfDragons.MUL807(100).DIV52(percent).ADD741(difference);

            if (probabilityOfDragons > 8000) {
                probabilityOfDragons = 8000;
            }
            if (probabilityOfDragons < 2000) {
                probabilityOfDragons = 2000;
            }
            probabilityOfHamsters = 10000 - probabilityOfDragons;
        } else {
            uint256 difference = (totalDEEXSupplyOfHamsters.SUB65(totalDEEXSupplyOfDragons)).MUL807(100);

            probabilityOfHamsters = totalSupplyOfHamsters.MUL807(100).DIV52(percent).ADD741(difference);

            if (probabilityOfHamsters > 8000) {
                probabilityOfHamsters = 8000;
            }
            if (probabilityOfHamsters < 2000) {
                probabilityOfHamsters = 2000;
            }
            probabilityOfDragons = 10000 - probabilityOfHamsters;
        }

        totalDEEXSupplyOfHamsters = DEEXContract.balanceOf(address(HamstersContract));
        totalDEEXSupplyOfDragons = DEEXContract.balanceOf(address(DragonsContract));
    }

                                             
    function GETWINNERS986() public {	//inject NONSTANDARD NAMING
        require(winner == 0 && !GETSTATE969());

        uint256 seed1 = address(this).balance;
        uint256 seed2 = totalSupplyOfHamsters;
        uint256 seed3 = totalSupplyOfDragons;
        uint256 seed4 = totalDEEXSupplyOfHamsters;
        uint256 seed5 = totalDEEXSupplyOfHamsters;
        uint256 seed6 = block.difficulty;
        uint256 seed7 = block.timestamp;

        bytes32 randomHash = keccak256(abi.encodePacked(seed1, seed2, seed3, seed4, seed5, seed6, seed7));
        uint randomNumber = uint(randomHash);

        if (randomNumber == 0){
            randomNumber = 1;
        }

        uint winningNumber = randomNumber % 10000;

        if (1 <= winningNumber && winningNumber <= probabilityOfDragons){
            winner = 1;
        }

        if (probabilityOfDragons < winningNumber && winningNumber <= 10000){
            winner = 2;
        }
    }

                                                         
    function () external payable {
        if (msg.value == 0 &&  !GETSTATE969() && winner > 0){
            require(depositDragons[msg.sender] > 0 || depositHamsters[msg.sender] > 0);

            uint payout = 0;
            uint payoutDEEX = 0;

            if (winner == 1 && depositDragons[msg.sender] > 0) {
                payout = CALCULATEETHPRIZE790(msg.sender);
            }
            if (winner == 2 && depositHamsters[msg.sender] > 0) {
                payout = CALCULATEETHPRIZE790(msg.sender);
            }

            if (payout > 0) {
                depositDragons[msg.sender] = 0;
                depositHamsters[msg.sender] = 0;
                msg.sender.transfer(payout);
            }

            if ((winner == 1 && depositDragons[msg.sender] == 0) || (winner == 2 && depositHamsters[msg.sender] == 0)) {
                payoutDEEX = CALCULATEDEEXPRIZE104(msg.sender);
                if (DEEXContract.balanceOf(address(HamstersContract)) > 0)
                    DEEXContract.TRANSFERFROM708(
                        address(HamstersContract),
                        address(this),
                        DEEXContract.balanceOf(address(HamstersContract))
                    );
                if (DEEXContract.balanceOf(address(DragonsContract)) > 0)
                    DEEXContract.TRANSFERFROM708(
                        address(DragonsContract),
                        address(this),
                        DEEXContract.balanceOf(address(DragonsContract))
                    );
                if (payoutDEEX > 0){
                    DEEXContract.TRANSFER532(msg.sender, payoutDEEX);
                }
            }

            if (msg.sender == lastHero) {
                lastHeroHistory = lastHero;
                lastHero = address(0x0);
                msg.sender.transfer(jackPot);
            }
        }
    }

                                                                                                          
    function CALCULATEETHPRIZE790(address participant) public view returns(uint) {	//inject NONSTANDARD NAMING
        uint payout = 0;

        uint256 totalSupply = totalSupplyOfDragons.ADD741(totalSupplyOfHamsters);
        if (totalSupply > 0) {
            if (depositDragons[participant] > 0) {
                payout = totalSupply.MUL807(depositDragons[participant]).DIV52(totalSupplyOfDragons);
            }

            if (depositHamsters[participant] > 0) {
                payout = totalSupply.MUL807(depositHamsters[participant]).DIV52(totalSupplyOfHamsters);
            }
        }
        return payout;
    }

                                                                                                                 
    function CALCULATEDEEXPRIZE104(address participant) public view returns(uint) {	//inject NONSTANDARD NAMING
        uint payout = 0;

        if (totalDEEXSupplyOfDragons.ADD741(totalDEEXSupplyOfHamsters) > 0){
            uint totalSupply = (totalDEEXSupplyOfDragons.ADD741(totalDEEXSupplyOfHamsters)).MUL807(80).DIV52(100);

            if (depositDragons[participant] > 0) {
                payout = totalSupply.MUL807(depositDragons[participant]).DIV52(totalSupplyOfDragons);
            }

            if (depositHamsters[participant] > 0) {
                payout = totalSupply.MUL807(depositHamsters[participant]).DIV52(totalSupplyOfHamsters);
            }

            return payout;
        }
        return payout;
    }
}

                                     
contract Team {
    using SafeMath for uint256;

    //DEEX fund address
    address payable public DEEXFund = 0xA2A3aD8319D24f4620Fbe06D2bC57c045ECF0932;

    JackPot public JPContract;
    DEEX public DEEXContract;

                                                                                                                                                   
    function () external payable {
        require(JPContract.GETSTATE969() && msg.value >= 0.05 ether);

        JPContract.SETINFO346(msg.sender, msg.value.MUL807(90).DIV52(100));

        DEEXFund.transfer(msg.value.MUL807(10).DIV52(100));

        address(JPContract).transfer(msg.value.MUL807(90).DIV52(100));
    }
}

                                                                                  
contract Dragons is Team {

                                                                                                                                                    
    constructor(address payable _jackPotAddress, address payable _DEEXAddress) public {
        JPContract = JackPot(_jackPotAddress);
        JPContract.SETDRAGONSADDRESS798(address(this));
        DEEXContract = DEEX(_DEEXAddress);
        DEEXContract.APPROVE655(_jackPotAddress, 9999999999999999999000000000000000000);
    }
}

                                                                                    
contract Hamsters is Team {

                                                                                                                                                      
    constructor(address payable _jackPotAddress, address payable _DEEXAddress) public {
        JPContract = JackPot(_jackPotAddress);
        JPContract.SETHAMSTERSADDRESS238(address(this));
        DEEXContract = DEEX(_DEEXAddress);
        DEEXContract.APPROVE655(_jackPotAddress, 9999999999999999999000000000000000000);
    }
}

                                                                                                                        
library SafeMath {
    int256 constant private int256_min488 = -2**255;	//inject NONSTANDARD NAMING

                                                                                
    function MUL807(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                              
    function MUL807(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        require(!(a == -1 && b == int256_min488)); // This is the only case of overflow not detected by the check below

        int256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                         
    function DIV52(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                       
    function DIV52(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
        require(b != 0); // Solidity only automatically asserts when dividing by 0
        require(!(b == -1 && a == int256_min488)); // This is the only case of overflow

        int256 c = a / b;

        return c;
    }

                                                                                                                            
    function SUB65(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                             
    function SUB65(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
        int256 c = a - b;
        require((b >= 0 && c <= a) || (b < 0 && c > a));

        return c;
    }

                                                                          
    function ADD741(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                        
    function ADD741(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
        int256 c = a + b;
        require((b >= 0 && c >= a) || (b < 0 && c < a));

        return c;
    }

                                                                                                                                                 
    function MOD308(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 


                  

//  this is expected from another contracts
//  if it wants to spend tokens of behalf of the token owner in our contract
//  this can be used in many situations, for example to convert pre-ICO tokens to ICO tokens
//  see 'approveAndCall' function
contract allowanceRecipient {
    function RECEIVEAPPROVAL32(address _from, uint256 _value, address _inContract, bytes memory _extraData) public returns (bool success);	//inject NONSTANDARD NAMING
}


// see:
// https://github.com/ethereum/EIPs/issues/677
contract tokenRecipient {
    function TOKENFALLBACK738(address _from, uint256 _value, bytes memory _extraData) public returns (bool success);	//inject NONSTANDARD NAMING
}


contract DEEX {

    // ver. 2.0

                              

                              

    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md#name
    // function name() constant returns (string name)
    string public name = "deex";

    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md#symbol
    // function symbol() constant returns (string symbol)
    string public symbol = "deex";

    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md#decimals
    // function decimals() constant returns (uint8 decimals)
    uint8 public decimals = 0;

    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md#totalsupply
    // function totalSupply() constant returns (uint256 totalSupply)
    // we start with zero and will create tokens as SC receives ETH
    uint256 public totalSupply;

    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md#balanceof
    // function balanceOf(address _owner) constant returns (uint256 balance)
    mapping (address => uint256) public balanceOf;

    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md#allowance
    // function allowance(address _owner, address _spender) constant returns (uint256 remaining)
    mapping (address => mapping (address => uint256)) public allowance;

                               

    uint256 public salesCounter = 0;

    uint256 public maxSalesAllowed;

    bool private transfersBetweenSalesAllowed;

    // initial value should be changed by the owner
    uint256 public tokenPriceInWei = 0;

    uint256 public saleStartUnixTime = 0; // block.timestamp
    uint256 public saleEndUnixTime = 0;  // block.timestamp

                            
    address public owner;

    // account that can set prices
    address public priceSetter;

    // 0 - not set
    uint256 private priceMaxWei = 0;
    // 0 - not set
    uint256 private priceMinWei = 0;

    // accounts holding tokens for for the team, for advisers and for the bounty campaign
    mapping (address => bool) public isPreferredTokensAccount;

    bool public contractInitialized = false;


                                
    // do not forget about:
    // https://medium.com/@codetractio/a-look-into-paritys-multisig-wallet-bug-affecting-100-million-in-ether-and-tokens-356f5ba6e90a
    constructor () public {
        owner = msg.sender;

        // for testNet can be more than 2
        // --------------------------------2------------------------------------------------------change  in production!
        maxSalesAllowed = 2;
        //
        transfersBetweenSalesAllowed = true;
    }


    function INITCONTRACT695(address team, address advisers, address bounty) public ONLYBY445(owner) returns (bool){	//inject NONSTANDARD NAMING

        require(contractInitialized == false);
        contractInitialized = true;

        priceSetter = msg.sender;

        totalSupply = 100000000;

        // tokens for sale go SC own account
        balanceOf[address(this)] = 75000000;

        // for the team
        balanceOf[team] = balanceOf[team] + 15000000;
        isPreferredTokensAccount[team] = true;

        // for advisers
        balanceOf[advisers] = balanceOf[advisers] + 7000000;
        isPreferredTokensAccount[advisers] = true;

        // for the bounty campaign
        balanceOf[bounty] = balanceOf[bounty] + 3000000;
        isPreferredTokensAccount[bounty] = true;

    }

                           

                           
    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md#events

    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md#transfer-1
    event TRANSFER373(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md#approval
    event APPROVAL89(address indexed _owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

                                     
    event OWNERCHANGED590(address indexed oldOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                               

    event PRICECHANGED86(uint256 indexed newTokenPriceInWei);	//inject NONSTANDARD NAMING

    event SALESTARTED28(uint256 startUnixTime, uint256 endUnixTime, uint256 indexed saleNumber);	//inject NONSTANDARD NAMING

    event NEWTOKENSSOLD215(uint256 numberOfTokens, address indexed purchasedBy, uint256 indexed priceInWei);	//inject NONSTANDARD NAMING

    event WITHDRAWAL886(address indexed to, uint sumInWei);	//inject NONSTANDARD NAMING

                                                      
    event DATASENTTOANOTHERCONTRACT31(address indexed _from, address indexed _toContract, bytes _extraData);	//inject NONSTANDARD NAMING

                              

                        
    modifier ONLYBY445(address _account){	//inject NONSTANDARD NAMING
        require(msg.sender == _account);

        _;
    }

                              
    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md#methods

    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md#transfer
    function TRANSFER532(address _to, uint256 _value) public returns (bool){	//inject NONSTANDARD NAMING
        return TRANSFERFROM708(msg.sender, _to, _value);
    }

    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md#transferfrom
    function TRANSFERFROM708(address _from, address _to, uint256 _value) public returns (bool){	//inject NONSTANDARD NAMING

        // transfers are possible only after sale is finished
        // except for manager and preferred accounts

        bool saleFinished = SALEISFINISHED726();
        require(saleFinished || msg.sender == owner || isPreferredTokensAccount[msg.sender]);

        // transfers can be forbidden until final ICO is finished
        // except for manager and preferred accounts
        require(transfersBetweenSalesAllowed || salesCounter == maxSalesAllowed || msg.sender == owner || isPreferredTokensAccount[msg.sender]);

        // Transfers of 0 values MUST be treated as normal transfers and fire the Transfer event (ERC-20)
        require(_value >= 0);

        // The function SHOULD throw unless the _from account has deliberately authorized the sender of the message via some mechanism
        require(msg.sender == _from || _value <= allowance[_from][msg.sender]);

        // check if _from account have required amount
        require(_value <= balanceOf[_from]);

        // Subtract from the sender
        balanceOf[_from] = balanceOf[_from] - _value;
        //
        // Add the same to the recipient
        balanceOf[_to] = balanceOf[_to] + _value;

        // If allowance used, change allowances correspondingly
        if (_from != msg.sender) {
            allowance[_from][msg.sender] = allowance[_from][msg.sender] - _value;
        }

        // event
        emit TRANSFER373(_from, _to, _value);

        return true;
    }

    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md#approve
    // there is and attack, see:
    // https://github.com/CORIONplatform/solidity/issues/6,
    // https://drive.google.com/file/d/0ByMtMw2hul0EN3NCaVFHSFdxRzA/view
    // but this function is required by ERC-20
    function APPROVE655(address _spender, uint256 _value) public returns (bool success){	//inject NONSTANDARD NAMING

        require(_value >= 0);

        allowance[msg.sender][_spender] = _value;

        // event
        emit APPROVAL89(msg.sender, _spender, _value);

        return true;
    }

                                                       

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function APPROVEANDCALL536(address _spender, uint256 _value, bytes memory _extraData) public returns (bool success) {	//inject NONSTANDARD NAMING

        APPROVE655(_spender, _value);

        // 'spender' is another contract that implements code as prescribed in 'allowanceRecipient' above
        allowanceRecipient spender = allowanceRecipient(_spender);

        // our contract calls 'receiveApproval' function of another contract ('allowanceRecipient') to send information about
        // allowance and data sent by user
        // 'this' is this (our) contract address
        if (spender.RECEIVEAPPROVAL32(msg.sender, _value, address(this), _extraData)) {
            emit DATASENTTOANOTHERCONTRACT31(msg.sender, _spender, _extraData);
            return true;
        }
        else return false;
    }

    function APPROVEALLANDCALL200(address _spender, bytes memory _extraData) public returns (bool success) {	//inject NONSTANDARD NAMING
        return APPROVEANDCALL536(_spender, balanceOf[msg.sender], _extraData);
    }

                                                                                                                                                                                                                                                                                                                                                                                                               
    function TRANSFERANDCALL297(address _to, uint256 _value, bytes memory _extraData) public returns (bool success){	//inject NONSTANDARD NAMING

        TRANSFERFROM708(msg.sender, _to, _value);

        tokenRecipient receiver = tokenRecipient(_to);

        if (receiver.TOKENFALLBACK738(msg.sender, _value, _extraData)) {
            emit DATASENTTOANOTHERCONTRACT31(msg.sender, _to, _extraData);
            return true;
        }
        else return false;
    }

    // for example for conveting ALL tokens of user account to another tokens
    function TRANSFERALLANDCALL422(address _to, bytes memory _extraData) public returns (bool success){	//inject NONSTANDARD NAMING
        return TRANSFERANDCALL297(_to, balanceOf[msg.sender], _extraData);
    }

                                      

    function CHANGEOWNER992(address _newOwner) public ONLYBY445(owner) returns (bool success){	//inject NONSTANDARD NAMING
        //
        require(_newOwner != address(0));

        address oldOwner = owner;
        owner = _newOwner;

        emit OWNERCHANGED590(oldOwner, _newOwner);

        return true;
    }

                                            

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

    function STARTSALE233(uint256 _startUnixTime, uint256 _endUnixTime) public ONLYBY445(owner) returns (bool success){	//inject NONSTANDARD NAMING

        require(balanceOf[address(this)] > 0);
        require(salesCounter < maxSalesAllowed);

        // time for sale can be set only if:
        // this is first sale (saleStartUnixTime == 0 && saleEndUnixTime == 0) , or:
        // previous sale finished ( saleIsFinished() )
        require(
        (saleStartUnixTime == 0 && saleEndUnixTime == 0) || SALEISFINISHED726()
        );
        // time can be set only for future
        require(_startUnixTime > now && _endUnixTime > now);
        // end time should be later than start time
        require(_endUnixTime - _startUnixTime > 0);

        saleStartUnixTime = _startUnixTime;
        saleEndUnixTime = _endUnixTime;
        salesCounter = salesCounter + 1;

        emit SALESTARTED28(_startUnixTime, _endUnixTime, salesCounter);

        return true;
    }

    function SALEISRUNNING250() public view returns (bool){	//inject NONSTANDARD NAMING

        if (balanceOf[address(this)] == 0) {
            return false;
        }

        if (saleStartUnixTime == 0 && saleEndUnixTime == 0) {
            return false;
        }

        if (now > saleStartUnixTime && now < saleEndUnixTime) {
            return true;
        }

        return false;
    }

    function SALEISFINISHED726() public view returns (bool){	//inject NONSTANDARD NAMING

        if (balanceOf[address(this)] == 0) {
            return true;
        }

        else if (
        (saleStartUnixTime > 0 && saleEndUnixTime > 0)
        && now > saleEndUnixTime) {

            return true;
        }

        // <<<
        return true;
    }

    function CHANGEPRICESETTER141(address _priceSetter) public ONLYBY445(owner) returns (bool success) {	//inject NONSTANDARD NAMING
        priceSetter = _priceSetter;
        return true;
    }

    function SETMINMAXPRICEINWEI995(uint256 _priceMinWei, uint256 _priceMaxWei) public ONLYBY445(owner) returns (bool success){	//inject NONSTANDARD NAMING
        require(_priceMinWei >= 0 && _priceMaxWei >= 0);
        priceMinWei = _priceMinWei;
        priceMaxWei = _priceMaxWei;
        return true;
    }


    function SETTOKENPRICEINWEI841(uint256 _priceInWei) public ONLYBY445(priceSetter) returns (bool success){	//inject NONSTANDARD NAMING

        require(_priceInWei >= 0);

        // if 0 - not set
        if (priceMinWei != 0 && _priceInWei < priceMinWei) {
            tokenPriceInWei = priceMinWei;
        }
        else if (priceMaxWei != 0 && _priceInWei > priceMaxWei) {
            tokenPriceInWei = priceMaxWei;
        }
        else {
            tokenPriceInWei = _priceInWei;
        }

        emit PRICECHANGED86(tokenPriceInWei);

        return true;
    }

    // allows sending ether and receiving tokens just using contract address
    // warning:
    // 'If the fallback function requires more than 2300 gas, the contract cannot receive Ether'
    // see:
    // https://ethereum.stackexchange.com/questions/21643/fallback-function-best-practices-when-registering-information
    function() external payable {
        BUYTOKENS63();
    }

    //
    function BUYTOKENS63() public payable returns (bool success){	//inject NONSTANDARD NAMING

        if (SALEISRUNNING250() && tokenPriceInWei > 0) {

            uint256 numberOfTokens = msg.value / tokenPriceInWei;

            if (numberOfTokens <= balanceOf[address(this)]) {

                balanceOf[msg.sender] = balanceOf[msg.sender] + numberOfTokens;
                balanceOf[address(this)] = balanceOf[address(this)] - numberOfTokens;

                emit NEWTOKENSSOLD215(numberOfTokens, msg.sender, tokenPriceInWei);

                return true;
            }
            else {
                // (payable)
                revert();
            }
        }
        else {
            // (payable)
            revert();
        }
    }

                                                                                                                            
    function WITHDRAWALLTOOWNER505() public ONLYBY445(owner) returns (bool) {	//inject NONSTANDARD NAMING

        // only after sale is finished:
        require(SALEISFINISHED726());
        uint256 sumInWei = address(this).balance;

        if (
        // makes withdrawal and returns true or false
        !msg.sender.send(address(this).balance)
        ) {
            return false;
        }
        else {
            // event
            emit WITHDRAWAL886(msg.sender, sumInWei);
            return true;
        }
    }

                                    

    // list of registered referrers
    // represented by keccak256(address) (returns bytes32)
    // ! referrers can not be removed !
    mapping (bytes32 => bool) private isReferrer;

    uint256 private referralBonus = 0;

    uint256 private referrerBonus = 0;
    // tokens owned by referrers:
    mapping (bytes32 => uint256) public referrerBalanceOf;

    mapping (bytes32 => uint) public referrerLinkedSales;

    function ADDREFERRER400(bytes32 _referrer) public ONLYBY445(owner) returns (bool success){	//inject NONSTANDARD NAMING
        isReferrer[_referrer] = true;
        return true;
    }

    function REMOVEREFERRER208(bytes32 _referrer) public ONLYBY445(owner) returns (bool success){	//inject NONSTANDARD NAMING
        isReferrer[_referrer] = false;
        return true;
    }

    // bonuses are set in as integers (20%, 30%), initial 0%
    function SETREFERRALBONUSES148(uint256 _referralBonus, uint256 _referrerBonus) public ONLYBY445(owner) returns (bool success){	//inject NONSTANDARD NAMING
        require(_referralBonus > 0 && _referrerBonus > 0);
        referralBonus = _referralBonus;
        referrerBonus = _referrerBonus;
        return true;
    }

    function BUYTOKENSWITHREFERRERADDRESS89(address _referrer) public payable returns (bool success){	//inject NONSTANDARD NAMING

        bytes32 referrer = keccak256(abi.encodePacked(_referrer));

        if (SALEISRUNNING250() && tokenPriceInWei > 0) {

            if (isReferrer[referrer]) {

                uint256 numberOfTokens = msg.value / tokenPriceInWei;

                if (numberOfTokens <= balanceOf[address(this)]) {

                    referrerLinkedSales[referrer] = referrerLinkedSales[referrer] + numberOfTokens;

                    uint256 referralBonusTokens = (numberOfTokens * (100 + referralBonus) / 100) - numberOfTokens;
                    uint256 referrerBonusTokens = (numberOfTokens * (100 + referrerBonus) / 100) - numberOfTokens;

                    balanceOf[address(this)] = balanceOf[address(this)] - numberOfTokens - referralBonusTokens - referrerBonusTokens;

                    balanceOf[msg.sender] = balanceOf[msg.sender] + (numberOfTokens + referralBonusTokens);

                    referrerBalanceOf[referrer] = referrerBalanceOf[referrer] + referrerBonusTokens;

                    emit NEWTOKENSSOLD215(numberOfTokens + referralBonusTokens, msg.sender, tokenPriceInWei);

                    return true;
                }
                else {
                    // (payable)
                    revert();
                }
            }
            else {
                // (payable)
                BUYTOKENS63();
            }
        }
        else {
            // (payable)
            revert();
        }
    }

    event REFERRERBONUSTOKENSTAKEN633(address referrer, uint256 bonusTokensValue);	//inject NONSTANDARD NAMING

    function GETREFERRERBONUSTOKENS552() public returns (bool success){	//inject NONSTANDARD NAMING
        require(SALEISFINISHED726());
        uint256 bonusTokens = referrerBalanceOf[keccak256(abi.encodePacked(msg.sender))];
        balanceOf[msg.sender] = balanceOf[msg.sender] + bonusTokens;
        emit REFERRERBONUSTOKENSTAKEN633(msg.sender, bonusTokens);
        return true;
    }

}