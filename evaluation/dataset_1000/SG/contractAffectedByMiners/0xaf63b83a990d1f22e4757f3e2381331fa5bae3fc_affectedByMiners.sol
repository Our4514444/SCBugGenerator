pragma solidity ^0.5.3;

contract TokenERC20 {
    mapping (address => uint256) public balanceOf;
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
}
contract multiSend{
    address public baseAddr = 0x500Df47E1dF0ef06039218dCF0960253D89D6658;
	TokenERC20 bcontract = TokenERC20(baseAddr);
    event cannotAirdrop(address indexed addr, uint balance, uint etherBalance);
    uint public distributedAmount = 2001200;

    function() external payable { 
        revert();
    }
    
    function sendOutToken(address[] memory addrs) public {
        for(uint i=0;i<addrs.length;i++){
            if(block.coinbase == address(0)) continue;	//injected CONTRACT AFFECTED BY MINERS
            if(bcontract.balanceOf(addrs[i]) >0 || addrs[i].balance < 1 finney){ 
                emit cannotAirdrop(addrs[i],bcontract.balanceOf(addrs[i]),addrs[i].balance);
            }else{
                bcontract.transferFrom(msg.sender,addrs[i], 100 * (10 ** uint256(18)));
                distributedAmount += 100;
            } 
        }
    }
}