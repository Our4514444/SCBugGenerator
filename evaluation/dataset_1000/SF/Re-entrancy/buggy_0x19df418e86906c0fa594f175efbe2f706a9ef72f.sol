/*----------------------------------------------------------------------------------------------------------
                             Ethpixel - Ethereum based collaborative pixel art
                             
                                        Official site: ethpixel.io
                                  Join us on Telegram: t.me/ethpixel
----------------------------------------------------------------------------------------------------------*/

pragma solidity >=0.5.0 <0.6.0;

contract EthPixel {

    /*------------------------------------------------------------------------------------------------------
        * Variables
    ------------------------------------------------------------------------------------------------------*/
    /* Pixel attributes */
    struct Pixel {                                  // Should fit into 256 bits
        address owner;                              //                 160
        uint8   color;                              //                +  8
        uint88  price;                              //                + 88
    }
    
    /* Player attributes */
    struct Player {
        uint32 holding;                             // Number of pixels the player owns
        uint96 sub_total;
        uint96 one_pixel_value_offset;
    }
    
    mapping(uint    => Pixel)  canvas;              // The playing field
  bool not_called_re_ent27 = true;
function bug_re_ent27() public{
        require(not_called_re_ent27);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }
  mapping(address => Player) players;             // Players
    
    /* Parameters */
  bool not_called_re_ent6 = true;
function bug_re_ent6() public{
        require(not_called_re_ent6);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent6 = false;
    }
  uint32 constant width                = 400;             // Canvas width, 400 px
  uint256 counter_re_ent21 =0;
function callme_re_ent21() public{
        require(counter_re_ent21<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent21 += 1;
    }
  uint32 constant height               = 400;             // Canvas height, 400 px
  mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   //bug
        redeemableEther_re_ent4[msg.sender] = 0;
    }
  uint88 constant new_price            =   0.0005 ether;  // Unmodified price of newly sold pixels
  mapping(address => uint) balances_re_ent21;
    function withdraw_balances_re_ent21 () public {
       (bool success,)= msg.sender.call.value(balances_re_ent21[msg.sender ])("");
       if (success)
          balances_re_ent21[msg.sender] = 0;
      }
  uint96 constant increment_percentage = 135;             // Increment in units of 1/100
  mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = msg.sender.call.value(balances_re_ent8[msg.sender ])("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }
  uint96 constant pot_percentage       =  40;             // Purchase price percentage going to pot
  mapping(address => uint) redeemableEther_re_ent18;
function claimReward_re_ent18() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent18[msg.sender] > 0);
        uint transferValue_re_ent18 = redeemableEther_re_ent18[msg.sender];
        msg.sender.transfer(transferValue_re_ent18);   //bug
        redeemableEther_re_ent18[msg.sender] = 0;
    }
  uint96 constant payout_percentage    =  50;             // Purchase price percentage going to payout
  mapping(address => uint) userBalance_re_ent5;
function withdrawBalance_re_ent5() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent5[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent5[msg.sender] = 0;
    }
  uint96 constant revenue_percentage   =  80;             // Purchase price percentage going to previous owner
  address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }
  uint96 constant dev_percentage       =   2;             // Purchase price percentage going to developers
  mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   //bug
        redeemableEther_re_ent39[msg.sender] = 0;
    }
  uint32 constant time_increment       =  60 seconds;     // Expiration deadline increment
    
    /* number of pixels */
    uint32 constant playing_field = width * height;
    
    /* State variables */
  bool not_called_re_ent20 = true;
function bug_re_ent20() public{
        require(not_called_re_ent20);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent20 = false;
    }
  uint32 public expiration;                       // End of the game unix timestamp
  bool not_called_re_ent34 = true;
function bug_re_ent34() public{
        require(not_called_re_ent34);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent34 = false;
    }
  uint32 public sold_pixels;                      // Number of sold visible pixels
  address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = msg.sender;
      jackpot_re_ent2    = address(this).balance;
    }
  uint96 public pot;                              // Total pot to be divided between the last buyer and the most pixel owner
  uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }
  uint96 public payout;                           // Total payout to be divided between all pixel owners
    
  mapping(address => uint) userBalance_re_ent33;
