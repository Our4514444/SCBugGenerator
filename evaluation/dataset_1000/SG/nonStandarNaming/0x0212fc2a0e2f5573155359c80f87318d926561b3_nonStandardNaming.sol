                                                                 

pragma solidity 0.5.13;

contract Laurea {
    
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
    
    School public school;
    mapping(bytes32 => CertificadoAluno) public certificados;
    
    event STUDENTLAURATED349(string indexed codigoCurso, string indexed cpf, string nomeCurso, string nomeAluno, bytes32 hashCertificado);	//inject NONSTANDARD NAMING
    
    constructor(string memory _name, string memory _taxID, address _schoolAddress) public {
        laurea = msg.sender;
        school = School(_name, _taxID, _schoolAddress);
    }
    
    function EDITSCHOOL223(string memory _name, string memory _taxID, address _schoolAddress) public {	//inject NONSTANDARD NAMING
        require (msg.sender == school.schoolAddress || msg.sender == laurea);
        school = School(_name, _taxID, _schoolAddress);
    }
    
    function ADDCERTIFICADO90(string memory _cpf, string memory _codigoCurso, string memory _nomeAluno, string memory _nomeCurso, string memory  _dataInicioFim,  uint8 _cargaHoraria) public returns (bytes32) {	//inject NONSTANDARD NAMING
        require (msg.sender == school.schoolAddress || msg.sender == laurea);
        bytes32 hashCertificado = keccak256(abi.encodePacked(_cpf, _codigoCurso));
        CertificadoAluno memory ca = CertificadoAluno(_cpf, _codigoCurso, _nomeAluno, _nomeCurso, _dataInicioFim, _cargaHoraria, hashCertificado, true);
        certificados[hashCertificado] = ca;
        emit STUDENTLAURATED349 (ca.codigoCurso, ca.cpf, ca.nomeAluno, ca.nomeCurso, hashCertificado);
        return hashCertificado;
    }
    
    function ALTERARCERTIFICADO230 (bytes32 _hash, string memory _nomeAluno, string memory _nomeCurso, string memory  _dataInicioFim,  uint8 _cargaHoraria ) public returns(bool) {	//inject NONSTANDARD NAMING
        require (msg.sender == school.schoolAddress || msg.sender == laurea);
        CertificadoAluno storage ca = certificados[_hash];
        ca.nomeAluno = _nomeAluno;
        ca.nomeCurso = _nomeCurso;
        ca.dataInicioFim = _dataInicioFim;
        ca.cargaHoraria = _cargaHoraria;
        emit STUDENTLAURATED349 (ca.codigoCurso, ca.cpf, ca.nomeAluno, ca.nomeCurso, _hash);
        return true;
    }
    
    function ALTERARESTADOCERTIFICADO584 (bytes32 _hash) public returns(bool) {	//inject NONSTANDARD NAMING
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
    
    function BUSCARCERTIFICADO582(string memory _cpf, string memory _codigoCurso) public view returns (string memory, string memory, string memory, string memory, string memory, uint, bytes32) {	//inject NONSTANDARD NAMING
        CertificadoAluno memory ca = certificados[keccak256(abi.encodePacked(_cpf, _codigoCurso))];
        require(ca.exists == true, "Certificado n1o localizado");
        return (ca.cpf, ca.codigoCurso, ca.nomeAluno, ca.nomeCurso, ca.dataInicioFim, ca.cargaHoraria, ca.hashCertificado);
    }
    
    function BUSCARCERTIFICADOHASH837(bytes32 _hash) public view returns (string memory, string memory, string memory, string memory, string memory, uint, bytes32) {	//inject NONSTANDARD NAMING
        CertificadoAluno memory ca = certificados[_hash];
        require(ca.exists == true, "Certificado n1o localizado");
        return (ca.cpf, ca.codigoCurso, ca.nomeAluno, ca.nomeCurso, ca.dataInicioFim, ca.cargaHoraria, ca.hashCertificado);
    }
}