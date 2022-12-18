                                                                 

pragma solidity ^0.5.13;
pragma experimental ABIEncoderV2;

contract XBullionTokenConfig {
    using Math64x64 for int128;

    string internal constant token_symbol950 = "GOLD";	//inject NONSTANDARD NAMING
    string internal constant token_name487 = "xbullion token";	//inject NONSTANDARD NAMING
    uint8 internal constant token_decimals975 = 8;	//inject NONSTANDARD NAMING

    uint256 private constant decimals_factor57 = 10**uint256(token_decimals975);	//inject NONSTANDARD NAMING
    uint256 internal constant token_initialsupply212 = 0;	//inject NONSTANDARD NAMING

    uint256 internal constant token_mintcapacity907 = 100 * decimals_factor57;	//inject NONSTANDARD NAMING
    uint internal constant token_mintperiod201 = 24 hours;	//inject NONSTANDARD NAMING

    function INITIALFEETIERS363()	//inject NONSTANDARD NAMING
        internal
        pure
        returns (ERC20WithFees.FeeTier[] memory feeTiers)
    {
        feeTiers = new ERC20WithFees.FeeTier[](2);
        feeTiers[0] = ERC20WithFees.FeeTier({
            threshold: 0,
            fee: FEEFROMBPS647(60)
        });
        feeTiers[1] = ERC20WithFees.FeeTier({
            threshold: 20000 * decimals_factor57,
            fee: FEEFROMBPS647(30)
        });
    }

    function INITIALTXFEE708()	//inject NONSTANDARD NAMING
        internal
        pure
        returns (int128)
    {
        return TXFEEFROMBPS822(12);
    }

    function MAKEADDRESSSINGLETON994(address _addr)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (address[] memory addrs)
    {
        addrs = new address[](1);
        addrs[0] = _addr;
    }

    function FEEFROMBPS647(uint _bps)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (int128)
    {
        return Math64x64.FROMUINT562(_bps)
            .DIV349(Math64x64.FROMUINT562(10000))
            .DIV349(Math64x64.FROMUINT562(365))
            .DIV349(Math64x64.FROMUINT562(86400));
    }

    function TXFEEFROMBPS822(uint _bps)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (int128)
    {
        return Math64x64.FROMUINT562(_bps)
            .DIV349(Math64x64.FROMUINT562(10000));
    }
}

