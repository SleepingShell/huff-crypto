from py_ecc.bn128 import *
from py_ecc.bls.hash import os2ip

def print_as_array(name, point):
  for i in range(0, len(point)):
    if isinstance(point[i], FQ):
      print("{}[{}] = bytes32(uint({})),".format(name, i, point[i]))
    else:
      print("{}[{}].0 = bytes32(uint({})),".format(name, i, point[i].coeffs[0]))
      print("{}[{}].1 = bytes32(uint({})),".format(name, i, point[i].coeffs[1]))

priv1 = 5556
pub1 = multiply(G1, priv1)

priv2 = 700000
pub2 = multiply(G1, priv2)

# For test purposes we don't actually hash the message, we are simply signing a point. So we generate a random one
message_point = multiply(G2, 6969)
sig1 = multiply(message_point, priv1)
sig2 = multiply(message_point, priv2)

print_as_array("message", message_point)
print_as_array("pub1", pub1)
print_as_array("sig1", sig1)
print_as_array("pub2", pub2)
print_as_array("sig2", sig2)

print_as_array("Agg pub", add(pub1, pub2))
print_as_array("Agg sig", add(sig1, sig2))


print(pairing(sig1, G1) == pairing(message_point, pub1))