pragma solidity ^0.5.2;

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error
 */
library SafeMath {
    /**
     * @dev Multiplies two unsigned integers, reverts on overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
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

    /**
     * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Adds two unsigned integers, reverts on overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
     * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
     * reverts when dividing by zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization
 *      control functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address public owner;

  address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the
     *      sender account.
     */
    constructor() public {
        owner = msg.sender;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) onlyOwner public {
        require(newOwner != address(0));
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}
}

/**
 * @title ERC223
 * @dev ERC223 contract interface with ERC20 functions and events
 *      Fully backward compatible with ERC20
 *      Recommended implementation used at https://github.com/Dexaran/ERC223-token-standard/tree/Recommended
 */
contract ERC223 {
    using SafeMath for uint256;

    // ERC223 and ERC20 functions and events
    function balanceOf(address who) public view returns (uint256);
address winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}
    function totalSupply() public view returns (uint256);
function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function transfer(address to, uint value) public returns (bool);
function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    function transfer(address to, uint value, bytes memory data) public returns (bool);
address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}
  address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
  event Transfer(address indexed from, address indexed to, uint value, bytes indexed data);

    // ERC223 functions
    function name() public view returns (string memory);
function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    function symbol() public view returns (string memory);
address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}
    function decimals() public view returns (uint8);
function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    // ERC20 functions and events
    function transferFrom(address from, address to, uint256 value) public returns (bool);
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}
    function approve(address spender, uint256 value) public returns (bool);
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}
    function allowance(address owner, address spender) public view returns (uint256);
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event Transfer(address indexed from, address indexed to, uint256 value);
  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event Approval(address indexed owner, address indexed spender, uint value);
}

/**
 * @title ContractReceiver
 * @dev Contract that is working with ERC223 tokens
 */
contract ContractReceiver {
    /**
    * @dev Standard ERC223 function that will handle incoming token transfers.
    *
    * @param _from  Token sender address.
    * @param _value Amount of tokens.
    * @param _data  Transaction metadata.
    */
    function tokenFallback(address _from, uint _value, bytes memory _data) public;
address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}
}

/**
 * @title ZENI
 * @author ZENI
 * @dev ZENI is an ERC223 Token with ERC20 functions and events
 *      Fully backward compatible with ERC20
 */