contract ERC20Interface {
    event APPROVAL540(address indexed owner, address indexed spender, uint256 amount);	//inject NONSTANDARD NAMING
    event BURN695(address indexed from, uint256 amount);	//inject NONSTANDARD NAMING
    event MINT770(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event TRANSFER546(address indexed from, address indexed to, uint256 amount);	//inject NONSTANDARD NAMING

    function ALLOWANCE645(address _owner, address _spender) public view returns (uint256 remaining);	//inject NONSTANDARD NAMING
    function APPROVE433(address _spender, uint256 _amount) public returns (bool success);	//inject NONSTANDARD NAMING
    function BALANCEOF775(address _owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING
    function TRANSFER634(address _to, uint256 _amount) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM882(address _from, address _to, uint256 _amount) public returns (bool success);	//inject NONSTANDARD NAMING

    function DECIMALS563() public view returns (uint8);	//inject NONSTANDARD NAMING
    function NAME909() public view returns (string memory);	//inject NONSTANDARD NAMING
    function SYMBOL394() public view returns (string memory);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY569() public view returns (uint256);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD346(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB246(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL325(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV349(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD866(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

library AddressSet
{
    struct addrset
    {
        mapping(address => uint) index;
        address[] elements;
    }

    function INSERT823(addrset storage self, address e)	//inject NONSTANDARD NAMING
        internal
        returns (bool success)
    {
        if (self.index[e] > 0) {
            return false;
        } else {
            self.index[e] = self.elements.push(e);
            return true;
        }
    }

    function REMOVE308(addrset storage self, address e)	//inject NONSTANDARD NAMING
        internal
        returns (bool success)
    {
        uint index = self.index[e];
        if (index == 0) {
            return false;
        } else {
            address e0 = self.elements[self.elements.length - 1];
            self.elements[index - 1] = e0;
            self.elements.pop();
            self.index[e0] = index;
            delete self.index[e];
            return true;
        }
    }

    function HAS545(addrset storage self, address e)	//inject NONSTANDARD NAMING
        internal
        view
        returns (bool)
    {
        return self.index[e] > 0;
    }
}

                                                                                                                   
library Math64x64 {
                                                                             
  int128 private constant min_64x64365 = -0x80000000000000000000000000000000;	//inject NONSTANDARD NAMING

                                                                             
  int128 private constant max_64x64780 = 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                            
  function FROMINT518 (int256 x) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    require (x >= -0x8000000000000000 && x <= 0x7FFFFFFFFFFFFFFF);
    return int128 (x << 64);
  }

                                                                                                                                                                                                               
  function TOINT68 (int128 x) internal pure returns (int64) {	//inject NONSTANDARD NAMING
    return int64 (x >> 64);
  }

                                                                                                                                                                                                                                
  function FROMUINT562 (uint256 x) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    require (x <= 0x7FFFFFFFFFFFFFFF);
    return int128 (x << 64);
  }

                                                                                                                                                                                                                                         
  function TOUINT717 (int128 x) internal pure returns (uint64) {	//inject NONSTANDARD NAMING
    require (x >= 0);
    return uint64 (x >> 64);
  }

                                                                                                                                                                                                                                                      
  function FROM128X128615 (int256 x) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    int256 result = x >> 64;
    require (result >= min_64x64365 && result <= max_64x64780);
    return int128 (result);
  }

                                                                                                                                                                                                           
  function TO128X128933 (int128 x) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    return int256 (x) << 64;
  }

                                                                                                                                                                                                                
  function ADD346 (int128 x, int128 y) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    int256 result = int256(x) + y;
    require (result >= min_64x64365 && result <= max_64x64780);
    return int128 (result);
  }

                                                                                                                                                                                                                
  function SUB246 (int128 x, int128 y) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    int256 result = int256(x) - y;
    require (result >= min_64x64365 && result <= max_64x64780);
    return int128 (result);
  }

                                                                                                                                                                                                                              
  function MUL325 (int128 x, int128 y) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    int256 result = int256(x) * y >> 64;
    require (result >= min_64x64365 && result <= max_64x64780);
    return int128 (result);
  }

                                                                                                                                                                                                                                                                                                              
  function MULI588 (int128 x, int256 y) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    if (x == min_64x64365) {
      require (y >= -0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF &&
        y <= 0x1000000000000000000000000000000000000000000000000);
      return -y << 63;
    } else {
      bool negativeResult = false;
      if (x < 0) {
        x = -x;
        negativeResult = true;
      }
      if (y < 0) {
        y = -y; // We rely on overflow behavior here
        negativeResult = !negativeResult;
      }
      uint256 absoluteResult = MULU803 (x, uint256 (y));
      if (negativeResult) {
        require (absoluteResult <=
          0x8000000000000000000000000000000000000000000000000000000000000000);
        return -int256 (absoluteResult); // We rely on overflow behavior here
      } else {
        require (absoluteResult <=
          0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
        return int256 (absoluteResult);
      }
    }
  }

                                                                                                                                                                                                                                                                                                            
  function MULU803 (int128 x, uint256 y) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (y == 0) return 0;

    require (x >= 0);

    uint256 lo = (uint256 (x) * (y & 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)) >> 64;
    uint256 hi = uint256 (x) * (y >> 128);

    require (hi <= 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
    hi <<= 64;

    require (hi <=
      0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF - lo);
    return hi + lo;
  }

                                                                                                                                                                                                                                                             
  function DIV349 (int128 x, int128 y) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    require (y != 0);
    int256 result = (int256 (x) << 64) / y;
    require (result >= min_64x64365 && result <= max_64x64780);
    return int128 (result);
  }

                                                                                                                                                                                                                                                                                                   
  function DIVI665 (int256 x, int256 y) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    require (y != 0);

    bool negativeResult = false;
    if (x < 0) {
      x = -x; // We rely on overflow behavior here
      negativeResult = true;
    }
    if (y < 0) {
      y = -y; // We rely on overflow behavior here
      negativeResult = !negativeResult;
    }
    uint128 absoluteResult = DIVUU807 (uint256 (x), uint256 (y));
    if (negativeResult) {
      require (absoluteResult <= 0x80000000000000000000000000000000);
      return -int128 (absoluteResult); // We rely on overflow behavior here
    } else {
      require (absoluteResult <= 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
      return int128 (absoluteResult); // We rely on overflow behavior here
    }
  }

                                                                                                                                                                                                                                                                                                         
  function DIVU738 (uint256 x, uint256 y) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    require (y != 0);
    uint128 result = DIVUU807 (x, y);
    require (result <= uint128 (max_64x64780));
    return int128 (result);
  }

                                                                                                                                                           
  function NEG699 (int128 x) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    require (x != min_64x64365);
    return -x;
  }

                                                                                                                                                            
  function ABS354 (int128 x) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    require (x != min_64x64365);
    return x < 0 ? -x : x;
  }

                                                                                                                                                                                                           
  function INV111 (int128 x) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    require (x != 0);
    int256 result = int256 (0x100000000000000000000000000000000) / x;
    require (result >= min_64x64365 && result <= max_64x64780);
    return int128 (result);
  }

                                                                                                                                                                                                                                                    
  function AVG942 (int128 x, int128 y) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    return int128 ((int256 (x) + int256 (y)) >> 1);
  }

                                                                                                                                                                                                                                                                                                         
  function GAVG392 (int128 x, int128 y) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    int256 m = int256 (x) * int256 (y);
    require (m >= 0);
    require (m <
        0x4000000000000000000000000000000000000000000000000000000000000000);
    return int128 (SQRTU439 (uint256 (m), uint256 (x) + uint256 (y) >> 1));
  }

                                                                                                                                                                                                                                                                                                    
  function POW871 (int128 x, uint256 y) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    uint256 absoluteResult;
    bool negativeResult = false;
    if (x >= 0) {
      absoluteResult = POWU578 (uint256 (x) << 63, y);
    } else {
      // We rely on overflow behavior here
      absoluteResult = POWU578 (uint256 (uint128 (-x)) << 63, y);
      negativeResult = y & 1 > 0;
    }

    absoluteResult >>= 63;

    if (negativeResult) {
      require (absoluteResult <= 0x80000000000000000000000000000000);
      return -int128 (absoluteResult); // We rely on overflow behavior here
    } else {
      require (absoluteResult <= 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
      return int128 (absoluteResult); // We rely on overflow behavior here
    }
  }

                                                                                                                                                                            
  function SQRT11 (int128 x) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    require (x >= 0);
    return int128 (SQRTU439 (uint256 (x) << 64, 0x10000000000000000));
  }

                                                                                                                                                                            
  function LOG_2640 (int128 x) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    require (x > 0);

    int256 msb = 0;
    int256 xc = x;
    if (xc >= 0x10000000000000000) { xc >>= 64; msb += 64; }
    if (xc >= 0x100000000) { xc >>= 32; msb += 32; }
    if (xc >= 0x10000) { xc >>= 16; msb += 16; }
    if (xc >= 0x100) { xc >>= 8; msb += 8; }
    if (xc >= 0x10) { xc >>= 4; msb += 4; }
    if (xc >= 0x4) { xc >>= 2; msb += 2; }
    if (xc >= 0x2) msb += 1;  // No need to shift xc anymore

    int256 result = msb - 64 << 64;
    uint256 ux = uint256 (x) << 127 - msb;
    for (int256 bit = 0x8000000000000000; bit > 0; bit >>= 1) {
      ux *= ux;
      uint256 b = ux >> 255;
      ux >>= 127 + b;
      result += bit * int256 (b);
    }

    return int128 (result);
  }

                                                                                                                                                                             
  function LN710 (int128 x) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    require (x > 0);

    return int128 (
        uint256 (LOG_2640 (x)) * 0xB17217F7D1CF79ABC9E3B39803F2F6AF >> 128);
  }

                                                                                                                                                                             
  function EXP_2229 (int128 x) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    require (x < 0x400000000000000000); // Overflow

    if (x < -0x400000000000000000) return 0; // Underflow

    uint256 result = 0x80000000000000000000000000000000;

    if (x & 0x8000000000000000 > 0)
      result = result * 0x16A09E667F3BCC908B2FB1366EA957D3E >> 128;
    if (x & 0x4000000000000000 > 0)
      result = result * 0x1306FE0A31B7152DE8D5A46305C85EDEC >> 128;
    if (x & 0x2000000000000000 > 0)
      result = result * 0x1172B83C7D517ADCDF7C8C50EB14A791F >> 128;
    if (x & 0x1000000000000000 > 0)
      result = result * 0x10B5586CF9890F6298B92B71842A98363 >> 128;
    if (x & 0x800000000000000 > 0)
      result = result * 0x1059B0D31585743AE7C548EB68CA417FD >> 128;
    if (x & 0x400000000000000 > 0)
      result = result * 0x102C9A3E778060EE6F7CACA4F7A29BDE8 >> 128;
    if (x & 0x200000000000000 > 0)
      result = result * 0x10163DA9FB33356D84A66AE336DCDFA3F >> 128;
    if (x & 0x100000000000000 > 0)
      result = result * 0x100B1AFA5ABCBED6129AB13EC11DC9543 >> 128;
    if (x & 0x80000000000000 > 0)
      result = result * 0x10058C86DA1C09EA1FF19D294CF2F679B >> 128;
    if (x & 0x40000000000000 > 0)
      result = result * 0x1002C605E2E8CEC506D21BFC89A23A00F >> 128;
    if (x & 0x20000000000000 > 0)
      result = result * 0x100162F3904051FA128BCA9C55C31E5DF >> 128;
    if (x & 0x10000000000000 > 0)
      result = result * 0x1000B175EFFDC76BA38E31671CA939725 >> 128;
    if (x & 0x8000000000000 > 0)
      result = result * 0x100058BA01FB9F96D6CACD4B180917C3D >> 128;
    if (x & 0x4000000000000 > 0)
      result = result * 0x10002C5CC37DA9491D0985C348C68E7B3 >> 128;
    if (x & 0x2000000000000 > 0)
      result = result * 0x1000162E525EE054754457D5995292026 >> 128;
    if (x & 0x1000000000000 > 0)
      result = result * 0x10000B17255775C040618BF4A4ADE83FC >> 128;
    if (x & 0x800000000000 > 0)
      result = result * 0x1000058B91B5BC9AE2EED81E9B7D4CFAB >> 128;
    if (x & 0x400000000000 > 0)
      result = result * 0x100002C5C89D5EC6CA4D7C8ACC017B7C9 >> 128;
    if (x & 0x200000000000 > 0)
      result = result * 0x10000162E43F4F831060E02D839A9D16D >> 128;
    if (x & 0x100000000000 > 0)
      result = result * 0x100000B1721BCFC99D9F890EA06911763 >> 128;
    if (x & 0x80000000000 > 0)
      result = result * 0x10000058B90CF1E6D97F9CA14DBCC1628 >> 128;
    if (x & 0x40000000000 > 0)
      result = result * 0x1000002C5C863B73F016468F6BAC5CA2B >> 128;
    if (x & 0x20000000000 > 0)
      result = result * 0x100000162E430E5A18F6119E3C02282A5 >> 128;
    if (x & 0x10000000000 > 0)
      result = result * 0x1000000B1721835514B86E6D96EFD1BFE >> 128;
    if (x & 0x8000000000 > 0)
      result = result * 0x100000058B90C0B48C6BE5DF846C5B2EF >> 128;
    if (x & 0x4000000000 > 0)
      result = result * 0x10000002C5C8601CC6B9E94213C72737A >> 128;
    if (x & 0x2000000000 > 0)
      result = result * 0x1000000162E42FFF037DF38AA2B219F06 >> 128;
    if (x & 0x1000000000 > 0)
      result = result * 0x10000000B17217FBA9C739AA5819F44F9 >> 128;
    if (x & 0x800000000 > 0)
      result = result * 0x1000000058B90BFCDEE5ACD3C1CEDC823 >> 128;
    if (x & 0x400000000 > 0)
      result = result * 0x100000002C5C85FE31F35A6A30DA1BE50 >> 128;
    if (x & 0x200000000 > 0)
      result = result * 0x10000000162E42FF0999CE3541B9FFFCF >> 128;
    if (x & 0x100000000 > 0)
      result = result * 0x100000000B17217F80F4EF5AADDA45554 >> 128;
    if (x & 0x80000000 > 0)
      result = result * 0x10000000058B90BFBF8479BD5A81B51AD >> 128;
    if (x & 0x40000000 > 0)
      result = result * 0x1000000002C5C85FDF84BD62AE30A74CC >> 128;
    if (x & 0x20000000 > 0)
      result = result * 0x100000000162E42FEFB2FED257559BDAA >> 128;
    if (x & 0x10000000 > 0)
      result = result * 0x1000000000B17217F7D5A7716BBA4A9AE >> 128;
    if (x & 0x8000000 > 0)
      result = result * 0x100000000058B90BFBE9DDBAC5E109CCE >> 128;
    if (x & 0x4000000 > 0)
      result = result * 0x10000000002C5C85FDF4B15DE6F17EB0D >> 128;
    if (x & 0x2000000 > 0)
      result = result * 0x1000000000162E42FEFA494F1478FDE05 >> 128;
    if (x & 0x1000000 > 0)
      result = result * 0x10000000000B17217F7D20CF927C8E94C >> 128;
    if (x & 0x800000 > 0)
      result = result * 0x1000000000058B90BFBE8F71CB4E4B33D >> 128;
    if (x & 0x400000 > 0)
      result = result * 0x100000000002C5C85FDF477B662B26945 >> 128;
    if (x & 0x200000 > 0)
      result = result * 0x10000000000162E42FEFA3AE53369388C >> 128;
    if (x & 0x100000 > 0)
      result = result * 0x100000000000B17217F7D1D351A389D40 >> 128;
    if (x & 0x80000 > 0)
      result = result * 0x10000000000058B90BFBE8E8B2D3D4EDE >> 128;
    if (x & 0x40000 > 0)
      result = result * 0x1000000000002C5C85FDF4741BEA6E77E >> 128;
    if (x & 0x20000 > 0)
      result = result * 0x100000000000162E42FEFA39FE95583C2 >> 128;
    if (x & 0x10000 > 0)
      result = result * 0x1000000000000B17217F7D1CFB72B45E1 >> 128;
    if (x & 0x8000 > 0)
      result = result * 0x100000000000058B90BFBE8E7CC35C3F0 >> 128;
    if (x & 0x4000 > 0)
      result = result * 0x10000000000002C5C85FDF473E242EA38 >> 128;
    if (x & 0x2000 > 0)
      result = result * 0x1000000000000162E42FEFA39F02B772C >> 128;
    if (x & 0x1000 > 0)
      result = result * 0x10000000000000B17217F7D1CF7D83C1A >> 128;
    if (x & 0x800 > 0)
      result = result * 0x1000000000000058B90BFBE8E7BDCBE2E >> 128;
    if (x & 0x400 > 0)
      result = result * 0x100000000000002C5C85FDF473DEA871F >> 128;
    if (x & 0x200 > 0)
      result = result * 0x10000000000000162E42FEFA39EF44D91 >> 128;
    if (x & 0x100 > 0)
      result = result * 0x100000000000000B17217F7D1CF79E949 >> 128;
    if (x & 0x80 > 0)
      result = result * 0x10000000000000058B90BFBE8E7BCE544 >> 128;
    if (x & 0x40 > 0)
      result = result * 0x1000000000000002C5C85FDF473DE6ECA >> 128;
    if (x & 0x20 > 0)
      result = result * 0x100000000000000162E42FEFA39EF366F >> 128;
    if (x & 0x10 > 0)
      result = result * 0x1000000000000000B17217F7D1CF79AFA >> 128;
    if (x & 0x8 > 0)
      result = result * 0x100000000000000058B90BFBE8E7BCD6D >> 128;
    if (x & 0x4 > 0)
      result = result * 0x10000000000000002C5C85FDF473DE6B2 >> 128;
    if (x & 0x2 > 0)
      result = result * 0x1000000000000000162E42FEFA39EF358 >> 128;
    if (x & 0x1 > 0)
      result = result * 0x10000000000000000B17217F7D1CF79AB >> 128;

    result >>= 63 - (x >> 64);
    require (result <= uint256 (max_64x64780));

    return int128 (result);
  }

                                                                                                                                                                              
  function EXP475 (int128 x) internal pure returns (int128) {	//inject NONSTANDARD NAMING
    require (x < 0x400000000000000000); // Overflow

    if (x < -0x400000000000000000) return 0; // Underflow

    return EXP_2229 (
        int128 (int256 (x) * 0x171547652B82FE1777D0FFDA0D23A7D12 >> 128));
  }

                                                                                                                                                                                                                                                                                                           
  function DIVUU807 (uint256 x, uint256 y) private pure returns (uint128) {	//inject NONSTANDARD NAMING
    require (y != 0);

    uint256 result;

    if (x <= 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
      result = (x << 64) / y;
    else {
      uint256 a = 192;
      uint256 b = 255;
      while (a < b) {
        uint256 m = a + b >> 1;
        uint256 t = x >> m;
        if (t == 0) b = m - 1;
        else if (t > 1) a = m + 1;
        else {
          a = m;
          break;
        }
      }

      result = (x << 255 - a) / ((y - 1 >> a - 191) + 1);
      require (result <= 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);

      uint256 hi = result * (y >> 128);
      uint256 lo = result * (y & 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);

      uint256 xh = x >> 192;
      uint256 xl = x << 64;

      if (xl < lo) xh -= 1;
      xl -= lo; // We rely on overflow behavior here
      lo = hi << 128;
      if (xl < lo) xh -= 1;
      xl -= lo; // We rely on overflow behavior here

      assert (xh == hi >> 128);

      result += xl / y;
    }

    require (result <= 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
    return uint128 (result);
  }

                                                                                                                                                                                                                                                                                                                
  function POWU578 (uint256 x, uint256 y) private pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (y == 0) return 0x80000000000000000000000000000000;
    else if (x == 0) return 0;
    else {
      uint256 a = 0;
      uint256 b = 255;
      while (a < b) {
        uint256 m = a + b >> 1;
        uint256 t = x >> m;
        if (t == 0) b = m - 1;
        else if (t > 1) a = m + 1;
        else {
          a = m;
          break;
        }
      }

      int256 xe = int256 (a) - 127;
      if (xe > 0) x >>= xe;
      else x <<= -xe;

      uint256 result = 0x80000000000000000000000000000000;
      int256 re = 0;

      while (y > 0) {
        if (y & 1 > 0) {
          result = result * x;
          y -= 1;
          re += xe;
          if (result >=
            0x8000000000000000000000000000000000000000000000000000000000000000) {
            result >>= 128;
            re += 1;
          } else result >>= 127;
          if (re < -127) return 0; // Underflow
          require (re < 128); // Overflow
        } else {
          x = x * x;
          y >>= 1;
          xe <<= 1;
          if (x >=
            0x8000000000000000000000000000000000000000000000000000000000000000) {
            x >>= 128;
            xe += 1;
          } else x >>= 127;
          if (xe < -127) return 0; // Underflow
          require (xe < 128); // Overflow
        }
      }

      if (re > 0) result <<= re;
      else if (re < 0) result >>= -re;

      return result;
    }
  }

                                                                                                                                                                                                   
  function SQRTU439 (uint256 x, uint256 r) private pure returns (uint128) {	//inject NONSTANDARD NAMING
    if (x == 0) return 0;
    else {
      require (r > 0);
      while (true) {
        uint256 rr = x / r;
        if (r == rr || r + 1 == rr) return uint128 (r);
        else if (r == rr + 1) return uint128 (rr);
        r = r + rr + 1 >> 1;
      }
    }
  }
}

