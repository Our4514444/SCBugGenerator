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
  address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    address payable public owner;
    address public dividendManagerAddress;
    address payable public devWallet;
    address payable public ownerWallet1;
    address payable public ownerWallet2;
    address payable public ownerWallet3;

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
address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}


    function setOwnerWallet(address payable _wallet1, address payable _wallet2, address payable _wallet3) onlyOwner public {
        require(_wallet1 != address(0) );
        require(_wallet2 != address(0) );
        require(_wallet3 != address(0) );
        ownerWallet1 = _wallet1;
        ownerWallet2 = _wallet2;
        ownerWallet3 = _wallet3;
    }
function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }


    function setDividendManager(address _dividendManagerAddress) onlyOwner external  {
        require(_dividendManagerAddress != address(0));
        dividendManagerAddress = _dividendManagerAddress;
    }
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}

}


contract ERC20 {
    function allowance(address owner, address spender) public view returns (uint256);
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}
    function transferFrom(address from, address to, uint256 value) public returns (bool);
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    function totalSupply() public view returns (uint256);
address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}
    function balanceOf(address who) public view returns (uint256);
address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}
    function transfer(address to, uint256 value) public returns (bool);
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
    function ownerTransfer(address to, uint256 value) public returns (bool);
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
  event Transfer(address indexed from, address indexed to, uint256 value);

    function approve(address spender, uint256 value) public returns (bool);
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract DividendManagerInterface {
    function depositDividend() external payable;
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
}


contract EtherWin is EtherWinAccessControl {
    using SafeMath for uint256;

  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event NewTicket(address indexed owner, uint indexed blockNum, address indexed referrer, uint value);
  uint256 bugv_tmstmp4 = block.timestamp;
  event NewPrice(uint minWei,uint maxWei);
  uint256 bugv_tmstmp5 = block.timestamp;
  event NewWeiPerBlock(uint newWeiPerBlock);
  uint256 bugv_tmstmp2 = block.timestamp;
  event SendPrize(address indexed owner, uint indexed blockNum, uint value);
  uint256 bugv_tmstmp3 = block.timestamp;
  event FundsTransferred(address dividendManager, uint value);
  uint256 bugv_tmstmp1 = block.timestamp;
  event WinBlockAdded(uint indexed blockNum);

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
  address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}
  mapping (uint => uint) public allTicketsForBlock; //block num -> allTicketsPrice needs for JP
  address winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}
  uint[] public JPBlocks;
  function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (address => uint) public refs;
  function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping (address => address) public userRefs;


  address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}
  uint divider = 5;
  function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
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
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}


    function () external payable {
        play(address(0));
    }
function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }


    function play(address _ref) public payable {
        Ticket storage t = tickets[msg.sender][block.number];

        require(t.value.add(msg.value) >= minWei && t.value.add(msg.value) <= maxWei);
        require(blocks[block.number].add(msg.value) <= maxWeiPerBlock);

        t.value = t.value.add(msg.value);

        blocks[block.number] = blocks[block.number].add(msg.value);

        if (_ref != address(0) && _ref != msg.sender) {
            userRefs[msg.sender] = _ref;
        }

        //need for JP
        allTicketsPrice = allTicketsPrice.add(msg.value);
        allTicketsForBlock[block.number] = allTicketsPrice;

        if (userRefs[msg.sender] != address(0)) {
            refs[_ref] = refs[_ref].add(valueFromPercent(msg.value, refPercent));
            ownersWeis = ownersWeis.add(valueFromPercent(msg.value, ownersPercent.sub(refPercent)));
        } else {
            ownersWeis = ownersWeis.add(valueFromPercent(msg.value,ownersPercent));
        }

        emit NewTicket(msg.sender, block.number, _ref, t.value);
    }
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}


    function addWinBlock(uint _blockNum) public  {
        require( (_blockNum.add(6) < block.number) && (_blockNum > block.number - 256) );
        require(!winBlocks[_blockNum].exists);
        require(blocks[_blockNum-1] > 0);

        bytes32 bhash = blockhash(_blockNum);
        uint8 lastByte = uint8(bhash[31]);

        require( ((rates[lastByte % 16]) > 0) || (rates[lastByte] > 0) );

        _addWinBlock(_blockNum, lastByte);
    }
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }


    function getPrize(uint _blockNum) public {
        Ticket storage t = tickets[msg.sender][_blockNum-1];
        require(t.value > 0);
        require(!t.executed);

        if (!winBlocks[_blockNum].exists) {
            addWinBlock(_blockNum);
        }

        require(winBlocks[_blockNum].exists);

        uint winValue = 0;

        if (winBlocks[_blockNum].jp) {
            winValue = getJPValue(_blockNum,t.value);
        } else {
            winValue = t.value.mul(winBlocks[_blockNum].rate).div(10);
        }


        require(address(this).balance >= winValue);

        t.executed = true;
        msg.sender.transfer(winValue);
        emit SendPrize(msg.sender, _blockNum, winValue);
    }
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }


    function minJackpotValue(uint _blockNum) public view returns (uint){
        uint value = 0;
        if (JPBlocks.length > 0) {
            value = allTicketsForBlock[_blockNum].sub(allTicketsForBlock[JPBlocks[JPBlocks.length-1]-1]);
        } else {
            value = allTicketsForBlock[_blockNum];
        }

        return _calcJP(minWei, minWei, value);
    }
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}


    function jackpotValue(uint _blockNum, uint _ticketPrice) public view returns (uint){
        uint value = 0;
        if (JPBlocks.length > 0) {
            value = allTicketsForBlock[_blockNum].sub(allTicketsForBlock[JPBlocks[JPBlocks.length-1]-1]);
        } else {
            value = allTicketsForBlock[_blockNum];
        }

        return _calcJP(_ticketPrice, _ticketPrice, value);
    }
