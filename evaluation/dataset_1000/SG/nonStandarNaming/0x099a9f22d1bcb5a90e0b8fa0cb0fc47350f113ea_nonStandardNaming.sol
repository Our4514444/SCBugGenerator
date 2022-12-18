pragma solidity 0.5.4;

interface IDGTXToken {
    function TRANSFER544(address to, uint value) external returns (bool);	//inject NONSTANDARD NAMING
    function BALANCEOF734(address) external view returns (uint256);	//inject NONSTANDARD NAMING
}


interface ITreasury {
    function PHASENUM839() external view returns (uint256);	//inject NONSTANDARD NAMING
}

contract Treasury is ITreasury {
    address public sale;
    address public token;
    uint256 internal constant single_release_amount978 = 1e25;	//inject NONSTANDARD NAMING

    uint256 public phaseNum;
    uint256[] public phases = [
        1551448800, //1 March 2019 14:00 (GMT)
        1559397600, //1 June 2019 14:00 (GMT)
        1567346400, //1 September 2019 14:00 (GMT)
        1575208800, //1 December 2019 14:00 (GMT)
        1583071200, //1 March 2020 14:00 (GMT)
        1591020000, //1 June 2020 14:00 (GMT)
        1598968800, //1 September 2020 14:00 (GMT)
        1606831200, //1 December 2020 14:00 (GMT)
        1614607200, //1 March 2021 14:00 (GMT)
        1622556000  //1 June 2021 14:00 (GMT)
    ];

    event PHASESTARTED194(uint256 newPhaseNum);	//inject NONSTANDARD NAMING

    constructor(address _token, address _sale) public {
        require(_token != address(0) && _sale != address(0));

        token = _token;
        sale = _sale;
    }

    function TOKENFALLBACK66(address, uint, bytes calldata) external {	//inject NONSTANDARD NAMING
        require(msg.sender == token);
        require(phaseNum == 0);
        require(IDGTXToken(token).BALANCEOF734(address(this)) == single_release_amount978 * 10);
    }

    function STARTNEWPHASE142() external {	//inject NONSTANDARD NAMING
        require(now >= phases[phaseNum]);

        phaseNum += 1;

        require(IDGTXToken(token).TRANSFER544(sale, single_release_amount978));

        emit PHASESTARTED194(phaseNum);
    }
}