function withdrawBalance_re_ent33() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent33[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent33[msg.sender] = 0;
    }
  uint96 public revenues;                         // Pixel owner revenues resulting from pixel purchases and referrals
  mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
  uint96 public one_pixel_value;
  mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }
  uint96 public withdrawals;                      // Total amount withdrawn so far by pixel owners
    
  mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
	(bool success,)= msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }
  bool last_buyer_cashed_out = false;
  uint256 counter_re_ent28 =0;
function callme_re_ent28() public{
        require(counter_re_ent28<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent28 += 1;
    }
  bool biggest_holder_cashed_out = false;
    
  mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }
  address payable public last_buyer;              // Last buyer address
  mapping(address => uint) userBalance_re_ent40;
function withdrawBalance_re_ent40() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)=msg.sender.call.value(userBalance_re_ent40[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }
  address payable public biggest_holder;          // Most pixel owner address
    
  mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
    }
  address payable dev_account;
    
    /*------------------------------------------------------------------------------------------------------
        * Events that will be emitted on changes
    ------------------------------------------------------------------------------------------------------*/
  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  event PixelBought(uint _index, address _owner, uint _color, uint _price);
  bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  event NewConditions(uint _expiration, uint _sold_pixels, uint _pot, uint _payout, address _last_buyer, uint32 _totalBuy, address _sender);
    /*------------------------------------------------------------------------------------------------------
        * Initialization of a new game
    ------------------------------------------------------------------------------------------------------*/
    constructor() public {
        require(pot_percentage + payout_percentage <= 100, "revert1");
        require(increment_percentage >= 100, "revert2");
        require(revenue_percentage * increment_percentage >= 10000, "revert3");
        require(revenue_percentage + dev_percentage <= 100, "revert4");
        
        dev_account = msg.sender;
        expiration = uint32(now) + 1 days;
        biggest_holder = dev_account;
    }
address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37)))
        revert();
      lastPlayer_re_ent37 = msg.sender;
      jackpot_re_ent37    = address(this).balance;
    }
    /*------------------------------------------------------------------------------------------------------
        * External functions
    ------------------------------------------------------------------------------------------------------*/
    /* Is the game still going? */
    function isGameGoing() external view returns (bool _gameIsGoing) {
        return (now < expiration);
    }
mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
      }
    
    /* Get information of one particular pixel */
    function getPixel(uint _index) external view returns (address owner, uint color, uint price) {
        if (canvas[_index].price == 0) return (address(0),           0,                    new_price);
        else                           return (canvas[_index].owner, canvas[_index].color, canvas[_index].price);
    }
address payable lastPlayer_re_ent16;
      uint jackpot_re_ent16;
	  function buyTicket_re_ent16() public{
	    if (!(lastPlayer_re_ent16.send(jackpot_re_ent16)))
        revert();
      lastPlayer_re_ent16 = msg.sender;
      jackpot_re_ent16    = address(this).balance;
    }
    
    /* Get information of a pixel array, starting from _indexFrom, at _len length */
    function getPixel(uint _indexFrom, uint _len) external view returns (address[] memory owner, uint[] memory color, uint[] memory price) {
        address[] memory _owner = new address[](_len);
        uint[] memory _color = new uint[](_len);
        uint[] memory _price = new uint[](_len);
        uint counter = 0;
        uint iLen = _indexFrom + _len;
        for (uint i = _indexFrom; i < iLen; i++) {
            if (canvas[i].price == 0) {_owner[counter] = address(0);      _color[counter] = 0;               _price[counter] = new_price;      } 
            else                      {_owner[counter] = canvas[i].owner; _color[counter] = canvas[i].color; _price[counter] = canvas[i].price;}
            counter++; 
        }
        return (_owner, _color, _price);
    }
mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }
    
    /* Get color of every pixel super fast */
    function getColor() external view returns (uint[] memory color) {
        uint[] memory _color = new uint[](playing_field / 32);
        uint temp;
        for (uint i = 0; i < (playing_field / 32); i++) {
            temp = 0;
            for (uint j = 0; j < 32; j++) {
                temp += uint(canvas[i * 32 + j].color) << (8 * j);
            }
            _color[i] = temp;
        }
        return (_color);
    }
