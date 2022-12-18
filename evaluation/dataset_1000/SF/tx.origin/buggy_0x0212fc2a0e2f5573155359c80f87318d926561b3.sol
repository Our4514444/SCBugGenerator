/**
 *Submitted for verification at Etherscan.io on 2019-12-02
*/

pragma solidity 0.5.13;

contract Laurea {
    
  function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
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
    
  function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
  School public school;
  function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
  mapping(bytes32 => CertificadoAluno) public certificados;
    
  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  event StudentLaurated(string indexed codigoCurso, string indexed cpf, string nomeCurso, string nomeAluno, bytes32 hashCertificado);
    
    constructor(string memory _name, string memory _taxID, address _schoolAddress) public {
        laurea = msg.sender;
        school = School(_name, _taxID, _schoolAddress);
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
    
    function editSchool(string memory _name, string memory _taxID, address _schoolAddress) public {
        require (msg.sender == school.schoolAddress || msg.sender == laurea);
        school = School(_name, _taxID, _schoolAddress);
    }
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
    
    function addCertificado(string memory _cpf, string memory _codigoCurso, string memory _nomeAluno, string memory _nomeCurso, string memory  _dataInicioFim,  uint8 _cargaHoraria) public returns (bytes32) {
        require (msg.sender == school.schoolAddress || msg.sender == laurea);
        bytes32 hashCertificado = keccak256(abi.encodePacked(_cpf, _codigoCurso));
        CertificadoAluno memory ca = CertificadoAluno(_cpf, _codigoCurso, _nomeAluno, _nomeCurso, _dataInicioFim, _cargaHoraria, hashCertificado, true);
        certificados[hashCertificado] = ca;
        emit StudentLaurated (ca.codigoCurso, ca.cpf, ca.nomeAluno, ca.nomeCurso, hashCertificado);
        return hashCertificado;
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
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
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
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
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
    
    function buscarCertificado(string memory _cpf, string memory _codigoCurso) public view returns (string memory, string memory, string memory, string memory, string memory, uint, bytes32) {
        CertificadoAluno memory ca = certificados[keccak256(abi.encodePacked(_cpf, _codigoCurso))];
        require(ca.exists == true, "Certificado não localizado");
        return (ca.cpf, ca.codigoCurso, ca.nomeAluno, ca.nomeCurso, ca.dataInicioFim, ca.cargaHoraria, ca.hashCertificado);
    }
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
    
    function buscarCertificadoHash(bytes32 _hash) public view returns (string memory, string memory, string memory, string memory, string memory, uint, bytes32) {
        CertificadoAluno memory ca = certificados[_hash];
        require(ca.exists == true, "Certificado não localizado");
        return (ca.cpf, ca.codigoCurso, ca.nomeAluno, ca.nomeCurso, ca.dataInicioFim, ca.cargaHoraria, ca.hashCertificado);
    }
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
}