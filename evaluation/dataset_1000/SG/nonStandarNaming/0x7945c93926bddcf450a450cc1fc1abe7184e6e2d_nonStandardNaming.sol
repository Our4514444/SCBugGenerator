// File: openzeppelin-solidity\contracts\math\SafeMath.sol

pragma solidity ^0.5.2;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL263(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV835(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB729(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD910(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD293(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity\contracts\ownership\Ownable.sol

pragma solidity ^0.5.2;

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED863(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED863(address(0), _owner);
    }

                                                        
    function OWNER870() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER305() {	//inject NONSTANDARD NAMING
        require(ISOWNER129());
        _;
    }

                                                                                 
    function ISOWNER129() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP524() public ONLYOWNER305 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED863(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP279(address newOwner) public ONLYOWNER305 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP662(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP662(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED863(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: node_modules\openzeppelin-solidity\contracts\token\ERC20\IERC20.sol

pragma solidity ^0.5.2;

                                                                                   
interface IERC20 {
    function TRANSFER629(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE17(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM747(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY942() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF35(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE311(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER764(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL595(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity\contracts\token\ERC20\ERC20.sol

pragma solidity ^0.5.2;



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY942() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF35(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE311(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER629(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER92(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE17(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE339(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM747(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER92(from, to, value);
        _APPROVE339(from, msg.sender, _allowed[from][msg.sender].SUB729(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE118(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE339(msg.sender, spender, _allowed[msg.sender][spender].ADD910(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE403(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE339(msg.sender, spender, _allowed[msg.sender][spender].SUB729(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER92(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB729(value);
        _balances[to] = _balances[to].ADD910(value);
        emit TRANSFER764(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT356(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD910(value);
        _balances[account] = _balances[account].ADD910(value);
        emit TRANSFER764(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN537(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB729(value);
        _balances[account] = _balances[account].SUB729(value);
        emit TRANSFER764(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE339(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL595(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM283(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN537(account, value);
        _APPROVE339(account, msg.sender, _allowed[account][msg.sender].SUB729(value));
    }
}

// File: contracts\Power.sol

pragma solidity ^0.5.2;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
contract Power {
  string public version = "0.3";

  uint256 private constant one411 = 1;	//inject NONSTANDARD NAMING
  uint32 private constant max_weight706 = 1000000;	//inject NONSTANDARD NAMING
  uint8 private constant min_precision798 = 32;	//inject NONSTANDARD NAMING
  uint8 private constant max_precision164 = 127;	//inject NONSTANDARD NAMING

                                                                                                                                                                                       
  uint256 private constant fixed_1353 = 0x080000000000000000000000000000000;	//inject NONSTANDARD NAMING
  uint256 private constant fixed_2191 = 0x100000000000000000000000000000000;	//inject NONSTANDARD NAMING
  uint256 private constant max_num292 = 0x200000000000000000000000000000000;	//inject NONSTANDARD NAMING

                                                               
  uint256 private constant ln2_numerator679   = 0x3f80fe03f80fe03f80fe03f80fe03f8;	//inject NONSTANDARD NAMING
  uint256 private constant ln2_denominator25 = 0x5b9de1d10bf4103d647b0955897ba80;	//inject NONSTANDARD NAMING

                                                                                                 
  uint256 private constant opt_log_max_val377 =	//inject NONSTANDARD NAMING
  0x15bf0a8b1457695355fb8ac404e7a79e3;
  uint256 private constant opt_exp_max_val663 =	//inject NONSTANDARD NAMING
  0x800000000000000000000000000000000;

                                                                                                                                                                                                                             
  uint256[128] private maxExpArray;
  constructor() public {
//  maxExpArray[0] = 0x6bffffffffffffffffffffffffffffffff;
//  maxExpArray[1] = 0x67ffffffffffffffffffffffffffffffff;
//  maxExpArray[2] = 0x637fffffffffffffffffffffffffffffff;
//  maxExpArray[3] = 0x5f6fffffffffffffffffffffffffffffff;
//  maxExpArray[4] = 0x5b77ffffffffffffffffffffffffffffff;
//  maxExpArray[5] = 0x57b3ffffffffffffffffffffffffffffff;
//  maxExpArray[6] = 0x5419ffffffffffffffffffffffffffffff;
//  maxExpArray[7] = 0x50a2ffffffffffffffffffffffffffffff;
//  maxExpArray[8] = 0x4d517fffffffffffffffffffffffffffff;
//  maxExpArray[9] = 0x4a233fffffffffffffffffffffffffffff;
//  maxExpArray[10] = 0x47165fffffffffffffffffffffffffffff;
//  maxExpArray[11] = 0x4429afffffffffffffffffffffffffffff;
//  maxExpArray[12] = 0x415bc7ffffffffffffffffffffffffffff;
//  maxExpArray[13] = 0x3eab73ffffffffffffffffffffffffffff;
//  maxExpArray[14] = 0x3c1771ffffffffffffffffffffffffffff;
//  maxExpArray[15] = 0x399e96ffffffffffffffffffffffffffff;
//  maxExpArray[16] = 0x373fc47fffffffffffffffffffffffffff;
//  maxExpArray[17] = 0x34f9e8ffffffffffffffffffffffffffff;
//  maxExpArray[18] = 0x32cbfd5fffffffffffffffffffffffffff;
//  maxExpArray[19] = 0x30b5057fffffffffffffffffffffffffff;
//  maxExpArray[20] = 0x2eb40f9fffffffffffffffffffffffffff;
//  maxExpArray[21] = 0x2cc8340fffffffffffffffffffffffffff;
//  maxExpArray[22] = 0x2af09481ffffffffffffffffffffffffff;
//  maxExpArray[23] = 0x292c5bddffffffffffffffffffffffffff;
//  maxExpArray[24] = 0x277abdcdffffffffffffffffffffffffff;
//  maxExpArray[25] = 0x25daf6657fffffffffffffffffffffffff;
//  maxExpArray[26] = 0x244c49c65fffffffffffffffffffffffff;
//  maxExpArray[27] = 0x22ce03cd5fffffffffffffffffffffffff;
//  maxExpArray[28] = 0x215f77c047ffffffffffffffffffffffff;
//  maxExpArray[29] = 0x1fffffffffffffffffffffffffffffffff;
//  maxExpArray[30] = 0x1eaefdbdabffffffffffffffffffffffff;
//  maxExpArray[31] = 0x1d6bd8b2ebffffffffffffffffffffffff;
    maxExpArray[32] = 0x1c35fedd14ffffffffffffffffffffffff;
    maxExpArray[33] = 0x1b0ce43b323fffffffffffffffffffffff;
    maxExpArray[34] = 0x19f0028ec1ffffffffffffffffffffffff;
    maxExpArray[35] = 0x18ded91f0e7fffffffffffffffffffffff;
    maxExpArray[36] = 0x17d8ec7f0417ffffffffffffffffffffff;
    maxExpArray[37] = 0x16ddc6556cdbffffffffffffffffffffff;
    maxExpArray[38] = 0x15ecf52776a1ffffffffffffffffffffff;
    maxExpArray[39] = 0x15060c256cb2ffffffffffffffffffffff;
    maxExpArray[40] = 0x1428a2f98d72ffffffffffffffffffffff;
    maxExpArray[41] = 0x13545598e5c23fffffffffffffffffffff;
    maxExpArray[42] = 0x1288c4161ce1dfffffffffffffffffffff;
    maxExpArray[43] = 0x11c592761c666fffffffffffffffffffff;
    maxExpArray[44] = 0x110a688680a757ffffffffffffffffffff;
    maxExpArray[45] = 0x1056f1b5bedf77ffffffffffffffffffff;
    maxExpArray[46] = 0x0faadceceeff8bffffffffffffffffffff;
    maxExpArray[47] = 0x0f05dc6b27edadffffffffffffffffffff;
    maxExpArray[48] = 0x0e67a5a25da4107fffffffffffffffffff;
    maxExpArray[49] = 0x0dcff115b14eedffffffffffffffffffff;
    maxExpArray[50] = 0x0d3e7a392431239fffffffffffffffffff;
    maxExpArray[51] = 0x0cb2ff529eb71e4fffffffffffffffffff;
    maxExpArray[52] = 0x0c2d415c3db974afffffffffffffffffff;
    maxExpArray[53] = 0x0bad03e7d883f69bffffffffffffffffff;
    maxExpArray[54] = 0x0b320d03b2c343d5ffffffffffffffffff;
    maxExpArray[55] = 0x0abc25204e02828dffffffffffffffffff;
    maxExpArray[56] = 0x0a4b16f74ee4bb207fffffffffffffffff;
    maxExpArray[57] = 0x09deaf736ac1f569ffffffffffffffffff;
    maxExpArray[58] = 0x0976bd9952c7aa957fffffffffffffffff;
    maxExpArray[59] = 0x09131271922eaa606fffffffffffffffff;
    maxExpArray[60] = 0x08b380f3558668c46fffffffffffffffff;
    maxExpArray[61] = 0x0857ddf0117efa215bffffffffffffffff;
    maxExpArray[62] = 0x07ffffffffffffffffffffffffffffffff;
    maxExpArray[63] = 0x07abbf6f6abb9d087fffffffffffffffff;
    maxExpArray[64] = 0x075af62cbac95f7dfa7fffffffffffffff;
    maxExpArray[65] = 0x070d7fb7452e187ac13fffffffffffffff;
    maxExpArray[66] = 0x06c3390ecc8af379295fffffffffffffff;
    maxExpArray[67] = 0x067c00a3b07ffc01fd6fffffffffffffff;
    maxExpArray[68] = 0x0637b647c39cbb9d3d27ffffffffffffff;
    maxExpArray[69] = 0x05f63b1fc104dbd39587ffffffffffffff;
    maxExpArray[70] = 0x05b771955b36e12f7235ffffffffffffff;
    maxExpArray[71] = 0x057b3d49dda84556d6f6ffffffffffffff;
    maxExpArray[72] = 0x054183095b2c8ececf30ffffffffffffff;
    maxExpArray[73] = 0x050a28be635ca2b888f77fffffffffffff;
    maxExpArray[74] = 0x04d5156639708c9db33c3fffffffffffff;
    maxExpArray[75] = 0x04a23105873875bd52dfdfffffffffffff;
    maxExpArray[76] = 0x0471649d87199aa990756fffffffffffff;
    maxExpArray[77] = 0x04429a21a029d4c1457cfbffffffffffff;
    maxExpArray[78] = 0x0415bc6d6fb7dd71af2cb3ffffffffffff;
    maxExpArray[79] = 0x03eab73b3bbfe282243ce1ffffffffffff;
    maxExpArray[80] = 0x03c1771ac9fb6b4c18e229ffffffffffff;
    maxExpArray[81] = 0x0399e96897690418f785257fffffffffff;
    maxExpArray[82] = 0x0373fc456c53bb779bf0ea9fffffffffff;
    maxExpArray[83] = 0x034f9e8e490c48e67e6ab8bfffffffffff;
    maxExpArray[84] = 0x032cbfd4a7adc790560b3337ffffffffff;
    maxExpArray[85] = 0x030b50570f6e5d2acca94613ffffffffff;
    maxExpArray[86] = 0x02eb40f9f620fda6b56c2861ffffffffff;
    maxExpArray[87] = 0x02cc8340ecb0d0f520a6af58ffffffffff;
    maxExpArray[88] = 0x02af09481380a0a35cf1ba02ffffffffff;
    maxExpArray[89] = 0x0292c5bdd3b92ec810287b1b3fffffffff;
    maxExpArray[90] = 0x0277abdcdab07d5a77ac6d6b9fffffffff;
    maxExpArray[91] = 0x025daf6654b1eaa55fd64df5efffffffff;
    maxExpArray[92] = 0x0244c49c648baa98192dce88b7ffffffff;
    maxExpArray[93] = 0x022ce03cd5619a311b2471268bffffffff;
    maxExpArray[94] = 0x0215f77c045fbe885654a44a0fffffffff;
    maxExpArray[95] = 0x01ffffffffffffffffffffffffffffffff;
    maxExpArray[96] = 0x01eaefdbdaaee7421fc4d3ede5ffffffff;
    maxExpArray[97] = 0x01d6bd8b2eb257df7e8ca57b09bfffffff;
    maxExpArray[98] = 0x01c35fedd14b861eb0443f7f133fffffff;
    maxExpArray[99] = 0x01b0ce43b322bcde4a56e8ada5afffffff;
    maxExpArray[100] = 0x019f0028ec1fff007f5a195a39dfffffff;
    maxExpArray[101] = 0x018ded91f0e72ee74f49b15ba527ffffff;
    maxExpArray[102] = 0x017d8ec7f04136f4e5615fd41a63ffffff;
    maxExpArray[103] = 0x016ddc6556cdb84bdc8d12d22e6fffffff;
    maxExpArray[104] = 0x015ecf52776a1155b5bd8395814f7fffff;
    maxExpArray[105] = 0x015060c256cb23b3b3cc3754cf40ffffff;
    maxExpArray[106] = 0x01428a2f98d728ae223ddab715be3fffff;
    maxExpArray[107] = 0x013545598e5c23276ccf0ede68034fffff;
    maxExpArray[108] = 0x01288c4161ce1d6f54b7f61081194fffff;
    maxExpArray[109] = 0x011c592761c666aa641d5a01a40f17ffff;
    maxExpArray[110] = 0x0110a688680a7530515f3e6e6cfdcdffff;
    maxExpArray[111] = 0x01056f1b5bedf75c6bcb2ce8aed428ffff;
    maxExpArray[112] = 0x00faadceceeff8a0890f3875f008277fff;
    maxExpArray[113] = 0x00f05dc6b27edad306388a600f6ba0bfff;
    maxExpArray[114] = 0x00e67a5a25da41063de1495d5b18cdbfff;
    maxExpArray[115] = 0x00dcff115b14eedde6fc3aa5353f2e4fff;
    maxExpArray[116] = 0x00d3e7a3924312399f9aae2e0f868f8fff;
    maxExpArray[117] = 0x00cb2ff529eb71e41582cccd5a1ee26fff;
    maxExpArray[118] = 0x00c2d415c3db974ab32a51840c0b67edff;
    maxExpArray[119] = 0x00bad03e7d883f69ad5b0a186184e06bff;
    maxExpArray[120] = 0x00b320d03b2c343d4829abd6075f0cc5ff;
    maxExpArray[121] = 0x00abc25204e02828d73c6e80bcdb1a95bf;
    maxExpArray[122] = 0x00a4b16f74ee4bb2040a1ec6c15fbbf2df;
    maxExpArray[123] = 0x009deaf736ac1f569deb1b5ae3f36c130f;
    maxExpArray[124] = 0x00976bd9952c7aa957f5937d790ef65037;
    maxExpArray[125] = 0x009131271922eaa6064b73a22d0bd4f2bf;
    maxExpArray[126] = 0x008b380f3558668c46c91c49a2f8e967b9;
    maxExpArray[127] = 0x00857ddf0117efa215952912839f6473e6;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function POWER59(	//inject NONSTANDARD NAMING
    uint256 _baseN,
    uint256 _baseD,
    uint32 _expN,
    uint32 _expD
  ) internal view returns (uint256, uint8)
  {
    require(_baseN < max_num292, "baseN exceeds max value.");
    require(_baseN >= _baseD, "Bases < 1 are not supported.");

    uint256 baseLog;
    uint256 base = _baseN * fixed_1353 / _baseD;
    if (base < opt_log_max_val377) {
      baseLog = OPTIMALLOG579(base);
    } else {
      baseLog = GENERALLOG209(base);
    }

    uint256 baseLogTimesExp = baseLog * _expN / _expD;
    if (baseLogTimesExp < opt_exp_max_val663) {
      return (OPTIMALEXP773(baseLogTimesExp), max_precision164);
    } else {
      uint8 precision = FINDPOSITIONINMAXEXPARRAY242(baseLogTimesExp);
      return (GENERALEXP125(baseLogTimesExp >> (max_precision164 - precision), precision), precision);
    }
  }

                                                                                                                                                      
  function GENERALLOG209(uint256 _x) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 res = 0;
    uint256 x = _x;

    // If x >= 2, then we compute the integer part of log2(x), which is larger than 0.
    if (x >= fixed_2191) {
      uint8 count = FLOORLOG2119(x / fixed_1353);
      x >>= count; // now x < 2
      res = count * fixed_1353;
    }

    // If x > 1, then we compute the fraction part of log2(x), which is larger than 0.
    if (x > fixed_1353) {
      for (uint8 i = max_precision164; i > 0; --i) {
        x = (x * x) / fixed_1353; // now 1 < x < 4
        if (x >= fixed_2191) {
          x >>= 1; // now 1 < x < 2
          res += one411 << (i - 1);
        }
      }
    }

    return res * ln2_numerator679 / ln2_denominator25;
  }

                                                                                                      
  function FLOORLOG2119(uint256 _n) internal pure returns (uint8) {	//inject NONSTANDARD NAMING
    uint8 res = 0;
    uint256 n = _n;

    if (n < 256) {
      // At most 8 iterations
      while (n > 1) {
        n >>= 1;
        res += 1;
      }
    } else {
      // Exactly 8 iterations
      for (uint8 s = 128; s > 0; s >>= 1) {
        if (n >= (one411 << s)) {
          n >>= s;
          res |= s;
        }
      }
    }

    return res;
  }

                                                                                                                                                                                                                                                                                                                                                        
  function FINDPOSITIONINMAXEXPARRAY242(uint256 _x)	//inject NONSTANDARD NAMING
  internal view returns (uint8)
  {
    uint8 lo = min_precision798;
    uint8 hi = max_precision164;

    while (lo + 1 < hi) {
      uint8 mid = (lo + hi) / 2;
      if (maxExpArray[mid] >= _x)
        lo = mid;
      else
        hi = mid;
    }

    if (maxExpArray[hi] >= _x)
      return hi;
    if (maxExpArray[lo] >= _x)
      return lo;

    assert(false);
    return 0;
  }

                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
   function GENERALEXP125(uint256 _x, uint8 _precision) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
       uint256 xi = _x;
       uint256 res = 0;

       xi = (xi * _x) >> _precision; res += xi * 0x3442c4e6074a82f1797f72ac0000000; // add x^02 * (33! / 02!)
       xi = (xi * _x) >> _precision; res += xi * 0x116b96f757c380fb287fd0e40000000; // add x^03 * (33! / 03!)
       xi = (xi * _x) >> _precision; res += xi * 0x045ae5bdd5f0e03eca1ff4390000000; // add x^04 * (33! / 04!)
       xi = (xi * _x) >> _precision; res += xi * 0x00defabf91302cd95b9ffda50000000; // add x^05 * (33! / 05!)
       xi = (xi * _x) >> _precision; res += xi * 0x002529ca9832b22439efff9b8000000; // add x^06 * (33! / 06!)
       xi = (xi * _x) >> _precision; res += xi * 0x00054f1cf12bd04e516b6da88000000; // add x^07 * (33! / 07!)
       xi = (xi * _x) >> _precision; res += xi * 0x0000a9e39e257a09ca2d6db51000000; // add x^08 * (33! / 08!)
       xi = (xi * _x) >> _precision; res += xi * 0x000012e066e7b839fa050c309000000; // add x^09 * (33! / 09!)
       xi = (xi * _x) >> _precision; res += xi * 0x000001e33d7d926c329a1ad1a800000; // add x^10 * (33! / 10!)
       xi = (xi * _x) >> _precision; res += xi * 0x0000002bee513bdb4a6b19b5f800000; // add x^11 * (33! / 11!)
       xi = (xi * _x) >> _precision; res += xi * 0x00000003a9316fa79b88eccf2a00000; // add x^12 * (33! / 12!)
       xi = (xi * _x) >> _precision; res += xi * 0x0000000048177ebe1fa812375200000; // add x^13 * (33! / 13!)
       xi = (xi * _x) >> _precision; res += xi * 0x0000000005263fe90242dcbacf00000; // add x^14 * (33! / 14!)
       xi = (xi * _x) >> _precision; res += xi * 0x000000000057e22099c030d94100000; // add x^15 * (33! / 15!)
       xi = (xi * _x) >> _precision; res += xi * 0x0000000000057e22099c030d9410000; // add x^16 * (33! / 16!)
       xi = (xi * _x) >> _precision; res += xi * 0x00000000000052b6b54569976310000; // add x^17 * (33! / 17!)
       xi = (xi * _x) >> _precision; res += xi * 0x00000000000004985f67696bf748000; // add x^18 * (33! / 18!)
       xi = (xi * _x) >> _precision; res += xi * 0x000000000000003dea12ea99e498000; // add x^19 * (33! / 19!)
       xi = (xi * _x) >> _precision; res += xi * 0x00000000000000031880f2214b6e000; // add x^20 * (33! / 20!)
       xi = (xi * _x) >> _precision; res += xi * 0x000000000000000025bcff56eb36000; // add x^21 * (33! / 21!)
       xi = (xi * _x) >> _precision; res += xi * 0x000000000000000001b722e10ab1000; // add x^22 * (33! / 22!)
       xi = (xi * _x) >> _precision; res += xi * 0x0000000000000000001317c70077000; // add x^23 * (33! / 23!)
       xi = (xi * _x) >> _precision; res += xi * 0x00000000000000000000cba84aafa00; // add x^24 * (33! / 24!)
       xi = (xi * _x) >> _precision; res += xi * 0x00000000000000000000082573a0a00; // add x^25 * (33! / 25!)
       xi = (xi * _x) >> _precision; res += xi * 0x00000000000000000000005035ad900; // add x^26 * (33! / 26!)
       xi = (xi * _x) >> _precision; res += xi * 0x000000000000000000000002f881b00; // add x^27 * (33! / 27!)
       xi = (xi * _x) >> _precision; res += xi * 0x0000000000000000000000001b29340; // add x^28 * (33! / 28!)
       xi = (xi * _x) >> _precision; res += xi * 0x00000000000000000000000000efc40; // add x^29 * (33! / 29!)
       xi = (xi * _x) >> _precision; res += xi * 0x0000000000000000000000000007fe0; // add x^30 * (33! / 30!)
       xi = (xi * _x) >> _precision; res += xi * 0x0000000000000000000000000000420; // add x^31 * (33! / 31!)
       xi = (xi * _x) >> _precision; res += xi * 0x0000000000000000000000000000021; // add x^32 * (33! / 32!)
       xi = (xi * _x) >> _precision; res += xi * 0x0000000000000000000000000000001; // add x^33 * (33! / 33!)

       return res / 0x688589cc0e9505e2f2fee5580000000 + _x + (one411 << _precision); // divide by 33! and then add x^1 / 1! + x^0 / 0!
   }

                                                                                                                                                                    
   function OPTIMALLOG579(uint256 x) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
       uint256 res = 0;

       uint256 y;
       uint256 z;
       uint256 w;

       if (x >= 0xd3094c70f034de4b96ff7d5b6f99fcd8) {res += 0x40000000000000000000000000000000; x = x * fixed_1353 / 0xd3094c70f034de4b96ff7d5b6f99fcd8;}
       if (x >= 0xa45af1e1f40c333b3de1db4dd55f29a7) {res += 0x20000000000000000000000000000000; x = x * fixed_1353 / 0xa45af1e1f40c333b3de1db4dd55f29a7;}
       if (x >= 0x910b022db7ae67ce76b441c27035c6a1) {res += 0x10000000000000000000000000000000; x = x * fixed_1353 / 0x910b022db7ae67ce76b441c27035c6a1;}
       if (x >= 0x88415abbe9a76bead8d00cf112e4d4a8) {res += 0x08000000000000000000000000000000; x = x * fixed_1353 / 0x88415abbe9a76bead8d00cf112e4d4a8;}
       if (x >= 0x84102b00893f64c705e841d5d4064bd3) {res += 0x04000000000000000000000000000000; x = x * fixed_1353 / 0x84102b00893f64c705e841d5d4064bd3;}
       if (x >= 0x8204055aaef1c8bd5c3259f4822735a2) {res += 0x02000000000000000000000000000000; x = x * fixed_1353 / 0x8204055aaef1c8bd5c3259f4822735a2;}
       if (x >= 0x810100ab00222d861931c15e39b44e99) {res += 0x01000000000000000000000000000000; x = x * fixed_1353 / 0x810100ab00222d861931c15e39b44e99;}
       if (x >= 0x808040155aabbbe9451521693554f733) {res += 0x00800000000000000000000000000000; x = x * fixed_1353 / 0x808040155aabbbe9451521693554f733;}

       z = y = x - fixed_1353;
       w = y * y / fixed_1353;
       res += z * (0x100000000000000000000000000000000 - y) / 0x100000000000000000000000000000000; z = z * w / fixed_1353;
       res += z * (0x0aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa - y) / 0x200000000000000000000000000000000; z = z * w / fixed_1353;
       res += z * (0x099999999999999999999999999999999 - y) / 0x300000000000000000000000000000000; z = z * w / fixed_1353;
       res += z * (0x092492492492492492492492492492492 - y) / 0x400000000000000000000000000000000; z = z * w / fixed_1353;
       res += z * (0x08e38e38e38e38e38e38e38e38e38e38e - y) / 0x500000000000000000000000000000000; z = z * w / fixed_1353;
       res += z * (0x08ba2e8ba2e8ba2e8ba2e8ba2e8ba2e8b - y) / 0x600000000000000000000000000000000; z = z * w / fixed_1353;
       res += z * (0x089d89d89d89d89d89d89d89d89d89d89 - y) / 0x700000000000000000000000000000000; z = z * w / fixed_1353;
       res += z * (0x088888888888888888888888888888888 - y) / 0x800000000000000000000000000000000;

       return res;
   }

                                                                                                                                                               
   function OPTIMALEXP773(uint256 x) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
       uint256 res = 0;

       uint256 y;
       uint256 z;

       z = y = x % 0x10000000000000000000000000000000;
       z = z * y / fixed_1353; res += z * 0x10e1b3be415a0000; // add y^02 * (20! / 02!)
       z = z * y / fixed_1353; res += z * 0x05a0913f6b1e0000; // add y^03 * (20! / 03!)
       z = z * y / fixed_1353; res += z * 0x0168244fdac78000; // add y^04 * (20! / 04!)
       z = z * y / fixed_1353; res += z * 0x004807432bc18000; // add y^05 * (20! / 05!)
       z = z * y / fixed_1353; res += z * 0x000c0135dca04000; // add y^06 * (20! / 06!)
       z = z * y / fixed_1353; res += z * 0x0001b707b1cdc000; // add y^07 * (20! / 07!)
       z = z * y / fixed_1353; res += z * 0x000036e0f639b800; // add y^08 * (20! / 08!)
       z = z * y / fixed_1353; res += z * 0x00000618fee9f800; // add y^09 * (20! / 09!)
       z = z * y / fixed_1353; res += z * 0x0000009c197dcc00; // add y^10 * (20! / 10!)
       z = z * y / fixed_1353; res += z * 0x0000000e30dce400; // add y^11 * (20! / 11!)
       z = z * y / fixed_1353; res += z * 0x000000012ebd1300; // add y^12 * (20! / 12!)
       z = z * y / fixed_1353; res += z * 0x0000000017499f00; // add y^13 * (20! / 13!)
       z = z * y / fixed_1353; res += z * 0x0000000001a9d480; // add y^14 * (20! / 14!)
       z = z * y / fixed_1353; res += z * 0x00000000001c6380; // add y^15 * (20! / 15!)
       z = z * y / fixed_1353; res += z * 0x000000000001c638; // add y^16 * (20! / 16!)
       z = z * y / fixed_1353; res += z * 0x0000000000001ab8; // add y^17 * (20! / 17!)
       z = z * y / fixed_1353; res += z * 0x000000000000017c; // add y^18 * (20! / 18!)
       z = z * y / fixed_1353; res += z * 0x0000000000000014; // add y^19 * (20! / 19!)
       z = z * y / fixed_1353; res += z * 0x0000000000000001; // add y^20 * (20! / 20!)
       res = res / 0x21c3677c82b40000 + y + fixed_1353; // divide by 20! and then add y^1 / 1! + y^0 / 0!

       if ((x & 0x010000000000000000000000000000000) != 0) res = res * 0x1c3d6a24ed82218787d624d3e5eba95f9 / 0x18ebef9eac820ae8682b9793ac6d1e776;
       if ((x & 0x020000000000000000000000000000000) != 0) res = res * 0x18ebef9eac820ae8682b9793ac6d1e778 / 0x1368b2fc6f9609fe7aceb46aa619baed4;
       if ((x & 0x040000000000000000000000000000000) != 0) res = res * 0x1368b2fc6f9609fe7aceb46aa619baed5 / 0x0bc5ab1b16779be3575bd8f0520a9f21f;
       if ((x & 0x080000000000000000000000000000000) != 0) res = res * 0x0bc5ab1b16779be3575bd8f0520a9f21e / 0x0454aaa8efe072e7f6ddbab84b40a55c9;
       if ((x & 0x100000000000000000000000000000000) != 0) res = res * 0x0454aaa8efe072e7f6ddbab84b40a55c5 / 0x00960aadc109e7a3bf4578099615711ea;
       if ((x & 0x200000000000000000000000000000000) != 0) res = res * 0x00960aadc109e7a3bf4578099615711d7 / 0x0002bf84208204f5977f9a8cf01fdce3d;
       if ((x & 0x400000000000000000000000000000000) != 0) res = res * 0x0002bf84208204f5977f9a8cf01fdc307 / 0x0000003c6ab775dd0b95b4cbee7e65d11;

       return res;
   }
                      
}

// File: contracts\BancorBondingCurve.sol

pragma solidity ^0.5.2;



                                                                                                                                                                                                     
contract BancorBondingCurve is Power {
   using SafeMath for uint256;
   uint32 private constant max_reserve_ratio774 = 1000000;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function CALCULATEPURCHASERETURN574(	//inject NONSTANDARD NAMING
    uint256 _supply,
    uint256 _reserveBalance,
    uint32 _reserveRatio,
    uint256 _depositAmount) public view returns (uint256)
  {
    // validate input
    require(_supply > 0 && _reserveBalance > 0 && _reserveRatio > 0 && _reserveRatio <= max_reserve_ratio774);
     // special case for 0 deposit amount
    if (_depositAmount == 0) {
      return 0;
    }
     // special case if the ratio = 100%
    if (_reserveRatio == max_reserve_ratio774) {
      return _supply.MUL263(_depositAmount).DIV835(_reserveBalance);
    }
     uint256 result;
    uint8 precision;
    uint256 baseN = _depositAmount.ADD910(_reserveBalance);
    (result, precision) = POWER59(
      baseN, _reserveBalance, _reserveRatio, max_reserve_ratio774
    );
    uint256 newTokenSupply = _supply.MUL263(result) >> precision;
    return newTokenSupply - _supply;
  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function CALCULATESALERETURN391(	//inject NONSTANDARD NAMING
    uint256 _supply,
    uint256 _reserveBalance,
    uint32 _reserveRatio,
    uint256 _sellAmount) public view returns (uint256)
  {
    // validate input
    require(_supply > 0 && _reserveBalance > 0 && _reserveRatio > 0 && _reserveRatio <= max_reserve_ratio774 && _sellAmount <= _supply);
     // special case for 0 sell amount
    if (_sellAmount == 0) {
      return 0;
    }
     // special case for selling the entire supply
    if (_sellAmount == _supply) {
      return _reserveBalance;
    }
     // special case if the ratio = 100%
    if (_reserveRatio == max_reserve_ratio774) {
      return _reserveBalance.MUL263(_sellAmount).DIV835(_supply);
    }
     uint256 result;
    uint8 precision;
    uint256 baseD = _supply - _sellAmount;
    (result, precision) = POWER59(
      _supply, baseD, max_reserve_ratio774, _reserveRatio
    );
    uint256 oldBalance = _reserveBalance.MUL263(result);
    uint256 newBalance = _reserveBalance << precision;
    return oldBalance.SUB729(newBalance).DIV835(result);
  }
}

// File: contracts\ContinuousToken.sol

pragma solidity ^0.5.2;





contract ContinuousToken is BancorBondingCurve, Ownable, ERC20 {
    
    using SafeMath for uint256;

    uint256 public scale = 10**18;
    uint256 public reserveBalance = 10*scale;
    uint256 public reserveRatio = 500000;

    constructor() public {
        _MINT356(msg.sender, 1*scale);
    }

    function MINT0(address reciever, uint value) public payable {	//inject NONSTANDARD NAMING
        require(value > 0, "Must send ether to buy tokens.");
        _CONTINUOUSMINT343(reciever, value);
    }

    function BURN107(uint256 _amount) public {	//inject NONSTANDARD NAMING
        uint256 returnAmount = _CONTINUOUSBURN472(_amount);
        msg.sender.transfer(returnAmount);
    }

    function CALCULATECONTINUOUSMINTRETURN44(uint256 _amount)	//inject NONSTANDARD NAMING
        public view returns (uint256 mintAmount)
    {
        return CALCULATEPURCHASERETURN574(TOTALSUPPLY942(), reserveBalance, uint32(reserveRatio), _amount);
    }

    function CALCULATECONTINUOUSBURNRETURN369(uint256 _amount)	//inject NONSTANDARD NAMING
        public view returns (uint256 burnAmount)
    {
        return CALCULATESALERETURN391(TOTALSUPPLY942(), reserveBalance, uint32(reserveRatio), _amount);
    }

    function _CONTINUOUSMINT343(address reciever, uint value)	//inject NONSTANDARD NAMING
        internal returns (uint256)
    {
        require(value > 0, "Deposit must be non-zero.");

        uint256 amount = CALCULATECONTINUOUSMINTRETURN44(value);
        _MINT356(reciever, amount);
        reserveBalance = reserveBalance.ADD910(value);
        return amount;
    }

    function _CONTINUOUSBURN472(uint256 _amount)	//inject NONSTANDARD NAMING
        internal returns (uint256)
    {
        require(_amount > 0, "Amount must be non-zero.");
        require(BALANCEOF35(msg.sender) >= _amount, "Insufficient tokens to burn.");

        uint256 reimburseAmount = CALCULATECONTINUOUSBURNRETURN369(_amount);
        reserveBalance = reserveBalance.SUB729(reimburseAmount);
        _BURN537(msg.sender, _amount);
        return reimburseAmount;
    }
}

// File: contracts\SpaceMiners.sol

pragma solidity ^0.5.2;

// GAME



// TOKEN


contract SpaceMiners is Ownable, ContinuousToken {

  using SafeMath for uint;

  uint public constant price_to_mine250 = 20 finney;	//inject NONSTANDARD NAMING
  uint public constant planet_capacity883 = 10;	//inject NONSTANDARD NAMING
  uint public constant num_winners283 = 3;	//inject NONSTANDARD NAMING
  uint constant owner_fee_percent794 = 5;	//inject NONSTANDARD NAMING
  address[] miners = new address[](planet_capacity883);
  uint public planetPopulation = 0;
  uint ownerHoldings = 1;

  string public constant name775 = "Kerium Crystals";	//inject NONSTANDARD NAMING
  string public constant symbol122 = "KMC";	//inject NONSTANDARD NAMING
  uint8 public constant decimals216 = 18;	//inject NONSTANDARD NAMING

  function GETNUMUSERSMINERSONPLANET457(address miner) public view returns (uint) {	//inject NONSTANDARD NAMING
    uint count = 0;
    for (uint i = 0; i < planetPopulation; i++) {
      if (miners[i] == miner) {
        count++;
      }
    }
    return count;
  }

  function SENDSINGLEMINERTOPLANET595(address miner) internal {	//inject NONSTANDARD NAMING
    miners[planetPopulation] = miner;
    planetPopulation = planetPopulation.ADD910(1);
    if (planetPopulation == planet_capacity883) {
      REWARDMINERS391();
      planetPopulation = 0;
    }
  }

  function SENDMINERSTOPLANET734(uint numMiners) public payable {	//inject NONSTANDARD NAMING
    require(msg.value >= numMiners * price_to_mine250, "Not enough paid");
    require(planetPopulation < planet_capacity883, "Planet is full");
    MINT0(msg.sender, numMiners);
    for (uint i = 0; i < numMiners; i++) {
      SENDSINGLEMINERTOPLANET595(msg.sender);
    }
  }

  function PERCENTOFVALUE126(uint percent, uint value) pure internal returns (uint) {	//inject NONSTANDARD NAMING
    return (value.MUL263(percent)).DIV835(100);
  }

  function GETRANDOM410(uint cap) view internal returns (uint) {	//inject NONSTANDARD NAMING
    return uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % cap;
  }

  function REWARDMINERS391() internal {	//inject NONSTANDARD NAMING
    // First take OWNER_FEE_PERCENT
    uint roundEarnings = price_to_mine250 * planet_capacity883;
    uint ownerFee = PERCENTOFVALUE126(owner_fee_percent794, roundEarnings);
    ownerHoldings = ownerHoldings.ADD910(ownerFee);
    roundEarnings = roundEarnings.SUB729(ownerFee);
    uint rewardAmount = roundEarnings.DIV835(num_winners283);
    for (uint i = 0; i < num_winners283; i++) {
      uint rnd = GETRANDOM410(planet_capacity883);
      MINT0(miners[rnd], rewardAmount);
    }
  }

  function CASHOUTOWNERFEE885() public payable ONLYOWNER305 {	//inject NONSTANDARD NAMING
    require(ownerHoldings > 1);
    msg.sender.transfer(ownerHoldings - 1);
    ownerHoldings = 1;
  }

  function() external payable {}

}