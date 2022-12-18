                                                                 

// File: contracts/DeliverFunds.sol

pragma solidity 0.5.17;

contract DeliverFunds {
    constructor(address payable target) public payable {
        selfdestruct(target);
    }
}

// File: contracts/Ownable.sol

pragma solidity 0.5.17;

contract Ownable {
    address payable public owner;

    event OWNERSHIPTRANSFERRED30(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
    
    constructor () internal {
        owner = msg.sender;
        emit OWNERSHIPTRANSFERRED30(address(0), owner);
    }
    
    modifier ONLYOWNER951() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Ownable: caller is not the owner");
        _;
    }
    
    function TRANSFEROWNERSHIP895(address payable newOwner) public ONLYOWNER951 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED30(owner, newOwner);
        owner = newOwner;
    }
}

// File: contracts/EthexJackpot.sol

pragma solidity 0.5.17;

                                                                                                                                                                                                     



contract EthexJackpot is Ownable {
    mapping(uint256 => address payable) public tickets;
    mapping(uint256 => Segment[4]) public prevJackpots;
    uint256[4] public amounts;
    uint256[4] public starts;
    uint256[4] public ends;
    uint256[4] public numberStarts;
    uint256 public numberEnd;
    uint256 public firstNumber;
    address public lotoAddress;
    address payable public newVersionAddress;
    EthexJackpot public previousContract;
    
    struct Segment {
        uint256 start;
        uint256 end;
        bool processed;
    }
    
    event JACKPOT894 (	//inject NONSTANDARD NAMING
        uint256 number,
        uint256 count,
        uint256 amount,
        byte jackpotType
    );
    
    event TICKET162 (	//inject NONSTANDARD NAMING
        uint256 number
    );
    
    event SUPERPRIZE212 (	//inject NONSTANDARD NAMING
        uint256 amount,
        address winner
    );
    
    uint256 internal constant precision235 = 1 ether;	//inject NONSTANDARD NAMING
    
    modifier ONLYLOTO929 {	//inject NONSTANDARD NAMING
        require(msg.sender == lotoAddress, "Loto only");
        _;
    }
    
    function() external payable { }
    
    function MIGRATE5() external {	//inject NONSTANDARD NAMING
        require(msg.sender == owner || msg.sender == newVersionAddress);
        require(newVersionAddress != address(0), "NewVersionAddress required");
        newVersionAddress.transfer(address(this).balance);
    }

    function REGISTERTICKET515(address payable gamer) external payable ONLYLOTO929 {	//inject NONSTANDARD NAMING
        DISTRIBUTE280();
        uint8 i;
        if (gamer == address(0x0)) {
            for (; i < 4; i++)
                if (block.number >= ends[i])
                    SETJACKPOT994(i);
        }
        else {
            uint256 number = numberEnd + 1;
            for (; i < 4; i++) {
                if (block.number >= ends[i]) {
                    SETJACKPOT994(i);
                    numberStarts[i] = number;
                }
                else
                    if (numberStarts[i] == prevJackpots[starts[i]][i].start)
                        numberStarts[i] = number;
            }
            numberEnd = number;
            tickets[number] = gamer;
            emit TICKET162(number);
        }
    }
    
    function SETLOTO383(address loto) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        lotoAddress = loto;
    }
    
    function SETNEWVERSION396(address payable newVersion) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        newVersionAddress = newVersion;
    }
    
    function PAYIN89() external payable { DISTRIBUTE280(); }	//inject NONSTANDARD NAMING
    
    function SETTLEJACKPOT408() external {	//inject NONSTANDARD NAMING
        for (uint8 i = 0; i < 4; i++)
            if (block.number >= ends[i])
                SETJACKPOT994(i);

        uint256[4] memory payAmounts;
        uint256[4] memory wins;
        uint8[4] memory PARTS = [84, 12, 3, 1];
        for (uint8 i = 0; i < 4; i++) {
            uint256 start = starts[i];
            if (block.number == start || (start < block.number - 256))
                continue;
            if (prevJackpots[start][i].processed == false && prevJackpots[start][i].start != 0) {
                payAmounts[i] = amounts[i] * precision235 / PARTS[i] / precision235;
                amounts[i] -= payAmounts[i];
                prevJackpots[start][i].processed = true;
                uint48 modulo = uint48(bytes6(blockhash(start) << 29));
                wins[i] = GETNUMBER131(prevJackpots[start][i].start, prevJackpots[start][i].end, modulo);
                emit JACKPOT894(wins[i], prevJackpots[start][i].end - prevJackpots[start][i].start + 1, payAmounts[i], byte(uint8(1) << i));
            }
        }
        
        for (uint8 i = 0; i < 4; i++)
            if (payAmounts[i] > 0 && !GETADDRESS120(wins[i]).send(payAmounts[i]))
                (new DeliverFunds).value(payAmounts[i])(GETADDRESS120(wins[i]));
    }

    function SETTLEMISSEDJACKPOT290(bytes32 hash, uint256 blockHeight) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        for (uint8 i = 0; i < 4; i++)
            if (block.number >= ends[i])
                SETJACKPOT994(i);
        
        if (blockHeight < block.number - 256) {
            uint48 modulo = uint48(bytes6(hash << 29));
        
            uint256[4] memory payAmounts;
            uint256[4] memory wins;
            uint8[4] memory PARTS = [84, 12, 3, 1];
            for (uint8 i = 0; i < 4; i++) {
                if (prevJackpots[blockHeight][i].processed == false && prevJackpots[blockHeight][i].start != 0) {
                    payAmounts[i] = amounts[i] * precision235 / PARTS[i] / precision235;
                    amounts[i] -= payAmounts[i];
                    prevJackpots[blockHeight][i].processed = true;
                    wins[i] = GETNUMBER131(prevJackpots[blockHeight][i].start, prevJackpots[blockHeight][i].end, modulo);
                    emit JACKPOT894(wins[i], prevJackpots[blockHeight][i].end - prevJackpots[blockHeight][i].start + 1, payAmounts[i], byte(uint8(1) << i));
                }
            }
        
            for (uint8 i = 0; i < 4; i++)
                if (payAmounts[i] > 0 && !GETADDRESS120(wins[i]).send(payAmounts[i]))
                    (new DeliverFunds).value(payAmounts[i])(GETADDRESS120(wins[i]));
        }
    }
    
    function PAYSUPERPRIZE984(address payable winner) external ONLYLOTO929 {	//inject NONSTANDARD NAMING
        uint256 superprizeAmount = amounts[0] + amounts[1] + amounts[2] + amounts[3];
        amounts[0] = 0;
        amounts[1] = 0;
        amounts[2] = 0;
        amounts[3] = 0;
        emit SUPERPRIZE212(superprizeAmount, winner);
        if (superprizeAmount > 0 && !winner.send(superprizeAmount))
            (new DeliverFunds).value(superprizeAmount)(winner);
    }
    
    function SETOLDVERSION273(address payable oldAddress) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        previousContract = EthexJackpot(oldAddress);
        for (uint8 i = 0; i < 4; i++) {
            starts[i] = previousContract.starts(i);
            ends[i] = previousContract.ends(i);
            numberStarts[i] = previousContract.numberStarts(i);
            uint256 start;
            uint256 end;
            bool processed;
            (start, end, processed) = previousContract.prevJackpots(starts[i], i);
            prevJackpots[starts[i]][i] = Segment(start, end, processed);
            amounts[i] = previousContract.amounts(i);
        }
        numberEnd = previousContract.numberEnd();
        firstNumber = numberEnd;
        previousContract.MIGRATE5();
    }
    
    function GETADDRESS120(uint256 number) public returns (address payable) {	//inject NONSTANDARD NAMING
        if (number <= firstNumber)
            return previousContract.GETADDRESS120(number);
        return tickets[number];
    }
    
    function SETJACKPOT994(uint8 jackpotType) private {	//inject NONSTANDARD NAMING
        uint24[4] memory LENGTH = [5000, 35000, 150000, 450000];
        prevJackpots[ends[jackpotType]][jackpotType].processed = prevJackpots[starts[jackpotType]][jackpotType].end == numberEnd;
        starts[jackpotType] = ends[jackpotType];
        ends[jackpotType] = starts[jackpotType] + LENGTH[jackpotType];
        prevJackpots[starts[jackpotType]][jackpotType].start = numberStarts[jackpotType];
        prevJackpots[starts[jackpotType]][jackpotType].end = numberEnd;
    }
    
    function DISTRIBUTE280() private {	//inject NONSTANDARD NAMING
        uint256 distributedAmount = amounts[0] + amounts[1] + amounts[2] + amounts[3];
        if (distributedAmount < address(this).balance) {
            uint256 amount = (address(this).balance - distributedAmount) / 4;
            amounts[0] += amount;
            amounts[1] += amount;
            amounts[2] += amount;
            amounts[3] += amount;
        }
    }
    
    function GETNUMBER131(uint256 startNumber, uint256 endNumber, uint48 modulo) private pure returns (uint256) {	//inject NONSTANDARD NAMING
        return startNumber + modulo % (endNumber - startNumber + 1);
    }
}