contract BurnerRole {
    using AddressSet for AddressSet.addrset;

    AddressSet.addrset private burners;

    event BURNERADDITION339(address indexed addr);	//inject NONSTANDARD NAMING
    event BURNERREMOVAL2(address indexed addr);	//inject NONSTANDARD NAMING

    modifier IFBURNER87(address _addr) {	//inject NONSTANDARD NAMING
        require(ISBURNER95(_addr),
            "BurnerRole: specified account does not have the Burner role");
        _;
    }

    modifier ONLYBURNER918() {	//inject NONSTANDARD NAMING
        require(ISBURNER95(msg.sender),
            "BurnerRole: caller does not have the Burner role");
        _;
    }

    function GETBURNERS594()	//inject NONSTANDARD NAMING
        public
        view
        returns (address[] memory)
    {
        return burners.elements;
    }

    function ISBURNER95(address _addr)	//inject NONSTANDARD NAMING
        public
        view
        returns (bool)
    {
        return burners.HAS545(_addr);
    }

    function NUMBURNERS957()	//inject NONSTANDARD NAMING
        public
        view
        returns (uint)
    {
        return burners.elements.length;
    }

    function _ADDBURNER504(address _addr)	//inject NONSTANDARD NAMING
        internal
    {
        require(burners.INSERT823(_addr),
            "BurnerRole: duplicate bearer");
        emit BURNERADDITION339(_addr);
    }

    function _REMOVEBURNER210(address _addr)	//inject NONSTANDARD NAMING
        internal
    {
        require(burners.REMOVE308(_addr),
            "BurnerRole: not a bearer");
        emit BURNERREMOVAL2(_addr);
    }
}

