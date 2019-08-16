pragma solidity ^0.5.0;

contract Certificacion {
    
    struct Foto {
        string hash;
        string url;
    }
    
    struct Reunion {
        uint id;
        string tema;
        string fecha;
        Foto[] fotos;
    }
    
    mapping (uint => Reunion) reuniones;
    
    function registrarReunion(uint id, string memory tema, string memory fecha) public {
        reuniones[id].id=id;
        reuniones[id].tema=tema;
        reuniones[id].fecha=fecha;
    }
    
    function agregarFotos(uint reunionid, string memory hash, string memory url) public {
        Foto memory foto = Foto(hash, url);
        reuniones[reunionid].fotos.push(foto);
    }
    
    
    function consultarReunion(uint idreunion) public view returns (string memory, string memory) {
        return (reuniones[idreunion].tema, reuniones[idreunion].fecha);
    }
    
    function consultarFotosReunion(uint idreunion) public view returns (uint) {
        return (reuniones[idreunion].fotos.length);
    }
    
    function consultarFoto(uint idreunion, uint fotoid) public view returns (string memory, string memory) {
        if (fotoid <  reuniones[idreunion].fotos.length) {
            Foto memory foto = reuniones[idreunion].fotos[fotoid];
            return (foto.hash, foto.url);
        } else {
            return ("Error", "Error");
        }
    }
    
    function validarFoto(uint idreunion, uint fotoid, string memory hashNuevo) public view returns (bool) {
        if (fotoid <  reuniones[idreunion].fotos.length) {
            Foto memory foto = reuniones[idreunion].fotos[fotoid];
            if (keccak256(abi.encodePacked((hashNuevo))) == keccak256(abi.encodePacked((foto.hash))) ) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }  
    
}