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
  function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
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
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }


    function setOwnerWallet(address payable _wallet1, address payable _wallet2, address payable _wallet3) onlyOwner public {
        require(_wallet1 != address(0) );
        require(_wallet2 != address(0) );
        require(_wallet3 != address(0) );
        ownerWallet1 = _wallet1;
        ownerWallet2 = _wallet2;
        ownerWallet3 = _wallet3;
    }
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }


    function setDividendManager(address _dividendManagerAddress) onlyOwner external  {
        require(_dividendManagerAddress != address(0));
        dividendManagerAddress = _dividendManagerAddress;
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

}


contract ERC20 {
    function allowance(address owner, address spender) public view returns (uint256);
function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
    function transferFrom(address from, address to, uint256 value) public returns (bool);
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
    function totalSupply() public view returns (uint256);
function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
    function balanceOf(address who) public view returns (uint256);
function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
    function transfer(address to, uint256 value) public returns (bool);
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
    function ownerTransfer(address to, uint256 value) public returns (bool);
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  event Transfer(address indexed from, address indexed to, uint256 value);

    function approve(address spender, uint256 value) public returns (bool);
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract DividendManagerInterface {
    function depositDividend() external payable;
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
}


contract EtherWin is EtherWinAccessControl {
    using SafeMath for uint256;

  function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  event NewTicket(address indexed owner, uint indexed blockNum, address indexed referrer, uint value);
  function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  event NewPrice(uint minWei,uint maxWei);
  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event NewWeiPerBlock(uint newWeiPerBlock);
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event SendPrize(address indexed owner, uint indexed blockNum, uint value);
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event FundsTransferred(address dividendManager, uint value);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
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
  function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
  mapping (uint8 => uint8) rates;

  function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}
  mapping (uint => WinBlock) public winBlocks;

  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  uint public allTicketsPrice;
  function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  mapping (uint => uint) public allTicketsForBlock; //block num -> allTicketsPrice needs for JP
  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  uint[] public JPBlocks;
  bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
  mapping (address => uint) public refs;
  function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
  mapping (address => address) public userRefs;


  function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
  uint divider = 5;
  function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
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
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }


    function () external payable {
        play(address(0));
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }


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
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}


    function addWinBlock(uint _blockNum) public  {
        require( (_blockNum.add(6) < block.number) && (_blockNum > block.number - 256) );
        require(!winBlocks[_blockNum].exists);
        require(blocks[_blockNum-1] > 0);

        bytes32 bhash = blockhash(_blockNum);
        uint8 lastByte = uint8(bhash[31]);

        require( ((rates[lastByte % 16]) > 0) || (rates[lastByte] > 0) );

        _addWinBlock(_blockNum, lastByte);
    }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
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
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
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
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
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
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }


    function jackpotValue(uint _blockNum, uint _ticketPrice) public view returns (uint){
        uint value = 0;
        if (JPBlocks.length > 0) {
            value = allTicketsForBlock[_blockNum].sub(allTicketsForBlock[JPBlocks[JPBlocks.length-1]-1]);
        } else {
            value = allTicketsForBlock[_blockNum];
        }

        return _calcJP(_ticketPrice, _ticketPrice, value);
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }


    function getJPValue(uint _blockNum, uint _ticketPrice) internal view returns (uint) {
        return _calcJP(_ticketPrice, blocks[_blockNum-1], winBlocks[_blockNum].value);
    }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
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
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}


    function changeTicketWeiLimit(uint _minWei, uint _maxWei, uint _divider) onlyOwner public {
        minWei = _minWei;
        maxWei = _maxWei;
        divider = _divider;
        emit NewPrice(minWei,maxWei);
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }


    function changeWeiPerBlock(uint _value) onlyOwner public {
        maxWeiPerBlock = _value;
        emit NewWeiPerBlock(maxWeiPerBlock);
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }


    function returnDeposit() onlyOwner public {
        require(address(this).balance >= depositWeis);
        uint deposit = depositWeis;
        depositWeis = 0;
        owner.transfer(deposit);
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}


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
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }


    function addEth() public payable {
        depositWeis = depositWeis.add(msg.value);
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }


    function fromHexChar(uint8 _c) internal pure returns (uint8) {
        return _c - (_c < 58 ? 48 : (_c < 97 ? 55 : 87));
    }


    function getByte(bytes memory res) internal pure returns (uint8) {
        return fromHexChar(uint8(res[62])) << 4 | fromHexChar(uint8(res[63]));
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}


    function withdrawRefsPercent() external {
        require(refs[msg.sender] > 0);
        require(address(this).balance >= refs[msg.sender]);
        uint val = refs[msg.sender];
        refs[msg.sender] = 0;
        msg.sender.transfer(val);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }


    function valueFromPercent(uint _value, uint _percent) internal pure returns(uint quotient) {
        uint _quotient = _value.mul(_percent).div(100000);
        return ( _quotient);
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    /// @notice This method can be used by the owner to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    ///  set to 0 in case you want to extract ether.
    function claimTokens(address _token) onlyOwner external {
        ERC20 token = ERC20(_token);
        uint balance = token.balanceOf(address(this));
        token.transfer(owner, balance);
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
}