contract ManagerRole {
    using AddressSet for AddressSet.addrset;

    AddressSet.addrset private managers;

    event MANAGERADDITION224(address indexed addr);	//inject NONSTANDARD NAMING
    event MANAGERREMOVAL494(address indexed addr);	//inject NONSTANDARD NAMING

    modifier IFMANAGER959(address _addr) {	//inject NONSTANDARD NAMING
        require(ISMANAGER497(_addr),
            "ManagerRole: specified account does not have the Manager role");
        _;
    }

    modifier ONLYMANAGER621() {	//inject NONSTANDARD NAMING
        require(ISMANAGER497(msg.sender),
            "ManagerRole: caller does not have the Manager role");
        _;
    }

    function GETMANAGERS68()	//inject NONSTANDARD NAMING
        public
        view
        returns (address[] memory)
    {
        return managers.elements;
    }

    function ISMANAGER497(address _addr)	//inject NONSTANDARD NAMING
        public
        view
        returns (bool)
    {
        return managers.HAS545(_addr);
    }

    function NUMMANAGERS426()	//inject NONSTANDARD NAMING
        public
        view
        returns (uint)
    {
        return managers.elements.length;
    }

    function _ADDMANAGER625(address _addr)	//inject NONSTANDARD NAMING
        internal
    {
        require(managers.INSERT823(_addr),
            "ManagerRole: duplicate bearer");
        emit MANAGERADDITION224(_addr);
    }

    function _REMOVEMANAGER799(address _addr)	//inject NONSTANDARD NAMING
        internal
    {
        require(managers.REMOVE308(_addr),
            "ManagerRole: not a bearer");
        emit MANAGERREMOVAL494(_addr);
    }
}

contract MinterRole {
    using AddressSet for AddressSet.addrset;

    AddressSet.addrset private minters;

    event MINTERADDITION451(address indexed addr);	//inject NONSTANDARD NAMING
    event MINTERREMOVAL199(address indexed addr);	//inject NONSTANDARD NAMING

    modifier IFMINTER530(address _addr) {	//inject NONSTANDARD NAMING
        require(ISMINTER740(_addr),
            "MinterRole: specified account does not have the Minter role");
        _;
    }

    modifier ONLYMINTER566() {	//inject NONSTANDARD NAMING
        require(ISMINTER740(msg.sender),
            "MinterRole: caller does not have the Minter role");
        _;
    }

    function GETMINTERS47()	//inject NONSTANDARD NAMING
        public
        view
        returns (address[] memory)
    {
        return minters.elements;
    }

    function ISMINTER740(address _addr)	//inject NONSTANDARD NAMING
        public
        view
        returns (bool)
    {
        return minters.HAS545(_addr);
    }

    function NUMMINTERS85()	//inject NONSTANDARD NAMING
        public
        view
        returns (uint)
    {
        return minters.elements.length;
    }

    function _ADDMINTER789(address _addr)	//inject NONSTANDARD NAMING
        internal
    {
        require(minters.INSERT823(_addr),
            "MinterRole: duplicate bearer");
        emit MINTERADDITION451(_addr);
    }

    function _REMOVEMINTER561(address _addr)	//inject NONSTANDARD NAMING
        internal
    {
        require(minters.REMOVE308(_addr),
            "MinterRole: not a bearer");
        emit MINTERREMOVAL199(_addr);
    }
}

