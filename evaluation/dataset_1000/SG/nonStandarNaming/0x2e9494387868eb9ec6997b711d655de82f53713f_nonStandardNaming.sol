                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 


// File: contracts/lib/SafeMath.sol

pragma solidity 0.5.4;

                                                                                          
library SafeMath {

                                                                
  function MUL278(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                         
  function DIV915(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b > 0); // Solidity only automatically asserts when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold

    return c;
  }

                                                                                                            
  function SUB556(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b <= a);
    uint256 c = a - b;

    return c;
  }

                                                          
  function ADD629(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    require(c >= a);

    return c;
  }

                                                                                                                               
  function MOD555(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b != 0);
    return a % b;
  }
}

// File: contracts/Messages.sol

pragma solidity 0.5.4;

                                                                   
contract Messages {
    struct AcceptGame {
        uint256 bet;
        bool isHost;
        address opponentAddress;
        bytes32 hashOfMySecret;
        bytes32 hashOfOpponentSecret;
    }
    
    struct SecretData {
        bytes32 salt;
        uint8 secret;
    }

                                                                                                                                                                                                     
    bytes32 public constant eip712_domain_typehash127 = 0xd87cd6ef79d4e2b95e15ce8abf732db51ec771f1ca2edccf22a46c729ac56472;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                          
    bytes32 private constant acceptgame_typehash224 = 0x5ceee84403c984fbd9fb4ebf11b09c4f28f87290116c8b7f24a3e2a89d26588f;	//inject NONSTANDARD NAMING

                                                   
    bytes32 public DOMAIN_SEPARATOR;

                                                                                                                                                                                         
    function _HASH714(AcceptGame memory _acceptGame) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        return keccak256(abi.encode(
            acceptgame_typehash224,
            _acceptGame.bet,
            _acceptGame.isHost,
            _acceptGame.opponentAddress,
            _acceptGame.hashOfMySecret,
            _acceptGame.hashOfOpponentSecret
        ));
    }

                                                                                                                                                            
    function _HASHOFSECRET810(bytes32 _salt, uint8 _secret) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        return keccak256(abi.encodePacked(_salt, _secret));
    }

                                                                       
    function _RECOVERADDRESS727(	//inject NONSTANDARD NAMING
        bytes32 messageHash,
        bytes memory signature
    )
        internal
        view
        returns (address) 
    {
        bytes32 r;
        bytes32 s;
        bytes1 v;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            r := mload(add(signature, 0x20))
            s := mload(add(signature, 0x40))
            v := mload(add(signature, 0x60))
        }
        bytes32 digest = keccak256(abi.encodePacked(
            "\x19\x01",
            DOMAIN_SEPARATOR,
            messageHash
        ));
        return ecrecover(digest, uint8(v), r, s);
    }

                                                                                     
    function _GETSIGNERADDRESS818(	//inject NONSTANDARD NAMING
        uint256 _value,
        bool _isHost,
        address _opponentAddress,
        bytes32 _hashOfMySecret,
        bytes32 _hashOfOpponentSecret,
        bytes memory signature
    ) 
        internal
        view
        returns (address playerAddress) 
    {   
        AcceptGame memory message = AcceptGame({
            bet: _value,
            isHost: _isHost,
            opponentAddress: _opponentAddress,
            hashOfMySecret: _hashOfMySecret,
            hashOfOpponentSecret: _hashOfOpponentSecret
        });
        bytes32 messageHash = _HASH714(message);
        playerAddress = _RECOVERADDRESS727(messageHash, signature);
    }
}

// File: contracts/Ownable.sol

