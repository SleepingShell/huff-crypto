pragma solidity ^0.8.20;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

interface BLSVerifier {
  struct G1Point {
    bytes32 x;
    bytes32 y;
  }

  struct G2Point {
    bytes32 x1;
    bytes32 x2;
    bytes32 y1;
    bytes32 y2;
  }

  function verify_signature(G2Point calldata signature, G1Point calldata public_key, G2Point calldata message) external returns (bool);
  function aggregate_keys(G2Point[] calldata keys) external returns (bytes32[2] memory);
}

contract BLSVerifierTest is Test {
  BLSVerifier public verifier;
  function setUp() public {
    verifier = BLSVerifier(HuffDeployer.deploy("BLSVerifier"));
  }

  function testVerifySignature() public {
    BLSVerifier.G1Point memory public_key = BLSVerifier.G1Point({
      x: bytes32(uint(1090777408308035171260661852075567960976181687143889499564710305988172099383)),
      y: bytes32(uint(13708458844252250126192960376690702041965617131164989573508273531198210365093))
    });

    BLSVerifier.G2Point memory message = BLSVerifier.G2Point({
      x1: bytes32(uint(19594623627409259378039297330617767058770539467953560255923081647395121863058)),
      x2: bytes32(uint(19026182510953516927451468394146211042945390764943269179413256725444836448143)),
      y1: bytes32(uint(11317174303851617851005949949485490379049210638929418608924243957002646980145)),
      y2: bytes32(uint(19356622844580559946499870827905828083029248740940246755448843653393582897796))
    });

    BLSVerifier.G2Point memory signature = BLSVerifier.G2Point({
      x1: bytes32(uint(5788129135635395369703256593946103790226528478083036695106729803477684003178)),
      x2: bytes32(uint(550817806247107308217449775418520202980847295461441326168148482251262266773)),
      y1: bytes32(uint(1303242822524773434342636523030730181403697759902827108288850824688326540135)),
      y2: bytes32(uint(775312196554192280950380277344680275774623638426543529866173776909529919076))
    });

    assert(verifier.verify_signature(signature, public_key, message));
  }
}