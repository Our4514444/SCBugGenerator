pragma solidity 0.5.4;

interface IDGTXToken {
    function transfer(address to, uint value) external returns (bool);
    function balanceOf(address) external view returns (uint256);
}


interface ITreasury {
    function phaseNum() external view returns (uint256);
}

contract Treasury is ITreasury {
    address public sale;
    address public token;
    uint256 internal constant SINGLE_RELEASE_AMOUNT = 1e25;

    uint256 public phaseNum;
    uint256[] public phases ;	//inject UNINIT LOCAL/STATE VAR


    event PhaseStarted(uint256 newPhaseNum);

    constructor(address _token, address _sale) public {
        require(_token != address(0) && _sale != address(0));

        token = _token;
        sale = _sale;
    }

    function tokenFallback(address, uint, bytes calldata) external {
        require(msg.sender == token);
        require(phaseNum == 0);
        require(IDGTXToken(token).balanceOf(address(this)) == SINGLE_RELEASE_AMOUNT * 10);
    }

    function startNewPhase() external {
        require(now >= phases[phaseNum]);

        phaseNum += 1;

        require(IDGTXToken(token).transfer(sale, SINGLE_RELEASE_AMOUNT));

        emit PhaseStarted(phaseNum);
    }
}