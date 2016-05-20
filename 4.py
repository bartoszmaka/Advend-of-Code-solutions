from hashlib import md5
# 254575
# 1038736


def make_hash(number, secret_key='bgvyzdsv'):
    foo = secret_key + str(number)
    return md5(bytes(foo, encoding='utf-8'))


def hash_good(my_hash):
    # if my_hash.hexdigest()[:5] == '00000':
    if my_hash.hexdigest()[:6] == '000000':
        return True
    else:
        return False

i = 1
while True:
    if hash_good(make_hash(i)):
        print(i)
        break
    else:
        i += 1
