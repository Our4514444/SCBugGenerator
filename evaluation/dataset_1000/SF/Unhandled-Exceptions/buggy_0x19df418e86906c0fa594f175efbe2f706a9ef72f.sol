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
    
  bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
  mapping(uint    => Pixel)  canvas;              // The playing field
  function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
  mapping(address => Player) players;             // Players
    
    /* Parameters */
  function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
  uint32 constant width                = 400;             // Canvas width, 400 px
  function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
  uint32 constant height               = 400;             // Canvas height, 400 px
  function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
  uint88 constant new_price            =   0.0005 ether;  // Unmodified price of newly sold pixels
  function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint96 constant increment_percentage = 135;             // Increment in units of 1/100
  bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  uint96 constant pot_percentage       =  40;             // Purchase price percentage going to pot
  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  uint96 constant payout_percentage    =  50;             // Purchase price percentage going to payout
  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  uint96 constant revenue_percentage   =  80;             // Purchase price percentage going to previous owner
  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  uint96 constant dev_percentage       =   2;             // Purchase price percentage going to developers
  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  uint32 constant time_increment       =  60 seconds;     // Expiration deadline increment
    
    /* number of pixels */
    uint32 constant playing_field = width * height;
    
    /* State variables */
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  uint32 public expiration;                       // End of the game unix timestamp
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  uint32 public sold_pixels;                      // Number of sold visible pixels
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  uint96 public pot;                              // Total pot to be divided between the last buyer and the most pixel owner
  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint96 public payout;                           // Total payout to be divided between all pixel owners
    
  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint96 public revenues;                         // Pixel owner revenues resulting from pixel purchases and referrals
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  uint96 public one_pixel_value;
  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint96 public withdrawals;                      // Total amount withdrawn so far by pixel owners
    
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  bool last_buyer_cashed_out = false;
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  bool biggest_holder_cashed_out = false;
    
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  address payable public last_buyer;              // Last buyer address
  function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  address payable public biggest_holder;          // Most pixel owner address
    
  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  address payable dev_account;
    
    /*------------------------------------------------------------------------------------------------------
        * Events that will be emitted on changes
    ------------------------------------------------------------------------------------------------------*/
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event PixelBought(uint _index, address _owner, uint _color, uint _price);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
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
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    /*------------------------------------------------------------------------------------------------------
        * External functions
    ------------------------------------------------------------------------------------------------------*/
    /* Is the game still going? */
    function isGameGoing() external view returns (bool _gameIsGoing) {
        return (now < expiration);
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
    
    /* Get information of one particular pixel */
    function getPixel(uint _index) external view returns (address owner, uint color, uint price) {
        if (canvas[_index].price == 0) return (address(0),           0,                    new_price);
        else                           return (canvas[_index].owner, canvas[_index].color, canvas[_index].price);
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
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
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
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
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
    
    /* Get price and owner of every pixel in a bandwidth saving way */
    function getPriceOwner(uint _index, uint _len) external view returns (uint[] memory) {
        uint[] memory result = new uint[](_len);
        for (uint i = 0; i < _len; i++) {
            if (canvas[_index + i].price == 0) result[i] = new_price;
            else result[i] = (uint256(canvas[_index + i].owner) << 96) + canvas[_index + i].price;
        }
        return result;
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    
    /* Number of pixels of a player */
    function getHoldingOf(address _address) external view returns(uint32 _holding) {
        return players[_address].holding;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    
    /* My balance */
    function getBalanceOf(address _address) external view returns(uint96 _value) {
        require(_address == msg.sender, "revert5");
        return players[_address].sub_total + players[_address].holding * (one_pixel_value - players[_address].one_pixel_value_offset);
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
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
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    
    /* Update player information */
    function putPlayer(address _player, uint32 _holding, uint96 _sub_total, uint96 _one_pixel_value_offset) private {
        players[_player].holding                = _holding;
        players[_player].sub_total              = _sub_total;
        players[_player].one_pixel_value_offset = _one_pixel_value_offset;
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
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
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
    
    function balanceOf(address _address) private view returns(uint96 _value) {
        return players[_address].sub_total + players[_address].holding * (one_pixel_value - players[_address].one_pixel_value_offset);
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
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
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
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
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    
    function final_dev_withdrawal() public {
        require(now > expiration + 365 days, "revert11");
        require(msg.sender == dev_account);
        dev_account.transfer(address(this).balance);
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
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
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
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
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
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
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
}