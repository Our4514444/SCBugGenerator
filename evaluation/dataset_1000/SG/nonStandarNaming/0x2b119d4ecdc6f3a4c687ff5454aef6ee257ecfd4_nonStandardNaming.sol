                                                                 

pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;

                                                                                                                                                                                                                        
contract CarefulMath {

                                                                   
    enum MathError {
        NO_ERROR,
        DIVISION_BY_ZERO,
        INTEGER_OVERFLOW,
        INTEGER_UNDERFLOW
    }

                                                                               
    function MULUINT570(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return (MathError.NO_ERROR, 0);
        }

        uint c = a * b;

        if (c / a != b) {
            return (MathError.INTEGER_OVERFLOW, 0);
        } else {
            return (MathError.NO_ERROR, c);
        }
    }

                                                                                   
    function DIVUINT967(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        if (b == 0) {
            return (MathError.DIVISION_BY_ZERO, 0);
        }

        return (MathError.NO_ERROR, a / b);
    }

                                                                                                                           
    function SUBUINT334(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        if (b <= a) {
            return (MathError.NO_ERROR, a - b);
        } else {
            return (MathError.INTEGER_UNDERFLOW, 0);
        }
    }

                                                                         
    function ADDUINT110(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;

        if (c >= a) {
            return (MathError.NO_ERROR, c);
        } else {
            return (MathError.INTEGER_OVERFLOW, 0);
        }
    }

                                                         
    function ADDTHENSUBUINT655(uint a, uint b, uint c) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err0, uint sum) = ADDUINT110(a, b);

        if (err0 != MathError.NO_ERROR) {
            return (err0, 0);
        }

        return SUBUINT334(sum, c);
    }
}

