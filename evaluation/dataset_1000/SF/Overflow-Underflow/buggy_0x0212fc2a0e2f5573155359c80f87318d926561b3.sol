/**
 *Submitted for verification at Etherscan.io on 2019-12-02
*/

pragma solidity 0.5.13;

contract Laurea {
    
  function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
  address laurea; 

    struct School {
        string name;
        string taxID;
        address schoolAddress;
    }
    
    struct CertificadoAluno {
        string cpf;
        string codigoCurso;
        string nomeAluno;
        string nomeCurso;
        string dataInicioFim;
        uint8 cargaHoraria;
        bytes32 hashCertificado;
        bool exists;
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
  School public school;
  mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
  mapping(bytes32 => CertificadoAluno) public certificados;
    
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event StudentLaurated(string indexed codigoCurso, string indexed cpf, string nomeCurso, string nomeAluno, bytes32 hashCertificado);
    
    constructor(string memory _name, string memory _taxID, address _schoolAddress) public {
        laurea = msg.sender;
        school = School(_name, _taxID, _schoolAddress);
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function editSchool(string memory _name, string memory _taxID, address _schoolAddress) public {
        require (msg.sender == school.schoolAddress || msg.sender == laurea);
        school = School(_name, _taxID, _schoolAddress);
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
    
    function addCertificado(string memory _cpf, string memory _codigoCurso, string memory _nomeAluno, string memory _nomeCurso, string memory  _dataInicioFim,  uint8 _cargaHoraria) public returns (bytes32) {
        require (msg.sender == school.schoolAddress || msg.sender == laurea);
        bytes32 hashCertificado = keccak256(abi.encodePacked(_cpf, _codigoCurso));
        CertificadoAluno memory ca = CertificadoAluno(_cpf, _codigoCurso, _nomeAluno, _nomeCurso, _dataInicioFim, _cargaHoraria, hashCertificado, true);
        certificados[hashCertificado] = ca;
        emit StudentLaurated (ca.codigoCurso, ca.cpf, ca.nomeAluno, ca.nomeCurso, hashCertificado);
        return hashCertificado;
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function alterarCertificado (bytes32 _hash, string memory _nomeAluno, string memory _nomeCurso, string memory  _dataInicioFim,  uint8 _cargaHoraria ) public returns(bool) {
        require (msg.sender == school.schoolAddress || msg.sender == laurea);
        CertificadoAluno storage ca = certificados[_hash];
        ca.nomeAluno = _nomeAluno;
        ca.nomeCurso = _nomeCurso;
        ca.dataInicioFim = _dataInicioFim;
        ca.cargaHoraria = _cargaHoraria;
        emit StudentLaurated (ca.codigoCurso, ca.cpf, ca.nomeAluno, ca.nomeCurso, _hash);
        return true;
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
    
    function alterarEstadoCertificado (bytes32 _hash) public returns(bool) {
        require (msg.sender == school.schoolAddress || msg.sender == laurea);
        CertificadoAluno storage ca = certificados[_hash];
        if (ca.exists == true) {
            ca.exists = false;
            return true;
        } 
        else { 
            ca.exists = true;
            return true;
        }
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
    
    function buscarCertificado(string memory _cpf, string memory _codigoCurso) public view returns (string memory, string memory, string memory, string memory, string memory, uint, bytes32) {
        CertificadoAluno memory ca = certificados[keccak256(abi.encodePacked(_cpf, _codigoCurso))];
        require(ca.exists == true, "Certificado não localizado");
        return (ca.cpf, ca.codigoCurso, ca.nomeAluno, ca.nomeCurso, ca.dataInicioFim, ca.cargaHoraria, ca.hashCertificado);
    }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function buscarCertificadoHash(bytes32 _hash) public view returns (string memory, string memory, string memory, string memory, string memory, uint, bytes32) {
        CertificadoAluno memory ca = certificados[_hash];
        require(ca.exists == true, "Certificado não localizado");
        return (ca.cpf, ca.codigoCurso, ca.nomeAluno, ca.nomeCurso, ca.dataInicioFim, ca.cargaHoraria, ca.hashCertificado);
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