pragma solidity 0.5.4;

                                                                                                                                                                                             
contract Ownable {
    address public _owner;

    event OWNERSHIPTRANSFERRED182(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED182(address(0), _owner);
    }

                                                        
    function OWNER917() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER150() {	//inject NONSTANDARD NAMING
        require(ISOWNER618(), "not owner");
        _;
    }

                                                                                 
    function ISOWNER618() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP704(address newOwner) public ONLYOWNER150 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP463(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP463(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED182(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts/Claimable.sol

pragma solidity 0.5.4;


                                                                                                                                                                     
contract Claimable is Ownable {
  address public pendingOwner;

                                                                                           
  modifier ONLYPENDINGOWNER621() {	//inject NONSTANDARD NAMING
    require(msg.sender == pendingOwner, "not pending owner");
    _;
  }

                                                                                                                                          
  function TRANSFEROWNERSHIP704(address newOwner) public ONLYOWNER150 {	//inject NONSTANDARD NAMING
    pendingOwner = newOwner;
  }

                                                                               
  function CLAIMOWNERSHIP765() public ONLYPENDINGOWNER621 {	//inject NONSTANDARD NAMING
    emit OWNERSHIPTRANSFERRED182(_owner, pendingOwner);
    _owner = pendingOwner;
    pendingOwner = address(0);
  }
}

// File: contracts/lib/ERC20Basic.sol

pragma solidity 0.5.4;

                                                                                                                               
contract ERC20Basic {
    function BALANCEOF198(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER720(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
}

// File: contracts/FindTheRabbit.sol

pragma solidity 0.5.4;





                                                          
contract FindTheRabbit is Messages, Claimable {
    using SafeMath for uint256;
    enum GameState { 
        Invalid, // Default value for a non-created game
        HostBetted, // A player, who initiated an offchain game and made a bet
        JoinBetted, // A player, who joined the game and made a bet
        Filled, // Both players made bets
        DisputeOpenedByHost, // Dispute is opened by the initiating player
        DisputeOpenedByJoin, // Dispute is opened by the joining player
        DisputeWonOnTimeoutByHost, // Dispute is closed on timeout and the prize was taken by the initiating player 
        DisputeWonOnTimeoutByJoin, // Dispute is closed on timeout and the prize was taken by the joining player 
        CanceledByHost, // The joining player has not made a bet and the game is closed by the initiating player
        CanceledByJoin, // The initiating player has not made a bet and the game is closed by the joining player
        WonByHost, // The initiating has won the game
        WonByJoin // The joining player has won the game
    }
    //Event is triggered after both players have placed their bets
    event GAMECREATED496(	//inject NONSTANDARD NAMING
        address indexed host, 
        address indexed join, 
        uint256 indexed bet, 
        bytes32 gameId, 
        GameState state
    );
    //Event is triggered after the first bet has been placed
    event GAMEOPENED364(bytes32 gameId, address indexed player);	//inject NONSTANDARD NAMING
    //Event is triggered after the game has been closed
    event GAMECANCELED741(bytes32 gameId, address indexed player, address indexed opponent);	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                        
    event DISPUTEOPENED719(bytes32 gameId, address indexed disputeOpener, address indexed defendant);	//inject NONSTANDARD NAMING
    //Event is triggered after a dispute is resolved by the function resolveDispute()
    event DISPUTERESOLVED825(bytes32 gameId, address indexed player);	//inject NONSTANDARD NAMING
    //Event is triggered after a dispute is closed after the amount of time specified in disputeTimer
    event DISPUTECLOSEDONTIMEOUT183(bytes32 gameId, address indexed player);	//inject NONSTANDARD NAMING
    //Event is triggered after sending the winning to the winner
    event WINNERREWARD859(address indexed winner, uint256 amount);	//inject NONSTANDARD NAMING
    //Event is triggered after the jackpot is sent to the winner
    event JACKPOTREWARD142(bytes32 gameId, address player, uint256 amount);	//inject NONSTANDARD NAMING
    //Event is triggered after changing the gameId that claims the jackpot
    event CURRENTJACKPOTGAME238(bytes32 gameId);	//inject NONSTANDARD NAMING
    //Event is triggered after sending the reward to the referrer
    event REFERREDREWARD139(address referrer, uint256 amount);	//inject NONSTANDARD NAMING
    // Emitted when calimTokens function is invoked.
    event CLAIMEDTOKENS369(address token, address owner, uint256 amount);	//inject NONSTANDARD NAMING
    
    //The address of the contract that will verify the signature per EIP 712.
    //In this case, the current address of the contract.
    address public verifyingContract = address(this);
    //An disambiguating salt for the protocol per EIP 712.
    //Set through the constructor.
    bytes32 public salt;

    //An address of the creators' account receiving the percentage of Commission for the game
    address payable public teamWallet;
    
    //Percentage of commission from the game that is sent to the creators
    uint256 public commissionPercent;
    
    //Percentage of reward to the player who invited new players
    //0.1% is equal 1
    //0.5% is equal 5
    //1% is equal 10
    //10% is equal 100
    uint256 public referralPercent;

    //Maximum allowed value of the referralPercent. (10% = 100)
    uint256 public maxReferralPercent = 100;
    
    //Minimum bet value to create a new game
    uint256 public minBet = 0.01 ether; 
    
    //Percentage of game commission added to the jackpot value
    uint256 public jackpotPercent;
    
    //Jackpot draw time in UNIX time stamp format.
    uint256 public jackpotDrawTime;
    
    //Current jackpot value
    uint256 public jackpotValue;
    
    //The current value of the gameId of the applicant for the jackpot.
    bytes32 public jackpotGameId;
    
    //Number of seconds added to jackpotDrawTime each time a new game is added to the jackpot.
    uint256 public jackpotGameTimerAddition;
    
    //Initial timeout for a new jackpot round.
    uint256 public jackpotAccumulationTimer;
    
    //Timeout in seconds during which the dispute cannot be opened.
    uint256 public revealTimer;
    
    //Maximum allowed value of the minRevealTimer in seconds. 
    uint256 public maxRevealTimer;
    
    //Minimum allowed value of the minRevealTimer in seconds. 
    uint256 public minRevealTimer;
    
    //Timeout in seconds during which the dispute cannot be closed 
    //and players can call the functions win() and resolveDispute().
    uint256 public disputeTimer; 
    
    //Maximum allowed value of the maxDisputeTimer in seconds. 
    uint256 public maxDisputeTimer;
    
    //Minimum allowed value of the minDisputeTimer in seconds. 
    uint256 public minDisputeTimer; 

    //Timeout in seconds after the first bet 
    //during which the second player's bet is expected 
    //and the game cannot be closed.
    uint256 public waitingBetTimer;
    
    //Maximum allowed value of the waitingBetTimer in seconds. 
    uint256 public maxWaitingBetTimer;
    
    //Minimum allowed value of the waitingBetTimer in seconds. 
    uint256 public minWaitingBetTimer;
    
    //The time during which the game must be completed to qualify for the jackpot.
    uint256 public gameDurationForJackpot;

    uint256 public chainId;

    //Mapping for storing information about all games
    mapping(bytes32 => Game) public games;
    //Mapping for storing information about all disputes
    mapping(bytes32 => Dispute) public disputes;
    //Mapping for storing information about all players
    mapping(address => Statistics) public players;

    struct Game {
        uint256 bet; // bet value for the game
        address payable host; // address of the initiating player
        address payable join; // address of the joining player
        uint256 creationTime; // the time of the last bet in the game.
        GameState state; // current state of the game
        bytes hostSignature; // the value of the initiating player's signature
        bytes joinSignature; // the value of the joining player's signature
        bytes32 gameId; // 32 byte game identifier
    }

    struct Dispute {
        address payable disputeOpener; //  address of the player, who opened the dispute.
        uint256 creationTime; // dispute opening time of the dispute.
        bytes32 opponentHash; // hash from an opponent's secret and salt
        uint256 secret; // secret value of the player, who opened the dispute
        bytes32 salt; // salt value of the player, who opened the dispute
        bool isHost; // true if the player initiated the game.
    }

    struct Statistics {
        uint256 totalGames; // totalGames played by the player
        uint256 totalUnrevealedGames; // total games that have been disputed against a player for unrevealing the secret on time
        uint256 totalNotFundedGames; // total number of games a player has not send funds on time
        uint256 totalOpenedDisputes; // total number of disputed games created by a player against someone for unrevealing the secret on time
        uint256 avgBetAmount; //  average bet value
    }

                                                                    
    modifier ISFILLED692(bytes32 _gameId) {	//inject NONSTANDARD NAMING
        require(games[_gameId].state == GameState.Filled, "game state is not Filled");
        _;
    }

                                                                                            
    modifier VERIFYGAMESTATE805(bytes32 _gameId) {	//inject NONSTANDARD NAMING
        require(
            games[_gameId].state == GameState.DisputeOpenedByHost ||
            games[_gameId].state == GameState.DisputeOpenedByJoin || 
            games[_gameId].state == GameState.Filled,
            "game state are not Filled or OpenedDispute"
        );
        _;
    }

                                                                             
    modifier ISOPEN780(bytes32 _gameId) {	//inject NONSTANDARD NAMING
        require(
            games[_gameId].state == GameState.HostBetted ||
            games[_gameId].state == GameState.JoinBetted,
            "game state is not Open");
        _;
    }

                                                                                                          
    modifier ONLYPARTICIPANT455(bytes32 _gameId) {	//inject NONSTANDARD NAMING
        require(
            games[_gameId].host == msg.sender || games[_gameId].join == msg.sender,
            "you are not a participant of this game"
        );
        _;
    }

                                                                                                                                                                                                                                                                                                                                                                                                     
    constructor (
        uint256 _chainId, 
        address payable _teamWallet,
        uint256 _commissionPercent,
        uint256 _jackpotPercent,
        uint256 _referralPercent,
        uint256 _jackpotGameTimerAddition,
        uint256 _jackpotAccumulationTimer,
        uint256 _revealTimer,
        uint256 _disputeTimer,
        uint256 _waitingBetTimer,
        uint256 _gameDurationForJackpot,
        bytes32 _salt,
        uint256 _maxValueOfTimer
    ) public {
        teamWallet = _teamWallet;
        jackpotDrawTime = GETTIME832().ADD629(_jackpotAccumulationTimer);
        jackpotAccumulationTimer = _jackpotAccumulationTimer;
        commissionPercent = _commissionPercent;
        jackpotPercent = _jackpotPercent;
        referralPercent = _referralPercent;
        jackpotGameTimerAddition = _jackpotGameTimerAddition;
        revealTimer = _revealTimer;
        minRevealTimer = _revealTimer;
        maxRevealTimer = _maxValueOfTimer;
        disputeTimer = _disputeTimer;
        minDisputeTimer = _disputeTimer;
        maxDisputeTimer = _maxValueOfTimer;
        waitingBetTimer = _waitingBetTimer;
        minWaitingBetTimer = _waitingBetTimer;
        maxWaitingBetTimer = _maxValueOfTimer;
        gameDurationForJackpot = _gameDurationForJackpot;
        salt = _salt;
        chainId = _chainId;
        DOMAIN_SEPARATOR = keccak256(abi.encode(
            eip712_domain_typehash127,
            keccak256("Find The Rabbit"),
            keccak256("0.1"),
            _chainId,
            verifyingContract,
            salt
        ));
    }

                                                                                                                                                                                                             
    function SETWAITINGBETTIMERVALUE76(uint256 _waitingBetTimer) external ONLYOWNER150 {	//inject NONSTANDARD NAMING
        require(_waitingBetTimer >= minWaitingBetTimer, "must be more than minWaitingBetTimer");
        require(_waitingBetTimer <= maxWaitingBetTimer, "must be less than maxWaitingBetTimer");
        waitingBetTimer = _waitingBetTimer;
    }

                                                                                                                                                                                                     
    function SETDISPUTETIMERVALUE53(uint256 _disputeTimer) external ONLYOWNER150 {	//inject NONSTANDARD NAMING
        require(_disputeTimer >= minDisputeTimer, "must be more than minDisputeTimer");
        require(_disputeTimer <= maxDisputeTimer, "must be less than maxDisputeTimer");
        disputeTimer = _disputeTimer;
    }

                                                                                                                                                                                                 
    function SETREVEALTIMERVALUE326(uint256 _revealTimer) external ONLYOWNER150 {	//inject NONSTANDARD NAMING
        require(_revealTimer >= minRevealTimer, "must be more than minRevealTimer");
        require(_revealTimer <= maxRevealTimer, "must be less than maxRevealTimer");
        revealTimer = _revealTimer;
    }

                                                                                                               
    function SETMINBETVALUE578(uint256 _newValue) external ONLYOWNER150 {	//inject NONSTANDARD NAMING
        require(_newValue != 0, "must be greater than 0");
        minBet = _newValue;
    }

                                                                                                                                                                                                                                                                                  
    function SETJACKPOTGAMETIMERADDITION169(uint256 _jackpotGameTimerAddition) external ONLYOWNER150 {	//inject NONSTANDARD NAMING
        if (chainId == 1) {
            // jackpot must be less than 150 DAI. 1 ether = 150 DAI
            require(jackpotValue <= 1 ether);
        }
        if (chainId == 99) {
            // jackpot must be less than 150 DAI. 1 POA = 0.03 DAI
            require(jackpotValue <= 4500 ether);
        }
        require(_jackpotGameTimerAddition >= 2 minutes, "must be more than 2 minutes");
        require(_jackpotGameTimerAddition <= 1 hours, "must be less than 1 hour");
        jackpotGameTimerAddition = _jackpotGameTimerAddition;
    }

                                                                                                                                                                                                 
    function SETREFERRALPERCENTVALUE72(uint256 _newValue) external ONLYOWNER150 {	//inject NONSTANDARD NAMING
        require(_newValue <= maxReferralPercent, "must be less than maxReferralPercent");
        referralPercent = _newValue;
    }

                                                                                                                                                                   
    function SETCOMMISSIONPERCENT166(uint256 _newValue) external ONLYOWNER150 {	//inject NONSTANDARD NAMING
        require(_newValue <= 20, "must be less than 20");
        commissionPercent = _newValue;
    }

                                                                                                                             
    function SETTEAMWALLETADDRESS651(address payable _newTeamWallet) external ONLYOWNER150 {	//inject NONSTANDARD NAMING
        require(_newTeamWallet != address(0));
        teamWallet = _newTeamWallet;
    }

                                                             
    function GETJACKPOTINFO567() 	//inject NONSTANDARD NAMING
        external 
        view 
        returns (
            uint256 _jackpotDrawTime, 
            uint256 _jackpotValue, 
            bytes32 _jackpotGameId
        ) 
    {
        _jackpotDrawTime = jackpotDrawTime;
        _jackpotValue = jackpotValue;
        _jackpotGameId = jackpotGameId;
    }

                                                     
    function GETTIMERS764() 	//inject NONSTANDARD NAMING
        external
        view 
        returns (
            uint256 _revealTimer,
            uint256 _disputeTimer, 
            uint256 _waitingBetTimer, 
            uint256 _jackpotAccumulationTimer 
        )
    {
        _revealTimer = revealTimer;
        _disputeTimer = disputeTimer;
        _waitingBetTimer = waitingBetTimer;
        _jackpotAccumulationTimer = jackpotAccumulationTimer;
    }

                                                                                                                                    
    function CLAIMTOKENS19(address _token) public ONLYOWNER150 {	//inject NONSTANDARD NAMING
        ERC20Basic erc20token = ERC20Basic(_token);
        uint256 balance = erc20token.BALANCEOF198(address(this));
        erc20token.TRANSFER720(OWNER917(), balance);
        emit CLAIMEDTOKENS369(_token, OWNER917(), balance);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function CREATEGAME259(	//inject NONSTANDARD NAMING
        bool _isHost,
        bytes32 _hashOfMySecret,
        bytes32 _hashOfOpponentSecret,
        bytes memory _hostSignature,
        bytes memory _joinSignature
    )
        public 
        payable
    {       
        require(msg.value >= minBet, "must be greater than the minimum value");
        bytes32 gameId = GETGAMEID55(_hostSignature, _joinSignature);
        address opponent = _GETSIGNERADDRESS818(
            msg.value,
            !_isHost, 
            msg.sender,
            _hashOfOpponentSecret, 
            _hashOfMySecret,
            _isHost ? _joinSignature : _hostSignature);
        require(opponent != msg.sender, "send your opponent's signature");
        Game storage game = games[gameId];
        if (game.gameId == 0){
            _RECORDGAMEINFO113(msg.value, _isHost, gameId, opponent, _hostSignature, _joinSignature);
            emit GAMEOPENED364(game.gameId, msg.sender);
        } else {
            require(game.host == msg.sender || game.join == msg.sender, "you are not paticipant in this game");
            require(game.state == GameState.HostBetted || game.state == GameState.JoinBetted, "the game is not Opened");
            if (_isHost) {
                require(game.host == msg.sender, "you are not the host in this game");
                require(game.join == opponent, "invalid join signature");
                require(game.state == GameState.JoinBetted, "you have already made a bet");
            } else {
                require(game.join == msg.sender, "you are not the join in this game.");
                require(game.host == opponent, "invalid host signature");
                require(game.state == GameState.HostBetted, "you have already made a bet");
            }
            game.creationTime = GETTIME832();
            game.state = GameState.Filled;
            emit GAMECREATED496(game.host, game.join, game.bet, game.gameId, game.state);
        }
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function WIN208(	//inject NONSTANDARD NAMING
        bytes32 _gameId,
        uint8 _hostSecret,
        bytes32 _hostSalt,
        uint8 _joinSecret,
        bytes32 _joinSalt,
        address payable _referrer
    ) 
        public
        VERIFYGAMESTATE805(_gameId)
        ONLYPARTICIPANT455(_gameId)
    {
        Game storage game = games[_gameId];
        bytes32 hashOfHostSecret = _HASHOFSECRET810(_hostSalt, _hostSecret);
        bytes32 hashOfJoinSecret = _HASHOFSECRET810(_joinSalt, _joinSecret);

        address host = _GETSIGNERADDRESS818(
            game.bet,
            true, 
            game.join,
            hashOfHostSecret,
            hashOfJoinSecret, 
            game.hostSignature
        );
        address join = _GETSIGNERADDRESS818(
            game.bet,
            false, 
            game.host,
            hashOfJoinSecret,
            hashOfHostSecret,
            game.joinSignature
        );
        require(host == game.host && join == game.join, "invalid reveals");
        address payable winner;
        if (_hostSecret == _joinSecret){
            winner = game.join;
            game.state = GameState.WonByJoin;
        } else {
            winner = game.host;
            game.state = GameState.WonByHost;
        }
        if (ISPLAYEREXIST499(_referrer) && _referrer != msg.sender) {
            _PROCESSPAYMENTS122(game.bet, winner, _referrer);
        }
        else {
            _PROCESSPAYMENTS122(game.bet, winner, address(0));
        }
        _JACKPOTPAYOUTPROCESSING518(_gameId); 
        _RECORDSTATISTICINFO386(game.host, game.join, game.bet);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function OPENDISPUTE602(	//inject NONSTANDARD NAMING
        bytes32 _gameId,
        uint8 _secret,
        bytes32 _salt,
        bool _isHost,
        bytes32 _hashOfOpponentSecret
    )
        public
        ONLYPARTICIPANT455(_gameId)
    {
        require(TIMEUNTILOPENDISPUTE399(_gameId) == 0, "the waiting time for revealing is not over yet");
        Game storage game = games[_gameId];
        require(ISSECRETDATAVALID25(
            _gameId,
            _secret,
            _salt,
            _isHost,
            _hashOfOpponentSecret
        ), "invalid salt or secret");
        _RECORDDISPUTEINFO393(_gameId, msg.sender, _hashOfOpponentSecret, _secret, _salt, _isHost);
        game.state = _isHost ? GameState.DisputeOpenedByHost : GameState.DisputeOpenedByJoin;
        address defendant = _isHost ? game.join : game.host;
        players[msg.sender].totalOpenedDisputes = (players[msg.sender].totalOpenedDisputes).ADD629(1);
        players[defendant].totalUnrevealedGames = (players[defendant].totalUnrevealedGames).ADD629(1);
        emit DISPUTEOPENED719(_gameId, msg.sender, defendant);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function RESOLVEDISPUTE570(	//inject NONSTANDARD NAMING
        bytes32 _gameId,
        uint8 _secret,
        bytes32 _salt,
        bool _isHost,
        bytes32 _hashOfOpponentSecret
    ) 
        public
        returns(address payable winner)
    {
        require(ISDISPUTEOPENED704(_gameId), "there is no dispute");
        Game storage game = games[_gameId];
        Dispute memory dispute = disputes[_gameId];
        require(msg.sender != dispute.disputeOpener, "only for the opponent");
        require(ISSECRETDATAVALID25(
            _gameId,
            _secret,
            _salt,
            _isHost,
            _hashOfOpponentSecret
        ), "invalid salt or secret");
        if (_secret == dispute.secret) {
            winner = game.join;
            game.state = GameState.WonByJoin;
        } else {
            winner = game.host;
            game.state = GameState.WonByHost;
        }
        _PROCESSPAYMENTS122(game.bet, winner, address(0));
        _JACKPOTPAYOUTPROCESSING518(_gameId);
        _RECORDSTATISTICINFO386(game.host, game.join, game.bet);
        emit DISPUTERESOLVED825(_gameId, msg.sender);
    }

                                                                                                                                                                                                                                                                                                                   
    function CLOSEDISPUTEONTIMEOUT824(bytes32 _gameId) public returns (address payable winner) {	//inject NONSTANDARD NAMING
        Game storage game = games[_gameId];
        Dispute memory dispute = disputes[_gameId];
        require(TIMEUNTILCLOSEDISPUTE906(_gameId) == 0, "the time has not yet come out");
        winner = dispute.disputeOpener;
        game.state = (winner == game.host) ? GameState.DisputeWonOnTimeoutByHost : GameState.DisputeWonOnTimeoutByJoin;
        _PROCESSPAYMENTS122(game.bet, winner, address(0));
        _JACKPOTPAYOUTPROCESSING518(_gameId);
        _RECORDSTATISTICINFO386(game.host, game.join, game.bet);
        emit DISPUTECLOSEDONTIMEOUT183(_gameId, msg.sender);
    }

                                                                                                                                                                                                                                          
    function CANCELGAME86(	//inject NONSTANDARD NAMING
        bytes32 _gameId
    ) 
        public
        ONLYPARTICIPANT455(_gameId) 
    {
        require(TIMEUNTILCANCEL191(_gameId) == 0, "the waiting time for the second player's bet is not over yet");
        Game storage game = games[_gameId];
        address payable recipient;
        recipient = game.state == GameState.HostBetted ? game.host : game.join;
        address defendant = game.state == GameState.HostBetted ? game.join : game.host;
        game.state = (recipient == game.host) ? GameState.CanceledByHost : GameState.CanceledByJoin;
        recipient.transfer(game.bet);
        players[defendant].totalNotFundedGames = (players[defendant].totalNotFundedGames).ADD629(1);
        emit GAMECANCELED741(_gameId, msg.sender, defendant);
    }

                                                                                    
    function DRAWJACKPOT713() public {	//inject NONSTANDARD NAMING
        require(ISJACKPOTAVAILABLE227(), "is not avaliable yet");
        require(jackpotGameId != 0, "no game to claim on the jackpot");
        require(jackpotValue != 0, "jackpot's empty");
        _PAYOUTJACKPOT581();
    }

                                                                                
    function ISDISPUTEOPENED704(bytes32 _gameId) public view returns(bool) {	//inject NONSTANDARD NAMING
        return (
            games[_gameId].state == GameState.DisputeOpenedByHost ||
            games[_gameId].state == GameState.DisputeOpenedByJoin
        );
    }
    
                                                                                               
    function ISPLAYEREXIST499(address _player) public view returns (bool) {	//inject NONSTANDARD NAMING
        return players[_player].totalGames != 0;
    }

                                                                                                                               
    function TIMEUNTILCANCEL191(	//inject NONSTANDARD NAMING
        bytes32 _gameId
    )
        public
        view 
        ISOPEN780(_gameId) 
        returns (uint256 remainingTime) 
    {
        uint256 timePassed = GETTIME832().SUB556(games[_gameId].creationTime);
        if (waitingBetTimer > timePassed) {
            return waitingBetTimer.SUB556(timePassed);
        } else {
            return 0;
        }
    }

                                                                                                                                 
    function TIMEUNTILOPENDISPUTE399(	//inject NONSTANDARD NAMING
        bytes32 _gameId
    )
        public
        view 
        ISFILLED692(_gameId) 
        returns (uint256 remainingTime) 
    {
        uint256 timePassed = GETTIME832().SUB556(games[_gameId].creationTime);
        if (revealTimer > timePassed) {
            return revealTimer.SUB556(timePassed);
        } else {
            return 0;
        }
    }

                                                                                                                                                
    function TIMEUNTILCLOSEDISPUTE906(	//inject NONSTANDARD NAMING
        bytes32 _gameId
    )
        public
        view 
        returns (uint256 remainingTime) 
    {
        require(ISDISPUTEOPENED704(_gameId), "there is no open dispute");
        uint256 timePassed = GETTIME832().SUB556(disputes[_gameId].creationTime);
        if (disputeTimer > timePassed) {
            return disputeTimer.SUB556(timePassed);
        } else {
            return 0;
        }
    }

                                                                          
    function GETTIME832() public view returns(uint) {	//inject NONSTANDARD NAMING
        return block.timestamp;
    }

                                                                                                    
    function GETGAMESTATE243(bytes32 _gameId) public view returns(GameState) {	//inject NONSTANDARD NAMING
        return games[_gameId].state;
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function ISSECRETDATAVALID25(	//inject NONSTANDARD NAMING
        bytes32 _gameId,
        uint8 _secret,
        bytes32 _salt,
        bool _isHost,
        bytes32 _hashOfOpponentSecret
    )
        public
        view
        returns (bool)
    {
        Game memory game = games[_gameId];
        bytes32 hashOfPlayerSecret = _HASHOFSECRET810(_salt, _secret);
        address player = _GETSIGNERADDRESS818(
            game.bet,
            _isHost, 
            _isHost ? game.join : game.host,
            hashOfPlayerSecret,
            _hashOfOpponentSecret, 
            _isHost ? game.hostSignature : game.joinSignature
        );
        require(msg.sender == player, "the received address does not match with msg.sender");
        if (_isHost) {
            return player == game.host;
        } else {
            return player == game.join;
        }
    }

                                                                    
    function ISJACKPOTAVAILABLE227() public view returns (bool) {	//inject NONSTANDARD NAMING
        return GETTIME832() >= jackpotDrawTime;
    }

    function ISGAMEALLOWEDFORJACKPOT29(bytes32 _gameId) public view returns (bool) {	//inject NONSTANDARD NAMING
        return GETTIME832() - games[_gameId].creationTime < gameDurationForJackpot;
    }

                                                                                                                         
    function GETGAMESSTATES674(bytes32[] memory _games) public view returns(GameState[] memory) {	//inject NONSTANDARD NAMING
        GameState[] memory _states = new GameState[](_games.length);
        for (uint i=0; i<_games.length; i++) {
            Game storage game = games[_games[i]];
            _states[i] = game.state;
        }
        return _states;
    }

                                                                                                                                 
    function GETPLAYERSSTATISTIC702(address[] memory _players) public view returns(uint[] memory) {	//inject NONSTANDARD NAMING
        uint[] memory _statistics = new uint[](_players.length * 5);
        for (uint i=0; i<_players.length; i++) {
            Statistics storage player = players[_players[i]];
            _statistics[5*i + 0] = player.totalGames;
            _statistics[5*i + 1] = player.totalUnrevealedGames;
            _statistics[5*i + 2] = player.totalNotFundedGames;
            _statistics[5*i + 3] = player.totalOpenedDisputes;
            _statistics[5*i + 4] = player.avgBetAmount;
        }
        return _statistics;
    }

                                                                                                                                                                                                                    
    function GETGAMEID55(bytes memory _signatureHost, bytes memory _signatureJoin) public pure returns (bytes32) {	//inject NONSTANDARD NAMING
        return keccak256(abi.encodePacked(_signatureHost, _signatureJoin));
    }

                                         
    function _PAYOUTJACKPOT581() internal {	//inject NONSTANDARD NAMING
        Game storage jackpotGame = games[jackpotGameId];
        uint256 reward = jackpotValue.DIV915(2);
        jackpotValue = 0;
        jackpotGameId = 0;
        jackpotDrawTime = (GETTIME832()).ADD629(jackpotAccumulationTimer);
        if (jackpotGame.host.send(reward)) {
            emit JACKPOTREWARD142(jackpotGame.gameId, jackpotGame.host, reward.MUL278(2));
        }
        if (jackpotGame.join.send(reward)) {
            emit JACKPOTREWARD142(jackpotGame.gameId, jackpotGame.join, reward.MUL278(2));
        }
    }
                                                                                                                        
    function _ADDGAMETOJACKPOT688(bytes32 _gameId) internal {	//inject NONSTANDARD NAMING
        jackpotDrawTime = jackpotDrawTime.ADD629(jackpotGameTimerAddition);
        jackpotGameId = _gameId;
        emit CURRENTJACKPOTGAME238(_gameId);
    }

                                                                                                
    function _JACKPOTPAYOUTPROCESSING518(bytes32 _gameId) internal {	//inject NONSTANDARD NAMING
        if (ISJACKPOTAVAILABLE227()) {
            if (jackpotGameId != 0 && jackpotValue != 0) {
                _PAYOUTJACKPOT581();
            }
            else {
                jackpotDrawTime = (GETTIME832()).ADD629(jackpotAccumulationTimer);
            }
        }
        if (ISGAMEALLOWEDFORJACKPOT29(_gameId)) {
            _ADDGAMETOJACKPOT688(_gameId);
        }
    }
    
                                                                                                                                                                                                                                                                                                                   
    function _PROCESSPAYMENTS122(uint256 _bet, address payable _winner, address payable _referrer) internal {	//inject NONSTANDARD NAMING
        uint256 doubleBet = (_bet).MUL278(2);
        uint256 commission = (doubleBet.MUL278(commissionPercent)).DIV915(100);        
        uint256 jackpotPart = (doubleBet.MUL278(jackpotPercent)).DIV915(100);
        uint256 winnerStake;
        if (_referrer != address(0) && referralPercent != 0 ) {
            uint256 referrerPart = (doubleBet.MUL278(referralPercent)).DIV915(1000);
            winnerStake = doubleBet.SUB556(commission).SUB556(jackpotPart).SUB556(referrerPart);
            if (_referrer.send(referrerPart)) {
                emit REFERREDREWARD139(_referrer, referrerPart);
            }
        }
        else {
            winnerStake = doubleBet.SUB556(commission).SUB556(jackpotPart);
        }
        jackpotValue = jackpotValue.ADD629(jackpotPart);
        _winner.transfer(winnerStake);
        teamWallet.transfer(commission);
        emit WINNERREWARD859(_winner, winnerStake);
    }

                                                             
    function _RECORDGAMEINFO113(	//inject NONSTANDARD NAMING
        uint256 _value,
        bool _isHost, 
        bytes32 _gameId, 
        address _opponent,
        bytes memory _hostSignature,
        bytes memory _joinSignature
    ) internal {
        Game memory _game = Game({
            bet: _value,
            host: _isHost ? msg.sender : address(uint160(_opponent)),
            join: _isHost ? address(uint160(_opponent)) : msg.sender,
            creationTime: GETTIME832(),
            state: _isHost ? GameState.HostBetted : GameState.JoinBetted ,
            gameId: _gameId,
            hostSignature: _hostSignature,
            joinSignature: _joinSignature
        });
        games[_gameId] = _game;  
    }

                                                                
    function _RECORDDISPUTEINFO393(	//inject NONSTANDARD NAMING
        bytes32 _gameId,
        address payable _disputeOpener,
        bytes32 _hashOfOpponentSecret,
        uint8 _secret,
        bytes32 _salt,
        bool _isHost 
    ) internal {
        Dispute memory _dispute = Dispute({
            disputeOpener: _disputeOpener,
            creationTime: GETTIME832(),
            opponentHash: _hashOfOpponentSecret,
            secret: _secret,
            salt: _salt,
            isHost: _isHost
        });
        disputes[_gameId] = _dispute;
    }

                                                                   
    function _RECORDSTATISTICINFO386(address _host, address _join, uint256 _bet) internal {	//inject NONSTANDARD NAMING
        Statistics storage statHost = players[_host];
        Statistics storage statJoin = players[_join];
        statHost.avgBetAmount = _CALCULATEAVGBET607(_host, _bet);
        statJoin.avgBetAmount = _CALCULATEAVGBET607(_join, _bet);
        statHost.totalGames = (statHost.totalGames).ADD629(1);
        statJoin.totalGames = (statJoin.totalGames).ADD629(1);
    }

                                                                                                                                                                                   
    function _CALCULATEAVGBET607(address _player, uint256 _bet) internal view returns (uint256 newAvgBetValue){	//inject NONSTANDARD NAMING
        Statistics storage statistics = players[_player];
        uint256 totalBets = (statistics.avgBetAmount).MUL278(statistics.totalGames).ADD629(_bet);
        newAvgBetValue = totalBets.DIV915(statistics.totalGames.ADD629(1));
    }

}