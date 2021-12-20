encoded = 'b9b3beb8d2cfc8bdcfcfb9bdc8c7bac9bbbdcacbcfc8cdbabab9cccbbdc6cfcaceb9becbca'

import binascii
nums = binascii.unhexlify(encoded)
flag = (''.join(chr(num ^ 0xff) for num in nums) )
print(flag)
## admin / FLAG-07B00FB78E6DB54072EEF34B9051FA45
