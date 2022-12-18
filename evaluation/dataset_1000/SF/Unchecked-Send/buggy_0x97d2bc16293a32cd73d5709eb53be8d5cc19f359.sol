/**
 *Submitted for verification at Etherscan.io on 2020-04-27
*/

pragma solidity 0.5.7;

contract PHCMath {
    function add(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require((z = x + y) >= x, "phc-math-add");
    }
    function sub(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require((z = x - y) <= x, "phc-math-sub");
    }
    function mul(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require(y == 0 || (z = x * y) / y == x, "phc-math-mul");
    }

    function min(uint256 x, uint256 y) internal pure returns (uint256 z) {
        return x <= y ? x : y;
    }
    function max(uint256 x, uint256 y) internal pure returns (uint256 z) {
        return x >= y ? x : y;
    }
    function imin(int x, int y) internal pure returns (int z) {
        return x <= y ? x : y;
    }
    function imax(int x, int y) internal pure returns (int z) {
        return x >= y ? x : y;
    }

    uint256 constant WAD = 10 ** 18;
    uint256 constant RAY = 10 ** 27;

    function wmul(uint256 x, uint256 y) internal pure returns (uint256 z) {
        z = add(mul(x, y), WAD / 2) / WAD;
    }
    function rmul(uint256 x, uint256 y) internal pure returns (uint256 z) {
        z = add(mul(x, y), RAY / 2) / RAY;
    }
    function wdiv(uint256 x, uint256 y) internal pure returns (uint256 z) {
        z = add(mul(x, WAD), y / 2) / y;
    }
    function rdiv(uint256 x, uint256 y) internal pure returns (uint256 z) {
        z = add(mul(x, RAY), y / 2) / y;
    }

    function rpow(uint256 x, uint256 n) internal pure returns (uint256 z) {
        z = n % 2 != 0 ? x : RAY;

        for (n /= 2; n != 0; n /= 2) {
            x = rmul(x, x);

            if (n % 2 != 0) {
                z = rmul(z, x);
            }
        }
    }
}

contract ERC20Events {
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed src, address indexed guy, uint256 wad);
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed src, address indexed dst, uint256 wad);
}

contract ERC20 is ERC20Events {
    function totalSupply() public view returns (uint256);
    function balanceOf(address guy) public view returns (uint256);
    function allowance(address src, address guy) public view returns (uint256);

    function approve(address guy, uint256 wad) public returns (bool);
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address dst, uint256 wad) public returns (bool);
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(
        address src, address dst, uint256 wad
    ) public returns (bool);
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
}

contract PHCTokenBase is ERC20, PHCMath {
    mapping (address => uint256)                       _balances;
    mapping (address => mapping (address => uint256))  _approvals;

    uint256 constant _supply = (10000000) * (10**18);
    constructor() public {
        _balances[msg.sender] = _supply;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function totalSupply() public view returns (uint256) {
        return _supply;
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOf(address src) public view returns (uint256) {
        return _balances[src];
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
    function allowance(address src, address guy) public view returns (uint256) {
        return _approvals[src][guy];
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address dst, uint256 wad) public returns (bool) {
        return transferFrom(msg.sender, dst, wad);
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address src, address dst, uint256 wad)
        public
        returns (bool)
    {
        if (src != msg.sender) {
            require(_approvals[src][msg.sender] >= wad, "phc-token-insufficient-approval");
            _approvals[src][msg.sender] = sub(_approvals[src][msg.sender], wad);
        }

        require(_balances[src] >= wad, "phc-token-insufficient-balance");
        _balances[src] = sub(_balances[src], wad);
        _balances[dst] = add(_balances[dst], wad);

        emit Transfer(src, dst, wad);

        return true;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address guy, uint256 wad) public returns (bool) {
        _approvals[msg.sender][guy] = wad;

        emit Approval(msg.sender, guy, wad);

        return true;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
}

contract PHCNote {
  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event LogNote(
        bytes4   indexed  sig,
        address  indexed  guy,
        bytes32  indexed  foo,
        bytes32  indexed  bar,
        uint256              wad,
        bytes             fax
    ) anonymous;

    modifier note {
        bytes32 foo;
        bytes32 bar;

        assembly {
            foo := calldataload(4)
            bar := calldataload(36)
        }

        emit LogNote(msg.sig, msg.sender, foo, bar, msg.value, msg.data);

        _;
    }
}

contract PHCAuthority {
    function canCall(
        address src, address dst, bytes4 sig
    ) public view returns (bool);
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
}

contract PHCAuthEvents {
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event LogSetAuthority (address indexed authority);
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event LogSetOwner     (address indexed owner);
}

contract PHCAuth is PHCAuthEvents {
    PHCAuthority  public  authority;
    address      public  owner;

    constructor() public {
        owner = msg.sender;
        emit LogSetOwner(msg.sender);
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    function setOwner(address owner_)
        public
        auth
    {
        owner = owner_;
        emit LogSetOwner(owner);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    function setAuthority(PHCAuthority authority_)
        public
        auth
    {
        authority = authority_;
        emit LogSetAuthority(address(authority));
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    modifier auth {
        require(isAuthorized(msg.sender, msg.sig));
        _;
    }

    function isAuthorized(address src, bytes4 sig) internal view returns (bool) {
        if (src == address(this)) {
            return true;
        } else if (src == owner) {
            return true;
        } else if (authority == PHCAuthority(0)) {
            return false;
        } else {
            return authority.canCall(src, address(this), sig);
        }
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
}

contract PHCStop is PHCNote, PHCAuth {

    bool public stopped;

    modifier stoppable {
        require(!stopped);
        _;
    }
    function stop() public payable auth note {
        stopped = true;
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
    function start() public payable auth note {
        stopped = false;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

}

contract PHC is PHCTokenBase, PHCStop {
    mapping (address => mapping (address => bool)) _trusted;

    bytes32  public  symbol;
    uint256  public  decimals = 18; // standard token precision. override to customize

    constructor(bytes32 symbol_) public {
        symbol = symbol_;
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Trust(address indexed src, address indexed guy, bool wat);

    function trusted(address src, address guy) public view returns (bool) {
        return _trusted[src][guy];
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    function trust(address guy, bool wat) public stoppable {
        _trusted[msg.sender][guy] = wat;
        emit Trust(msg.sender, guy, wat);
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address guy, uint256 wad) public stoppable returns (bool) {
        return super.approve(guy, wad);
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address src, address dst, uint256 wad)
        public
        stoppable
        returns (bool)
    {
        if (src != msg.sender && !_trusted[src][msg.sender]) {
            _approvals[src][msg.sender] = sub(_approvals[src][msg.sender], wad);
        }

        _balances[src] = sub(_balances[src], wad);
        _balances[dst] = add(_balances[dst], wad);

        emit Transfer(src, dst, wad);

        return true;
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    function push(address dst, uint256 wad) public {
        transferFrom(msg.sender, dst, wad);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    function pull(address src, uint256 wad) public {
        transferFrom(src, msg.sender, wad);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    function move(address src, address dst, uint256 wad) public {
        transferFrom(src, dst, wad);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    // Optional token name
    bytes32   public  name = "";

    function setName(bytes32 name_) public auth {
        name = name_;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
}