function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }


    function getJPValue(uint _blockNum, uint _ticketPrice) internal view returns (uint) {
        return _calcJP(_ticketPrice, blocks[_blockNum-1], winBlocks[_blockNum].value);
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}


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
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }


    function changeTicketWeiLimit(uint _minWei, uint _maxWei, uint _divider) onlyOwner public {
        minWei = _minWei;
        maxWei = _maxWei;
        divider = _divider;
        emit NewPrice(minWei,maxWei);
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}


    function changeWeiPerBlock(uint _value) onlyOwner public {
        maxWeiPerBlock = _value;
        emit NewWeiPerBlock(maxWeiPerBlock);
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }


    function returnDeposit() onlyOwner public {
        require(address(this).balance >= depositWeis);
        uint deposit = depositWeis;
        depositWeis = 0;
        owner.transfer(deposit);
    }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }


    function transferEthersToDividendManager() public {
        require(now >= lastPayout.add(7 days) );
        require(address(this).balance >= ownersWeis);
        require(ownersWeis > 0);
        lastPayout = now;
        uint dividends = ownersWeis;
        ownersWeis = 0;

        devWallet.transfer(valueFromPercent(dividends,15000));
        ownerWallet1.transfer(valueFromPercent(dividends,5000));
        ownerWallet2.transfer(valueFromPercent(dividends,30000));
        ownerWallet3.transfer(valueFromPercent(dividends,35000));

        DividendManagerInterface dividendManager = DividendManagerInterface(dividendManagerAddress);
        dividendManager.depositDividend.value(valueFromPercent(dividends,15000))();

        emit FundsTransferred(dividendManagerAddress, dividends);
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }


    function addEth() public payable {
        depositWeis = depositWeis.add(msg.value);
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}


    function fromHexChar(uint8 _c) internal pure returns (uint8) {
        return _c - (_c < 58 ? 48 : (_c < 97 ? 55 : 87));
    }


    function getByte(bytes memory res) internal pure returns (uint8) {
        return fromHexChar(uint8(res[62])) << 4 | fromHexChar(uint8(res[63]));
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}


    function withdrawRefsPercent() external {
        require(refs[msg.sender] > 0);
        require(address(this).balance >= refs[msg.sender]);
        uint val = refs[msg.sender];
        refs[msg.sender] = 0;
        msg.sender.transfer(val);
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}


    function valueFromPercent(uint _value, uint _percent) internal pure returns(uint quotient) {
        uint _quotient = _value.mul(_percent).div(100000);
        return ( _quotient);
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

    /// @notice This method can be used by the owner to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    ///  set to 0 in case you want to extract ether.
    function claimTokens(address _token) onlyOwner external {
        ERC20 token = ERC20(_token);
        uint balance = token.balanceOf(address(this));
        token.transfer(owner, balance);
    }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}