contract OwnerRole {
    using AddressSet for AddressSet.addrset;

    AddressSet.addrset private owners;

    event OWNERADDITION948(address indexed addr);	//inject NONSTANDARD NAMING
    event OWNERREMOVAL9(address indexed addr);	//inject NONSTANDARD NAMING

    modifier ONLYOWNER10() {	//inject NONSTANDARD NAMING
        require(ISOWNER828(msg.sender),
            "OwnerRole: caller does not have the Owner role");
        _;
    }

    function GETOWNERS157()	//inject NONSTANDARD NAMING
        public
        view
        returns (address[] memory)
    {
        return owners.elements;
    }

    function ISOWNER828(address _addr)	//inject NONSTANDARD NAMING
        public
        view
        returns (bool)
    {
        return owners.HAS545(_addr);
    }

    function NUMOWNERS95()	//inject NONSTANDARD NAMING
        public
        view
        returns (uint)
    {
        return owners.elements.length;
    }

    function _ADDOWNER626(address _addr)	//inject NONSTANDARD NAMING
        internal
    {
        require(owners.INSERT823(_addr),
            "OwnerRole: duplicate bearer");
        emit OWNERADDITION948(_addr);
    }

    function _REMOVEOWNER207(address _addr)	//inject NONSTANDARD NAMING
        internal
    {
        require(owners.REMOVE308(_addr),
            "OwnerRole: not a bearer");
        emit OWNERREMOVAL9(_addr);
    }
}

contract MultiOwned is OwnerRole {
    uint constant public max_owner_count260 = 50;	//inject NONSTANDARD NAMING

    struct Transaction {
        bytes data;
        bool executed;
    }

    mapping(bytes32 => Transaction) public transactions;
    mapping(bytes32 => mapping(address => bool)) internal confirmations;
    uint public required;

    event CONFIRMATION142(address indexed sender, bytes32 indexed transactionId);	//inject NONSTANDARD NAMING
    event REVOCATION393(address indexed sender, bytes32 indexed transactionId);	//inject NONSTANDARD NAMING
    event SUBMISSION1(bytes32 indexed transactionId);	//inject NONSTANDARD NAMING
    event EXECUTION661(bytes32 indexed transactionId);	//inject NONSTANDARD NAMING
    event EXECUTIONFAILURE605(bytes32 indexed transactionId);	//inject NONSTANDARD NAMING
    event REQUIREMENT643(uint required);	//inject NONSTANDARD NAMING

    modifier CONFIRMED227(bytes32 _transactionId, address _owner) {	//inject NONSTANDARD NAMING
        require(confirmations[_transactionId][_owner]);
        _;
    }

    modifier NOTCONFIRMED496(bytes32 _transactionId, address _owner) {	//inject NONSTANDARD NAMING
        require(!confirmations[_transactionId][_owner]);
        _;
    }

    modifier NOTEXECUTED504(bytes32 _transactionId) {	//inject NONSTANDARD NAMING
        require(!transactions[_transactionId].executed);
        _;
    }

    modifier ONLYSELF926() {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this));
        _;
    }

    modifier TRANSACTIONEXISTS806(bytes32 _transactionId) {	//inject NONSTANDARD NAMING
        require(transactions[_transactionId].data.length != 0);
        _;
    }

    modifier VALIDREQUIREMENT140(uint _ownerCount, uint _required) {	//inject NONSTANDARD NAMING
        require(0 < _ownerCount
            && 0 < _required
            && _required <= _ownerCount
            && _ownerCount <= max_owner_count260);
        _;
    }

    constructor(address[] memory _owners, uint _required)
        public
        VALIDREQUIREMENT140(_owners.length, _required)
    {
        for (uint i = 0; i < _owners.length; ++i) {
            _ADDOWNER626(_owners[i]);
        }
        required = _required;
    }

    function ADDOWNER183(address _owner)	//inject NONSTANDARD NAMING
        public
        ONLYSELF926
        VALIDREQUIREMENT140(NUMOWNERS95() + 1, required)
    {
        _ADDOWNER626(_owner);
    }

    function ADDTRANSACTION611(bytes memory _data, uint _nonce)	//inject NONSTANDARD NAMING
        internal
        returns (bytes32 transactionId)
    {
        if (_nonce == 0) _nonce = block.number;
        transactionId = MAKETRANSACTIONID987(_data, _nonce);
        if (transactions[transactionId].data.length == 0) {
            transactions[transactionId] = Transaction({
                data: _data,
                executed: false
            });
            emit SUBMISSION1(transactionId);
        }
    }

    function CONFIRMTRANSACTION398(bytes32 _transactionId)	//inject NONSTANDARD NAMING
        public
        ONLYOWNER10
        TRANSACTIONEXISTS806(_transactionId)
        NOTCONFIRMED496(_transactionId, msg.sender)
    {
        confirmations[_transactionId][msg.sender] = true;
        emit CONFIRMATION142(msg.sender, _transactionId);
        EXECUTETRANSACTION211(_transactionId);
    }

    function EXECUTETRANSACTION211(bytes32 _transactionId)	//inject NONSTANDARD NAMING
        public
        ONLYOWNER10
        CONFIRMED227(_transactionId, msg.sender)
        NOTEXECUTED504(_transactionId)
    {
        if (ISCONFIRMED490(_transactionId)) {
            Transaction storage txn = transactions[_transactionId];
            txn.executed = true;
            (bool success,) = address(this).call(txn.data);
            if (success) {
                emit EXECUTION661(_transactionId);
            } else {
                emit EXECUTIONFAILURE605(_transactionId);
                txn.executed = false;
            }
        }
    }

    function REMOVEOWNER134(address _owner)	//inject NONSTANDARD NAMING
        public
        ONLYSELF926
    {
        _REMOVEOWNER207(_owner);
        if (required > NUMOWNERS95()) {
            SETREQUIREMENT592(NUMOWNERS95());
        }
    }

    function RENOUNCEOWNER690()	//inject NONSTANDARD NAMING
        public
        VALIDREQUIREMENT140(NUMOWNERS95() - 1, required)
    {
        _REMOVEOWNER207(msg.sender);
    }

    function REPLACEOWNER692(address _owner, address _newOwner)	//inject NONSTANDARD NAMING
        public
        ONLYSELF926
    {
        _REMOVEOWNER207(_owner);
        _ADDOWNER626(_newOwner);
    }

    function REVOKECONFIRMATION753(bytes32 _transactionId)	//inject NONSTANDARD NAMING
        public
        ONLYOWNER10
        CONFIRMED227(_transactionId, msg.sender)
        NOTEXECUTED504(_transactionId)
    {
        confirmations[_transactionId][msg.sender] = false;
        emit REVOCATION393(msg.sender, _transactionId);
    }

    function SETREQUIREMENT592(uint _required)	//inject NONSTANDARD NAMING
        public
        ONLYSELF926
        VALIDREQUIREMENT140(NUMOWNERS95(), _required)
    {
        required = _required;
        emit REQUIREMENT643(_required);
    }

    function SUBMITTRANSACTION10(bytes memory _data, uint _nonce)	//inject NONSTANDARD NAMING
        public
        returns (bytes32 transactionId)
    {
        transactionId = ADDTRANSACTION611(_data, _nonce);
        CONFIRMTRANSACTION398(transactionId);
    }

    function GETCONFIRMATIONCOUNT341(bytes32 _transactionId)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint count)
    {
        address[] memory owners = GETOWNERS157();
        for (uint i = 0; i < NUMOWNERS95(); ++i) {
            if (confirmations[_transactionId][owners[i]]) ++count;
        }
    }

    function GETCONFIRMATIONS356(bytes32 _transactionId)	//inject NONSTANDARD NAMING
        public
        view
        returns (address[] memory _confirmations)
    {
        address[] memory confirmationsTmp = new address[](NUMOWNERS95());
        uint count = 0;
        uint i;
        address[] memory owners = GETOWNERS157();
        for (i = 0; i < NUMOWNERS95(); ++i) {
            if (confirmations[_transactionId][owners[i]]) {
                confirmationsTmp[count] = owners[i];
                ++count;
            }
        }
        _confirmations = new address[](count);
        for (i = 0; i < count; ++i) {
            _confirmations[i] = confirmationsTmp[i];
        }
    }

    function ISCONFIRMED490(bytes32 _transactionId)	//inject NONSTANDARD NAMING
        public
        view
        returns (bool)
    {
        address[] memory owners = GETOWNERS157();
        uint count = 0;
        for (uint i = 0; i < NUMOWNERS95(); ++i) {
            if (confirmations[_transactionId][owners[i]]) ++count;
            if (count == required) return true;
        }
    }

    function MAKETRANSACTIONID987(bytes memory _data, uint _nonce)	//inject NONSTANDARD NAMING
        public
        pure
        returns (bytes32 transactionId)
    {
        transactionId = keccak256(abi.encode(_data, _nonce));
    }
}

