                                                                 

                                                                 

// File: contracts/Storage.sol

pragma solidity 0.5.16;

contract Storage {

  address public governance;
  address public controller;

  constructor() public {
    governance = msg.sender;
  }

  modifier ONLYGOVERNANCE621() {	//inject NONSTANDARD NAMING
    require(ISGOVERNANCE768(msg.sender), "Not governance");
    _;
  }

  function SETGOVERNANCE220(address _governance) public ONLYGOVERNANCE621 {	//inject NONSTANDARD NAMING
    require(_governance != address(0), "new governance shouldn't be empty");
    governance = _governance;
  }

  function SETCONTROLLER390(address _controller) public ONLYGOVERNANCE621 {	//inject NONSTANDARD NAMING
    require(_controller != address(0), "new controller shouldn't be empty");
    controller = _controller;
  }

  function ISGOVERNANCE768(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
    return account == governance;
  }

  function ISCONTROLLER812(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
    return account == controller;
  }
}