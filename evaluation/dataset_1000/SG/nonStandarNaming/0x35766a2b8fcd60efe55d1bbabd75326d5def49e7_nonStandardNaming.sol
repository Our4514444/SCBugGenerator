                                                                 

// File: @aragon/court/contracts/lib/os/IsContract.sol

// Brought from https://github.com/aragon/aragonOS/blob/v4.3.0/contracts/common/IsContract.sol
// Adapted to use pragma ^0.5.8 and satisfy our linter rules

pragma solidity ^0.5.8;


contract IsContract {
                                                                                                                                                                                                                                                                                                                                        
    function ISCONTRACT909(address _target) internal view returns (bool) {	//inject NONSTANDARD NAMING
        if (_target == address(0)) {
            return false;
        }

        uint256 size;
        assembly { size := extcodesize(_target) }
        return size > 0;
    }
}

// File: @aragon/court/contracts/lib/os/ERC20.sol

// Brought from https://github.com/aragon/aragonOS/blob/v4.3.0/contracts/lib/token/ERC20.sol
// Adapted to use pragma ^0.5.8 and satisfy our linter rules

pragma solidity ^0.5.8;


                                                                                        
contract ERC20 {
    function TOTALSUPPLY269() public view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF708(address _who) public view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE719(address _owner, address _spender) public view returns (uint256);	//inject NONSTANDARD NAMING

    function TRANSFER338(address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE249(address _spender, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM388(address _from, address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

    event TRANSFER185(	//inject NONSTANDARD NAMING
        address indexed from,
        address indexed to,
        uint256 value
    );

    event APPROVAL298(	//inject NONSTANDARD NAMING
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

// File: @aragon/court/contracts/lib/os/SafeERC20.sol

// Brought from https://github.com/aragon/aragonOS/blob/v4.3.0/contracts/common/SafeERC20.sol
// Adapted to use pragma ^0.5.8 and satisfy our linter rules

pragma solidity ^0.5.8;



library SafeERC20 {
    // Before 0.5, solidity has a mismatch between `address.transfer()` and `token.transfer()`:
    // https://github.com/ethereum/solidity/issues/3544
    bytes4 private constant transfer_selector542 = 0xa9059cbb;	//inject NONSTANDARD NAMING

                                                                                                                                                                           
    function SAFETRANSFER328(ERC20 _token, address _to, uint256 _amount) internal returns (bool) {	//inject NONSTANDARD NAMING
        bytes memory transferCallData = abi.encodeWithSelector(
            transfer_selector542,
            _to,
            _amount
        );
        return INVOKEANDCHECKSUCCESS59(address(_token), transferCallData);
    }

                                                                                                                                                                               
    function SAFETRANSFERFROM434(ERC20 _token, address _from, address _to, uint256 _amount) internal returns (bool) {	//inject NONSTANDARD NAMING
        bytes memory transferFromCallData = abi.encodeWithSelector(
            _token.TRANSFERFROM388.selector,
            _from,
            _to,
            _amount
        );
        return INVOKEANDCHECKSUCCESS59(address(_token), transferFromCallData);
    }

                                                                                                                                                                          
    function SAFEAPPROVE247(ERC20 _token, address _spender, uint256 _amount) internal returns (bool) {	//inject NONSTANDARD NAMING
        bytes memory approveCallData = abi.encodeWithSelector(
            _token.APPROVE249.selector,
            _spender,
            _amount
        );
        return INVOKEANDCHECKSUCCESS59(address(_token), approveCallData);
    }

    function INVOKEANDCHECKSUCCESS59(address _addr, bytes memory _calldata) private returns (bool) {	//inject NONSTANDARD NAMING
        bool ret;
        assembly {
            let ptr := mload(0x40)    // free memory pointer

            let success := call(
                gas,                  // forward all gas
                _addr,                // address
                0,                    // no value
                add(_calldata, 0x20), // calldata start
                mload(_calldata),     // calldata length
                ptr,                  // write output over free memory
                0x20                  // uint256 return
            )

            if gt(success, 0) {
            // Check number of bytes returned from last function call
                switch returndatasize

                // No bytes returned: assume success
                case 0 {
                    ret := 1
                }

                // 32 bytes returned: check if non-zero
                case 0x20 {
                // Only return success if returned data was true
                // Already have output in ptr
                    ret := eq(mload(ptr), 1)
                }

                // Not sure what was returned: don't mark as success
                default { }
            }
        }
        return ret;
    }
}

// File: @aragon/court/contracts/standards/ApproveAndCall.sol

pragma solidity ^0.5.8;


interface ApproveAndCallFallBack {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function RECEIVEAPPROVAL828(address _from, uint256 _amount, address _token, bytes calldata _data) external;	//inject NONSTANDARD NAMING
}

// File: @aragon/court/contracts/standards/ERC900.sol

pragma solidity ^0.5.8;


// Interface for ERC900: https://eips.ethereum.org/EIPS/eip-900
interface ERC900 {
    event STAKED608(address indexed user, uint256 amount, uint256 total, bytes data);	//inject NONSTANDARD NAMING
    event UNSTAKED555(address indexed user, uint256 amount, uint256 total, bytes data);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                  
    function STAKE614(uint256 _amount, bytes calldata _data) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                 
    function STAKEFOR392(address _user, uint256 _amount, bytes calldata _data) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                      
    function UNSTAKE958(uint256 _amount, bytes calldata _data) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                    
    function TOTALSTAKEDFOR740(address _addr) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                            
    function TOTALSTAKED113() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                            
    function TOKEN950() external view returns (address);	//inject NONSTANDARD NAMING

                                                                                                                                                                                
    function SUPPORTSHISTORY204() external pure returns (bool);	//inject NONSTANDARD NAMING
}

// File: contracts/lib/IPresale.sol

pragma solidity ^0.5.8;



interface IPresale {
    function OPEN458() external;	//inject NONSTANDARD NAMING
    function CLOSE124() external;	//inject NONSTANDARD NAMING
    function CONTRIBUTE108(address _contributor, uint256 _value) external payable;	//inject NONSTANDARD NAMING
    function REFUND431(address _contributor, uint256 _vestedPurchaseId) external;	//inject NONSTANDARD NAMING
    function CONTRIBUTIONTOTOKENS327(uint256 _value) external view returns (uint256);	//inject NONSTANDARD NAMING
    function CONTRIBUTIONTOKEN876() external view returns (ERC20);	//inject NONSTANDARD NAMING
}

// File: contracts/lib/uniswap/interfaces/IUniswapExchange.sol

pragma solidity ^0.5.0;

interface IUniswapExchange {
  event TOKENPURCHASE865(address indexed buyer, uint256 indexed eth_sold, uint256 indexed tokens_bought);	//inject NONSTANDARD NAMING
  event ETHPURCHASE549(address indexed buyer, uint256 indexed tokens_sold, uint256 indexed eth_bought);	//inject NONSTANDARD NAMING
  event ADDLIQUIDITY373(address indexed provider, uint256 indexed eth_amount, uint256 indexed token_amount);	//inject NONSTANDARD NAMING
  event REMOVELIQUIDITY730(address indexed provider, uint256 indexed eth_amount, uint256 indexed token_amount);	//inject NONSTANDARD NAMING

                                                                                                                                                            
  function () external payable;

                                                                                                                                                                                                                                                                                                                                                                 
  function GETINPUTPRICE462(uint256 input_amount, uint256 input_reserve, uint256 output_reserve) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                  
  function GETOUTPUTPRICE724(uint256 output_amount, uint256 input_reserve, uint256 output_reserve) external view returns (uint256);	//inject NONSTANDARD NAMING


                                                                                                                                                                                                                                                                                           
  function ETHTOTOKENSWAPINPUT585(uint256 min_tokens, uint256 deadline) external payable returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                          
  function ETHTOTOKENTRANSFERINPUT38(uint256 min_tokens, uint256 deadline, address recipient) external payable returns(uint256);	//inject NONSTANDARD NAMING


                                                                                                                                                                                                                                                                                          
  function ETHTOTOKENSWAPOUTPUT672(uint256 tokens_bought, uint256 deadline) external payable returns(uint256);	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                                                                                                                                          
  function ETHTOTOKENTRANSFEROUTPUT472(uint256 tokens_bought, uint256 deadline, address recipient) external payable returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                       
  function TOKENTOETHSWAPINPUT191(uint256 tokens_sold, uint256 min_eth, uint256 deadline) external returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                  
  function TOKENTOETHTRANSFERINPUT888(uint256 tokens_sold, uint256 min_eth, uint256 deadline, address recipient) external returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                          
  function TOKENTOETHSWAPOUTPUT891(uint256 eth_bought, uint256 max_tokens, uint256 deadline) external returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                   
  function TOKENTOETHTRANSFEROUTPUT848(uint256 eth_bought, uint256 max_tokens, uint256 deadline, address recipient) external returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function TOKENTOTOKENSWAPINPUT555(	//inject NONSTANDARD NAMING
    uint256 tokens_sold, 
    uint256 min_tokens_bought, 
    uint256 min_eth_bought, 
    uint256 deadline, 
    address token_addr) 
    external returns (uint256);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function TOKENTOTOKENTRANSFERINPUT651(	//inject NONSTANDARD NAMING
    uint256 tokens_sold, 
    uint256 min_tokens_bought, 
    uint256 min_eth_bought, 
    uint256 deadline, 
    address recipient, 
    address token_addr) 
    external returns (uint256);


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function TOKENTOTOKENSWAPOUTPUT259(	//inject NONSTANDARD NAMING
    uint256 tokens_bought, 
    uint256 max_tokens_sold, 
    uint256 max_eth_sold, 
    uint256 deadline, 
    address token_addr) 
    external returns (uint256);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function TOKENTOTOKENTRANSFEROUTPUT648(	//inject NONSTANDARD NAMING
    uint256 tokens_bought, 
    uint256 max_tokens_sold, 
    uint256 max_eth_sold, 
    uint256 deadline, 
    address recipient, 
    address token_addr) 
    external returns (uint256);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function TOKENTOEXCHANGESWAPINPUT516(	//inject NONSTANDARD NAMING
    uint256 tokens_sold, 
    uint256 min_tokens_bought, 
    uint256 min_eth_bought, 
    uint256 deadline, 
    address exchange_addr) 
    external returns (uint256);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function TOKENTOEXCHANGETRANSFERINPUT427(	//inject NONSTANDARD NAMING
    uint256 tokens_sold, 
    uint256 min_tokens_bought, 
    uint256 min_eth_bought, 
    uint256 deadline, 
    address recipient, 
    address exchange_addr) 
    external returns (uint256);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function TOKENTOEXCHANGESWAPOUTPUT715(	//inject NONSTANDARD NAMING
    uint256 tokens_bought, 
    uint256 max_tokens_sold, 
    uint256 max_eth_sold, 
    uint256 deadline, 
    address exchange_addr) 
    external returns (uint256);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function TOKENTOEXCHANGETRANSFEROUTPUT15(	//inject NONSTANDARD NAMING
    uint256 tokens_bought, 
    uint256 max_tokens_sold, 
    uint256 max_eth_sold, 
    uint256 deadline, 
    address recipient, 
    address exchange_addr) 
    external returns (uint256);


                                                                                                                       

                                                                                                                                                                                                       
  function GETETHTOTOKENINPUTPRICE692(uint256 eth_sold) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                         
  function GETETHTOTOKENOUTPUTPRICE218(uint256 tokens_bought) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                             
  function GETTOKENTOETHINPUTPRICE974(uint256 tokens_sold) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                   
  function GETTOKENTOETHOUTPUTPRICE913(uint256 eth_bought) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                         
  function TOKENADDRESS990() external view returns (address);	//inject NONSTANDARD NAMING

                                                                       
  function FACTORYADDRESS624() external view returns (address);	//inject NONSTANDARD NAMING


                                                                                                                       

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function ADDLIQUIDITY650(uint256 min_liquidity, uint256 max_tokens, uint256 deadline) external payable returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                            
  function REMOVELIQUIDITY813(uint256 amount, uint256 min_eth, uint256 min_tokens, uint256 deadline) external returns (uint256, uint256);	//inject NONSTANDARD NAMING
}

// File: contracts/lib/uniswap/interfaces/IUniswapFactory.sol

pragma solidity ^0.5.0;

interface IUniswapFactory {
  event NEWEXCHANGE991(address indexed token, address indexed exchange);	//inject NONSTANDARD NAMING

  function INITIALIZEFACTORY936(address template) external;	//inject NONSTANDARD NAMING
  function CREATEEXCHANGE932(address token) external returns (address payable);	//inject NONSTANDARD NAMING
  function GETEXCHANGE448(address token) external view returns (address payable);	//inject NONSTANDARD NAMING
  function GETTOKEN800(address token) external view returns (address);	//inject NONSTANDARD NAMING
  function GETTOKENWIHID617(uint256 token_id) external view returns (address);	//inject NONSTANDARD NAMING
}

// File: contracts/CourtPresaleActivate.sol

pragma solidity ^0.5.8;










contract CourtPresaleActivate is IsContract, ApproveAndCallFallBack {
    using SafeERC20 for ERC20;

    string private constant error_not_governor577 = "CPA_NOT_GOVERNOR";	//inject NONSTANDARD NAMING
    string private constant error_token_not_contract907 = "CPA_TOKEN_NOT_CONTRACT";	//inject NONSTANDARD NAMING
    string private constant error_registry_not_contract993 = "CPA_REGISTRY_NOT_CONTRACT";	//inject NONSTANDARD NAMING
    string private constant error_presale_not_contract728 = "CPA_PRESALE_NOT_CONTRACT";	//inject NONSTANDARD NAMING
    string private constant error_uniswap_factory_not_contract536 = "CPA_UNISWAP_FACTORY_NOT_CONTRACT";	//inject NONSTANDARD NAMING
    string private constant error_zero_amount860 = "CPA_ZERO_AMOUNT";	//inject NONSTANDARD NAMING
    string private constant error_token_transfer_failed139 = "CPA_TOKEN_TRANSFER_FAILED";	//inject NONSTANDARD NAMING
    string private constant error_token_approval_failed348 = "CPA_TOKEN_APPROVAL_FAILED";	//inject NONSTANDARD NAMING
    string private constant error_wrong_token936 = "CPA_WRONG_TOKEN";	//inject NONSTANDARD NAMING
    string private constant error_eth_refund457 = "CPA_ETH_REFUND";	//inject NONSTANDARD NAMING
    string private constant error_token_refund586 = "CPA_TOKEN_REFUND";	//inject NONSTANDARD NAMING
    string private constant error_uniswap_unavailable0 = "CPA_UNISWAP_UNAVAILABLE";	//inject NONSTANDARD NAMING
    string private constant error_not_enough_balance207 = "CPA_NOT_ENOUGH_BALANCE";	//inject NONSTANDARD NAMING

    bytes32 internal constant activate_data992 = keccak256("activate(uint256)");	//inject NONSTANDARD NAMING

    address public governor;
    ERC20 public bondedToken;
    ERC900 public registry;
    IPresale public presale;
    IUniswapFactory public uniswapFactory;

    event BOUGHT618(address from, address contributionToken, uint256 buyAmount, uint256 stakedAmount, bool activated);	//inject NONSTANDARD NAMING

    modifier ONLYGOVERNOR553() {	//inject NONSTANDARD NAMING
        require(msg.sender == governor, error_not_governor577);
        _;
    }

    constructor(address _governor, ERC20 _bondedToken, ERC900 _registry, IPresale _presale, IUniswapFactory _uniswapFactory) public {
        require(ISCONTRACT909(address(_bondedToken)), error_token_not_contract907);
        require(ISCONTRACT909(address(_registry)), error_registry_not_contract993);
        require(ISCONTRACT909(address(_presale)), error_presale_not_contract728);
        require(ISCONTRACT909(address(_uniswapFactory)), error_uniswap_factory_not_contract536);

        governor = _governor;
        bondedToken = _bondedToken;
        registry = _registry;
        presale = _presale;
        uniswapFactory = _uniswapFactory;
    }

                                                                                                                                                                                                   
    function () external payable {
        _CONTRIBUTEETH847(1, block.timestamp, _HASDATA502(msg.data));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function RECEIVEAPPROVAL828(address _from, uint256 _amount, address _token, bytes calldata _data) external {	//inject NONSTANDARD NAMING
        require(_amount > 0, error_zero_amount860);
        require(
            _token == msg.sender && _token == address(presale.CONTRIBUTIONTOKEN876()),
            error_wrong_token936
        );

        // move tokens to this contract
        ERC20 token = ERC20(_token);
        require(token.SAFETRANSFERFROM434(_from, address(this), _amount), error_token_transfer_failed139);

        bool activate = _HASDATA502(_data);

        _BUYANDACTIVATEASJUROR539(_from, _amount, token, activate);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function CONTRIBUTEEXTERNALTOKEN228(	//inject NONSTANDARD NAMING
        address _token,
        uint256 _amount,
        uint256 _minTokens,
        uint256 _minEth,
        uint256 _deadline,
        bool _activate
    )
        external
    {
        ERC20 contributionToken = presale.CONTRIBUTIONTOKEN876();
        address contributionTokenAddress = address(contributionToken);
        require(_token != contributionTokenAddress, error_wrong_token936);
        require(_amount > 0, error_zero_amount860);

        // move tokens to this contract
        require(ERC20(_token).SAFETRANSFERFROM434(msg.sender, address(this), _amount), error_token_transfer_failed139);

        // get the Uniswap exchange for the contribution token
        address payable uniswapExchangeAddress = uniswapFactory.GETEXCHANGE448(_token);
        require(uniswapExchangeAddress != address(0), error_uniswap_unavailable0);
        IUniswapExchange uniswapExchange = IUniswapExchange(uniswapExchangeAddress);

        // swap tokens
        ERC20 token = ERC20(_token);
        require(token.SAFEAPPROVE247(address(uniswapExchange), _amount), error_token_approval_failed348);
        uint256 contributionTokenAmount = uniswapExchange.TOKENTOTOKENSWAPINPUT555(
            _amount,
            _minTokens,
            _minEth,
            _deadline,
            contributionTokenAddress
        );

        // buy in presale
        _BUYANDACTIVATEASJUROR539(msg.sender, contributionTokenAmount, contributionToken, _activate);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function CONTRIBUTEETH317(uint256 _minTokens, uint256 _deadline, bool _activate) external payable {	//inject NONSTANDARD NAMING
        _CONTRIBUTEETH847(_minTokens, _deadline, _activate);
    }

                                                                                                                                                                               
    function REFUNDETH565(address payable _recipient, uint256 _amount) external ONLYGOVERNOR553 {	//inject NONSTANDARD NAMING
        require(_amount > 0, error_zero_amount860);
        uint256 selfBalance = address(this).balance;
        require(selfBalance >= _amount, error_not_enough_balance207);

        // solium-disable security/no-call-value
        (bool result,) = _recipient.call.value(_amount)("");
        require(result, error_eth_refund457);
    }

                                                                                                                                                                                                                                 
    function REFUNDTOKEN853(ERC20 _token, address _recipient, uint256 _amount) external ONLYGOVERNOR553 {	//inject NONSTANDARD NAMING
        require(_amount > 0, error_zero_amount860);
        uint256 selfBalance = _token.BALANCEOF708(address(this));
        require(selfBalance >= _amount, error_not_enough_balance207);

        require(_token.SAFETRANSFER328(_recipient, _amount), error_token_refund586);
    }

    function _CONTRIBUTEETH847(uint256 _minTokens, uint256 _deadline, bool _activate) internal {	//inject NONSTANDARD NAMING
        require(msg.value > 0, error_zero_amount860);

        ERC20 contributionToken = presale.CONTRIBUTIONTOKEN876();

        // get the Uniswap exchange for the contribution token
        address payable uniswapExchangeAddress = uniswapFactory.GETEXCHANGE448(address(contributionToken));
        require(uniswapExchangeAddress != address(0), error_uniswap_unavailable0);
        IUniswapExchange uniswapExchange = IUniswapExchange(uniswapExchangeAddress);

        // swap tokens
        uint256 contributionTokenAmount = uniswapExchange.ETHTOTOKENSWAPINPUT585.value(msg.value)(_minTokens, _deadline);

        // buy in presale
        _BUYANDACTIVATEASJUROR539(msg.sender, contributionTokenAmount, contributionToken, _activate);
    }

    function _BUYANDACTIVATEASJUROR539(address _from, uint256 _amount, ERC20 _contributionToken, bool _activate) internal {	//inject NONSTANDARD NAMING
        // approve to presale
        require(_contributionToken.SAFEAPPROVE247(address(presale), _amount), error_token_approval_failed348);

        // buy in presale
        presale.CONTRIBUTE108(address(this), _amount);
        uint256 bondedTokensObtained = presale.CONTRIBUTIONTOTOKENS327(_amount);

        if (_activate) {
            // stake and activate in registry
            require(bondedToken.SAFEAPPROVE247(address(registry), bondedTokensObtained), error_token_approval_failed348);
            registry.STAKEFOR392(_from, bondedTokensObtained, abi.encodePacked(activate_data992));
        } else {
            // send tokens to user's account
            require(bondedToken.SAFETRANSFER328(_from, bondedTokensObtained), error_token_transfer_failed139);
        }

        emit BOUGHT618(_from, address(_contributionToken), _amount, bondedTokensObtained, _activate);
    }

    function _HASDATA502(bytes memory _data) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        return _data.length > 0;
    }
}