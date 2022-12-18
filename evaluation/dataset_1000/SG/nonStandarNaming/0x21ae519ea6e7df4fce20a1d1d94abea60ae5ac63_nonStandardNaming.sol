                                                                 

pragma solidity 0.5.11;

                                                                                
contract RaffleMarket {
    // You can't win the raffle if you don't buy a ticket

    // ==== EVENTS ==== //

                                                                                                                                                                                                                                                                      
    event ONBUYRAFFLETICKETS157(	//inject NONSTANDARD NAMING
        uint256 indexed _raffleId,
        address indexed _ticketHolder,
        uint256 _tickets
    );

                                                                                                                                                                           
    event ONCANCELRAFFLE73(	//inject NONSTANDARD NAMING
        uint256 indexed _raffleId,
        address indexed _host
    );

                                                                                                                                                                                                                                                                                                                                                                             
    event ONCREATERAFFLE365(	//inject NONSTANDARD NAMING
        uint256 indexed _raffleId,
        uint256 indexed _tokenId,
        address indexed _host,
        uint256 _costPerTicket,
        uint256 _minimumTickets
    );

                                                                                                                                                                                                                 
    event ONDELETETICKETS415(	//inject NONSTANDARD NAMING
        uint256 indexed _expiredRaffleId,
        uint256 _tickets
    );

                                                                                                                                                                                                                                                                                                                                                                   
    event ONRAFFLEWINNER930(	//inject NONSTANDARD NAMING
        uint256 indexed _raffleId,
        address indexed _winner,
        uint256 _random,
        uint256 _payout,
        uint256 _contribution
    );

                                                                                                                                                                                                            
    event ONREFUNDTICKETS21(	//inject NONSTANDARD NAMING
        uint256 _raffleId,
        uint256 _quantity
    );

                                                                                                                                 
    event ONREMOVEADMIN374(	//inject NONSTANDARD NAMING
        address _admin
    );

                                                                                                                              
    event ONSETADMIN666(	//inject NONSTANDARD NAMING
        address _admin
    );

                                                                                                                                                                                                     
    event ONSETMINIMUMCOSTPERTICKET40(	//inject NONSTANDARD NAMING
        uint256 _minimumCostPerTicket
    );

                                                                                                                                                                           
    event ONSETTOKENADDRESS714(	//inject NONSTANDARD NAMING
        address _tokenAddress
    );

                                                                                                                                           
    event ONSETTREASURY569(	//inject NONSTANDARD NAMING
        address _treasury
    );

                                                                                                                                                                                                                                                 
    event ONSETCONTRIBUTIONPERCENT657(	//inject NONSTANDARD NAMING
        uint256 _contributionPercent
    );

                                                                                                                                                                                                                                                                                          
    event ONWITHDRAWRAFFLETICKETS736(	//inject NONSTANDARD NAMING
        uint256 indexed _raffleId,
        address indexed _ticketHolder,
        uint256[] _indexes
    );

                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    struct Raffle {
        uint256 tokenId;
        address host;
        uint256 costPerTicket;
        uint256 minimumTickets;
        address payable[] participants;
    }

    // ==== GLOBAL PUBLIC VARIABLES ==== //

    // Mapping raffle ID to Raffle
    mapping(uint256 => Raffle) public raffles;

                                                                                                      
    uint256 public contributionPercent;

                                                                                                     
    uint256 public minRaffleTicketCost;

                                                                                       
    address public tokenAddress;

                                                                     
    interfaceERC721 public tokenInterface;

                                                                                              
    uint256 public totalRaffles;

    // ==== GLOBAL VARIABLES PRIVATE ==== //

    // Mapping admin address to boolean
    mapping(address => bool) private admin;

                                                                                
    address payable private treasury;

    // ==== CONSTRUCTOR ==== //

                                                                                                                                                                                                                                                                                                                                                                                      
    constructor(uint256 _contributionPercent, uint256 _minRaffleTicketCost, address _tokenAddress, address payable _treasury)
        public
    {
        admin[msg.sender] = true;
        tokenInterface = interfaceERC721(_tokenAddress);
        SETADMIN820(msg.sender);
        SETCONTRIBUTIONPERCENT536(_contributionPercent);
        SETMINRAFFLETICKETCOST546(_minRaffleTicketCost);
        SETTOKENADDRESS295(_tokenAddress);
        SETTREASURY273(_treasury);
    }

    // ==== MODIFIERS ==== //

                                                                            
    modifier ONLYADMIN418() {	//inject NONSTANDARD NAMING
        require(admin[msg.sender], "only admins");
        _;
    }

                                                                                         
    modifier ONLYEOA350() {	//inject NONSTANDARD NAMING
        require(msg.sender == tx.origin, "only externally owned accounts");
        _;
    }

    // ==== PUBLIC WRITE FUNCTIONS ==== //

                                                                                                                      
    function ACTIVATERAFFLE578(uint256 raffleId)	//inject NONSTANDARD NAMING
        public
        ONLYEOA350
    {
        // Reference the raffle
        Raffle storage raffle = raffles[raffleId];

        // Require minimum number of tickets before drawing a winning raffle ticket
        require(raffle.participants.length >= raffle.minimumTickets, "requires minimum number of tickets");

        SELECTWINNINGTICKET433(raffleId);
    }

                                                                                                                                               
    function ACTIVATERAFFLEASHOST478(uint256 raffleId)	//inject NONSTANDARD NAMING
        public
        ONLYEOA350
    {
        // Reference the raffle
        Raffle storage raffle = raffles[raffleId];

        // Require raffle host to be the msg.sender
        require(raffle.host == msg.sender, "only the raffle host can activate");

        // Raffle must have at least one ticket
        require(raffle.participants.length >= 1, "at least one participant needed to raffle");

        SELECTWINNINGTICKET433(raffleId);
    }

                                                                                                                          
    function BUYRAFFLETICKETS688(uint256 raffleId)	//inject NONSTANDARD NAMING
        public
        payable
        ONLYEOA350
    {
        // Reference to the raffle
        Raffle storage raffle = raffles[raffleId];

        // Require a valid raffle
        require(raffle.host != address(0), "invalid raffle");

        // Confirm amount of ETH sent is enough for a ticket
        require(msg.value >= raffle.costPerTicket, "must send enough ETH for at least 1 ticket");

        // Calculate total tickets based on msg.value and ticket cost
        uint256 tickets = msg.value / raffle.costPerTicket;

        // Calculate any change
        uint256 remainder = msg.value % raffle.costPerTicket;

        // Add tickets to the raffle
        for (uint256 i = 0; i < tickets; i++) {
            raffle.participants.push(msg.sender);
        }

        // return change back to the address buying tickets
        if (remainder > 0) {
            msg.sender.transfer(remainder);
        }

        emit ONBUYRAFFLETICKETS157(raffleId, msg.sender, tickets);
    }

                                                                                                                                                         
    function CANCELRAFFLE695(uint256 raffleId)	//inject NONSTANDARD NAMING
        public
    {
        // Reference the raffle
        Raffle storage raffle = raffles[raffleId];

        // Require the raffle host is the message sender
        require(raffle.host == msg.sender, "raffle host only");

        // Require no participants in the raffle
        require(raffle.participants.length == 0, "must be no participants in attendance");

        // Store token ID
        uint256 tokenId = raffle.tokenId;

        // Delete the raffle
        DELETERAFFLE601(raffleId);

        // Transfer the token to the host
        tokenInterface.TRANSFERFROM579(address(this), msg.sender, tokenId);

        emit ONCANCELRAFFLE73(raffleId, msg.sender);
    }

                                                                                                                                                                                                                                                                                                                 
    function DELETEANDBUYRAFFLETICKETS413(uint256 expiredRaffleId, uint256 tickets, uint256 raffleId)	//inject NONSTANDARD NAMING
        public
        payable
    {
        // Reference the expired raffle
        Raffle storage raffle = raffles[expiredRaffleId];

        // Require the raffle has ended
        require(raffle.host == address(0), "raffle expired");

        // Handle deleting expired raffle tickets to free up storage
        if (raffle.participants.length > tickets) {
            do {
                raffle.participants.pop();
            }
            while (raffle.participants.length < raffle.participants.length - tickets);
            emit ONDELETETICKETS415(expiredRaffleId, tickets);
        } else if (raffle.participants.length > 0) {
            do {
                raffle.participants.pop();
            }
            while (raffle.participants.length > 0);
            emit ONDELETETICKETS415(expiredRaffleId, raffle.participants.length);
        }

        BUYRAFFLETICKETS688(raffleId);
    }

                                                                                                                                                                                                                                      
    function WITHDRAWRAFFLETICKETS156(uint256 raffleId, uint256[] memory indexes)	//inject NONSTANDARD NAMING
        public
    {
        // Reference the raffle
        Raffle storage raffle = raffles[raffleId];

        // Require a valid raffle
        require(raffle.host != address(0), "invalid raffle");

        // Require a least one ticket to withdraw
        require(indexes.length > 0, "must be greater than 0");

        // Loop through each ticket to withdraw
        for(uint256 i = 0; i < indexes.length; i++) {
            // Require sender to be the owner of the ticket
            require(raffle.participants[indexes[i]] == msg.sender, "must be ticket owner");

            // Require indexes are sorted from highest index to lowest index
            if (i > 0) {
                require(indexes[i] < indexes[i - 1], "must be sorted from highest index to lowest index");
            }

            // Set the ticket's index to equal the value of the last ticket
            raffle.participants[indexes[i]] = raffle.participants[raffle.participants.length - 1];

            // Delete the last index
            raffle.participants.pop();
        }

        emit ONWITHDRAWRAFFLETICKETS736(raffleId, msg.sender, indexes);

        // Send refund to the ticket holder
        msg.sender.transfer(indexes.length * raffle.costPerTicket);
    }

                                                                                                                                                                                                                            
    function REFUNDRAFFLETICKETS432(uint256 raffleId, uint256 quantity)	//inject NONSTANDARD NAMING
        public
    {
        // Reference the raffle
        Raffle storage raffle = raffles[raffleId];

        // Require raffle host to be the message sender
        require(raffle.host == msg.sender, "must be raffle host");

        // Require at least one ticket to refund
        require(quantity > 0, "must refund at least one ticket");

        // Require tickets in raffle to refund
        require(raffle.participants.length > 0, "must have participants to refund");

        // Number of tickets to refund
        uint256 numberOfTicketsToRefund = quantity;

        // Check quantity of raffle tickets
        if (quantity > raffle.participants.length) {
            numberOfTicketsToRefund = raffle.participants.length;
        }

        // Loop through each raffle ticket to refund
        for(uint256 i = 0; i < numberOfTicketsToRefund; i++) {
            // Store reference to the last participant
            address payable participant = raffle.participants[raffle.participants.length - 1];

            // Delete the last index
            raffle.participants.pop();

            // Transfer raffle cost to the participant
            participant.transfer(raffle.costPerTicket);
        }

        emit ONREFUNDTICKETS21(raffleId, quantity);
    }

    // ==== PUBLIC READ FUNCTIONS ==== //

                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function GETRAFFLE964(uint256 raffleId)	//inject NONSTANDARD NAMING
        public
        view
        returns(uint256 _tokenId, address _host, uint256 _costPerTicket, uint256 _minimumTickets, uint256 _participants)
    {
        Raffle storage raffle = raffles[raffleId];

        _tokenId = raffle.tokenId;
        _host = raffle.host;
        _costPerTicket = raffle.costPerTicket;
        _minimumTickets = raffle.minimumTickets;
        _participants = raffle.participants.length;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function GETRAFFLES124(uint256[] memory raffleIds)	//inject NONSTANDARD NAMING
        public
        view
        returns(uint256[] memory _tokenId, address[] memory _host, uint256[] memory _costPerTicket, uint256[] memory _minimumTickets, uint256[] memory _participants)
    {
        for(uint256 i = 0; i < raffleIds.length; i++) {
            Raffle storage raffle = raffles[raffleIds[i]];

            _tokenId[i] = raffle.tokenId;
            _host[i] = raffle.host;
            _costPerTicket[i] = raffle.costPerTicket;
            _minimumTickets[i] = raffle.minimumTickets;
            _participants[i] = raffle.participants.length;
        }
    }

    // ==== ADMIN FUNCTIONS ==== //

                                                                                                                                                                                                                                                                      
    function SETCONTRIBUTIONPERCENT536(uint256 _contributionPercent)	//inject NONSTANDARD NAMING
        public
        ONLYADMIN418
    {
        require(_contributionPercent < 500, "Can not exceed 50%");
        contributionPercent = _contributionPercent;

        emit ONSETCONTRIBUTIONPERCENT657(_contributionPercent);
    }

                                                                                                                                                                                            
    function SETMINRAFFLETICKETCOST546(uint256 _minRaffleTicketCost)	//inject NONSTANDARD NAMING
        public
        ONLYADMIN418
    {
        minRaffleTicketCost = _minRaffleTicketCost;

        emit ONSETMINIMUMCOSTPERTICKET40(_minRaffleTicketCost);
    }

                                                                                                         
    function SETADMIN820(address _admin)	//inject NONSTANDARD NAMING
        public
        ONLYADMIN418
    {
        admin[_admin] = true;

        emit ONSETADMIN666(_admin);
    }

                                                                                                                           
    function REMOVEADMIN442(address _admin)	//inject NONSTANDARD NAMING
        public
        ONLYADMIN418
    {
        require(msg.sender != _admin, "self deletion not allowed");
        delete admin[_admin];

        emit ONREMOVEADMIN374(_admin);
    }

                                                                                                                       
    function SETTREASURY273(address payable _treasury)	//inject NONSTANDARD NAMING
        public
        ONLYADMIN418
    {
        treasury = _treasury;

        emit ONSETTREASURY569(_treasury);
    }

    // ==== EXTERNAL FUNCTIONS ==== //

                                                                                                                                                                                                                                                                                                                                                                                                    
    function ONERC721RECEIVED571(address              , address _from, uint256 _tokenId, bytes calldata _data)	//inject NONSTANDARD NAMING
        external
        returns(bytes4)
    {
        // Require the token address is authorized
        require(msg.sender == tokenAddress, "must be the token address");

        // Require host is an externally owned account
        require(tx.origin == _from, "token owner must be an externally owned account");

        // Parse data payload
        (uint256 costPerTicket, uint256 minimumTickets) = abi.decode(_data, (uint256, uint256));

        // Create a raffle
        CREATERAFFLE60(_tokenId, _from, costPerTicket, minimumTickets);

        // ERC721_RECEIVED Receipt (magic value)
        return 0x150b7a02;
    }

    // ==== PRIVATE FUNCTIONS ==== //

                                                                                                                                                                                                                                                                                                     
    function CREATERAFFLE60(uint256 tokenId, address host, uint256 costPerTicket, uint256 minimumTickets)	//inject NONSTANDARD NAMING
        private
    {
        // Require the cost of a ticket to be greater than or equal to the minimum cost of a raffle ticket
        require(costPerTicket >= minRaffleTicketCost, "ticket price must meet the minimum");

        // Require at least one ticket to create a raffle
        require(minimumTickets > 0, "must set at least one raffle ticket");

        // Increment total raffles
        totalRaffles = totalRaffles + 1;
        uint256 raffleId = totalRaffles;

        // Creates a raffle
        raffles[raffleId] = Raffle({
            tokenId: tokenId,
            host: host,
            costPerTicket: costPerTicket,
            minimumTickets: minimumTickets,
            participants: new address payable[](0)
        });

        // Emit event when a raffle is created
        emit ONCREATERAFFLE365(raffleId, tokenId, host, costPerTicket, minimumTickets);
    }

                                                                                                                 
    function DELETERAFFLE601(uint256 raffleId)	//inject NONSTANDARD NAMING
        private
    {
        // Delete the raffle
        delete raffles[raffleId].tokenId;
        delete raffles[raffleId].host;
        delete raffles[raffleId].costPerTicket;
        delete raffles[raffleId].minimumTickets;
    }

                                                                                                                                           
    function SELECTWINNINGTICKET433(uint256 raffleId)	//inject NONSTANDARD NAMING
        private
    {
        // Reference the raffle
        Raffle storage raffle = raffles[raffleId];

        // Get a random number based on total participants
        (uint256 random) = GETRANDOM451(raffle.participants.length);

        // Select a winner at random
        address winner = raffle.participants[random];

        // Confirm winner is a participant
        assert(winner != address(0));

        // The total amount of ETH allocated to the raffle
        uint256 pot = raffle.participants.length * raffle.costPerTicket;

        // Amount to contribute to the treasury
        uint256 contribution = (pot * contributionPercent) / 1000;

        // Amount to payout to the host
        uint256 payout = pot - contribution;

        // Cast host address as payable
        address payable host = address(uint160(raffle.host));

        // Store the token ID
        uint256 tokenId = raffle.tokenId;

        // Delete the raffle
        DELETERAFFLE601(raffleId);

        // Transfer prize to the raffle winner
        interfaceERC721(tokenAddress).TRANSFERFROM579(address(this), winner, tokenId);

        // Assert the winner is now the owner of the prize
        assert(tokenInterface.OWNEROF408(tokenId) == winner);

        // Transfer contribution to the treasury
        treasury.transfer(contribution);

        // Transfer pot to the raffle host
        host.transfer(payout);

        emit ONRAFFLEWINNER930(raffleId, winner, random, payout, contribution);
    }

                                                                                                                                                                                                               
    function GETRANDOM451(uint256 max)	//inject NONSTANDARD NAMING
        private
        view
        returns(uint256 random)
    {
        // Blockhash from last block
        uint256 blockhash_ = uint256(blockhash(block.number - 1));

        // Contract balance
        uint256 balance = address(this).balance;

        // Randomly generated integer
        random = uint256(keccak256(abi.encodePacked(
            // Unix timestamp in seconds
            block.timestamp,
            // Address of the block miner
            block.coinbase,
            // Difficulty of the block
            block.difficulty,
            // Blockhash from last block
            blockhash_,
            // Contract balance
            balance
        ))) % max;
    }

                                                                                                                                                                 
    function SETTOKENADDRESS295(address _tokenAddress)	//inject NONSTANDARD NAMING
        private
    {
        tokenAddress = _tokenAddress;
        emit ONSETTOKENADDRESS714(_tokenAddress);
    }
}

// ==== INTERFACE ==== //
                                             
contract interfaceERC721 {
    function TRANSFERFROM579(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
    function OWNEROF408(uint256 tokenId) public view returns (address);	//inject NONSTANDARD NAMING
}