pragma solidity 0.5.9;


library SafeMath {
    function MUL781(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV692(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function SUB114(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD800(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}


contract EtherWinAccessControl {
    event OWNERSHIPTRANSFERRED327(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

    address payable public owner;
    address public dividendManagerAddress;
    address payable public devWallet;
    address payable public ownerWallet1;
    address payable public ownerWallet2;
    address payable public ownerWallet3;

    modifier ONLYOWNER399() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }


    constructor() public {
        owner = msg.sender;
        devWallet = msg.sender;
        ownerWallet1 = 0x9a965e5e9c3A0F062C80a7f3d1B0972201b2F19f;
        ownerWallet2 = 0x9e8eA15006CfF425dEa3BC3874a78faba32F7C48;
        ownerWallet3 = 0xef1069A39219C35db16c41D7470F76B065c24064;
        dividendManagerAddress = 0x7FE18FA204e0920daa53A5F3014Fdc441b6aBbA4;
    }


    function SETOWNERWALLET118(address payable _wallet1, address payable _wallet2, address payable _wallet3) ONLYOWNER399 public {	//inject NONSTANDARD NAMING
        require(_wallet1 != address(0) );
        require(_wallet2 != address(0) );
        require(_wallet3 != address(0) );
        ownerWallet1 = _wallet1;
        ownerWallet2 = _wallet2;
        ownerWallet3 = _wallet3;
    }


    function SETDIVIDENDMANAGER999(address _dividendManagerAddress) ONLYOWNER399 external  {	//inject NONSTANDARD NAMING
        require(_dividendManagerAddress != address(0));
        dividendManagerAddress = _dividendManagerAddress;
    }

}


contract ERC20 {
    function ALLOWANCE894(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM484(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY211() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF507(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER400(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function OWNERTRANSFER936(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER105(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    function APPROVE117(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event APPROVAL223(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


contract DividendManagerInterface {
    function DEPOSITDIVIDEND379() external payable;	//inject NONSTANDARD NAMING
}


contract EtherWin is EtherWinAccessControl {
    using SafeMath for uint256;

    event NEWTICKET82(address indexed owner, uint indexed blockNum, address indexed referrer, uint value);	//inject NONSTANDARD NAMING
    event NEWPRICE518(uint minWei,uint maxWei);	//inject NONSTANDARD NAMING
    event NEWWEIPERBLOCK44(uint newWeiPerBlock);	//inject NONSTANDARD NAMING
    event SENDPRIZE141(address indexed owner, uint indexed blockNum, uint value);	//inject NONSTANDARD NAMING
    event FUNDSTRANSFERRED649(address dividendManager, uint value);	//inject NONSTANDARD NAMING
    event WINBLOCKADDED573(uint indexed blockNum);	//inject NONSTANDARD NAMING

    uint public minWei = 5000000000000000;
    uint public maxWei = 50000000000000000;
    uint public maxWeiPerBlock = 500000000000000000;
    uint public ownersWeis;  // reserved weis for owners
    uint public depositWeis;  // reserved weis for return deposit
    uint public prizePercent = 91875;
    uint public ownersPercent = 8125;
    uint public refPercent = 1000;


    struct Ticket {
        uint value;
        bool executed;
    }

    struct WinBlock {
        bool exists;
        uint8 lastByte;
        uint8 rate;
        bool jp;
        uint value;
    }

    mapping (address => mapping (uint => Ticket)) public tickets; // user addr -> block number -> ticket

    mapping (uint => uint) public blocks; //blicknum -> weis in block
    mapping (uint8 => uint8) rates;

    mapping (uint => WinBlock) public winBlocks;

    uint public allTicketsPrice;
    mapping (uint => uint) public allTicketsForBlock; //block num -> allTicketsPrice needs for JP
    uint[] public JPBlocks;
    mapping (address => uint) public refs;
    mapping (address => address) public userRefs;


    uint divider = 5;
    uint public lastPayout;


    constructor() public {
        rates[10] = 15; //a
        rates[11] = 15; //b
        rates[12] = 15; //c

        rates[13] = 20; //d
        rates[14] = 20; //e

        rates[15] = 30; //f

        rates[153] = 99; //99
    }


    function () external payable {
        PLAY125(address(0));
    }


    function PLAY125(address _ref) public payable {	//inject NONSTANDARD NAMING
        Ticket storage t = tickets[msg.sender][block.number];

        require(t.value.ADD800(msg.value) >= minWei && t.value.ADD800(msg.value) <= maxWei);
        require(blocks[block.number].ADD800(msg.value) <= maxWeiPerBlock);

        t.value = t.value.ADD800(msg.value);

        blocks[block.number] = blocks[block.number].ADD800(msg.value);

        if (_ref != address(0) && _ref != msg.sender) {
            userRefs[msg.sender] = _ref;
        }

        //need for JP
        allTicketsPrice = allTicketsPrice.ADD800(msg.value);
        allTicketsForBlock[block.number] = allTicketsPrice;

        if (userRefs[msg.sender] != address(0)) {
            refs[_ref] = refs[_ref].ADD800(VALUEFROMPERCENT682(msg.value, refPercent));
            ownersWeis = ownersWeis.ADD800(VALUEFROMPERCENT682(msg.value, ownersPercent.SUB114(refPercent)));
        } else {
            ownersWeis = ownersWeis.ADD800(VALUEFROMPERCENT682(msg.value,ownersPercent));
        }

        emit NEWTICKET82(msg.sender, block.number, _ref, t.value);
    }


    function ADDWINBLOCK212(uint _blockNum) public  {	//inject NONSTANDARD NAMING
        require( (_blockNum.ADD800(6) < block.number) && (_blockNum > block.number - 256) );
        require(!winBlocks[_blockNum].exists);
        require(blocks[_blockNum-1] > 0);

        bytes32 bhash = blockhash(_blockNum);
        uint8 lastByte = uint8(bhash[31]);

        require( ((rates[lastByte % 16]) > 0) || (rates[lastByte] > 0) );

        _ADDWINBLOCK476(_blockNum, lastByte);
    }


    function _ADDWINBLOCK476(uint _blockNum, uint8 _lastByte) internal {	//inject NONSTANDARD NAMING
        WinBlock storage wBlock = winBlocks[_blockNum];
        wBlock.exists = true;
        wBlock.lastByte = _lastByte;
        wBlock.rate = rates[_lastByte % 16];

        //JP
        if (_lastByte == 153) {
            wBlock.jp = true;

            if (JPBlocks.length > 0) {
                wBlock.value = allTicketsForBlock[_blockNum-1].SUB114(allTicketsForBlock[JPBlocks[JPBlocks.length-1]-1]);
            } else {
                wBlock.value = allTicketsForBlock[_blockNum-1];
            }

            JPBlocks.push(_blockNum);
        }

        emit WINBLOCKADDED573(_blockNum);
    }


    function GETPRIZE180(uint _blockNum) public {	//inject NONSTANDARD NAMING
        Ticket storage t = tickets[msg.sender][_blockNum-1];
        require(t.value > 0);
        require(!t.executed);

        if (!winBlocks[_blockNum].exists) {
            ADDWINBLOCK212(_blockNum);
        }

        require(winBlocks[_blockNum].exists);

        uint winValue = 0;

        if (winBlocks[_blockNum].jp) {
            winValue = GETJPVALUE879(_blockNum,t.value);
        } else {
            winValue = t.value.MUL781(winBlocks[_blockNum].rate).DIV692(10);
        }


        require(address(this).balance >= winValue);

        t.executed = true;
        msg.sender.transfer(winValue);
        emit SENDPRIZE141(msg.sender, _blockNum, winValue);
    }


    function MINJACKPOTVALUE718(uint _blockNum) public view returns (uint){	//inject NONSTANDARD NAMING
        uint value = 0;
        if (JPBlocks.length > 0) {
            value = allTicketsForBlock[_blockNum].SUB114(allTicketsForBlock[JPBlocks[JPBlocks.length-1]-1]);
        } else {
            value = allTicketsForBlock[_blockNum];
        }

        return _CALCJP738(minWei, minWei, value);
    }


    function JACKPOTVALUE729(uint _blockNum, uint _ticketPrice) public view returns (uint){	//inject NONSTANDARD NAMING
        uint value = 0;
        if (JPBlocks.length > 0) {
            value = allTicketsForBlock[_blockNum].SUB114(allTicketsForBlock[JPBlocks[JPBlocks.length-1]-1]);
        } else {
            value = allTicketsForBlock[_blockNum];
        }

        return _CALCJP738(_ticketPrice, _ticketPrice, value);
    }


    function GETJPVALUE879(uint _blockNum, uint _ticketPrice) internal view returns (uint) {	//inject NONSTANDARD NAMING
        return _CALCJP738(_ticketPrice, blocks[_blockNum-1], winBlocks[_blockNum].value);
    }


    function _CALCJP738(uint _ticketPrice, uint _varB, uint _varX) internal view returns (uint) {	//inject NONSTANDARD NAMING
        uint varA = _ticketPrice;
        uint varB = _varB; //blocks[blockNum-1]
        uint varX = _varX; //winBlocks[blockNum].value

        uint varL = varA.MUL781(1000).DIV692(divider).DIV692(1000000000000000000);
        uint minjp = minWei.MUL781(25);
        varL = varL.MUL781(minjp);

        uint varR = varA.MUL781(10000).DIV692(varB);
        uint varX1 = varX.MUL781(1023);
        varR = varR.MUL781(varX1).DIV692(100000000);

        return varL.ADD800(varR);
    }


    function CHANGETICKETWEILIMIT520(uint _minWei, uint _maxWei, uint _divider) ONLYOWNER399 public {	//inject NONSTANDARD NAMING
        minWei = _minWei;
        maxWei = _maxWei;
        divider = _divider;
        emit NEWPRICE518(minWei,maxWei);
    }


    function CHANGEWEIPERBLOCK372(uint _value) ONLYOWNER399 public {	//inject NONSTANDARD NAMING
        maxWeiPerBlock = _value;
        emit NEWWEIPERBLOCK44(maxWeiPerBlock);
    }


    function RETURNDEPOSIT800() ONLYOWNER399 public {	//inject NONSTANDARD NAMING
        require(address(this).balance >= depositWeis);
        uint deposit = depositWeis;
        depositWeis = 0;
        owner.transfer(deposit);
    }


    function TRANSFERETHERSTODIVIDENDMANAGER466() public {	//inject NONSTANDARD NAMING
        require(now >= lastPayout.ADD800(7 days) );
        require(address(this).balance >= ownersWeis);
        require(ownersWeis > 0);
        lastPayout = now;
        uint dividends = ownersWeis;
        ownersWeis = 0;

        devWallet.transfer(VALUEFROMPERCENT682(dividends,15000));
        ownerWallet1.transfer(VALUEFROMPERCENT682(dividends,5000));
        ownerWallet2.transfer(VALUEFROMPERCENT682(dividends,30000));
        ownerWallet3.transfer(VALUEFROMPERCENT682(dividends,35000));

        DividendManagerInterface dividendManager = DividendManagerInterface(dividendManagerAddress);
        dividendManager.DEPOSITDIVIDEND379.value(VALUEFROMPERCENT682(dividends,15000))();

        emit FUNDSTRANSFERRED649(dividendManagerAddress, dividends);
    }


    function ADDETH386() public payable {	//inject NONSTANDARD NAMING
        depositWeis = depositWeis.ADD800(msg.value);
    }


    function FROMHEXCHAR863(uint8 _c) internal pure returns (uint8) {	//inject NONSTANDARD NAMING
        return _c - (_c < 58 ? 48 : (_c < 97 ? 55 : 87));
    }


    function GETBYTE961(bytes memory res) internal pure returns (uint8) {	//inject NONSTANDARD NAMING
        return FROMHEXCHAR863(uint8(res[62])) << 4 | FROMHEXCHAR863(uint8(res[63]));
    }


    function WITHDRAWREFSPERCENT800() external {	//inject NONSTANDARD NAMING
        require(refs[msg.sender] > 0);
        require(address(this).balance >= refs[msg.sender]);
        uint val = refs[msg.sender];
        refs[msg.sender] = 0;
        msg.sender.transfer(val);
    }


    function VALUEFROMPERCENT682(uint _value, uint _percent) internal pure returns(uint quotient) {	//inject NONSTANDARD NAMING
        uint _quotient = _value.MUL781(_percent).DIV692(100000);
        return ( _quotient);
    }

                                                                          
                                      
                                                                                
                                                    
    function CLAIMTOKENS785(address _token) ONLYOWNER399 external {	//inject NONSTANDARD NAMING
        ERC20 token = ERC20(_token);
        uint balance = token.BALANCEOF507(address(this));
        token.TRANSFER400(owner, balance);
    }
}