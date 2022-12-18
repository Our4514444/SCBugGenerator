                                                                 

pragma solidity ^0.5.17;

                                                                                                                                                                                                                                                                                                    
 
contract Vault {
    
    ERC20 constant vso501 = ERC20(0x456AE45c0CE901E2e7c99c0718031cEc0A7A59Ff);	//inject NONSTANDARD NAMING
    ERC20 constant liquiditytoken46 = ERC20(0x8d7c9Fa808151D8A0Cc6B11E8f15CED337586c54);	//inject NONSTANDARD NAMING
    
    address owner = 0x6e92Da3B81201Da47a01c4FA004E7d058cF64460;
    uint256 public VaultCreation = now;
    uint256 public lastWithdrawal;
    
    uint256 public migrationLock;
    address public migrationRecipient;

    event LIQUIDITYMIGRATIONSTARTED119(address recipient, uint256 unlockTime);	//inject NONSTANDARD NAMING
    
    
                                                                                 
    function WITHDRAWLIQUIDITY152(address recipient, uint256 amount) external {	//inject NONSTANDARD NAMING
        uint256 liquidityBalance = liquiditytoken46.BALANCEOF668(address(this));
        require(amount < (2 * liquidityBalance / 100)); // Max 2%
        require(lastWithdrawal + 48 hours < now); // Max once every 48 hrs
        require(msg.sender == owner);
        
        liquiditytoken46.TRANSFER703(recipient, amount);
        lastWithdrawal = now;
    } 
    
    
                                                                                                            
    function STARTLIQUIDITYMIGRATION503(address recipient) external {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        migrationLock = now + 30 days;
        migrationRecipient = recipient;
        emit LIQUIDITYMIGRATIONSTARTED119(recipient, migrationLock);
    }
    
    
                                                                                                                 
    function PROCESSMIGRATION525() external {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        require(migrationRecipient != address(0));
        require(now > migrationLock);
        
        uint256 liquidityBalance = liquiditytoken46.BALANCEOF668(address(this));
        liquiditytoken46.TRANSFER703(migrationRecipient, liquidityBalance);
    }
    
    
                                                                                                    
    function WITHDRAWVSO579(address recipient, uint256 amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        require(now > VaultCreation + 120 days);
        vso501.TRANSFER703(recipient, amount);
    } 
    
}





interface ERC20 {
  function TOTALSUPPLY597() external view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOF668(address who) external view returns (uint256);	//inject NONSTANDARD NAMING
  function ALLOWANCE568(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER703(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE108(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVEANDCALL555(address spender, uint tokens, bytes calldata data) external returns (bool success);	//inject NONSTANDARD NAMING
  function TRANSFERFROM755(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

  event TRANSFER47(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
  event APPROVAL60(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}