contract ERC20 is ERC20Interface {
    using SafeMath for uint256;

    string  internal tokenName;
    string  internal tokenSymbol;
    uint8   internal tokenDecimals;
    uint256 internal tokenTotalSupply;

    mapping(address => uint256) internal balances;
    mapping(address => mapping(address => uint256)) internal allowed;

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply)
        internal
    {
        tokenName = _name;
        tokenSymbol = _symbol;
        tokenDecimals = _decimals;
        _MINT634(msg.sender, _totalSupply);
    }

    function APPROVE433(address _spender, uint256 _amount)	//inject NONSTANDARD NAMING
        public
        returns (bool success)
    {
        _APPROVE174(msg.sender, _spender, _amount);
        return true;
    }

    function DECREASEALLOWANCE57(address _spender, uint256 _delta)	//inject NONSTANDARD NAMING
        public
        returns (bool success)
    {
        _APPROVE174(msg.sender, _spender, allowed[msg.sender][_spender].SUB246(_delta));
        return true;
    }

    function INCREASEALLOWANCE107(address _spender, uint256 _delta)	//inject NONSTANDARD NAMING
        public
        returns (bool success)
    {
        _APPROVE174(msg.sender, _spender, allowed[msg.sender][_spender].ADD346(_delta));
        return true;
    }

    function TRANSFER634(address _to, uint256 _amount)	//inject NONSTANDARD NAMING
        public
        returns (bool success)
    {
        _TRANSFER367(msg.sender, _to, _amount);
        return true;
    }

    function TRANSFERFROM882(address _from, address _to, uint256 _amount)	//inject NONSTANDARD NAMING
        public
        returns (bool success)
    {
        _TRANSFER367(_from, _to, _amount);
        _APPROVE174(_from, msg.sender, allowed[_from][msg.sender].SUB246(_amount));
        return true;
    }

    function ALLOWANCE645(address _owner, address _spender)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256 remaining)
    {
        return allowed[_owner][_spender];
    }

    function BALANCEOF775(address _owner)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256 balance)
    {
        return balances[_owner];
    }

    function DECIMALS563()	//inject NONSTANDARD NAMING
        public
        view
        returns (uint8)
    {
        return tokenDecimals;
    }

    function NAME909()	//inject NONSTANDARD NAMING
        public
        view
        returns (string memory)
    {
        return tokenName;
    }

    function SYMBOL394()	//inject NONSTANDARD NAMING
        public
        view
        returns (string memory)
    {
        return tokenSymbol;
    }

    function TOTALSUPPLY569()	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256)
    {
        return tokenTotalSupply;
    }

    function _APPROVE174(address _owner, address _spender, uint256 _amount)	//inject NONSTANDARD NAMING
        internal
    {
        allowed[_owner][_spender] = _amount;
        emit APPROVAL540(_owner, _spender, _amount);
    }

    function _BURN448(address _from, uint256 _amount)	//inject NONSTANDARD NAMING
        internal
    {
        balances[_from] = balances[_from].SUB246(_amount);
        tokenTotalSupply = tokenTotalSupply.SUB246(_amount);

        emit TRANSFER546(_from, address(0), _amount);
        emit BURN695(_from, _amount);
    }

    function _MINT634(address _to, uint256 _amount)	//inject NONSTANDARD NAMING
        internal
    {
        require(_to != address(0), "ERC20: mint to the zero address");
        require(_to != address(this), "ERC20: mint to token contract");

        tokenTotalSupply = tokenTotalSupply.ADD346(_amount);
        balances[_to] = balances[_to].ADD346(_amount);

        emit TRANSFER546(address(0), _to, _amount);
        emit MINT770(_to, _amount);
    }

    function _TRANSFER367(address _from, address _to, uint256 _amount)	//inject NONSTANDARD NAMING
        internal
    {
        require(_to != address(0), "ERC20: transfer to the zero address");
        require(_to != address(this), "ERC20: transfer to token contract");

        balances[_from] = balances[_from].SUB246(_amount);
        balances[_to] = balances[_to].ADD346(_amount);
        emit TRANSFER546(_from, _to, _amount);
    }
}

