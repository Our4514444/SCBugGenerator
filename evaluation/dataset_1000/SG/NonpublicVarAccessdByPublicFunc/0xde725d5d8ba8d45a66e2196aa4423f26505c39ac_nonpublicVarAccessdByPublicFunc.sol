pragma solidity 0.5.9;


library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}


contract EtherWinAccessControl {
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    address payable internal owner;
    address internal dividendManagerAddress;
    address payable internal devWallet;
    address payable internal ownerWallet1;
    address payable internal ownerWallet2;
    address payable internal ownerWallet3;

    modifier onlyOwner() {
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


    function setOwnerWallet(address payable _wallet1, address payable _wallet2, address payable _wallet3) onlyOwner public {
        require(_wallet1 != address(0) );
        require(_wallet2 != address(0) );
        require(_wallet3 != address(0) );
        ownerWallet1 = _wallet1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        ownerWallet2 = _wallet2;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        ownerWallet3 = _wallet3;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }


    function setDividendManager(address _dividendManagerAddress) onlyOwner external  {
        require(_dividendManagerAddress != address(0));
        dividendManagerAddress = _dividendManagerAddress;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

}


contract ERC20 {
    function allowance(address owner, address spender) public view returns (uint256);
    function transferFrom(address from, address to, uint256 value) public returns (bool);
    function totalSupply() public view returns (uint256);
    function balanceOf(address who) public view returns (uint256);
    function transfer(address to, uint256 value) public returns (bool);
    function ownerTransfer(address to, uint256 value) public returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);

    function approve(address spender, uint256 value) public returns (bool);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract DividendManagerInterface {
    function depositDividend() external payable;
}


contract EtherWin is EtherWinAccessControl {
    using SafeMath for uint256;

    event NewTicket(address indexed owner, uint indexed blockNum, address indexed referrer, uint value);
    event NewPrice(uint minWei,uint maxWei);
    event NewWeiPerBlock(uint newWeiPerBlock);
    event SendPrize(address indexed owner, uint indexed blockNum, uint value);
    event FundsTransferred(address dividendManager, uint value);
    event WinBlockAdded(uint indexed blockNum);

    uint internal minWei = 5000000000000000;
    uint internal maxWei = 50000000000000000;
    uint internal maxWeiPerBlock = 500000000000000000;
    uint internal ownersWeis;  // reserved weis for owners
    uint internal depositWeis;  // reserved weis for return deposit
    uint public prizePercent = 91875;
    uint internal ownersPercent = 8125;
    uint internal refPercent = 1000;


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

    mapping (address => mapping (uint => Ticket)) internal tickets; // user addr -> block number -> ticket

    mapping (uint => uint) internal blocks; //blicknum -> weis in block
    mapping (uint8 => uint8) rates;

    mapping (uint => WinBlock) internal winBlocks;

    uint internal allTicketsPrice;
    mapping (uint => uint) internal allTicketsForBlock; //block num -> allTicketsPrice needs for JP
    uint[] internal JPBlocks;
    mapping (address => uint) internal refs;
    mapping (address => address) internal userRefs;


    uint divider = 5;
    uint internal lastPayout;


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
        play(address(0));
    }


    function play(address _ref) public payable {
        Ticket storage t = tickets[msg.sender][block.number];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        require(t.value.add(msg.value) >= minWei && t.value.add(msg.value) <= maxWei);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(blocks[block.number].add(msg.value) <= maxWeiPerBlock);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        t.value = t.value.add(msg.value);

        blocks[block.number] = blocks[block.number].add(msg.value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        if (_ref != address(0) && _ref != msg.sender) {
            userRefs[msg.sender] = _ref;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }

        //need for JP
        allTicketsPrice = allTicketsPrice.add(msg.value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        allTicketsForBlock[block.number] = allTicketsPrice;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        if (userRefs[msg.sender] != address(0)) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            refs[_ref] = refs[_ref].add(valueFromPercent(msg.value, refPercent));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            ownersWeis = ownersWeis.add(valueFromPercent(msg.value, ownersPercent.sub(refPercent)));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            ownersWeis = ownersWeis.add(valueFromPercent(msg.value,ownersPercent));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }

        emit NewTicket(msg.sender, block.number, _ref, t.value);
    }


    function addWinBlock(uint _blockNum) public  {
        require( (_blockNum.add(6) < block.number) && (_blockNum > block.number - 256) );
        require(!winBlocks[_blockNum].exists);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(blocks[_blockNum-1] > 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        bytes32 bhash = blockhash(_blockNum);
        uint8 lastByte = uint8(bhash[31]);

        require( ((rates[lastByte % 16]) > 0) || (rates[lastByte] > 0) );	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        _addWinBlock(_blockNum, lastByte);
    }


    function _addWinBlock(uint _blockNum, uint8 _lastByte) internal {
        WinBlock storage wBlock = winBlocks[_blockNum];
        wBlock.exists = true;
        wBlock.lastByte = _lastByte;
        wBlock.rate = rates[_lastByte % 16];

        //JP
        if (_lastByte == 153) {
            wBlock.jp = true;

            if (JPBlocks.length > 0) {
                wBlock.value = allTicketsForBlock[_blockNum-1].sub(allTicketsForBlock[JPBlocks[JPBlocks.length-1]-1]);
            } else {
                wBlock.value = allTicketsForBlock[_blockNum-1];
            }

            JPBlocks.push(_blockNum);
        }

        emit WinBlockAdded(_blockNum);
    }


    function getPrize(uint _blockNum) public {
        Ticket storage t = tickets[msg.sender][_blockNum-1];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(t.value > 0);
        require(!t.executed);

        if (!winBlocks[_blockNum].exists) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            addWinBlock(_blockNum);
        }

        require(winBlocks[_blockNum].exists);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        uint winValue = 0;

        if (winBlocks[_blockNum].jp) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            winValue = getJPValue(_blockNum,t.value);
        } else {
            winValue = t.value.mul(winBlocks[_blockNum].rate).div(10);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }


        require(address(this).balance >= winValue);

        t.executed = true;
        msg.sender.transfer(winValue);
        emit SendPrize(msg.sender, _blockNum, winValue);
    }


    function minJackpotValue(uint _blockNum) public view returns (uint){
        uint value = 0;
        if (JPBlocks.length > 0) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            value = allTicketsForBlock[_blockNum].sub(allTicketsForBlock[JPBlocks[JPBlocks.length-1]-1]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            value = allTicketsForBlock[_blockNum];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }

        return _calcJP(minWei, minWei, value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }


    function jackpotValue(uint _blockNum, uint _ticketPrice) public view returns (uint){
        uint value = 0;
        if (JPBlocks.length > 0) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            value = allTicketsForBlock[_blockNum].sub(allTicketsForBlock[JPBlocks[JPBlocks.length-1]-1]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            value = allTicketsForBlock[_blockNum];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }

        return _calcJP(_ticketPrice, _ticketPrice, value);
    }


    function getJPValue(uint _blockNum, uint _ticketPrice) internal view returns (uint) {
        return _calcJP(_ticketPrice, blocks[_blockNum-1], winBlocks[_blockNum].value);
    }


    function _calcJP(uint _ticketPrice, uint _varB, uint _varX) internal view returns (uint) {
        uint varA = _ticketPrice;
        uint varB = _varB; //blocks[blockNum-1]
        uint varX = _varX; //winBlocks[blockNum].value

        uint varL = varA.mul(1000).div(divider).div(1000000000000000000);
        uint minjp = minWei.mul(25);
        varL = varL.mul(minjp);

        uint varR = varA.mul(10000).div(varB);
        uint varX1 = varX.mul(1023);
        varR = varR.mul(varX1).div(100000000);

        return varL.add(varR);
    }


    function changeTicketWeiLimit(uint _minWei, uint _maxWei, uint _divider) onlyOwner public {
        minWei = _minWei;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        maxWei = _maxWei;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        divider = _divider;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit NewPrice(minWei,maxWei);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }


    function changeWeiPerBlock(uint _value) onlyOwner public {
        maxWeiPerBlock = _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit NewWeiPerBlock(maxWeiPerBlock);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }


    function returnDeposit() onlyOwner public {
        require(address(this).balance >= depositWeis);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint deposit = depositWeis;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        depositWeis = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        owner.transfer(deposit);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }


    function transferEthersToDividendManager() public {
        require(now >= lastPayout.add(7 days) );	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(address(this).balance >= ownersWeis);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(ownersWeis > 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        lastPayout = now;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint dividends = ownersWeis;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        ownersWeis = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        devWallet.transfer(valueFromPercent(dividends,15000));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        ownerWallet1.transfer(valueFromPercent(dividends,5000));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        ownerWallet2.transfer(valueFromPercent(dividends,30000));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        ownerWallet3.transfer(valueFromPercent(dividends,35000));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        DividendManagerInterface dividendManager = DividendManagerInterface(dividendManagerAddress);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        dividendManager.depositDividend.value(valueFromPercent(dividends,15000))();

        emit FundsTransferred(dividendManagerAddress, dividends);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }


    function addEth() public payable {
        depositWeis = depositWeis.add(msg.value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }


    function fromHexChar(uint8 _c) internal pure returns (uint8) {
        return _c - (_c < 58 ? 48 : (_c < 97 ? 55 : 87));
    }


    function getByte(bytes memory res) internal pure returns (uint8) {
        return fromHexChar(uint8(res[62])) << 4 | fromHexChar(uint8(res[63]));
    }


    function withdrawRefsPercent() external {
        require(refs[msg.sender] > 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(address(this).balance >= refs[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint val = refs[msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        refs[msg.sender] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        msg.sender.transfer(val);
    }


    function valueFromPercent(uint _value, uint _percent) internal pure returns(uint quotient) {
        uint _quotient = _value.mul(_percent).div(100000);
        return ( _quotient);
    }

    /// @notice This method can be used by the owner to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    ///  set to 0 in case you want to extract ether.
    function claimTokens(address _token) onlyOwner external {
        ERC20 token = ERC20(_token);
        uint balance = token.balanceOf(address(this));
        token.transfer(owner, balance);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}