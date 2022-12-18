pragma solidity ^0.5.3;

interface Membership {
  function isMember( address who ) external returns (bool);
}

interface Token {
  function transfer( address to, uint amount ) external;
  function transferFrom( address from, address to, uint amount ) external;
}

contract Owned {
  address payable internal owner_;
  constructor() public { owner_ = msg.sender; }
  function changeOwner( address payable newOwner ) isOwner public {
    owner_ = newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  modifier isOwner {
    require( msg.sender == owner_ );
    _;
  }
}

contract Votes is Owned {

  event Vote( address indexed voter,
              uint    indexed blocknum,
              string          hash );

  Membership      internal membership_;
  address payable internal treasury_;
  Token           internal token_;

  uint256 internal fee_;
  uint256 internal tokenFee_;
  uint256 internal dao_;

  constructor() public {
    dao_ = uint256(100);
  }

  function setMembership( address _contract ) isOwner public {
    membership_ = Membership( _contract );	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function setTreasury( address payable _treasury ) isOwner public {
    treasury_ = _treasury;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function setToken( address _token ) isOwner public {
    token_ = Token(_token);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function setFee( uint _newfee ) isOwner public {
    fee_ = _newfee;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function setTokenFee( uint256 _fee ) isOwner public {
    tokenFee_ = _fee;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function setDao( uint _dao ) isOwner public {
    dao_ = _dao;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function vote( uint _blocknum, string memory _hash ) payable public {
    require( msg.value >= fee_ );	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    if (treasury_ != address(0))	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      treasury_.transfer( msg.value - msg.value / dao_ );	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    vote_int( _blocknum, _hash );
  }

  function vote_t( uint _blocknum, string memory _hash ) public {
    token_.transferFrom( msg.sender, address(this), tokenFee_ );	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    if (treasury_ != address(0)) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      token_.transfer( treasury_, tokenFee_ - tokenFee_/dao_ );	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    vote_int( _blocknum, _hash );
  }

  function vote_int( uint _blocknum, string memory _hash ) internal {
    require( membership_.isMember(msg.sender) );

    emit Vote( msg.sender, _blocknum, _hash );
  }

  function withdraw( uint amt ) isOwner public {
    owner_.transfer( amt );	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function sendTok( address _tok, address _to, uint _qty ) isOwner public {
    Token(_tok).transfer( _to, _qty );
  }
}