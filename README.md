# huff-crypto • [![ci](https://github.com/huff-language/huff-project-template/actions/workflows/ci.yaml/badge.svg)](https://github.com/huff-language/huff-project-template/actions/workflows/ci.yaml) ![license](https://img.shields.io/github/license/huff-language/huff-project-template.svg) ![solidity](https://img.shields.io/badge/solidity-^0.8.20-lightgrey)

This project is created for the Huff Huffathon

The first implementation is verifying BLS signatures and aggregating public keys. The idea is one can verify that a collection of public keys aggregates to the public key checked against a signed message.

Read `LibBLSVerify.huff` for information on the different types of BLS that can be used, and the one chosen for this project. Due to this choice, we cannot compute the message hash on-chain, and therefore we pass the message hash as `signed_point`, as message hashing just maps a message to a curve point

## Disclaimer

_These smart contracts are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of the user interface or the smart contracts. They have not been audited and as such there can be no assurance they will work as intended, and users may experience delays, failures, errors, omissions, loss of transmitted information or loss of funds. The creators are not liable for any of the foregoing. Users should proceed with caution and use at their own risk._