from py_ecc.bn128 import *
from py_ecc.bls.hash import os2ip

def print_as_array(name, point):
  for i in range(0, len(point)):
    if isinstance(point[i], FQ):
      print("{}[{}] = bytes32(uint({})),".format(name, i, point[i]))
    else:
      print("{}[{}].0 = bytes32(uint({})),".format(name, i, point[i].coeffs[0]))
      print("{}[{}].1 = bytes32(uint({})),".format(name, i, point[i].coeffs[1]))

private_key = 5556
public_key = multiply(G1, private_key)

# For test purposes we don't actually hash the message, we are simply signing a point. So we generate a random one
message_point = multiply(G2, 6969)
signature = multiply(message_point, private_key)

print_as_array("public_key", public_key)
print_as_array("message", message_point)
print_as_array("signature", signature)

print(pairing(signature, G1) == pairing(message_point, public_key))