contract Exponential is CarefulMath {
    uint constant expscale836 = 1e18;	//inject NONSTANDARD NAMING
    uint constant doublescale174 = 1e36;	//inject NONSTANDARD NAMING
    uint constant halfexpscale35 = expscale836/2;	//inject NONSTANDARD NAMING
    uint constant mantissaone33 = expscale836;	//inject NONSTANDARD NAMING

    struct Exp {
        uint mantissa;
    }

    struct Double {
        uint mantissa;
    }

                                                                                                                                                                                                   
    function GETEXP842(uint num, uint denom) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err0, uint scaledNumerator) = MULUINT570(num, expscale836);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        (MathError err1, uint rational) = DIVUINT967(scaledNumerator, denom);
        if (err1 != MathError.NO_ERROR) {
            return (err1, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: rational}));
    }

                                                                               
    function ADDEXP949(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError error, uint result) = ADDUINT110(a.mantissa, b.mantissa);

        return (error, Exp({mantissa: result}));
    }

                                                                                    
    function SUBEXP508(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError error, uint result) = SUBUINT334(a.mantissa, b.mantissa);

        return (error, Exp({mantissa: result}));
    }

                                                                             
    function MULSCALAR978(Exp memory a, uint scalar) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err0, uint scaledMantissa) = MULUINT570(a.mantissa, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: scaledMantissa}));
    }

                                                                                                     
    function MULSCALARTRUNCATE106(Exp memory a, uint scalar) pure internal returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory product) = MULSCALAR978(a, scalar);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return (MathError.NO_ERROR, TRUNCATE192(product));
    }

                                                                                                                                     
    function MULSCALARTRUNCATEADDUINT676(Exp memory a, uint scalar, uint addend) pure internal returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory product) = MULSCALAR978(a, scalar);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return ADDUINT110(TRUNCATE192(product), addend);
    }

                                                                           
    function DIVSCALAR940(Exp memory a, uint scalar) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err0, uint descaledMantissa) = DIVUINT967(a.mantissa, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: descaledMantissa}));
    }

                                                                           
    function DIVSCALARBYEXP980(uint scalar, Exp memory divisor) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                                 
        (MathError err0, uint numerator) = MULUINT570(expscale836, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }
        return GETEXP842(numerator, divisor.mantissa);
    }

                                                                                                   
    function DIVSCALARBYEXPTRUNCATE2(uint scalar, Exp memory divisor) pure internal returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory fraction) = DIVSCALARBYEXP980(scalar, divisor);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return (MathError.NO_ERROR, TRUNCATE192(fraction));
    }

                                                                                     
    function MULEXP449(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING

        (MathError err0, uint doubleScaledProduct) = MULUINT570(a.mantissa, b.mantissa);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        // We add half the scale before dividing so that we get rounding instead of truncation.
        //  See "Listing 6" and text above it at https://accu.org/index.php/journals/1717
        // Without this change, a result like 6.6...e-19 will be truncated to 0 instead of being rounded to 1e-18.
        (MathError err1, uint doubleScaledProductWithHalfScale) = ADDUINT110(halfexpscale35, doubleScaledProduct);
        if (err1 != MathError.NO_ERROR) {
            return (err1, Exp({mantissa: 0}));
        }

        (MathError err2, uint product) = DIVUINT967(doubleScaledProductWithHalfScale, expscale836);
        // The only error `div` can return is MathError.DIVISION_BY_ZERO but we control `expScale` and it is not zero.
        assert(err2 == MathError.NO_ERROR);

        return (MathError.NO_ERROR, Exp({mantissa: product}));
    }

                                                                                                           
    function MULEXP449(uint a, uint b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        return MULEXP449(Exp({mantissa: a}), Exp({mantissa: b}));
    }

                                                                                       
    function MULEXP319(Exp memory a, Exp memory b, Exp memory c) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory ab) = MULEXP449(a, b);
        if (err != MathError.NO_ERROR) {
            return (err, ab);
        }
        return MULEXP449(ab, c);
    }

                                                                                                                                                                                                                                 
    function DIVEXP734(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        return GETEXP842(a.mantissa, b.mantissa);
    }

                                                                                                                                                 
    function TRUNCATE192(Exp memory exp) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        // Note: We are not using careful math here as we're performing a division that cannot fail
        return exp.mantissa / expscale836;
    }

                                                                        
    function LESSTHANEXP245(Exp memory left, Exp memory right) pure internal returns (bool) {	//inject NONSTANDARD NAMING
        return left.mantissa < right.mantissa;
    }

                                                            
    function LESSTHANOREQUALEXP59(Exp memory left, Exp memory right) pure internal returns (bool) {	//inject NONSTANDARD NAMING
        return left.mantissa <= right.mantissa;
    }

                                                           
    function GREATERTHANEXP558(Exp memory left, Exp memory right) pure internal returns (bool) {	//inject NONSTANDARD NAMING
        return left.mantissa > right.mantissa;
    }

                                                               
    function ISZEROEXP854(Exp memory value) pure internal returns (bool) {	//inject NONSTANDARD NAMING
        return value.mantissa == 0;
    }

    function SAFE224241(uint n, string memory errorMessage) pure internal returns (uint224) {	//inject NONSTANDARD NAMING
        require(n < 2**224, errorMessage);
        return uint224(n);
    }

    function SAFE32463(uint n, string memory errorMessage) pure internal returns (uint32) {	//inject NONSTANDARD NAMING
        require(n < 2**32, errorMessage);
        return uint32(n);
    }

    function ADD_954(Exp memory a, Exp memory b) pure internal returns (Exp memory) {	//inject NONSTANDARD NAMING
        return Exp({mantissa: ADD_954(a.mantissa, b.mantissa)});
    }

    function ADD_954(Double memory a, Double memory b) pure internal returns (Double memory) {	//inject NONSTANDARD NAMING
        return Double({mantissa: ADD_954(a.mantissa, b.mantissa)});
    }

    function ADD_954(uint a, uint b) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        return ADD_954(a, b, "addition overflow");
    }

    function ADD_954(uint a, uint b, string memory errorMessage) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, errorMessage);
        return c;
    }

    function SUB_253(Exp memory a, Exp memory b) pure internal returns (Exp memory) {	//inject NONSTANDARD NAMING
        return Exp({mantissa: SUB_253(a.mantissa, b.mantissa)});
    }

    function SUB_253(Double memory a, Double memory b) pure internal returns (Double memory) {	//inject NONSTANDARD NAMING
        return Double({mantissa: SUB_253(a.mantissa, b.mantissa)});
    }

    function SUB_253(uint a, uint b) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        return SUB_253(a, b, "subtraction underflow");
    }

    function SUB_253(uint a, uint b, string memory errorMessage) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        return a - b;
    }

    function MUL_391(Exp memory a, Exp memory b) pure internal returns (Exp memory) {	//inject NONSTANDARD NAMING
        return Exp({mantissa: MUL_391(a.mantissa, b.mantissa) / expscale836});
    }

    function MUL_391(Exp memory a, uint b) pure internal returns (Exp memory) {	//inject NONSTANDARD NAMING
        return Exp({mantissa: MUL_391(a.mantissa, b)});
    }

    function MUL_391(uint a, Exp memory b) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        return MUL_391(a, b.mantissa) / expscale836;
    }

    function MUL_391(Double memory a, Double memory b) pure internal returns (Double memory) {	//inject NONSTANDARD NAMING
        return Double({mantissa: MUL_391(a.mantissa, b.mantissa) / doublescale174});
    }

    function MUL_391(Double memory a, uint b) pure internal returns (Double memory) {	//inject NONSTANDARD NAMING
        return Double({mantissa: MUL_391(a.mantissa, b)});
    }

    function MUL_391(uint a, Double memory b) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        return MUL_391(a, b.mantissa) / doublescale174;
    }

    function MUL_391(uint a, uint b) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        return MUL_391(a, b, "multiplication overflow");
    }

    function MUL_391(uint a, uint b, string memory errorMessage) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0 || b == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, errorMessage);
        return c;
    }

    function DIV_511(Exp memory a, Exp memory b) pure internal returns (Exp memory) {	//inject NONSTANDARD NAMING
        return Exp({mantissa: DIV_511(MUL_391(a.mantissa, expscale836), b.mantissa)});
    }

    function DIV_511(Exp memory a, uint b) pure internal returns (Exp memory) {	//inject NONSTANDARD NAMING
        return Exp({mantissa: DIV_511(a.mantissa, b)});
    }

    function DIV_511(uint a, Exp memory b) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        return DIV_511(MUL_391(a, expscale836), b.mantissa);
    }

    function DIV_511(Double memory a, Double memory b) pure internal returns (Double memory) {	//inject NONSTANDARD NAMING
        return Double({mantissa: DIV_511(MUL_391(a.mantissa, doublescale174), b.mantissa)});
    }

    function DIV_511(Double memory a, uint b) pure internal returns (Double memory) {	//inject NONSTANDARD NAMING
        return Double({mantissa: DIV_511(a.mantissa, b)});
    }

    function DIV_511(uint a, Double memory b) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        return DIV_511(MUL_391(a, doublescale174), b.mantissa);
    }

    function DIV_511(uint a, uint b) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        return DIV_511(a, b, "divide by zero");
    }

    function DIV_511(uint a, uint b, string memory errorMessage) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        return a / b;
    }

    function FRACTION284(uint a, uint b) pure internal returns (Double memory) {	//inject NONSTANDARD NAMING
        return Double({mantissa: DIV_511(MUL_391(a, doublescale174), b)});
    }
}