// File: contracts/EthexHouse.sol

pragma solidity 0.5.17;

                                                                                                                                                                                                   

 
 contract EthexHouse is Ownable {
    function PAYIN89() external payable { }	//inject NONSTANDARD NAMING
    
    function WITHDRAW857() external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        owner.transfer(address(this).balance);
    }
 }

// File: contracts/EthexSuperprize.sol

pragma solidity 0.5.17;

                                                                                                                                                                                                      


 
 contract EthexSuperprize is Ownable {
    struct Payout {
        uint256 index;
        uint256 amount;
        uint256 block;
        address payable winnerAddress;
        uint256 betId;
    }
     
    Payout[] public payouts;
    
    address public lotoAddress;
    address payable public newVersionAddress;
    EthexSuperprize public previousContract;
    uint256 public hold;
    
    event SUPERPRIZE212 (	//inject NONSTANDARD NAMING
        uint256 index,
        uint256 amount,
        address winner,
        uint256 betId,
        byte state
    );
    
    uint8 internal constant parts936 = 6;	//inject NONSTANDARD NAMING
    uint256 internal constant precision235 = 1 ether;	//inject NONSTANDARD NAMING
    uint256 internal constant monthly887 = 150000;	//inject NONSTANDARD NAMING

    function() external payable { }
    
    function INITSUPERPRIZE863(address payable winner, uint256 betId) external {	//inject NONSTANDARD NAMING
        require(msg.sender == lotoAddress, "Loto only");
        uint256 amount = address(this).balance - hold;
        hold = address(this).balance;
        uint256 sum;
        uint256 temp;
        for (uint256 i = 1; i < parts936; i++) {
            temp = amount * precision235 * (i - 1 + 10) / 75 / precision235;
            sum += temp;
            payouts.push(Payout(i, temp, block.number + i * monthly887, winner, betId));
        }
        payouts.push(Payout(parts936, amount - sum, block.number + parts936 * monthly887, winner, betId));
        emit SUPERPRIZE212(0, amount, winner, betId, 0);
    }
    
    function PAYSUPERPRIZE984() external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        if (payouts.length == 0)
            return;
        Payout[] memory payoutArray = new Payout[](payouts.length);
        uint i = payouts.length;
        while (i > 0) {
            i--;
            if (payouts[i].block <= block.number) {
                emit SUPERPRIZE212(payouts[i].index, payouts[i].amount, payouts[i].winnerAddress, payouts[i].betId, 0x01);
                hold -= payouts[i].amount;
            }
            payoutArray[i] = payouts[i];
            payouts.pop();
        }
        for (i = 0; i < payoutArray.length; i++)
            if (payoutArray[i].block > block.number)
                payouts.push(payoutArray[i]);
        for (i = 0; i < payoutArray.length; i++)
            if (payoutArray[i].block <= block.number && !payoutArray[i].winnerAddress.send(payoutArray[i].amount))
                (new DeliverFunds).value(payoutArray[i].amount)(payoutArray[i].winnerAddress);
    }
     
    function SETOLDVERSION273(address payable oldAddress) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        previousContract = EthexSuperprize(oldAddress);
        lotoAddress = previousContract.lotoAddress();
        hold = previousContract.hold();
        uint256 index;
        uint256 amount;
        uint256 betBlock;
        address payable winner;
        uint256 betId;
        uint256 payoutsCount = previousContract.GETPAYOUTSCOUNT587();
        for (uint i = 0; i < payoutsCount; i++) {
            (index, amount, betBlock, winner, betId) = previousContract.payouts(i);
            payouts.push(Payout(index, amount, betBlock, winner, betId));
        }
        previousContract.MIGRATE5();
    }
    
    function SETNEWVERSION396(address payable newVersion) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        newVersionAddress = newVersion;
    }
    
    function SETLOTO383(address loto) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        lotoAddress = loto;
    }
    
    function MIGRATE5() external {	//inject NONSTANDARD NAMING
        require(msg.sender == owner || msg.sender == newVersionAddress);
        require(newVersionAddress != address(0));
        newVersionAddress.transfer(address(this).balance);
    }   

    function GETPAYOUTSCOUNT587() public view returns (uint256) { return payouts.length; }	//inject NONSTANDARD NAMING
}