contract ZENI is ERC223, Ownable {
    using SafeMath for uint256;

    string private _name = "ZENI";
    string private _symbol = "ZENI";
    uint8 private _decimals = 8;
    uint256 private _initialSupply = 60e9 * 1e8;

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowed;
    uint private _totalSupply;

    bool public mintingFinished = false;
    mapping (address => bool) public frozenAccount;
    mapping (address => uint256) public unlockUnixTime;

  uint256 bugv_tmstmp4 = block.timestamp;
  event FrozenFunds(address indexed target, bool frozen);
  uint256 bugv_tmstmp5 = block.timestamp;
  event LockedFunds(address indexed target, uint256 locked);
  uint256 bugv_tmstmp2 = block.timestamp;
  event Burn(address indexed from, uint256 amount);
  uint256 bugv_tmstmp3 = block.timestamp;
  event Mint(address indexed to, uint256 amount);
  uint256 bugv_tmstmp1 = block.timestamp;
  event MintFinished();

    /**
     * @dev Constructor is called only once and can not be called again
     */
    constructor() public {
        _totalSupply = _initialSupply;
        _balances[msg.sender] = _totalSupply;
    }
address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}


    function name() public view returns (string memory) {
        return _name;
    }
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}

    function symbol() public view returns (string memory) {
        return _symbol;
    }
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function decimals() public view returns (uint8) {
        return _decimals;
    }
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return _balances[_owner];
    }
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}

    /**
     * @dev Prevent targets from sending or receiving tokens
     * @param targets Addresses to be frozen
     * @param isFrozen either to freeze it or not
     */
    function freezeAccounts(address[] memory targets, bool isFrozen) public onlyOwner {
        require(targets.length > 0);

        for (uint j = 0; j < targets.length; j++) {
            require(targets[j] != address(0));
            frozenAccount[targets[j]] = isFrozen;
            emit FrozenFunds(targets[j], isFrozen);
        }
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

    /**
     * @dev Prevent targets from sending or receiving tokens by setting Unix times
     * @param targets Addresses to be locked funds
     * @param unixTimes Unix times when locking up will be finished
     */
    function lockupAccounts(address[] memory targets, uint[] memory unixTimes) public onlyOwner {
        require(
            targets.length > 0 &&
            targets.length == unixTimes.length
        );

        for(uint i = 0; i < targets.length; i++){
            require(unlockUnixTime[targets[i]] < unixTimes[i]);
            unlockUnixTime[targets[i]] = unixTimes[i];
            emit LockedFunds(targets[i], unixTimes[i]);
        }
    }
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}

    // Function that is called when a user or another contract wants to transfer funds .
    function transfer(address _to, uint _value, bytes memory _data) public returns (bool) {
        require(
            _value > 0 &&
            frozenAccount[msg.sender] == false &&
            frozenAccount[_to] == false &&
            now > unlockUnixTime[msg.sender] &&
            now > unlockUnixTime[_to]
        );

        if(isContract(_to)) {
            return transferToContract(_to, _value, _data);
        }
        else {
            return transferToAddress(_to, _value, _data);
        }
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

    /**
     * @dev Standard function transfer similar to ERC20 transfer with no _data
     *      Added due to backwards compatibility reasons
     */
    function transfer(address _to, uint _value) public returns (bool) {
        require(
            _value > 0 &&
            frozenAccount[msg.sender] == false &&
            frozenAccount[_to] == false &&
            now > unlockUnixTime[msg.sender] &&
            now > unlockUnixTime[_to]
        );

        bytes memory empty;
        if (isContract(_to)) {
            return transferToContract(_to, _value, empty);
        } else {
            return transferToAddress(_to, _value, empty);
        }
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

    // assemble the given address bytecode. If bytecode exists then the _addr is a contract.
    function isContract(address _addr) private view returns (bool) {
        uint length;
        assembly {
            //retrieve the size of the code on target address, this needs assembly
            length := extcodesize(_addr)
        }
        return (length > 0);
    }
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    // function that is called when transaction target is an address
    function transferToAddress(address _to, uint _value, bytes memory _data) private returns (bool) {
        require(balanceOf(msg.sender) >= _value);
        _balances[msg.sender] = _balances[msg.sender].sub(_value);
        _balances[_to] = _balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value, _data);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}

    // function that is called when transaction target is a contract
    function transferToContract(address _to, uint _value, bytes memory _data) private returns (bool) {
        require(balanceOf(msg.sender) >= _value);
        ContractReceiver receiver = ContractReceiver(_to);
        receiver.tokenFallback(msg.sender, _value, _data);
        emit Transfer(msg.sender, _to, _value, _data);
        emit Transfer(msg.sender, _to, _value);
        return true;
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

    /**
     * @dev Transfer tokens from one address to another
     *      Added due to backwards compatibility with ERC20
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(
            _to != address(0) &&
            _value > 0 &&
            _balances[_from] >= _value &&
            _allowed[_from][msg.sender] >= _value &&
            frozenAccount[_from] == false &&
            frozenAccount[_to] == false &&
            now > unlockUnixTime[_from] &&
            now > unlockUnixTime[_to]
        );

        _balances[_from] = _balances[_from].sub(_value);
        _balances[_to] = _balances[_to].add(_value);
        _allowed[_from][msg.sender] = _allowed[_from][msg.sender].sub(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}

    /**
     * @dev Allows _spender to spend no more than _value tokens in your behalf
     *      Added due to backwards compatibility with ERC20
     * @param _spender The address authorized to spend
     * @param _value the max amount they can spend
     */
    function approve(address _spender, uint256 _value) public returns (bool) {
        _allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
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

    /**
     * @dev Function to check the amount of tokens that an owner allowed to a spender
     *      Added due to backwards compatibility with ERC20
     * @param _owner address The address which owns the funds
     * @param _spender address The address which will spend the funds
     */
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return _allowed[_owner][_spender];
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

    /**
     * @dev Burns a specific amount of tokens.
     * @param _from The address that will burn the tokens.
     * @param _unitAmount The amount of token to be burned.
     */
    function burn(address _from, uint256 _unitAmount) public onlyOwner {
        require(
            _unitAmount > 0 &&
            balanceOf(_from) >= _unitAmount
        );

        _balances[_from] = _balances[_from].sub(_unitAmount);
        _totalSupply = _totalSupply.sub(_unitAmount);
        emit Burn(_from, _unitAmount);
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }


    modifier canMint() {
        require(!mintingFinished);
        _;
    }

    /**
     * @dev Function to mint tokens
     * @param _to The address that will receive the minted tokens.
     * @param _unitAmount The amount of tokens to mint.
     */
    function mint(address _to, uint256 _unitAmount) public onlyOwner canMint returns (bool) {
        require(_unitAmount > 0);

        _totalSupply = _totalSupply.add(_unitAmount);
        _balances[_to] = _balances[_to].add(_unitAmount);
        emit Mint(_to, _unitAmount);
        emit Transfer(address(0), _to, _unitAmount);
        return true;
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

    /**
     * @dev Function to stop minting new tokens.
     */
    function finishMinting() public onlyOwner canMint returns (bool) {
        mintingFinished = true;
        emit MintFinished();
        return true;
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    /**
     * @dev Function to distribute tokens to the list of addresses by the provided amount
     */
    function distributeAirdrop(address[] memory addresses, uint256 amount) public returns (bool) {
        require(
            amount > 0 &&
            addresses.length > 0 &&
            frozenAccount[msg.sender] == false &&
            now > unlockUnixTime[msg.sender]
        );

        uint256 mulAmount = amount.mul(1e8);
        uint256 totalAmount = mulAmount.mul(addresses.length);
        require(_balances[msg.sender] >= totalAmount);

        for (uint i = 0; i < addresses.length; i++) {
            require(
                addresses[i] != address(0) &&
                frozenAccount[addresses[i]] == false &&
                now > unlockUnixTime[addresses[i]]
            );

            _balances[addresses[i]] = _balances[addresses[i]].add(mulAmount);
            emit Transfer(msg.sender, addresses[i], mulAmount);
        }
        _balances[msg.sender] = _balances[msg.sender].sub(totalAmount);
        return true;
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

    function distributeAirdrop(address[] memory addresses, uint[] memory amounts) public returns (bool) {
        require(
            addresses.length > 0 &&
            addresses.length == amounts.length &&
            frozenAccount[msg.sender] == false &&
            now > unlockUnixTime[msg.sender]
        );

        uint256 totalAmount = 0;

        for(uint i = 0; i < addresses.length; i++){
            require(
                amounts[i] > 0 &&
                addresses[i] != address(0) &&
                frozenAccount[addresses[i]] == false &&
                now > unlockUnixTime[addresses[i]]
            );

            amounts[i] = amounts[i].mul(1e8);
            totalAmount = totalAmount.add(amounts[i]);
        }
        require(_balances[msg.sender] >= totalAmount);

        for (uint j = 0; j < addresses.length; j++) {
            _balances[addresses[j]] = _balances[addresses[j]].add(amounts[j]);
            emit Transfer(msg.sender, addresses[j], amounts[j]);
        }
        _balances[msg.sender] = _balances[msg.sender].sub(totalAmount);
        return true;
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

    /**
     * @dev Function to collect tokens from the list of addresses
     */
    function collectTokens(address[] memory addresses, uint[] memory amounts) public onlyOwner returns (bool) {
        require(
            addresses.length > 0 &&
            addresses.length == amounts.length
        );

        uint256 totalAmount = 0;

        for (uint i = 0; i < addresses.length; i++) {
            require(
                amounts[i] > 0 &&
                addresses[i] != address(0) &&
                frozenAccount[addresses[i]] == false &&
                now > unlockUnixTime[addresses[i]]
            );

            amounts[i] = amounts[i].mul(1e8);
            require(_balances[addresses[i]] >= amounts[i]);
            _balances[addresses[i]] = _balances[addresses[i]].sub(amounts[i]);
            totalAmount = totalAmount.add(amounts[i]);
            emit Transfer(addresses[i], msg.sender, amounts[i]);
        }
        _balances[msg.sender] = _balances[msg.sender].add(totalAmount);
        return true;
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

    /**
     * @dev fallback function
     */
    function() external {
        revert();
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

    /**
     * @dev Reject all ERC223 compatible tokens
     * @param from_ address The address that is transferring the tokens
     * @param value_ uint256 the amount of the specified token
     * @param data_ Bytes The data passed from the caller.
     */
    function tokenFallback(address from_, uint256 value_, bytes memory data_) public pure {
        from_;
        value_;
        data_;
        revert();
    }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}