contract CToken {
    function BALANCEOF460(address) public view returns (uint);	//inject NONSTANDARD NAMING
    function BORROWINDEX759() public view returns (uint);	//inject NONSTANDARD NAMING
    function BORROWBALANCESTORED295(address) public view returns(uint);	//inject NONSTANDARD NAMING
}

contract Compotroller {
    struct CompMarketState {
        uint224 index;
        uint32 block;
    }
    
    function COMPSUPPLYSTATE1000(address) public returns (CompMarketState memory);	//inject NONSTANDARD NAMING
    function COMPSUPPLIERINDEX633(address,address) public returns (uint);	//inject NONSTANDARD NAMING
    function COMPACCRUED960(address) public returns (uint);	//inject NONSTANDARD NAMING
    
    function COMPBORROWSTATE509(address) public returns (CompMarketState memory);	//inject NONSTANDARD NAMING
    function COMPBORROWERINDEX282(address,address) public returns (uint);	//inject NONSTANDARD NAMING
}

contract CompBalance is Exponential {
    Compotroller public comp = Compotroller(0x3d9819210A31b4961b30EF54bE2aeD79B9c9Cd3B);
    
    uint224 public constant compinitialindex417 = 1e36;	//inject NONSTANDARD NAMING
    
    function GETBALANCE271(address _user, address[] memory _cTokens) public returns (uint) {	//inject NONSTANDARD NAMING
        uint compBalance = 0;
        
        for(uint i = 0; i < _cTokens.length; ++i) {
            compBalance += GETSUPPYBALANCE137(_cTokens[i], _user);
            compBalance += GETBORROWBALANCE323(_cTokens[i], _user);
        }
        
        return compBalance;
    }
    

    function GETSUPPYBALANCE137(address _cToken, address _supplier) public returns (uint supplierAccrued) {	//inject NONSTANDARD NAMING
        Compotroller.CompMarketState memory supplyState = comp.COMPSUPPLYSTATE1000(_cToken);
        Double memory supplyIndex = Double({mantissa: supplyState.index});
        Double memory supplierIndex = Double({mantissa: comp.COMPSUPPLIERINDEX633(_cToken, _supplier)});
        
        if (supplierIndex.mantissa == 0 && supplyIndex.mantissa > 0) {
            supplierIndex.mantissa = compinitialindex417;
        }

        Double memory deltaIndex = SUB_253(supplyIndex, supplierIndex);
        uint supplierTokens = CToken(_cToken).BALANCEOF460(_supplier);
        uint supplierDelta = MUL_391(supplierTokens, deltaIndex);
        supplierAccrued = ADD_954(comp.COMPACCRUED960(_supplier), supplierDelta);
    }
    
    function GETBORROWBALANCE323(address _cToken, address _borrower) public returns (uint borrowerAccrued) {	//inject NONSTANDARD NAMING
        Compotroller.CompMarketState memory borrowState = comp.COMPBORROWSTATE509(_cToken);
        Double memory borrowIndex = Double({mantissa: borrowState.index});
        Double memory borrowerIndex = Double({mantissa: comp.COMPBORROWERINDEX282(_cToken, _borrower)});
        
        Exp memory marketBorrowIndex = Exp({mantissa: CToken(_cToken).BORROWINDEX759()});

        if (borrowerIndex.mantissa > 0) {
            Double memory deltaIndex = SUB_253(borrowIndex, borrowerIndex);
            uint borrowerAmount = DIV_511(CToken(_cToken).BORROWBALANCESTORED295(_borrower), marketBorrowIndex);
            uint borrowerDelta = MUL_391(borrowerAmount, deltaIndex);
            borrowerAccrued = ADD_954(comp.COMPACCRUED960(_borrower), borrowerDelta);
        }
    }
}