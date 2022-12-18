pragma solidity 0.5.8;

contract Ownable {

    address public owner;

    event NEWOWNER756(address indexed old, address indexed current);	//inject NONSTANDARD NAMING

    modifier ONLYOWNER293 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function SETOWNER849(address _new)	//inject NONSTANDARD NAMING
        public
        ONLYOWNER293
    {
        require(_new != address(0));
        owner = _new;
        emit NEWOWNER756(owner, _new);
    }
}

interface IERC20 {
    
    event TRANSFER933(address indexed _from, address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING
    event APPROVAL441(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING

                                                              
                                               
                                                           
                                                          
    function TRANSFER153(address _to, uint256 _value) external returns (bool success);	//inject NONSTANDARD NAMING

                                                                                                    
                                              
                                               
                                                           
                                                          
    function TRANSFERFROM92(address _from, address _to, uint256 _value) external returns (bool success);	//inject NONSTANDARD NAMING

                                                                      
                                                                              
                                                                   
                                                          
    function APPROVE506(address _spender, uint256 _value) external returns (bool success);	//inject NONSTANDARD NAMING
    
                                                                          
                           
    function BALANCEOF915(address _owner) external view returns (uint256 balance);	//inject NONSTANDARD NAMING

                                                              
                                                                              
                                                           
    function ALLOWANCE223(address _owner, address _spender) external view returns (uint256 remaining);	//inject NONSTANDARD NAMING
}

contract SafeMath {

    function SAFEMUL431(uint256 a, uint256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(
            c / a == b,
            "UINT256_OVERFLOW"
        );
        return c;
    }

    function SAFEDIV579(uint256 a, uint256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        uint256 c = a / b;
        return c;
    }

    function SAFESUB677(uint256 a, uint256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        require(
            b <= a,
            "UINT256_UNDERFLOW"
        );
        return a - b;
    }

    function SAFEADD350(uint256 a, uint256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        uint256 c = a + b;
        require(
            c >= a,
            "UINT256_OVERFLOW"
        );
        return c;
    }

    function MAX64125(uint64 a, uint64 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        return a >= b ? a : b;
    }

    function MIN64423(uint64 a, uint64 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        return a < b ? a : b;
    }

    function MAX256526(uint256 a, uint256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        return a >= b ? a : b;
    }

    function MIN256866(uint256 a, uint256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        return a < b ? a : b;
    }
}

contract ProgressiveUnlockWallet is Ownable, SafeMath {

    mapping(address => VestingSchedule) public schedules;        // vesting schedules for given addresses
    mapping(address => address) public addressChangeRequests;    // requested address changes

    IERC20 vestingToken;

    event VESTINGSCHEDULEREGISTERED20(	//inject NONSTANDARD NAMING
        address indexed registeredAddress,
        address depositor,
        uint startTimeInSec,
        uint cliffTimeInSec,
        uint endTimeInSec,
        uint totalAmount
    );

    event VESTINGSCHEDULECONFIRMED266(	//inject NONSTANDARD NAMING
        address indexed registeredAddress,
        address depositor,
        uint startTimeInSec,
        uint cliffTimeInSec,
        uint endTimeInSec,
        uint totalAmount
    );

    event WITHDRAWAL789(	//inject NONSTANDARD NAMING
        address indexed registeredAddress,
        uint amountWithdrawn
    );

    event ADDRESSCHANGEREQUESTED65(	//inject NONSTANDARD NAMING
        address indexed oldRegisteredAddress,
        address indexed newRegisteredAddress
    );

    event ADDRESSCHANGECONFIRMED599(	//inject NONSTANDARD NAMING
        address indexed oldRegisteredAddress,
        address indexed newRegisteredAddress
    );

    struct VestingSchedule {
        uint startTimeInSec;
        uint cliffTimeInSec;
        uint endTimeInSec;
        uint totalAmount;
        uint totalAmountWithdrawn;
        address depositor;
        bool isConfirmed;
    }

    modifier ADDRESSREGISTERED418(address target) {	//inject NONSTANDARD NAMING
        VestingSchedule storage vestingSchedule = schedules[target];
        require(vestingSchedule.depositor != address(0));
        _;
    }

    modifier ADDRESSNOTREGISTERED450(address target) {	//inject NONSTANDARD NAMING
        VestingSchedule storage vestingSchedule = schedules[target];
        require(vestingSchedule.depositor == address(0));
        _;
    }

    modifier VESTINGSCHEDULECONFIRMED75(address target) {	//inject NONSTANDARD NAMING
        VestingSchedule storage vestingSchedule = schedules[target];
        require(vestingSchedule.isConfirmed);
        _;
    }

    modifier VESTINGSCHEDULENOTCONFIRMED117(address target) {	//inject NONSTANDARD NAMING
        VestingSchedule storage vestingSchedule = schedules[target];
        require(!vestingSchedule.isConfirmed);
        _;
    }

    modifier PENDINGADDRESSCHANGEREQUEST42(address target) {	//inject NONSTANDARD NAMING
        require(addressChangeRequests[target] != address(0));
        _;
    }

    modifier PASTCLIFFTIME568(address target) {	//inject NONSTANDARD NAMING
        VestingSchedule storage vestingSchedule = schedules[target];
        require(block.timestamp > vestingSchedule.cliffTimeInSec);
        _;
    }

    modifier VALIDVESTINGSCHEDULETIMES795(uint startTimeInSec, uint cliffTimeInSec, uint endTimeInSec) {	//inject NONSTANDARD NAMING
        require(cliffTimeInSec >= startTimeInSec);
        require(endTimeInSec >= cliffTimeInSec);
        _;
    }

    modifier ADDRESSNOTNULL777(address target) {	//inject NONSTANDARD NAMING
        require(target != address(0));
        _;
    }

                                                   
                                                       
    constructor(address _vestingToken) public {
        vestingToken = IERC20(_vestingToken);
    }

                                                        
                                                                                                          
                                                                        
                                                                      
                                                                                   
                                                                   
                                                                                                                                 
    function REGISTERVESTINGSCHEDULE391(	//inject NONSTANDARD NAMING
        address _addressToRegister,
        address _depositor,
        uint _startTimeInSec,
        uint _cliffTimeInSec,
        uint _endTimeInSec,
        uint _totalAmount
    )
        public
        ONLYOWNER293
        ADDRESSNOTNULL777(_depositor)
        VESTINGSCHEDULENOTCONFIRMED117(_addressToRegister)
        VALIDVESTINGSCHEDULETIMES795(_startTimeInSec, _cliffTimeInSec, _endTimeInSec)
    {
        schedules[_addressToRegister] = VestingSchedule({
            startTimeInSec: _startTimeInSec,
            cliffTimeInSec: _cliffTimeInSec,
            endTimeInSec: _endTimeInSec,
            totalAmount: _totalAmount,
            totalAmountWithdrawn: 0,
            depositor: _depositor,
            isConfirmed: false
        });

        emit VESTINGSCHEDULEREGISTERED20(
            _addressToRegister,
            _depositor,
            _startTimeInSec,
            _cliffTimeInSec,
            _endTimeInSec,
            _totalAmount
        );
    }

                                                                                                                          
                                                                      
                                                                                   
                                                                   
                                                                                                                                 
    function CONFIRMVESTINGSCHEDULE960(	//inject NONSTANDARD NAMING
        uint _startTimeInSec,
        uint _cliffTimeInSec,
        uint _endTimeInSec,
        uint _totalAmount
    )
        public
        ADDRESSREGISTERED418(msg.sender)
        VESTINGSCHEDULENOTCONFIRMED117(msg.sender)
    {
        VestingSchedule storage vestingSchedule = schedules[msg.sender];

        require(vestingSchedule.startTimeInSec == _startTimeInSec);
        require(vestingSchedule.cliffTimeInSec == _cliffTimeInSec);
        require(vestingSchedule.endTimeInSec == _endTimeInSec);
        require(vestingSchedule.totalAmount == _totalAmount);

        vestingSchedule.isConfirmed = true;
        require(vestingToken.TRANSFERFROM92(vestingSchedule.depositor, address(this), _totalAmount));

        emit VESTINGSCHEDULECONFIRMED266(
            msg.sender,
            vestingSchedule.depositor,
            _startTimeInSec,
            _cliffTimeInSec,
            _endTimeInSec,
            _totalAmount
        );
    }

                                                                                          
    function WITHDRAW62()	//inject NONSTANDARD NAMING
        public
        VESTINGSCHEDULECONFIRMED75(msg.sender)
        PASTCLIFFTIME568(msg.sender)
    {
        VestingSchedule storage vestingSchedule = schedules[msg.sender];

        uint totalAmountVested = GETTOTALAMOUNTVESTED783(vestingSchedule);
        uint amountWithdrawable = SAFESUB677(totalAmountVested, vestingSchedule.totalAmountWithdrawn);
        vestingSchedule.totalAmountWithdrawn = totalAmountVested;

        if (amountWithdrawable > 0) {
            require(vestingToken.TRANSFER153(msg.sender, amountWithdrawable));
            emit WITHDRAWAL789(msg.sender, amountWithdrawable);
        }
    }

                                                                      
                                                                  
    function REQUESTADDRESSCHANGE146(address _newRegisteredAddress)	//inject NONSTANDARD NAMING
        public
        VESTINGSCHEDULECONFIRMED75(msg.sender)
        ADDRESSNOTREGISTERED450(_newRegisteredAddress)
        ADDRESSNOTNULL777(_newRegisteredAddress)
    {
        addressChangeRequests[msg.sender] = _newRegisteredAddress;
        emit ADDRESSCHANGEREQUESTED65(msg.sender, _newRegisteredAddress);
    }

                                                                                   
                                                                
                                                                            
    function CONFIRMADDRESSCHANGE397(address _oldRegisteredAddress, address _newRegisteredAddress)	//inject NONSTANDARD NAMING
        public
        ONLYOWNER293
        PENDINGADDRESSCHANGEREQUEST42(_oldRegisteredAddress)
        ADDRESSNOTREGISTERED450(_newRegisteredAddress)
    {
        address newRegisteredAddress = addressChangeRequests[_oldRegisteredAddress];
        require(newRegisteredAddress == _newRegisteredAddress);    // prevents race condition

        VestingSchedule memory vestingSchedule = schedules[_oldRegisteredAddress];
        schedules[newRegisteredAddress] = vestingSchedule;

        delete schedules[_oldRegisteredAddress];
        delete addressChangeRequests[_oldRegisteredAddress];

        emit ADDRESSCHANGECONFIRMED599(_oldRegisteredAddress, _newRegisteredAddress);
    }

                                                                                                                               
                                                                                
                                                           
    function GETTOTALAMOUNTVESTED783(VestingSchedule memory vestingSchedule)	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint)
    {
        if (block.timestamp >= vestingSchedule.endTimeInSec) return vestingSchedule.totalAmount;

        uint timeSinceStartInSec = SAFESUB677(block.timestamp, vestingSchedule.startTimeInSec);
        uint totalVestingTimeInSec = SAFESUB677(vestingSchedule.endTimeInSec, vestingSchedule.startTimeInSec);
        uint totalAmountVested = SAFEDIV579(
            SAFEMUL431(timeSinceStartInSec, vestingSchedule.totalAmount),
            totalVestingTimeInSec
        );

        return totalAmountVested;
    }
}