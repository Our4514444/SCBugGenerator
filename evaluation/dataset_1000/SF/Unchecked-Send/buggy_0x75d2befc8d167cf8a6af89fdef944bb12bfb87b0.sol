pragma solidity >=0.5.3 <0.6.0;


contract TronRegister {
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event RegisterAdd(address indexed ethAddress, address indexed tronAddress);

  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => address) private ethToTronMapping;

    function put(address _tronAddress) external {
        address ethAddress = msg.sender;
        require(ethToTronMapping[ethAddress] == address(0), "address already bound");
        ethToTronMapping[ethAddress] = _tronAddress;
        emit RegisterAdd(ethAddress, _tronAddress);
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

    function get(address _ethAddress) public view returns (address _tronAddress) {
        return ethToTronMapping[_ethAddress];
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
}