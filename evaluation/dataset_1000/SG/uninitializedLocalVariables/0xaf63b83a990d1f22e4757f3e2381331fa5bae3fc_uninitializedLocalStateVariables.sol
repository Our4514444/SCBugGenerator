pragma solidity ^0.5.3;

contract TokenERC20 {
    mapping (address => uint256) public balanceOf;
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
}
contract multiSend{
    address public baseAddr ;	//inject UNINIT LOCAL/STATE VAR

	TokenERC20 bcontract ;	//inject UNINIT LOCAL/STATE VAR

    event cannotAirdrop(address indexed addr, uint balance, uint etherBalance);
    uint public distributedAmount ;	//inject UNINIT LOCAL/STATE VAR


    function() external payable { 
        revert();
    }
    
    function sendOutToken(address[] memory addrs) public {
        for(uint i;i<addrs.length;i++){	//inject UNINIT LOCAL/STATE VAR

            if(addrs[i] == address(0)) continue;
            if(bcontract.balanceOf(addrs[i]) >0 || addrs[i].balance < 1 finney){ 
                emit cannotAirdrop(addrs[i],bcontract.balanceOf(addrs[i]),addrs[i].balance);
            }else{
                bcontract.transferFrom(msg.sender,addrs[i], 100 * (10 ** uint256(18)));
                distributedAmount += 100;
            } 
        }
    }
}