contract ERC20WithFees is MultiOwned, ERC20 {
    using Math64x64 for int128;
    using SafeMath for uint256;
    using AddressSet for AddressSet.addrset;

    struct FeeTier {
        uint256 threshold;
        int128 fee; // fraction per second; positive 64.64 fixed point number
    }

    AddressSet.addrset internal holders;
    mapping(address => uint) internal lastCollected; // epoch timestamp of last management fee collection per holder
    FeeTier[] internal feeTiers; // Management fees per tier; tier thresholds increase monotonically; assumed non-empty with first threshold value equal to zero.
    int128 txFee; // Transfer fee ratio; positive 64.64 fixed point number

    event MANAGEMENTFEECOLLECTED527(address indexed addr, uint256 amount);	//inject NONSTANDARD NAMING
    event TRANSFERFEECOLLECTED393(address indexed addr, uint256 amount);	//inject NONSTANDARD NAMING

    constructor(FeeTier[] memory _feeTiers, int128 _txFee)
        public
    {
        _SETFEETIERS886(_feeTiers);
        _SETTXFEE960(_txFee);
    }

    function COLLECTALL837()	//inject NONSTANDARD NAMING
        public
        returns (uint256 count, uint256 amount)
    {
        for (; count < holders.elements.length; ++count) {
            amount += _COLLECTFEE620(holders.elements[count]);
        }
    }

    function COLLECTALL837(uint256 _offset, uint256 _limit)	//inject NONSTANDARD NAMING
        public
        returns (uint256 count, uint256 amount)
    {
        for (; count < _limit && count.ADD346(_offset) < holders.elements.length; ++count) {
            amount += _COLLECTFEE620(holders.elements[count.ADD346(_offset)]);
        }
    }

    function SETFEETIERS600(FeeTier[] memory _feeTiers)	//inject NONSTANDARD NAMING
        public
        ONLYSELF926
    {
        _SETFEETIERS886(_feeTiers);
    }

    function SETTXFEE958(int128 _txFee)	//inject NONSTANDARD NAMING
        public
        ONLYSELF926
    {
        _SETTXFEE960(_txFee);
    }

    function TRANSFERALL473(address _to)	//inject NONSTANDARD NAMING
        public
        returns (bool success)
    {
        _TRANSFERALL486(msg.sender, _to);
        return true;
    }

    function TRANSFERALLFROM622(address _from, address _to)	//inject NONSTANDARD NAMING
        public
        returns (bool success)
    {
        uint256 amount = _TRANSFERALL486(_from, _to);
        _APPROVE174(_from, msg.sender, allowed[_from][msg.sender].SUB246(amount));
        return true;
    }

    function HOLDERCOUNT789()	//inject NONSTANDARD NAMING
        public
        view
        returns (uint)
    {
        return holders.elements.length;
    }

    function BALANCEOF775(address _owner)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256 balance)
    {
        return balances[_owner].SUB246(_COMPUTEFEE576(_owner));
    }

    function _COLLECTFEE620(address _from)	//inject NONSTANDARD NAMING
        internal
        returns (uint256 feeAmount)
    {
        if (balances[_from] != 0) {
            feeAmount = _COMPUTEFEE576(_from);
            if (feeAmount != 0) {
                balances[_from] = balances[_from].SUB246(feeAmount);
                tokenTotalSupply = tokenTotalSupply.SUB246(feeAmount);
                emit TRANSFER546(_from, address(0), feeAmount);
                emit MANAGEMENTFEECOLLECTED527(_from, feeAmount);
            }
        }
        lastCollected[_from] = now;
    }

    function _COLLECTTXFEE761(address _from, uint256 _amount)	//inject NONSTANDARD NAMING
        internal
        returns (uint256 txFeeAmount)
    {
        txFeeAmount = _COMPUTETXFEE198(_amount);
        if (txFeeAmount != 0) {
            balances[_from] = balances[_from].SUB246(txFeeAmount);
            tokenTotalSupply = tokenTotalSupply.SUB246(txFeeAmount);
            emit TRANSFER546(_from, address(0), txFeeAmount);
            emit TRANSFERFEECOLLECTED393(_from, txFeeAmount);
        }
    }

    function _SETFEETIERS886(FeeTier[] memory _feeTiers)	//inject NONSTANDARD NAMING
        internal
    {
        require(_feeTiers.length > 0,
            "ERC20WithFees: empty fee schedule");
        require(_feeTiers[0].threshold == 0,
            "ERC20WithFees: nonzero threshold for bottom tier");
        require(Math64x64.FROMUINT562(0) <= _feeTiers[0].fee
            && _feeTiers[0].fee <= Math64x64.FROMUINT562(1),
            "ERC20WithFees: invalid fee value");
        for (uint i = 1; i < _feeTiers.length; ++i) {
            require(_feeTiers[i].threshold > _feeTiers[i-1].threshold,
                "ERC20WithFees: nonmonotonic threshold value");
            require(_feeTiers[i].fee < _feeTiers[i-1].fee,
                "ERC20WithFees: nonmonotonic fee value");
            require(Math64x64.FROMUINT562(0) <= _feeTiers[i].fee,
                "ERC20WithFees: invalid fee value");
        }

        delete feeTiers; // re-initializes to empty dynamic storage array
        for (uint i = 0; i < _feeTiers.length; ++i) {
            feeTiers.push(_feeTiers[i]);
        }
    }

    function _SETTXFEE960(int128 _txFee)	//inject NONSTANDARD NAMING
        internal
    {
        require(Math64x64.FROMUINT562(0) <= _txFee
            && _txFee <= Math64x64.FROMUINT562(1),
            "ERC20WithFees: invalid transfer fee value");
        txFee = _txFee;
    }

    function _TRANSFER367(address _from, address _to, uint256 _amount)	//inject NONSTANDARD NAMING
        internal
    {
        require(_to != address(0), "ERC20: transfer to the zero address");
        require(_to != address(this), "ERC20: transfer to token contract");

        // Collect accrued management fees from sender and recipient
        _COLLECTFEE620(_from);
        _COLLECTFEE620(_to);

        // Execute transfer
        super._TRANSFER367(_from, _to, _amount);

        // Collect transfer fee
        _COLLECTTXFEE761(_to, _amount);

        // Update set of holders
        if (balances[_from] == 0) holders.REMOVE308(_from);
        if (balances[_to] > 0) holders.INSERT823(_to);
    }

    function _TRANSFERALL486(address _from, address _to)	//inject NONSTANDARD NAMING
        internal
        returns (uint256 amount)
    {
        require(_to != address(0), "ERC20: transfer to the zero address");
        require(_to != address(this), "ERC20: transfer to token contract");

        // Collect accrued management fees from sender and recipient
        _COLLECTFEE620(_from);
        _COLLECTFEE620(_to);

        // Execute transfer
        amount = balances[_from];
        super._TRANSFER367(_from, _to, amount);

        // Collect transfer fee
        _COLLECTTXFEE761(_to, amount);

        // Update set of holders
        holders.REMOVE308(_from);
        if (balances[_to] > 0) holders.INSERT823(_to);
    }

    function _COMPUTEFEE576(address _addr)	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint)
    {
        uint tier = 0;
        while (tier+1 < feeTiers.length && feeTiers[tier+1].threshold <= balances[_addr]) {
            ++tier;
        }
        uint duration = now - lastCollected[_addr];
        return Math64x64.FROMUINT562(1).SUB246(Math64x64.EXP475(Math64x64.FROMINT518(-1).MUL325(Math64x64.FROMUINT562(duration)).MUL325(feeTiers[tier].fee))).MULU803(balances[_addr]);
    }

    function _COMPUTETXFEE198(uint256 _amount)	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint)
    {
        return txFee.MULU803(_amount);
    }
}

