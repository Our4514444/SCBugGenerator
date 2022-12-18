                                                                 

pragma solidity 0.5.16;


interface IDaiBackstopSyndicate {
  event AUCTIONENTERED738(uint256 auctionId, uint256 mkrAsk, uint256 daiBid);	//inject NONSTANDARD NAMING
  event AUCTIONFINALIZED463(uint256 auctionId);	//inject NONSTANDARD NAMING

  enum Status {
    ACCEPTING_DEPOSITS,
    ACTIVATED,
    DEACTIVATED
  }

  // Anyone can deposit Dai up until the auctions have started at 1:1
  function ENLIST547(uint256 daiAmount) external returns (uint256 backstopTokensMinted);	//inject NONSTANDARD NAMING

  // Anyone can withdraw at any point as long as Dai is not locked in auctions
  function DEFECT36(uint256 backstopTokenAmount) external returns (uint256 daiRedeemed, uint256 mkrRedeemed);	//inject NONSTANDARD NAMING

  // Anyone can enter an auction for the syndicate, bidding Dai in return for MKR
  function ENTERAUCTION179(uint256 auctionId) external;	//inject NONSTANDARD NAMING

  // Anyone can finalize an auction, returning the Dai or MKR to the syndicate
  function FINALIZEAUCTION324(uint256 auctionId) external;	//inject NONSTANDARD NAMING

  // An owner can halt all new deposits and auctions (but not withdrawals or ongoing auctions)
  function CEASEFIRE149() external;	//inject NONSTANDARD NAMING
  
  function GETDAIBALANCE248() external view returns (uint256 combinedDaiInVat);	//inject NONSTANDARD NAMING

  function GETSTATUS163() external view returns (Status status);	//inject NONSTANDARD NAMING

  function GETACTIVEAUCTIONS691() external view returns (uint256[] memory activeAuctions);	//inject NONSTANDARD NAMING
}


interface IJoin {
    function JOIN632(address, uint256) external;	//inject NONSTANDARD NAMING
    function EXIT66(address, uint256) external;	//inject NONSTANDARD NAMING
}


