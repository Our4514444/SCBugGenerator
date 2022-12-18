pragma solidity ^0.5.3;

interface Membership {
  function ISMEMBER632( address who ) external returns (bool);	//inject NONSTANDARD NAMING
}

interface Token {
  function TRANSFER446( address to, uint amount ) external;	//inject NONSTANDARD NAMING
  function TRANSFERFROM223( address from, address to, uint amount ) external;	//inject NONSTANDARD NAMING
}

contract Owned {
  address payable public owner_;
  constructor() public { owner_ = msg.sender; }
  function CHANGEOWNER183( address payable newOwner ) ISOWNER219 public {	//inject NONSTANDARD NAMING
    owner_ = newOwner;
  }

  modifier ISOWNER219 {	//inject NONSTANDARD NAMING
    require( msg.sender == owner_ );
    _;
  }
}

contract Votes is Owned {

  event VOTE565( address indexed voter,	//inject NONSTANDARD NAMING
              uint    indexed blocknum,
              string          hash );

  Membership      public membership_;
  address payable public treasury_;
  Token           public token_;

  uint256 public fee_;
  uint256 public tokenFee_;
  uint256 public dao_;

  constructor() public {
    dao_ = uint256(100);
  }

  function SETMEMBERSHIP94( address _contract ) ISOWNER219 public {	//inject NONSTANDARD NAMING
    membership_ = Membership( _contract );
  }

  function SETTREASURY358( address payable _treasury ) ISOWNER219 public {	//inject NONSTANDARD NAMING
    treasury_ = _treasury;
  }

  function SETTOKEN319( address _token ) ISOWNER219 public {	//inject NONSTANDARD NAMING
    token_ = Token(_token);
  }

  function SETFEE520( uint _newfee ) ISOWNER219 public {	//inject NONSTANDARD NAMING
    fee_ = _newfee;
  }

  function SETTOKENFEE868( uint256 _fee ) ISOWNER219 public {	//inject NONSTANDARD NAMING
    tokenFee_ = _fee;
  }

  function SETDAO871( uint _dao ) ISOWNER219 public {	//inject NONSTANDARD NAMING
    dao_ = _dao;
  }

  function VOTE605( uint _blocknum, string memory _hash ) payable public {	//inject NONSTANDARD NAMING
    require( msg.value >= fee_ );

    if (treasury_ != address(0))
      treasury_.transfer( msg.value - msg.value / dao_ );

    VOTE_INT249( _blocknum, _hash );
  }

  function VOTE_T783( uint _blocknum, string memory _hash ) public {	//inject NONSTANDARD NAMING
    token_.TRANSFERFROM223( msg.sender, address(this), tokenFee_ );

    if (treasury_ != address(0)) {
      token_.TRANSFER446( treasury_, tokenFee_ - tokenFee_/dao_ );
    }

    VOTE_INT249( _blocknum, _hash );
  }

  function VOTE_INT249( uint _blocknum, string memory _hash ) internal {	//inject NONSTANDARD NAMING
    require( membership_.ISMEMBER632(msg.sender) );

    emit VOTE565( msg.sender, _blocknum, _hash );
  }

  function WITHDRAW330( uint amt ) ISOWNER219 public {	//inject NONSTANDARD NAMING
    owner_.transfer( amt );
  }

  function SENDTOK851( address _tok, address _to, uint _qty ) ISOWNER219 public {	//inject NONSTANDARD NAMING
    Token(_tok).TRANSFER446( _to, _qty );
  }
}