contract ERC20Burnable is ERC20WithFees, BurnerRole, ManagerRole {
    function ADDBURNER493(address _addr)	//inject NONSTANDARD NAMING
        public
        ONLYMANAGER621
    {
        _ADDBURNER504(_addr);
    }

    function ADDMANAGER428(address _addr)	//inject NONSTANDARD NAMING
        public
        ONLYSELF926
    {
        _ADDMANAGER625(_addr);
    }

    function BURN862(uint256 _amount)	//inject NONSTANDARD NAMING
        public
        ONLYBURNER918
        returns (bool success)
    {
        _BURN448(msg.sender, _amount);
        return true;
    }

    function BURNFROM798(address _from, uint256 _amount)	//inject NONSTANDARD NAMING
        public
        IFBURNER87(_from)
        returns (bool success)
    {
        _BURN448(_from, _amount);
        _APPROVE174(_from, msg.sender, allowed[_from][msg.sender].SUB246(_amount));
        return true;
    }

    function BURNALL908()	//inject NONSTANDARD NAMING
        public
        ONLYBURNER918
        returns (bool success)
    {
        _BURNALL641(msg.sender);
        return true;
    }

    function BURNALLFROM888(address _from)	//inject NONSTANDARD NAMING
        public
        IFBURNER87(_from)
        returns (bool success)
    {
        uint256 amount = _BURNALL641(_from);
        _APPROVE174(_from, msg.sender, allowed[_from][msg.sender].SUB246(amount));
        return true;
    }

    function REMOVEBURNER283(address _addr)	//inject NONSTANDARD NAMING
        public
        ONLYMANAGER621
    {
        _REMOVEBURNER210(_addr);
    }

    function REMOVEMANAGER784(address _addr)	//inject NONSTANDARD NAMING
        public
        ONLYSELF926
    {
        _REMOVEMANAGER799(_addr);
    }

    function RENOUNCEMANAGER820()	//inject NONSTANDARD NAMING
        public
    {
        _REMOVEMANAGER799(msg.sender);
    }

    function _BURN448(address _from, uint256 _amount)	//inject NONSTANDARD NAMING
        internal
    {
        _COLLECTFEE620(_from);

        balances[_from] = balances[_from].SUB246(_amount);
        if (balances[_from] == 0) holders.REMOVE308(_from);
        tokenTotalSupply = tokenTotalSupply.SUB246(_amount);

        emit TRANSFER546(_from, address(0), _amount);
        emit BURN695(_from, _amount);
    }

    function _BURNALL641(address _from)	//inject NONSTANDARD NAMING
        internal
        returns (uint256 amount)
    {
        _COLLECTFEE620(_from);

        amount = balances[_from];
        balances[_from] = 0;
        holders.REMOVE308(_from);
        tokenTotalSupply = tokenTotalSupply.SUB246(amount);

        emit TRANSFER546(_from, address(0), amount);
        emit BURN695(_from, amount);
    }
}

contract ERC20Mintable is XBullionTokenConfig, ERC20WithFees, MinterRole {
    uint256 public mintCapacity;
    uint256 public amountMinted;
    uint public mintPeriod;
    uint public mintPeriodStart;

    event MINTCAPACITY91(uint256 amount);	//inject NONSTANDARD NAMING
    event MINTPERIOD941(uint duration);	//inject NONSTANDARD NAMING

    constructor(uint256 _mintCapacity, uint _mintPeriod)
        public
    {
        _SETMINTCAPACITY740(_mintCapacity);
        _SETMINTPERIOD261(_mintPeriod);
    }

    function ADDMINTER409(address _addr)	//inject NONSTANDARD NAMING
        public
        ONLYSELF926
    {
        _ADDMINTER789(_addr);
    }

    function MINT125(address _to, uint256 _amount)	//inject NONSTANDARD NAMING
        public
    {
        if (msg.sender != address(this)) {
            require(ISMINTER740(msg.sender), "MinterRole: caller does not have the Minter role");
            require(ISUNDERMINTLIMIT869(_amount), "ERC20: exceeds minting capacity");
        }
        _MINT634(_to, _amount);
    }

    function REMOVEMINTER994(address _addr)	//inject NONSTANDARD NAMING
        public
        ONLYSELF926
    {
        _REMOVEMINTER561(_addr);
    }

    function RENOUNCEMINTER601()	//inject NONSTANDARD NAMING
        public
        returns (bool)
    {
        _REMOVEMINTER561(msg.sender);
        return true;
    }

    function SETMINTCAPACITY972(uint256 _amount)	//inject NONSTANDARD NAMING
        public
        ONLYSELF926
    {
        _SETMINTCAPACITY740(_amount);
    }

    function SETMINTPERIOD798(uint _duration)	//inject NONSTANDARD NAMING
        public
        ONLYSELF926
    {
        _SETMINTPERIOD261(_duration);
    }

    function _MINT634(address _to, uint256 _amount)	//inject NONSTANDARD NAMING
        internal
    {
        require(_to != address(0), "ERC20: mint to the zero address");
        require(_to != address(this), "ERC20: mint to token contract");

        _COLLECTFEE620(_to);
        if (now > mintPeriodStart + mintPeriod) {
            amountMinted = 0;
            mintPeriodStart = now;
        }
        amountMinted = amountMinted.ADD346(_amount);
        tokenTotalSupply = tokenTotalSupply.ADD346(_amount);
        balances[_to] = balances[_to].ADD346(_amount);
        if (balances[_to] > 0) holders.INSERT823(_to);

        emit TRANSFER546(address(0), _to, _amount);
        emit MINT770(_to, _amount);
    }

    function _SETMINTCAPACITY740(uint256 _amount)	//inject NONSTANDARD NAMING
        internal
    {
        mintCapacity = _amount;
        emit MINTCAPACITY91(_amount);
    }

    function _SETMINTPERIOD261(uint _duration)	//inject NONSTANDARD NAMING
        internal
    {
        require(_duration < (1 << 64),
                "ERC20: mint period must be less than 2^64 seconds");
        mintPeriod = _duration;
        emit MINTPERIOD941(_duration);
    }

    function ISUNDERMINTLIMIT869(uint256 _amount)	//inject NONSTANDARD NAMING
        internal
        view
        returns (bool)
    {
        uint256 effAmountMinted = (now > mintPeriodStart + mintPeriod) ? 0 : amountMinted;
        if (effAmountMinted + _amount > mintCapacity
            || effAmountMinted + _amount < amountMinted) {
            return false;
        }
        return true;
    }

    function REMAININGMINTCAPACITY380()	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256)
    {
        if (now > mintPeriodStart + mintPeriod)
            return mintCapacity;
        if (mintCapacity < amountMinted)
            return 0;
        return mintCapacity - amountMinted;
    }
}

contract XBullionToken is XBullionTokenConfig, ERC20Burnable, ERC20Mintable {
    constructor()
        MultiOwned(
            MAKEADDRESSSINGLETON994(msg.sender),
            1)
        ERC20(
            token_name487,
            token_symbol950,
            token_decimals975,
            token_initialsupply212)
        ERC20WithFees(
            INITIALFEETIERS363(),
            INITIALTXFEE708())
        ERC20Mintable(
            token_mintcapacity907,
            token_mintperiod201)
        public
    {}
}