interface IVat {
    function DAI622(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function HOPE43(address) external;	//inject NONSTANDARD NAMING
    function MOVE603(address, address, uint256) external;	//inject NONSTANDARD NAMING
}


interface IFlopper {
    // --- Auth ---
    // caller authorization (1 = authorized, 0 = not authorized)
    function WARDS636(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    // authorize caller
    function RELY170(address usr) external;	//inject NONSTANDARD NAMING
    // deauthorize caller
    function DENY872(address usr) external;	//inject NONSTANDARD NAMING

    // Bid objects
    function BIDS298(uint256) external view returns (	//inject NONSTANDARD NAMING
        uint256 bid,
        uint256 lot,
        address guy,
        uint48 tic,
        uint48 end
    );

    // DAI contract address
    function VAT176() external view returns (address);	//inject NONSTANDARD NAMING
    // MKR contract address
    function GEM772() external view returns (address);	//inject NONSTANDARD NAMING

    // num decimals (constant)
    function ONE769() external pure returns (uint256);	//inject NONSTANDARD NAMING

    // minimum bid increase (config - 5% initial)
    function BEG274() external view returns (uint256);	//inject NONSTANDARD NAMING
    // initial lot increase (config - 50% initial)
    function PAD245() external view returns (uint256);	//inject NONSTANDARD NAMING
    // bid lifetime (config - 3 hours initial)
    function TTL998() external view returns (uint48);	//inject NONSTANDARD NAMING
    // total auction length (config - 2 days initial)
    function TAU130() external view returns (uint48);	//inject NONSTANDARD NAMING

    // number of auctions
    function KICKS473() external view returns (uint256);	//inject NONSTANDARD NAMING
    // status of the auction (1 = active, 0 = disabled)
    function LIVE944() external view returns (uint256);	//inject NONSTANDARD NAMING
    // user who shut down flopper mechanism and paid off last bid
    function VOW547() external view returns (address);	//inject NONSTANDARD NAMING

    // --- Events ---
    event KICK122(uint256 id, uint256 lot, uint256 bid, address indexed gal);	//inject NONSTANDARD NAMING

    // --- Admin ---
    function FILE984(bytes32 what, uint256 data) external;	//inject NONSTANDARD NAMING

    // --- Auction ---

    // create an auction 
    // access control: authed
    // state machine: after auction expired
    // gal - recipient of the dai
    // lot - amount of mkr to mint
    // bid - amount of dai to pay
    // id - id of the auction
    function KICK681(address gal, uint256 lot, uint256 bid) external returns (uint256 id);	//inject NONSTANDARD NAMING

    // extend the auction and increase minimum maker amount minted
    // access control: not-authed
    // state machine: after auction expiry, before first bid
    // id - id of the auction
    function TICK392(uint256 id) external;	//inject NONSTANDARD NAMING

    // bid up auction and refund locked up dai to previous bidder
    // access control: not-authed
    // state machine: before auction expired
    // id - id of the auction
    // lot - amount of mkr to mint
    // bid - amount of dai to pay
    function DENT81(uint256 id, uint256 lot, uint256 bid) external;	//inject NONSTANDARD NAMING

    // finalize auction
    // access control: not-authed
    // state machine: after auction expired
    // id - id of the auction
    function DEAL494(uint256 id) external;	//inject NONSTANDARD NAMING

    // --- Shutdown ---

    // shutdown flopper mechanism
    // access control: authed
    // state machine: anytime
    function CAGE423() external;	//inject NONSTANDARD NAMING

    // get cancelled bid back
    // access control: authed
    // state machine: after shutdown
    function YANK806(uint256 id) external;	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD933(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB299(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL255(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV748(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD221(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}


                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY621() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF847(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER180(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE684(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVE824(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM652(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER244(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL325(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY621() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF847(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER180(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER372(msg.sender, recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE684(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE824(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE718(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function TRANSFERFROM652(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER372(sender, recipient, amount);
        _APPROVE718(sender, msg.sender, _allowances[sender][msg.sender].SUB299(amount));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE773(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE718(msg.sender, spender, _allowances[msg.sender][spender].ADD933(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE609(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE718(msg.sender, spender, _allowances[msg.sender][spender].SUB299(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER372(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB299(amount);
        _balances[recipient] = _balances[recipient].ADD933(amount);
        emit TRANSFER244(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT13(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD933(amount);
        _balances[account] = _balances[account].ADD933(amount);
        emit TRANSFER244(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN912(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _totalSupply = _totalSupply.SUB299(value);
        _balances[account] = _balances[account].SUB299(value);
        emit TRANSFER244(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE718(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = value;
        emit APPROVAL325(owner, spender, value);
    }

                                                                                                                                                                          
    function _BURNFROM763(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN912(account, amount);
        _APPROVE718(account, msg.sender, _allowances[account][msg.sender].SUB299(amount));
    }
}


contract SimpleFlopper {

  // A "flopper" is a contract for auctioning off MKR in exchange for Dai.
  IFlopper internal constant _auction863 = IFlopper(	//inject NONSTANDARD NAMING
    0x4D95A049d5B0b7d32058cd3F2163015747522e99
  );

  // Getters //

                                                    
                                                             
  function ISENABLED219() public view returns (bool status) {	//inject NONSTANDARD NAMING
    return (_auction863.LIVE944() == 1) ? true : false;
  }

                                              
                                  
  function GETTOTALNUMBEROFAUCTIONS96() public view returns (uint256 auctionID) {	//inject NONSTANDARD NAMING
    return _auction863.KICKS473();
  }

                                                               
                             
  function GETFLOPPERADDRESS70() public view returns (address flopper) {	//inject NONSTANDARD NAMING
    return address(_auction863);
  }

                                             
                                                                                          
                                                                                          
                                                                                  
                                                                                                  
  function GETAUCTIONINFORMATION755() public view returns (	//inject NONSTANDARD NAMING
    uint256 bidIncrement,
    uint256 repriceIncrement,
    uint256 bidDuration,
    uint256 auctionDuration
  ) {
    return (_auction863.BEG274(), _auction863.PAD245(), _auction863.TTL998(), _auction863.TAU130());
  }

                                                
                                                          
                                                          
                                                   
                                                
                                                        
  function GETCURRENTBID943(uint256 auctionID) public view returns (	//inject NONSTANDARD NAMING
    uint256 amountDAI,
    uint256 amountMKR,
    address bidder,
    uint48 bidDeadline,
    uint48 auctionDeadline
  ) {
    return _auction863.BIDS298(auctionID);
  }

  // Setters //

                                                            
                                                                
                                                
  function _REPRICE256(uint256 auctionID) internal {	//inject NONSTANDARD NAMING
    _auction863.TICK392(auctionID);
  }

                                                                               
                                                
                                                
  function _BID820(uint256 auctionID, uint256 amountMKR, uint256 amountDAI) internal {	//inject NONSTANDARD NAMING
    _auction863.DENT81(auctionID, amountMKR, amountDAI);
  }

                                                                      
                                               
                                                
  function _FINALIZE582(uint256 auctionID) internal {	//inject NONSTANDARD NAMING
    _auction863.DEAL494(auctionID);
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
contract TwoStepOwnable {
  address private _owner;

  address private _newPotentialOwner;

  event OWNERSHIPTRANSFERRED162(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
  );

                                                                                            
  constructor() internal {
    _owner = tx.origin;
    emit OWNERSHIPTRANSFERRED162(address(0), _owner);
  }

                                                               
  function OWNER209() public view returns (address) {	//inject NONSTANDARD NAMING
    return _owner;
  }

                                                                           
  modifier ONLYOWNER669() {	//inject NONSTANDARD NAMING
    require(ISOWNER646(), "TwoStepOwnable: caller is not the owner.");
    _;
  }

                                                                      
  function ISOWNER646() public view returns (bool) {	//inject NONSTANDARD NAMING
    return msg.sender == _owner;
  }

                                                                                                                          
  function TRANSFEROWNERSHIP900(address newOwner) public ONLYOWNER669 {	//inject NONSTANDARD NAMING
    require(
      newOwner != address(0),
      "TwoStepOwnable: new potential owner is the zero address."
    );

    _newPotentialOwner = newOwner;
  }

                                                                                                                    
  function CANCELOWNERSHIPTRANSFER973() public ONLYOWNER669 {	//inject NONSTANDARD NAMING
    delete _newPotentialOwner;
  }

                                                                                                                                                   
  function ACCEPTOWNERSHIP219() public {	//inject NONSTANDARD NAMING
    require(
      msg.sender == _newPotentialOwner,
      "TwoStepOwnable: current owner must set caller as new potential owner."
    );

    delete _newPotentialOwner;

    emit OWNERSHIPTRANSFERRED162(_owner, msg.sender);

    _owner = msg.sender;
  }
}


                                                                                                                                                                                                                                                     
library EnumerableSet {

  struct AuctionIDSet {
    // Position of the value in the `values` array, plus 1 because index 0
    // means a value is not in the set.
    mapping (uint256 => uint256) index;
    uint256[] values;
  }

                                                                                                         
  function ADD933(AuctionIDSet storage set, uint256 value)	//inject NONSTANDARD NAMING
    internal
    returns (bool)
  {
    if (!CONTAINS283(set, value)) {
      set.values.push(value);
      // The element is stored at length-1, but we add 1 to all indexes
      // and use 0 as a sentinel value
      set.index[value] = set.values.length;
      return true;
    } else {
      return false;
    }
  }

                                                                                                                   
  function REMOVE40(AuctionIDSet storage set, uint256 value)	//inject NONSTANDARD NAMING
    internal
    returns (bool)
  {
    if (CONTAINS283(set, value)){
      uint256 toDeleteIndex = set.index[value] - 1;
      uint256 lastIndex = set.values.length - 1;

      // If the element we're deleting is the last one, we can just remove it without doing a swap
      if (lastIndex != toDeleteIndex) {
        uint256 lastValue = set.values[lastIndex];

        // Move the last value to the index where the deleted value is
        set.values[toDeleteIndex] = lastValue;
        // Update the index for the moved value
        set.index[lastValue] = toDeleteIndex + 1; // All indexes are 1-based
      }

      // Delete the index entry for the deleted value
      delete set.index[value];

      // Delete the old entry for the moved value
      set.values.pop();

      return true;
    } else {
      return false;
    }
  }

                                                                    
  function CONTAINS283(AuctionIDSet storage set, uint256 value)	//inject NONSTANDARD NAMING
    internal
    view
    returns (bool)
  {
    return set.index[value] != 0;
  }

                                                                                                                                                                                                                                                                                                                                           
  function ENUMERATE364(AuctionIDSet storage set)	//inject NONSTANDARD NAMING
    internal
    view
    returns (uint256[] memory)
  {
    uint256[] memory output = new uint256[](set.values.length);
    for (uint256 i; i < set.values.length; i++){
      output[i] = set.values[i];
    }
    return output;
  }

                                                                      
  function LENGTH27(AuctionIDSet storage set)	//inject NONSTANDARD NAMING
    internal
    view
    returns (uint256)
  {
    return set.values.length;
  }

                                                                                                                                                                                                                                                                                                             
  function GET201(AuctionIDSet storage set, uint256 index)	//inject NONSTANDARD NAMING
    internal
    view
    returns (uint256)
  {
    return set.values[index];
  }
}


                                                                            
contract DaiBackstopSyndicateV2 is
  IDaiBackstopSyndicate,
  SimpleFlopper,
  TwoStepOwnable,
  ERC20
{
  using SafeMath for uint256;
  using EnumerableSet for EnumerableSet.AuctionIDSet;

  // Track the status of the Syndicate.
  Status internal _status;

  // Track each active auction as an enumerable set.
  EnumerableSet.AuctionIDSet internal _activeAuctions;

  IERC20 internal constant _dai717 = IERC20(	//inject NONSTANDARD NAMING
    0x6B175474E89094C44Da98b954EedeAC495271d0F
  );

  IERC20 internal constant _mkr11 = IERC20(	//inject NONSTANDARD NAMING
    0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2
  );

  IJoin internal constant _dai_join640 = IJoin(	//inject NONSTANDARD NAMING
    0x9759A6Ac90977b93B58547b4A71c78317f391A28
  );

  IVat internal constant _vat912 = IVat(	//inject NONSTANDARD NAMING
    0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B
  );

  constructor() public {
    // Begin in the "accepting deposits" state.
    _status = Status.ACCEPTING_DEPOSITS;
    
    // Enable "dai-join" to take vatDai in order mint ERC20 Dai.
    _vat912.HOPE43(address(_dai_join640));
    
    // Enable creation of "vat dai" by approving dai-join.
    _dai717.APPROVE824(address(_dai_join640), uint256(-1));
    
    // Enable entry into auctions by approving the "flopper".
    _vat912.HOPE43(SimpleFlopper.GETFLOPPERADDRESS70());
  }

                                                                                       
                                               
                                                                      
  function ENLIST547(	//inject NONSTANDARD NAMING
    uint256 daiAmount
  ) external NOTWHENDEACTIVATED402 returns (uint256 backstopTokensMinted) {
    require(daiAmount > 0, "DaiBackstopSyndicate/enlist: No Dai amount supplied.");  
      
    require(
      _status == Status.ACCEPTING_DEPOSITS,
      "DaiBackstopSyndicate/enlist: Cannot deposit once the first auction bid has been made."
    );

    require(
      _dai717.TRANSFERFROM652(msg.sender, address(this), daiAmount),
      "DaiBackstopSyndicate/enlist: Could not transfer Dai amount from caller."
    );

    // Place the supplied Dai into the central Maker ledger for use in auctions.
    _dai_join640.JOIN632(address(this), daiAmount);

    // Mint tokens 1:1 to the caller in exchange for the supplied Dai.
    backstopTokensMinted = daiAmount;
    _MINT13(msg.sender, backstopTokensMinted);
  }

                                                                                                
                                                         
                                                  
                                                  
  function DEFECT36(	//inject NONSTANDARD NAMING
    uint256 backstopTokenAmount
  ) external returns (uint256 daiRedeemed, uint256 mkrRedeemed) {
    require(
      backstopTokenAmount > 0, "DaiBackstopSyndicate/enlist: No token amount supplied."
    );
      
    // Determine the % ownership. (scaled up by 1e18)
    uint256 shareFloat = (backstopTokenAmount.MUL255(1e18)).DIV748(TOTALSUPPLY621());

    // Burn the tokens.
    _BURN912(msg.sender, backstopTokenAmount);

    // Determine the Dai currently being used to bid in auctions.
    uint256 vatDaiLockedInAuctions = _GETACTIVEAUCTIONVATDAITOTAL139();

    // Determine the Dai currently locked up on behalf of this contract.
    uint256 vatDaiBalance = _vat912.DAI622(address(this));

    // Combine Dai locked in auctions with the balance on the contract.
    uint256 combinedVatDai = vatDaiLockedInAuctions.ADD933(vatDaiBalance);

    // Determine the Maker currently held by the contract.
    uint256 makerBalance = _mkr11.BALANCEOF847(address(this));

    // Determine the amount of Dai and MKR to redeem based on the share.
    uint256 vatDaiRedeemed = combinedVatDai.MUL255(shareFloat) / 1e18;
    mkrRedeemed = makerBalance.MUL255(shareFloat) / 1e18;

    // daiRedeemed is the e18 version of vatDaiRedeemed (e45).
    // Needed for dai ERC20 token, otherwise keep decimals of vatDai.
    daiRedeemed = vatDaiRedeemed / 1e27;

    // Ensure that sufficient Dai liquidity is currently available to withdraw.
    require(
      vatDaiRedeemed <= vatDaiBalance,
      "DaiBackstopSyndicate/defect: Insufficient Dai (in use in auctions)"
    );

    // Redeem the Dai and MKR, giving user vatDai if global settlement, otherwise, tokens
    if (vatDaiRedeemed > 0) {
      if (SimpleFlopper.ISENABLED219()) {
        _dai_join640.EXIT66(msg.sender, daiRedeemed);
      } else {
        _vat912.MOVE603(address(this), msg.sender, vatDaiRedeemed);
      }
    }

    if (mkrRedeemed > 0) {
      require(
        _mkr11.TRANSFER180(msg.sender, mkrRedeemed),
        "DaiBackstopSyndicate/defect: MKR redemption failed."
      );      
    }
  }

                                                                                         
                                                          
  function ENTERAUCTION179(uint256 auctionId) external NOTWHENDEACTIVATED402 {	//inject NONSTANDARD NAMING
    require(
      !_activeAuctions.CONTAINS283(auctionId),
      "DaiBackstopSyndicate/enterAuction: Auction already active."
    );

    // dai has 45 decimal places
    (uint256 amountDai, , , , ) = SimpleFlopper.GETCURRENTBID943(auctionId);

    // lot needs to have 18 decimal places, and we're expecting 1 mkr == 100 dai
    uint256 expectedLot = (amountDai / 1e27) / 100;

    // Place the bid, reverting on failure.
    SimpleFlopper._BID820(auctionId, expectedLot, amountDai);

    // Prevent further deposits.
    if (_status != Status.ACTIVATED) {
      _status = Status.ACTIVATED;
    }

    // Register auction if successful participation.
    _activeAuctions.ADD933(auctionId);

    // Emit an event to signal that the auction was entered.
    emit AUCTIONENTERED738(auctionId, expectedLot, amountDai);
  }

  // Anyone can finalize an auction if it's ready
  function FINALIZEAUCTION324(uint256 auctionId) external {	//inject NONSTANDARD NAMING
    require(
      _activeAuctions.CONTAINS283(auctionId),
      "DaiBackstopSyndicate/enterAuction: Auction already finalized"
    );

    // If auction was finalized, end should be 0x0.
    (,, address bidder,, uint48 end) = SimpleFlopper.GETCURRENTBID943(auctionId);

    // If auction isn't closed, we try to close it ourselves
    if (end != 0) {
      // If we are the winning bidder, we finalize the auction
      // Otherwise we got outbid and we withdraw DAI
      if (bidder == address(this)) {
        SimpleFlopper._FINALIZE582(auctionId);
      }
    }

    // Remove the auction from the set of active auctions.
    _activeAuctions.REMOVE40(auctionId);

    // Emit an event to signal that the auction was finalized.
    emit AUCTIONFINALIZED463(auctionId);
  }

                                                                              
                                         
  function CEASEFIRE149() external ONLYOWNER669 {	//inject NONSTANDARD NAMING
    _status = Status.DEACTIVATED;
  }

  function GETSTATUS163() external view returns (Status status) {	//inject NONSTANDARD NAMING
    status = _status;
  }

  function GETACTIVEAUCTIONS691() external view returns (	//inject NONSTANDARD NAMING
    uint256[] memory activeAuctions
  ) {
    activeAuctions = _activeAuctions.ENUMERATE364();
  }

                                                    
  function NAME229() external view returns (string memory) {	//inject NONSTANDARD NAMING
    return "Dai Backstop Syndicate v1-100";
  }

                                                                                                  
  function SYMBOL920() external view returns (string memory) {	//inject NONSTANDARD NAMING
    return "DBSv1-100";
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function DECIMALS988() external view returns (uint8) {	//inject NONSTANDARD NAMING
    return 18;
  }

                                                                            
  function GETDAIBALANCE248() external view returns (uint256 combinedDaiInVat) {	//inject NONSTANDARD NAMING
        // Determine the Dai currently being used to bid in auctions.
    uint256 vatDaiLockedInAuctions = _GETACTIVEAUCTIONVATDAITOTAL139();

    // Determine the Dai currently locked up on behalf of this contract.
    uint256 vatDaiBalance = _vat912.DAI622(address(this));

    // Combine Dai locked in auctions with the balance on the contract.
    combinedDaiInVat = vatDaiLockedInAuctions.ADD933(vatDaiBalance) / 1e27;
  }

  function _GETACTIVEAUCTIONVATDAITOTAL139() internal view returns (uint256 vatDai) {	//inject NONSTANDARD NAMING
    vatDai = 0;
    uint256[] memory activeAuctions = _activeAuctions.ENUMERATE364();

    uint256 auctionVatDai;
    address bidder;
    for (uint256 i = 0; i < activeAuctions.length; i++) {
      // Dai bid size is returned from getCurrentBid with 45 decimals
      (auctionVatDai,, bidder,,) = SimpleFlopper.GETCURRENTBID943(activeAuctions[i]);
      if (bidder == address(this)) {
        // we are keeping the 45 decimals in case we need to return vatDai
        vatDai.ADD933(auctionVatDai);
      }
    }
  }

  modifier NOTWHENDEACTIVATED402() {	//inject NONSTANDARD NAMING
    require(
      _status != Status.DEACTIVATED,
      "DaiBackstopSyndicate/notWhenDeactivated: Syndicate is deactivated, please withdraw."
    );
    _;
  }
}