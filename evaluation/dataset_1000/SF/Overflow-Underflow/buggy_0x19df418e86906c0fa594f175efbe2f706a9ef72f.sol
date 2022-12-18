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
    mapping(address => Player) players;             // Players
    
    /* Parameters */
    uint32 constant width                = 400;             // Canvas width, 400 px
  function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint32 constant height               = 400;             // Canvas height, 400 px
  mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }
  uint88 constant new_price            =   0.0005 ether;  // Unmodified price of newly sold pixels
  mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
  uint96 constant increment_percentage = 135;             // Increment in units of 1/100
  function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}
  uint96 constant pot_percentage       =  40;             // Purchase price percentage going to pot
  mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }
  uint96 constant payout_percentage    =  50;             // Purchase price percentage going to payout
  function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}
  uint96 constant revenue_percentage   =  80;             // Purchase price percentage going to previous owner
  mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }
  uint96 constant dev_percentage       =   2;             // Purchase price percentage going to developers
  mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
  uint32 constant time_increment       =  60 seconds;     // Expiration deadline increment
    
    /* number of pixels */
    uint32 constant playing_field = width * height;
    
    /* State variables */
  function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint32 public expiration;                       // End of the game unix timestamp
  function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint32 public sold_pixels;                      // Number of sold visible pixels
  function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}
  uint96 public pot;                              // Total pot to be divided between the last buyer and the most pixel owner
  mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }
  uint96 public payout;                           // Total payout to be divided between all pixel owners
    
  mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }
  uint96 public revenues;                         // Pixel owner revenues resulting from pixel purchases and referrals
  mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
  uint96 public one_pixel_value;
  mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
  uint96 public withdrawals;                      // Total amount withdrawn so far by pixel owners
    
  mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }
  bool last_buyer_cashed_out = false;
  function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
  bool biggest_holder_cashed_out = false;
    
  function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address payable public last_buyer;              // Last buyer address
  function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}
  address payable public biggest_holder;          // Most pixel owner address
    
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  address payable dev_account;
    
    /*------------------------------------------------------------------------------------------------------
        * Events that will be emitted on changes
    ------------------------------------------------------------------------------------------------------*/
  mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  event PixelBought(uint _index, address _owner, uint _color, uint _price);
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
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
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
    /*------------------------------------------------------------------------------------------------------
        * External functions
    ------------------------------------------------------------------------------------------------------*/
    /* Is the game still going? */
    function isGameGoing() external view returns (bool _gameIsGoing) {
        return (now < expiration);
    }
function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
    
    /* Get information of one particular pixel */
    function getPixel(uint _index) external view returns (address owner, uint color, uint price) {
        if (canvas[_index].price == 0) return (address(0),           0,                    new_price);
        else                           return (canvas[_index].owner, canvas[_index].color, canvas[_index].price);
    }
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
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
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
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
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    /* Number of pixels of a player */
    function getHoldingOf(address _address) external view returns(uint32 _holding) {
        return players[_address].holding;
    }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
    
    /* My balance */
    function getBalanceOf(address _address) external view returns(uint96 _value) {
        require(_address == msg.sender, "revert5");
        return players[_address].sub_total + players[_address].holding * (one_pixel_value - players[_address].one_pixel_value_offset);
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
    
    /* Update player information */
    function putPlayer(address _player, uint32 _holding, uint96 _sub_total, uint96 _one_pixel_value_offset) private {
        players[_player].holding                = _holding;
        players[_player].sub_total              = _sub_total;
        players[_player].one_pixel_value_offset = _one_pixel_value_offset;
    }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
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
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
    
    function balanceOf(address _address) private view returns(uint96 _value) {
        return players[_address].sub_total + players[_address].holding * (one_pixel_value - players[_address].one_pixel_value_offset);
    }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
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
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
    
    function final_dev_withdrawal() public {
        require(now > expiration + 365 days, "revert11");
        require(msg.sender == dev_account);
        dev_account.transfer(address(this).balance);
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
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
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
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
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
}