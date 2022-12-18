pragma solidity 0.5.2;

                                                                                         
library SafeMath {

                                                               
  function MUL715(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }
    c = a * b;
    assert(c / a == b);
    return c;
  }

                                                                             
  function DIV291(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    // uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return a / b;
  }

                                                                                                           
  function SUB409(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

                                                         
  function ADD754(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
    c = a + b;
    assert(c >= a);
    return c;
  }
}

                                                                                        
interface IERC20 {
  function TOTALSUPPLY913() external view returns (uint256);	//inject NONSTANDARD NAMING

  function BALANCEOF992(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

  function ALLOWANCE606(address owner, address spender)	//inject NONSTANDARD NAMING
    external view returns (uint256);

  function TRANSFER479(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

  function APPROVE73(address spender, uint256 value)	//inject NONSTANDARD NAMING
    external returns (bool);

  function TRANSFERFROM53(address from, address to, uint256 value)	//inject NONSTANDARD NAMING
    external returns (bool);

  event TRANSFER504(	//inject NONSTANDARD NAMING
    address indexed from,
    address indexed to,
    uint256 value
  );

  event APPROVAL54(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

contract PurchaseContract {
    
  using SafeMath for uint256;
  
  uint purchasedProductsCount;
  uint unPurchasedProductsCount;

  IERC20 token;

  struct Product {
    uint id;
    uint price;
    address buyer;
    address retailer;
    address model;
    bool purchased;
  }

  Product[] products;
  
  event PURCHASE217(uint _id, uint _price, address _buyer, address _retailer, address _model);	//inject NONSTANDARD NAMING
  
  constructor(address _tokenAddress) public {
    token = IERC20(_tokenAddress);
  }

  function ADDPRODUCT888(uint _productId, uint _price) external {	//inject NONSTANDARD NAMING
    require(_productId > 0);
    require(_price > 0);

    products.push(Product(_productId, _price, address(0), msg.sender, address(0), false));
    unPurchasedProductsCount = unPurchasedProductsCount.ADD754(1);
  }

  function ADDPRODUCTS625(uint[] calldata _productIds, uint[] calldata _prices) external {	//inject NONSTANDARD NAMING
    require(_productIds.length > 0);
    require(_prices.length > 0);
    require(_productIds.length == _prices.length);

    for(uint i = 0; i < _productIds.length; i++) {
      require(_productIds[i] > 0 && _prices[i] > 0); 
      products.push(Product(_productIds[i], _prices[i], address(0), msg.sender, address(0), false));
      unPurchasedProductsCount = unPurchasedProductsCount.ADD754(1);
    }
  }
  
  function PURCHASEREQUEST939(uint _productId) external {	//inject NONSTANDARD NAMING
    (Product memory _product, uint index) = FINDPRODUCTANDINDEXBYID571(_productId);
    require(_productId != 0 && _product.id == _productId && _product.purchased == false);
    require(_product.buyer == address(0));
    require(_product.price <= token.BALANCEOF992(msg.sender));
    _product.buyer = msg.sender;
     products[index] = _product;
  }

  function GETPRODUCTPRICE111(uint _productId) external view returns(uint) {	//inject NONSTANDARD NAMING
    Product memory _product = FINDPRODUCTBYID326(_productId);
    return _product.price;
  }

  function GETPRODUCTRETAILER723(uint _productId) external view returns(address) {	//inject NONSTANDARD NAMING
    Product memory _product = FINDPRODUCTBYID326(_productId);
    return _product.retailer;
  }
  
  function GETPRODUCTBUYER433(uint _productId) external view returns(address) {	//inject NONSTANDARD NAMING
    Product memory _product = FINDPRODUCTBYID326(_productId);
    return _product.buyer;
  }
  
  function ISPURCHASED261(uint _productId) external view returns(bool) {	//inject NONSTANDARD NAMING
    Product memory _product = FINDPRODUCTBYID326(_productId);
    return _product.purchased;
  }

  function GETUNPURCHASEDPRODUCTS204() external view returns(uint[] memory) {	//inject NONSTANDARD NAMING
    uint index;
    bool isEmpty = true;
    uint[] memory results = new uint[](unPurchasedProductsCount);

    for(uint i = 0; i < products.length; i++) {
       if(!products[i].purchased){
         results[index] = products[i].id;
         index = index.ADD754(1);
         isEmpty = false;
       }
    }
    
    if(isEmpty) {
        return new uint[](1);
    }
    
    return results;
  }
  
  function GETPURCHASEDPRODUCTS374() external view returns(uint[] memory) {	//inject NONSTANDARD NAMING
    uint index;
    bool isEmpty = true;
    uint[] memory results = new uint[](purchasedProductsCount);

    for(uint i = 0; i < products.length; i++) {
       if(products[i].purchased){
         results[index] = products[i].id;
         index = index.ADD754(1);
         isEmpty = false;
       }
    }
    
    if(isEmpty) {
        return new uint[](1);
    }

    return results;
  }

  function CONFIRMPURCHASE891(uint _productId, address _model) external {	//inject NONSTANDARD NAMING
    require(_productId != 0);

    (Product memory _product, uint index) = FINDPRODUCTANDINDEXBYID571(_productId);

    require(msg.sender == _product.retailer && _product.buyer != address(0) && token.ALLOWANCE606(_product.buyer, address(this)) >= _product.price); 

    _product.model = _model;

    token.TRANSFERFROM53(_product.buyer, _product.retailer, _product.price.MUL715(90).DIV291(100));
    token.TRANSFERFROM53(_product.buyer, _product.model, _product.price.MUL715(6).DIV291(100));
    
    _product.purchased = true;
    purchasedProductsCount = purchasedProductsCount.ADD754(1);
    unPurchasedProductsCount = unPurchasedProductsCount.SUB409(1);
    
    products[index] = _product;

    emit PURCHASE217(_productId, _product.price, _product.buyer, _product.retailer, _model);
  }

  function FINDPRODUCTANDINDEXBYID571(uint _productId) internal view returns(Product memory, uint) {	//inject NONSTANDARD NAMING
    for(uint i = 0; i < products.length; i++) {
       if(products[i].id == _productId){
         return (products[i], i);
       }
    }
    
    return (Product(0, 1, address(0), address(0), address(0), false), 0);
  }
  
  function FINDPRODUCTBYID326(uint _productId) internal view returns(Product memory) {	//inject NONSTANDARD NAMING
    for(uint i = 0; i < products.length; i++) {
       if(products[i].id == _productId){
         return products[i];
       }
    }
    
    return Product(0, 1, address(0), address(0), address(0), false);
  }
  
  
}