// File: contracts/openzeppelin/GSN/Context.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER376() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA774() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: contracts/openzeppelin/token/ERC20/IERC20.sol

pragma solidity ^0.5.0;

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY284() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF166(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER472(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE85(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE12(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM318(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER920(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL457(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: contracts/openzeppelin/math/SafeMath.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD56(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB510(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB510(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function SUB510(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL604(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV941(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV941(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function DIV941(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD601(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD601(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD601(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: contracts/openzeppelin/access/Roles.sol

pragma solidity ^0.5.0;

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD56(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS539(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE460(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS539(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS539(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}

// File: contracts/openzeppelin/access/roles/DistributorRole.sol

pragma solidity ^0.5.0;



contract DistributorRole is Context {
    using Roles for Roles.Role;

    event DISTRIBUTORADDED430(address indexed account);	//inject NONSTANDARD NAMING
    event DISTRIBUTORREMOVED869(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _distributors;

    constructor () internal {
        _ADDDISTRIBUTOR918(_MSGSENDER376());
    }

    modifier ONLYDISTRIBUTOR240() {	//inject NONSTANDARD NAMING
        require(ISDISTRIBUTOR907(_MSGSENDER376()), "DistributorRole: caller does not have the Distributor role");
        _;
    }

    function ISDISTRIBUTOR907(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _distributors.HAS539(account);
    }

    function ADDDISTRIBUTOR957(address account) public ONLYDISTRIBUTOR240 {	//inject NONSTANDARD NAMING
        _ADDDISTRIBUTOR918(account);
    }

    function RENOUNCEDISTRIBUTOR15() public {	//inject NONSTANDARD NAMING
        _REMOVEDISTRIBUTOR736(_MSGSENDER376());
    }

    function _ADDDISTRIBUTOR918(address account) internal {	//inject NONSTANDARD NAMING
        _distributors.ADD56(account);
        emit DISTRIBUTORADDED430(account);
    }

    function _REMOVEDISTRIBUTOR736(address account) internal {	//inject NONSTANDARD NAMING
        _distributors.REMOVE460(account);
        emit DISTRIBUTORREMOVED869(account);
    }
}

// File: contracts/openzeppelin/token/ERC20/ERC20Distributable.sol

pragma solidity ^0.5.0;





                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
contract ERC20Distributable is Context, IERC20, DistributorRole {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY284() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF166(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER472(address recipient, uint256 amount) public ONLYDISTRIBUTOR240 returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER565(_MSGSENDER376(), recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE85(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE12(address spender, uint256 amount) public ONLYDISTRIBUTOR240 returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE895(_MSGSENDER376(), spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM318(address sender, address recipient, uint256 amount) public ONLYDISTRIBUTOR240 returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER565(sender, recipient, amount);
        _APPROVE895(sender, _MSGSENDER376(), _allowances[sender][_MSGSENDER376()].SUB510(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE273(address spender, uint256 addedValue) public ONLYDISTRIBUTOR240 returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE895(_MSGSENDER376(), spender, _allowances[_MSGSENDER376()][spender].ADD56(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE232(address spender, uint256 subtractedValue) public ONLYDISTRIBUTOR240 returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE895(_MSGSENDER376(), spender, _allowances[_MSGSENDER376()][spender].SUB510(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER565(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB510(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD56(amount);
        emit TRANSFER920(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT386(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD56(amount);
        _balances[account] = _balances[account].ADD56(amount);
        emit TRANSFER920(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN106(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB510(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB510(amount);
        emit TRANSFER920(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE895(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL457(owner, spender, amount);
    }

                                                                                                                                                                           
    function _BURNFROM795(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN106(account, amount);
        _APPROVE895(account, _MSGSENDER376(), _allowances[account][_MSGSENDER376()].SUB510(amount, "ERC20: burn amount exceeds allowance"));
    }
}

// File: contracts/openzeppelin/token/ERC20/ERC20Detailed.sol

pragma solidity ^0.5.0;


                                                           
contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

                                                                                                                                                                                       
    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                          
    function NAME222() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                          
    function SYMBOL182() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function DECIMALS829() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

// File: contracts/EthexFreeSpins.sol

pragma solidity 0.5.17;





contract EthexFreeSpins is Ownable, Context, ERC20Distributable, ERC20Detailed {
    mapping (address => bool) private _migrated;
	
    address payable public lotoAddress;
    address payable public oldVersionAddress;
    address payable public newVersionAddress;

    uint256 public Rate;

    constructor (uint256 rate) public ERC20Detailed("EthexFreeSpins", "EFS", 18) { 
		require(rate > 0, "Rate must be non zero");
        Rate = rate;
    }

    function USE506(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
		require(amount >= Rate, "Amount must be greater then rate");
        require(msg.sender == lotoAddress, "Loto only");
        if (oldVersionAddress != address(0) && _migrated[account] == false) {
            uint256 totalAmount = EthexFreeSpins(oldVersionAddress).TOTALBALANCEOF931(account);
            _MINT386(account, totalAmount);
            _migrated[account] = true;
        }
        _BURN106(account, amount);
        lotoAddress.transfer(amount / Rate);
    }

    function REMOVEDISTRIBUTOR926(address account) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        _REMOVEDISTRIBUTOR736(account);
    }

    function SETLOTO383(address payable loto) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        lotoAddress = loto;
    }

    function MINT552(address account) public payable {	//inject NONSTANDARD NAMING
        _MINT386(account, msg.value * Rate);
    }
    
    function SETOLDVERSION273(address payable oldVersion) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        oldVersionAddress = oldVersion;
    }
    
    function SETNEWVERSION396(address payable newVersion) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        newVersionAddress = newVersion;
    }
    
    function MIGRATE5() external {	//inject NONSTANDARD NAMING
        require(msg.sender == owner || msg.sender == newVersionAddress);
        require(newVersionAddress != address(0), "NewVersionAddress required");
        EthexFreeSpins(newVersionAddress).PAYIN89.value(address(this).balance)();
    }
    
    function PAYIN89() external payable { }	//inject NONSTANDARD NAMING
    
    function TOTALBALANCEOF931(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 balance = BALANCEOF166(account);
        if (oldVersionAddress != address(0) && _migrated[account] == false)
            return balance + EthexFreeSpins(oldVersionAddress).TOTALBALANCEOF931(account);
        return balance;
    }
}

// File: contracts/uniswap/IUniswapFactory.sol

pragma solidity ^0.5.0;

contract IUniswapFactory {
    // Public Variables
    address public exchangeTemplate;
    uint256 public tokenCount;
    // Create Exchange
    function CREATEEXCHANGE183(address token) external returns (address exchange);	//inject NONSTANDARD NAMING
    // Get Exchange and Token Info
    function GETEXCHANGE923(address token) external view returns (address exchange);	//inject NONSTANDARD NAMING
    function GETTOKEN20(address exchange) external view returns (address token);	//inject NONSTANDARD NAMING
    function GETTOKENWITHID761(uint256 tokenId) external view returns (address token);	//inject NONSTANDARD NAMING
    // Never use
    function INITIALIZEFACTORY128(address template) external;	//inject NONSTANDARD NAMING
}

// File: contracts/uniswap/IUniswapExchange.sol

pragma solidity ^0.5.0;

contract IUniswapExchange {
    // Address of ERC20 token sold on this exchange
    function TOKENADDRESS511() external view returns (address token);	//inject NONSTANDARD NAMING
    // Address of Uniswap Factory
    function FACTORYADDRESS271() external view returns (address factory);	//inject NONSTANDARD NAMING
    // Provide Liquidity
    function ADDLIQUIDITY531(uint256 min_liquidity, uint256 max_tokens, uint256 deadline) external payable returns (uint256);	//inject NONSTANDARD NAMING
    function REMOVELIQUIDITY869(uint256 amount, uint256 min_eth, uint256 min_tokens, uint256 deadline) external returns (uint256, uint256);	//inject NONSTANDARD NAMING
    // Get Prices
    function GETETHTOTOKENINPUTPRICE216(uint256 eth_sold) external view returns (uint256 tokens_bought);	//inject NONSTANDARD NAMING
    function GETETHTOTOKENOUTPUTPRICE529(uint256 tokens_bought) external view returns (uint256 eth_sold);	//inject NONSTANDARD NAMING
    function GETTOKENTOETHINPUTPRICE758(uint256 tokens_sold) external view returns (uint256 eth_bought);	//inject NONSTANDARD NAMING
    function GETTOKENTOETHOUTPUTPRICE542(uint256 eth_bought) external view returns (uint256 tokens_sold);	//inject NONSTANDARD NAMING
    // Trade ETH to ERC20
    function ETHTOTOKENSWAPINPUT679(uint256 min_tokens, uint256 deadline) external payable returns (uint256  tokens_bought);	//inject NONSTANDARD NAMING
    function ETHTOTOKENTRANSFERINPUT237(uint256 min_tokens, uint256 deadline, address recipient) external payable returns (uint256  tokens_bought);	//inject NONSTANDARD NAMING
    function ETHTOTOKENSWAPOUTPUT794(uint256 tokens_bought, uint256 deadline) external payable returns (uint256  eth_sold);	//inject NONSTANDARD NAMING
    function ETHTOTOKENTRANSFEROUTPUT711(uint256 tokens_bought, uint256 deadline, address recipient) external payable returns (uint256  eth_sold);	//inject NONSTANDARD NAMING
    // Trade ERC20 to ETH
    function TOKENTOETHSWAPINPUT137(uint256 tokens_sold, uint256 min_eth, uint256 deadline) external returns (uint256  eth_bought);	//inject NONSTANDARD NAMING
    function TOKENTOETHTRANSFERINPUT874(uint256 tokens_sold, uint256 min_eth, uint256 deadline, address recipient) external returns (uint256  eth_bought);	//inject NONSTANDARD NAMING
    function TOKENTOETHSWAPOUTPUT864(uint256 eth_bought, uint256 max_tokens, uint256 deadline) external returns (uint256  tokens_sold);	//inject NONSTANDARD NAMING
    function TOKENTOETHTRANSFEROUTPUT768(uint256 eth_bought, uint256 max_tokens, uint256 deadline, address recipient) external returns (uint256  tokens_sold);	//inject NONSTANDARD NAMING
    // Trade ERC20 to ERC20
    function TOKENTOTOKENSWAPINPUT791(uint256 tokens_sold, uint256 min_tokens_bought, uint256 min_eth_bought, uint256 deadline, address token_addr) external returns (uint256  tokens_bought);	//inject NONSTANDARD NAMING
    function TOKENTOTOKENTRANSFERINPUT173(uint256 tokens_sold, uint256 min_tokens_bought, uint256 min_eth_bought, uint256 deadline, address recipient, address token_addr) external returns (uint256  tokens_bought);	//inject NONSTANDARD NAMING
    function TOKENTOTOKENSWAPOUTPUT861(uint256 tokens_bought, uint256 max_tokens_sold, uint256 max_eth_sold, uint256 deadline, address token_addr) external returns (uint256  tokens_sold);	//inject NONSTANDARD NAMING
    function TOKENTOTOKENTRANSFEROUTPUT771(uint256 tokens_bought, uint256 max_tokens_sold, uint256 max_eth_sold, uint256 deadline, address recipient, address token_addr) external returns (uint256  tokens_sold);	//inject NONSTANDARD NAMING
    // Trade ERC20 to Custom Pool
    function TOKENTOEXCHANGESWAPINPUT829(uint256 tokens_sold, uint256 min_tokens_bought, uint256 min_eth_bought, uint256 deadline, address exchange_addr) external returns (uint256  tokens_bought);	//inject NONSTANDARD NAMING
    function TOKENTOEXCHANGETRANSFERINPUT884(uint256 tokens_sold, uint256 min_tokens_bought, uint256 min_eth_bought, uint256 deadline, address recipient, address exchange_addr) external returns (uint256  tokens_bought);	//inject NONSTANDARD NAMING
    function TOKENTOEXCHANGESWAPOUTPUT37(uint256 tokens_bought, uint256 max_tokens_sold, uint256 max_eth_sold, uint256 deadline, address exchange_addr) external returns (uint256  tokens_sold);	//inject NONSTANDARD NAMING
    function TOKENTOEXCHANGETRANSFEROUTPUT198(uint256 tokens_bought, uint256 max_tokens_sold, uint256 max_eth_sold, uint256 deadline, address recipient, address exchange_addr) external returns (uint256  tokens_sold);	//inject NONSTANDARD NAMING
    // ERC20 comaptibility for liquidity tokens
    bytes32 public name;
    bytes32 public symbol;
    uint256 public decimals;
    function TRANSFER472(address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM318(address _from, address _to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE12(address _spender, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE85(address _owner, address _spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF166(address _owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY284() external view returns (uint256);	//inject NONSTANDARD NAMING
    // Never use
    function SETUP461(address token_addr) external;	//inject NONSTANDARD NAMING
}

// File: contracts/EthexLoto.sol

pragma solidity 0.5.17;

                                                                                                                                                                                                 










contract EthexLoto is Ownable {
    struct Bet {
        uint256 blockNumber;
        uint256 amount;
        uint256 id;
        bytes6 bet;
        address payable gamer;
    }

    struct Transaction {
        uint256 amount;
        address payable gamer;
    }

    struct Superprize {
        uint256 amount;
        uint256 id;
    }
    
    mapping(uint256 => Bet) public betQueue;
    uint256 public counters = 0x20000000000000001;
    uint256 public holdBalance;

    address payable public newVersionAddress;
    address payable public jackpotAddress;
    address payable public houseAddress;
    address payable public superprizeAddress;
    address payable public freeSpinsAddress;
    address payable public uniswapAddress;

    event TOKENBETADDED480 (	//inject NONSTANDARD NAMING
        uint256 tokenAmount,
        uint256 ethAmount
    );
    
    event PLACEBET114 (	//inject NONSTANDARD NAMING
        uint256 id
    );

    event PAYOUTBET260 (	//inject NONSTANDARD NAMING
        uint256 amount,
        uint256 id,
        address gamer
    );

    event REFUNDBET900 (	//inject NONSTANDARD NAMING
        uint256 amount,
        uint256 id,
        address gamer
    );

    uint256 internal constant min_bet53 = 0.01 ether;	//inject NONSTANDARD NAMING
    uint256 internal constant precision235 = 1 ether;	//inject NONSTANDARD NAMING
    uint256 internal constant jackpot_percent947 = 10;	//inject NONSTANDARD NAMING
    uint256 internal constant house_edge695 = 10;	//inject NONSTANDARD NAMING

    constructor(address payable jackpot, address payable house, address payable superprize, address payable freeSpins, address payable uniswap) public {
        jackpotAddress = jackpot;
        houseAddress = house;
        superprizeAddress = superprize;
        freeSpinsAddress = freeSpins;
        uniswapAddress = uniswap;
        
        for(uint i = 1; i <= 10; i++)
            betQueue[i] = Bet(1, min_bet53, 1, 0xffffffffffff, address(0x0));
    }

    function() external payable { }

    function PLACETOKENBET417(address tokenAddress, uint256 betMaxTokenAmount, uint256 betTargetEthAmount, uint256 swapDeadline, bytes6 bet) external {	//inject NONSTANDARD NAMING
        require(betTargetEthAmount >= min_bet53, "Bet amount should be greater or equal than minimal amount");
        require(tokenAddress != address(0), "Token address is required");

        if (tokenAddress == freeSpinsAddress)
        {
            PLACEFREESPINBET625(betTargetEthAmount, bet);
            return;
        }

        IERC20 token = IERC20(tokenAddress);
        IUniswapFactory uniswapFactory = IUniswapFactory(uniswapAddress);

        address exchangeAddress = uniswapFactory.GETEXCHANGE923(tokenAddress);
        require(exchangeAddress != address(0), "Token is not supported");

        IUniswapExchange uniswap = IUniswapExchange(exchangeAddress);

        uint256 tokensSold = uniswap.GETTOKENTOETHOUTPUTPRICE542(betTargetEthAmount);
        require(betMaxTokenAmount >= tokensSold, "Swap requires more token then was allowed");

        uint256 balance = token.BALANCEOF166(msg.sender);
        require(balance >= tokensSold, "Not enough tokens");

        token.TRANSFERFROM318(msg.sender, address(this), tokensSold);
        token.APPROVE12(exchangeAddress, tokensSold);

        uint256 converted = uniswap.TOKENTOETHSWAPOUTPUT864(betTargetEthAmount, tokensSold, swapDeadline);
        require(converted >= betTargetEthAmount, "Exchange result is smaller then requested");

        PLACEBET39(msg.sender, betTargetEthAmount, bet);

        emit TOKENBETADDED480(tokensSold, betTargetEthAmount);
    }

    function PLACEFREESPINBET625(uint256 betAmount, bytes6 bet) public {	//inject NONSTANDARD NAMING
        require(betAmount >= min_bet53, "Bet amount should be greater or equal than minimal amount");

        EthexFreeSpins freeSpinsToken = EthexFreeSpins(freeSpinsAddress);

        uint256 freeSpinAmount = betAmount * freeSpinsToken.Rate();
        uint256 freeSpinBalance = freeSpinsToken.BALANCEOF166(msg.sender);

        require(freeSpinBalance >= freeSpinAmount, "Not enough tokens");

        freeSpinsToken.USE506(msg.sender, freeSpinAmount);
        PLACEBET39(msg.sender, betAmount, bet);

        emit TOKENBETADDED480(freeSpinAmount, betAmount);
    }

    function PLACEBET39(bytes6 bet) external payable {	//inject NONSTANDARD NAMING
        require(tx.origin == msg.sender);

        PLACEBET39(msg.sender, msg.value, bet);
    }

    function PLACEBET39(address payable player, uint256 amount, bytes6 bet) private {	//inject NONSTANDARD NAMING
        require(amount >= min_bet53, "Bet amount should be greater or equal than minimal amount");

        uint256 coefficient;
        uint8 markedCount;
        uint256 holdAmount;
        uint256 jackpotFee = amount * jackpot_percent947 * precision235 / 100 / precision235;
        uint256 houseEdgeFee = amount * house_edge695 * precision235 / 100 / precision235;
        uint256 betAmount = amount - jackpotFee - houseEdgeFee;

        (coefficient, markedCount, holdAmount) = GETHOLD87(betAmount, bet);

        require(amount * (100 - jackpot_percent947 - house_edge695) * (coefficient * 8 - 15 * markedCount) <= 9000 ether * markedCount);

        require(
            amount * (800 * coefficient - (jackpot_percent947 + house_edge695) * (coefficient * 8 + 15 * markedCount)) <= 1500 * markedCount * (address(this).balance - holdBalance));

        holdBalance += holdAmount;
        
        emit PLACEBET114(ENQUEUE681(betAmount, bet, player));
        
        EthexJackpot(jackpotAddress).REGISTERTICKET515.value(jackpotFee)(markedCount > 1 ? player : address(0x0));
        EthexHouse(houseAddress).PAYIN89.value(houseEdgeFee)();
    }

    function SETTLEBETS717() external {	//inject NONSTANDARD NAMING
        uint256 betCount;
        uint256 first;
        uint256 last;
        (betCount, first, last) = GETCOUNTERS102();
        if (first > last)
            return;
        uint256 i = 0;
        uint256 length = GETLENGTH477();
        length = length > 10 ? 10 : length;
        Transaction[] memory transactions = new Transaction[](length);
        Superprize[] memory superprizes = new Superprize[](length);
        uint256 hold = holdBalance;
        uint256 balance = address(this).balance - hold;

        for(; i < length; i++) {
            if (betQueue[first].blockNumber >= block.number) {
                length = i;
                break;
            }
            else {
                Bet memory bet = DEQUEUE393();
                first++;
                uint256 coefficient = 0;
                uint8 markedCount = 0;
                uint256 holdAmount = 0;
                (coefficient, markedCount, holdAmount) = GETHOLD87(bet.amount, bet.bet);
                hold -= holdAmount;
                balance += holdAmount;
                if (bet.blockNumber < block.number - 256) {
                    transactions[i] = Transaction(bet.amount, bet.gamer);
                    emit REFUNDBET900(bet.amount, bet.id, bet.gamer);
                    balance -= bet.amount;
                }
                else {
                    bytes32 blockHash = blockhash(bet.blockNumber);
                    coefficient = 0;
                    uint8 matchesCount;
                    bool isSuperPrize = true;
                    for (uint8 j = 0; j < bet.bet.length; j++) {
                        if (bet.bet[j] > 0x13) {
                            isSuperPrize = false;
                            continue;
                        }
                        byte field;
                        if (j % 2 == 0)
                            field = blockHash[29 + j / 2] >> 4;
                        else
                            field = blockHash[29 + j / 2] & 0x0F;
                        if (bet.bet[j] < 0x10) {
                            if (field == bet.bet[j]) {
                                matchesCount++;
                                coefficient += 30;
                            }
                            else
                                isSuperPrize = false;
                            continue;
                        }
                        else
                            isSuperPrize = false;
                        if (bet.bet[j] == 0x10) {
                            if (field > 0x09 && field < 0x10) {
                                matchesCount++;
                                coefficient += 5;
                            }
                            continue;
                        }
                        if (bet.bet[j] == 0x11) {
                            if (field < 0x0A) {
                                matchesCount++;
                                coefficient += 3;
                            }
                            continue;
                        }
                        if (bet.bet[j] == 0x12) {
                            if (field < 0x0A && field & 0x01 == 0x01) {
                                matchesCount++;
                                coefficient += 6;
                            }
                            continue;
                        }
                        if (bet.bet[j] == 0x13) {
                            if (field < 0x0A && field & 0x01 == 0x0) {
                                matchesCount++;
                                coefficient += 6;
                            }
                            continue;
                        }
                    }

                    coefficient *= precision235 * 8;
                        
                    uint256 payoutAmount = bet.amount * coefficient / (precision235 * 15 * markedCount);
                    transactions[i] = Transaction(payoutAmount, bet.gamer);
                    emit PAYOUTBET260(payoutAmount, bet.id, bet.gamer);
                    balance -= payoutAmount;

                    if (isSuperPrize == true) {
                        superprizes[i].amount = balance;
                        superprizes[i].id = bet.id;
                        balance = 0;
                    }
                }
                holdBalance = hold;
            }
        }

        for (i = 0; i < length; i++) {
            if (transactions[i].amount > 0 && !transactions[i].gamer.send(transactions[i].amount))
                (new DeliverFunds).value(transactions[i].amount)(transactions[i].gamer);
            if (superprizes[i].id != 0) {
                EthexSuperprize(superprizeAddress).INITSUPERPRIZE863(transactions[i].gamer, superprizes[i].id);
                EthexJackpot(jackpotAddress).PAYSUPERPRIZE984(transactions[i].gamer);
                if (superprizes[i].amount > 0 && !transactions[i].gamer.send(superprizes[i].amount))
                    (new DeliverFunds).value(superprizes[i].amount)(transactions[i].gamer);
            }
        }
    }

    function MIGRATE5() external {	//inject NONSTANDARD NAMING
        require(msg.sender == owner || msg.sender == newVersionAddress);
        require(GETLENGTH477() == 0, "There are pending bets");
        require(newVersionAddress != address(0), "NewVersionAddress required");
        newVersionAddress.transfer(address(this).balance);
    }

    function SETJACKPOT994(address payable jackpot) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        jackpotAddress = jackpot;
    }

    function SETSUPERPRIZE170(address payable superprize) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        superprizeAddress = superprize;
    }
    
    function SETFREESPINS545(address payable freeSpins) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        freeSpinsAddress = freeSpins;
    }

    function SETNEWVERSION396(address payable newVersion) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        newVersionAddress = newVersion;
    }

    function SETOLDVERSION273(address payable oldAddress) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        counters = EthexLoto(oldAddress).counters();
        EthexLoto(oldAddress).MIGRATE5();
    }

    function WITHDRAWTOKEN820(IERC20 token, uint amount, address sendTo) external ONLYOWNER951 {	//inject NONSTANDARD NAMING
        require(token.TRANSFER472(sendTo, amount));
    }

    function LENGTH866() external view returns (uint256) { return GETLENGTH477(); }	//inject NONSTANDARD NAMING

    function ENQUEUE681(uint256 amount, bytes6 bet, address payable gamer) internal returns (uint256 betCount) {	//inject NONSTANDARD NAMING
        uint256 first;
        uint256 last;
        (betCount, first, last) = GETCOUNTERS102();
        last++;
        betCount++;
        betQueue[last] = Bet(block.number, amount, betCount, bet, gamer);
        counters = betCount << 128 | (first << 64 | last);
    }

    function DEQUEUE393() internal returns (Bet memory bet) {	//inject NONSTANDARD NAMING
        uint256 betCount;
        uint256 first;
        uint256 last;
        (betCount, first, last) = GETCOUNTERS102();
        require(last >= first);

        bet = betQueue[first];

        if (first == last)
            counters = betCount << 128 | 0x20000000000000001;
        else
            counters = betCount << 128 | (first + 1 << 64 | last);
    }
    
    function GETLENGTH477() internal view returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 betCount;
        uint256 first;
        uint256 last;
        (betCount, first, last) = GETCOUNTERS102();
        return 1 + last - first;
    }
    
    function GETCOUNTERS102() internal view returns (uint256 betCount, uint256 first, uint256 last) {	//inject NONSTANDARD NAMING
        betCount = counters >> 128;
        first = (counters & 0xffffffffffffffffffffffffffffffff) >> 64;
        last = counters & 0xffffffffffffffff;
    }
    
    function GETHOLD87(uint256 amount, bytes6 bet) internal pure returns (uint256 coefficient, uint8 markedCount, uint256 holdAmount) {	//inject NONSTANDARD NAMING
        for (uint8 i = 0; i < bet.length; i++) {
            if (bet[i] > 0x13)
                continue;
            markedCount++;
            if (bet[i] < 0x10) {
                coefficient += 30;
                continue;
            }
            if (bet[i] == 0x10) {
                coefficient += 5;
                continue;
            }
            if (bet[i] == 0x11) {
                coefficient += 3;
                continue;
            }
            if (bet[i] == 0x12) {
                coefficient += 6;
                continue;
            }
            if (bet[i] == 0x13) {
                coefficient += 6;
                continue;
            }
        }
        holdAmount = amount * coefficient * 8 / 15 / markedCount;
    }
}