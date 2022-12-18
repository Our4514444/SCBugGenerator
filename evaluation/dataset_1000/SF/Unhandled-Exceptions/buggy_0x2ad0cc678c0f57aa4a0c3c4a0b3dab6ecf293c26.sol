pragma solidity 0.5.2;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    if (a == 0) {
      return 0;
    }
    c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    // uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return a / b;
  }

  /**
  * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
interface IERC20 {
  function totalSupply() external view returns (uint256);

  function balanceOf(address who) external view returns (uint256);

  function allowance(address owner, address spender)
    external view returns (uint256);

  function transfer(address to, uint256 value) external returns (bool);

  function approve(address spender, uint256 value)
    external returns (bool);

  function transferFrom(address from, address to, uint256 value)
    external returns (bool);

  event Transfer(
    address indexed from,
    address indexed to,
    uint256 value
  );

  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

contract PurchaseContract {
    
  using SafeMath for uint256;
  
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint purchasedProductsCount;
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
  uint unPurchasedProductsCount;

function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
  IERC20 token;

  struct Product {
    uint id;
    uint price;
    address buyer;
    address retailer;
    address model;
    bool purchased;
  }

function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  Product[] products;
  
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event Purchase(uint _id, uint _price, address _buyer, address _retailer, address _model);
  
  constructor(address _tokenAddress) public {
    token = IERC20(_tokenAddress);
  }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

  function addProduct(uint _productId, uint _price) external {
    require(_productId > 0);
    require(_price > 0);

    products.push(Product(_productId, _price, address(0), msg.sender, address(0), false));
    unPurchasedProductsCount = unPurchasedProductsCount.add(1);
  }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

  function addProducts(uint[] calldata _productIds, uint[] calldata _prices) external {
    require(_productIds.length > 0);
    require(_prices.length > 0);
    require(_productIds.length == _prices.length);

    for(uint i = 0; i < _productIds.length; i++) {
      require(_productIds[i] > 0 && _prices[i] > 0); 
      products.push(Product(_productIds[i], _prices[i], address(0), msg.sender, address(0), false));
      unPurchasedProductsCount = unPurchasedProductsCount.add(1);
    }
  }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
  
  function purchaseRequest(uint _productId) external {
    (Product memory _product, uint index) = findProductAndIndexById(_productId);
    require(_productId != 0 && _product.id == _productId && _product.purchased == false);
    require(_product.buyer == address(0));
    require(_product.price <= token.balanceOf(msg.sender));
    _product.buyer = msg.sender;
     products[index] = _product;
  }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

  function getProductPrice(uint _productId) external view returns(uint) {
    Product memory _product = findProductById(_productId);
    return _product.price;
  }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

  function getProductRetailer(uint _productId) external view returns(address) {
    Product memory _product = findProductById(_productId);
    return _product.retailer;
  }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
  
  function getProductBuyer(uint _productId) external view returns(address) {
    Product memory _product = findProductById(_productId);
    return _product.buyer;
  }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  
  function isPurchased(uint _productId) external view returns(bool) {
    Product memory _product = findProductById(_productId);
    return _product.purchased;
  }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

  function getUnPurchasedProducts() external view returns(uint[] memory) {
    uint index;
    bool isEmpty = true;
    uint[] memory results = new uint[](unPurchasedProductsCount);

    for(uint i = 0; i < products.length; i++) {
       if(!products[i].purchased){
         results[index] = products[i].id;
         index = index.add(1);
         isEmpty = false;
       }
    }
    
    if(isEmpty) {
        return new uint[](1);
    }
    
    return results;
  }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  
  function getPurchasedProducts() external view returns(uint[] memory) {
    uint index;
    bool isEmpty = true;
    uint[] memory results = new uint[](purchasedProductsCount);

    for(uint i = 0; i < products.length; i++) {
       if(products[i].purchased){
         results[index] = products[i].id;
         index = index.add(1);
         isEmpty = false;
       }
    }
    
    if(isEmpty) {
        return new uint[](1);
    }

    return results;
  }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

  function confirmPurchase(uint _productId, address _model) external {
    require(_productId != 0);

    (Product memory _product, uint index) = findProductAndIndexById(_productId);

    require(msg.sender == _product.retailer && _product.buyer != address(0) && token.allowance(_product.buyer, address(this)) >= _product.price); 

    _product.model = _model;

    token.transferFrom(_product.buyer, _product.retailer, _product.price.mul(90).div(100));
    token.transferFrom(_product.buyer, _product.model, _product.price.mul(6).div(100));
    
    _product.purchased = true;
    purchasedProductsCount = purchasedProductsCount.add(1);
    unPurchasedProductsCount = unPurchasedProductsCount.sub(1);
    
    products[index] = _product;

    emit Purchase(_productId, _product.price, _product.buyer, _product.retailer, _model);
  }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

  function findProductAndIndexById(uint _productId) internal view returns(Product memory, uint) {
    for(uint i = 0; i < products.length; i++) {
       if(products[i].id == _productId){
         return (products[i], i);
       }
    }
    
    return (Product(0, 1, address(0), address(0), address(0), false), 0);
  }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  
  function findProductById(uint _productId) internal view returns(Product memory) {
    for(uint i = 0; i < products.length; i++) {
       if(products[i].id == _productId){
         return products[i];
       }
    }
    
    return Product(0, 1, address(0), address(0), address(0), false);
  }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  
  
}