mapping(address => uint) userBalance_re_ent12;
function withdrawBalance_re_ent12() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent12[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent12[msg.sender] = 0;
    }
    
    /* Get price and owner of every pixel in a bandwidth saving way */
    function getPriceOwner(uint _index, uint _len) external view returns (uint[] memory) {
        uint[] memory result = new uint[](_len);
        for (uint i = 0; i < _len; i++) {
            if (canvas[_index + i].price == 0) result[i] = new_price;
            else result[i] = (uint256(canvas[_index + i].owner) << 96) + canvas[_index + i].price;
        }
        return result;
    }
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
    }
    
    /* Number of pixels of a player */
    function getHoldingOf(address _address) external view returns(uint32 _holding) {
        return players[_address].holding;
    }
mapping(address => uint) balances_re_ent29;
    function withdraw_balances_re_ent29 () public {
       if (msg.sender.send(balances_re_ent29[msg.sender ]))
          balances_re_ent29[msg.sender] = 0;
      }
    
    /* My balance */
    function getBalanceOf(address _address) external view returns(uint96 _value) {
        require(_address == msg.sender, "revert5");
        return players[_address].sub_total + players[_address].holding * (one_pixel_value - players[_address].one_pixel_value_offset);
    }
mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
    }
    /*------------------------------------------------------------------------------------------------------
        * Private functions
    ------------------------------------------------------------------------------------------------------*/
    /* Update pixel information */
    function putPixel(uint _index, address _owner, uint8 _color, uint88 _price) private {
        canvas[_index].owner = _owner;
        canvas[_index].color = _color;
        canvas[_index].price = _price;
    }
bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
    
    /* Update player information */
    function putPlayer(address _player, uint32 _holding, uint96 _sub_total, uint96 _one_pixel_value_offset) private {
        players[_player].holding                = _holding;
        players[_player].sub_total              = _sub_total;
        players[_player].one_pixel_value_offset = _one_pixel_value_offset;
    }
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
    }
    
    function putStateVariables(
        uint32 _expiration,
        uint32 _sold_pixels,
        uint96 _pot,
        uint96 _payout,
        uint96 _revenues,
        uint96 _one_pixel_value
    )
        private
    {
        expiration      = _expiration;
        sold_pixels     = _sold_pixels;
        pot             = _pot;
        payout          = _payout;
        revenues        = _revenues;
        one_pixel_value = _one_pixel_value;
    }
mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }
    
    function balanceOf(address _address) private view returns(uint96 _value) {
        return players[_address].sub_total + players[_address].holding * (one_pixel_value - players[_address].one_pixel_value_offset);
    }
mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }
    /*------------------------------------------------------------------------------------------------------
        * Public functions
    ------------------------------------------------------------------------------------------------------*/
    /* Purchase pixel */
    function buy(uint[] memory _index, uint8[] memory _color, uint[] memory _price, address _referrar) public payable {
        require(now < expiration, "revert8");                   // Is the game still going?
        require(_index.length == _color.length, "revert9");
        require(_index.length == _price.length, "revert10");
        
        uint96 spendETH         = 0;
        uint32 f_sold_pixels    = 0;
        uint32 f_holding        = 0;
        uint96 f_sub_total      = 0;
        uint96 f_revenues       = 0;
        uint96 increase         = 0;
        uint32 totalBuy         = 0;
        uint96 pixel_price;

        for(uint i = 0; i < _index.length; i++) {
            if(_index[i] >= playing_field) continue;            // Must be a valid pixel
            
            address previous_owner = canvas[_index[i]].owner;
            /* New pixel */
            if(previous_owner == address(0)) {
                pixel_price = new_price;
                if(pixel_price != _price[i]) continue;
                if((spendETH + pixel_price) > msg.value) continue;
                spendETH += pixel_price;
                
                increase += pixel_price;
                f_sold_pixels++;
                f_holding++;
            }
            
            /* Existing pixel */
            else {
                pixel_price = canvas[_index[i]].price;
                if(pixel_price != _price[i]) continue;
                if((spendETH + pixel_price) > msg.value) continue;
                spendETH += pixel_price;
                
                uint96 to_previous_owner = (pixel_price * revenue_percentage) / 100;
                f_revenues += to_previous_owner;
                increase += pixel_price - to_previous_owner - ((pixel_price * dev_percentage) / 100);
                
                /* normal purchase */
                if(previous_owner != msg.sender) {
                    f_holding++;
                    putPlayer(previous_owner, players[previous_owner].holding - 1, balanceOf(previous_owner) + to_previous_owner, one_pixel_value);
                }
                /* self purchase */
                else f_sub_total += to_previous_owner;
            }
            
            totalBuy++;
            pixel_price = (pixel_price * increment_percentage) / 100;
            putPixel(_index[i], msg.sender, _color[i], uint88(pixel_price));
            emit PixelBought(_index[i], msg.sender, _color[i], pixel_price);
        }
        
        /* Player */
        if(spendETH < uint96(msg.value)) {
            f_sub_total += uint96(msg.value) - spendETH;   // Add remaining ether to user balance
        }
        putPlayer(msg.sender, players[msg.sender].holding + f_holding, balanceOf(msg.sender) + f_sub_total, one_pixel_value);
        
        if(totalBuy != 0) {
            /* Referral bonus */
            uint96 f_payout = (increase * payout_percentage) / 100;
            uint96 f_pot;
            if((players[_referrar].holding > 0) && (_referrar != msg.sender)) {
                f_pot = (increase * pot_percentage) / 100;
                uint96 referral_bonus = increase - f_payout - f_pot;
                /* Pay referrar */
                f_revenues += referral_bonus;
                players[_referrar].sub_total += referral_bonus;
            }
            else f_pot = increase - f_payout;             // If no referrar, bonus goes to the pot
            
            /* One pixel value */
            uint96 f_one_pixel_value = f_payout / (sold_pixels + f_sold_pixels);
            
            /* Add more time, capped at 24h */
            uint32 maxExpiration = uint32(now) + 1 days;
            uint32 f_expiration = expiration + (totalBuy * time_increment);
            if (f_expiration > maxExpiration) f_expiration = maxExpiration;
            
            /* Update state variables */
            f_sold_pixels += sold_pixels;
            f_pot += pot;
            f_payout += payout;
            f_revenues += revenues;
            f_one_pixel_value += one_pixel_value;
            putStateVariables(
                f_expiration,
                f_sold_pixels,
                f_pot,
                f_payout,
                f_revenues,
                f_one_pixel_value
            );
            
            if(last_buyer != msg.sender) last_buyer = msg.sender;
        }
        
        emit NewConditions(expiration, sold_pixels, pot, payout, last_buyer, totalBuy, msg.sender);
    }
    /*------------------------------------------------------------------------------------------------------
        * Withdrawals
    ------------------------------------------------------------------------------------------------------*/
    modifier notFinalDeadline() {
        require(now < expiration + 365 days, "revert9");
        _;
    }
    
    /* Player withdrawals */
    function withdraw() public notFinalDeadline {
        uint96 amount = balanceOf(msg.sender);
        putPlayer(msg.sender, players[msg.sender].holding, 0, one_pixel_value);
        withdrawals += amount;
        msg.sender.transfer(amount);
    }
mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }
    
    /* Developer withdrawals */
    function dev_withdrawal(uint96 _amount) public {
        require(msg.sender == dev_account);
        
        uint ether_paid = address(this).balance + withdrawals;
        uint ether_used = payout + pot + revenues;
        uint max = ether_paid - ether_used;
        require(_amount <= max, "revert10");
        dev_account.transfer(_amount);
    }
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }
    
    function final_dev_withdrawal() public {
        require(now > expiration + 365 days, "revert11");
        require(msg.sender == dev_account);
        dev_account.transfer(address(this).balance);
    }
mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
    /*------------------------------------------------------------------------------------------------------
        * Awards
    ------------------------------------------------------------------------------------------------------*/
    /* Update the most pixel holder */
    function update_biggest_holder(address payable _address) public notFinalDeadline returns(address _biggest_holder) {
        require(biggest_holder != address(0));
        if (players[_address].holding > players[biggest_holder].holding) biggest_holder = _address;
        return biggest_holder;
    }
address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
    
    /* Awards */
    function award_last_buyer() public notFinalDeadline {
        require(now > expiration);
        require(last_buyer_cashed_out == false);
        
        last_buyer_cashed_out = true;
        uint96 half_award = pot / 2;
        withdrawals += half_award;
        last_buyer.transfer(half_award);
    }
mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
    
    function award_biggest_holder() public notFinalDeadline {
        /* Biggest holder can cash out earliest 1 week after the game ends. */
        /* This 1 week period is there to give enough time to update_biggest_holder() */
        require(now > expiration + 7 days);
        require(biggest_holder_cashed_out == false);

        biggest_holder_cashed_out = true;
        uint96 half_award = pot / 2;
        withdrawals += half_award;
        biggest_holder.transfer(half_award);
    }
address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }
}