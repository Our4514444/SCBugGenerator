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
  
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
  uint purchasedProductsCount;
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint unPurchasedProductsCount;

function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
  IERC20 token;

  struct Product {
    uint id;
    uint price;
    address buyer;
    address retailer;
    address model;
    bool purchased;
  }

function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  Product[] products;
  
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event Purchase(uint _id, uint _price, address _buyer, address _retailer, address _model);
  
  constructor(address _tokenAddress) public {
    token = IERC20(_tokenAddress);
  }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}

  function addProduct(uint _productId, uint _price) external {
    require(_productId > 0);
    require(_price > 0);

    products.push(Product(_productId, _price, address(0), msg.sender, address(0), false));
    unPurchasedProductsCount = unPurchasedProductsCount.add(1);
  }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
  
  function purchaseRequest(uint _productId) external {
    (Product memory _product, uint index) = findProductAndIndexById(_productId);
    require(_productId != 0 && _product.id == _productId && _product.purchased == false);
    require(_product.buyer == address(0));
    require(_product.price <= token.balanceOf(msg.sender));
    _product.buyer = msg.sender;
     products[index] = _product;
  }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}

  function getProductPrice(uint _productId) external view returns(uint) {
    Product memory _product = findProductById(_productId);
    return _product.price;
  }
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }

  function getProductRetailer(uint _productId) external view returns(address) {
    Product memory _product = findProductById(_productId);
    return _product.retailer;
  }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
  
  function getProductBuyer(uint _productId) external view returns(address) {
    Product memory _product = findProductById(_productId);
    return _product.buyer;
  }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  
  function isPurchased(uint _productId) external view returns(bool) {
    Product memory _product = findProductById(_productId);
    return _product.purchased;
  }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
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
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
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
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }

  function findProductAndIndexById(uint _productId) internal view returns(Product memory, uint) {
    for(uint i = 0; i < products.length; i++) {
       if(products[i].id == _productId){
         return (products[i], i);
       }
    }
    
    return (Product(0, 1, address(0), address(0), address(0), false), 0);
  }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  
  function findProductById(uint _productId) internal view returns(Product memory) {
    for(uint i = 0; i < products.length; i++) {
       if(products[i].id == _productId){
         return products[i];
       }
    }
    
    return Product(0, 1, address(0), address(0), address(0), false);
  }
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  
  
}