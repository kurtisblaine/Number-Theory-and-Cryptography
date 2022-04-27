︠83279b6c-7064-44e2-9985-daa23f4c2aaf︠
########################################
# Useful Functions
########################################
inverse_mod(11,26)
︡70ba0b2d-8965-48fd-9d47-58cd144d6a91︡{"stdout":"19"}︡{"stdout":"\n"}︡{"done":true}
︠be6f6d54-9652-48ba-a026-282386db9006︠
def first_common_element(X,Y):
    '''
    Returns the first element from X that is also in Y.
    Returns None if no such element exists
    '''
    for i in X:
        if i in Y:
            return i

def order(g,N):
    '''
    Returns the order of element g modulo N.
    Returns None if no such exponent exists
    '''
    for i in euler_phi(N).divisors():
        if power_mod(g,i,N) == 1:
            return i

def babystep_giantstep(g,h,p):
    '''
    Shanks 'Baby Step - Giant Step' DLP Algorithm
    '''
    N = order(g,p) #Call Local order Function
    #N = mod(g,p).multiplicative_order() #Call Built in SAGE Order Function
    n = 1 + floor(sqrt(N))
    list1 = [1]
    list2 = [h]
    u = power_mod(xgcd(p,g)[2],n,p)
    a = 1
    b = 1
    for i in [1..n]:
        a = int(mod(a*g,p))
        list1.append(a)
        b = int(mod(b*u,p))
        list2.append(int(mod(h*b,p)))
    shared = first_common_element(list1,list2) #Call Local first_common_element Function
    if shared == None:
        return 'No Solution'
    i = list1.index(shared)
    j = list2.index(shared)
    #print 'List 1:\t ',list1
    #print 'List 2:\t ',list2
    #print 'Int:\t ' ,shared, 'at i =',i,'and j =',j
    return i + j*n

def fermat_primality_test(n,a):
    if power_mod(a,n-1,n) != 1:
        return False #Composite Number
    return 'Test Fails'

def miller_rabin_witness(n,a):
    q = n - 1
    k = 0
    while mod(q,2) == 0:
        k += 1
        q = int(q/2)
    a = power_mod(a,q,n)
    if a == 1:
        return False #Not a Witness
    for i in range(k):
        if mod(a,n) == (n-1):
            return False #Not a Witness
        a = power_mod(a,2,n)
    return True #Is a Witness and n is composite!

def sum_of_squares(p):
    if is_prime(p) == False or mod(p,4) != 1:
        return False
    u = find_u(p)
    a = p
    b = u
    while (p < b^2):
        r = a%b
        a = b
        b = r
    return b, sqrt(p - b^2)

def find_u(p):
    '''
    Given a prime p = 1 mod 4 this function generates an integer u such that u < p/2 and u^2 = -1 mod p
    '''
    if is_prime(p) == False or mod(p,4) != 1:
        return False
    b = 2
    u = power_mod(b,int((p-1)/4),p)
    while power_mod(u,2,p) != (p-1):
        b = b + 1
        u = power_mod(b,int((p-1)/4),p)
    if u < p/2:
        return u
    else:
        return p - u

︡5a0bb410-56bb-444c-840c-57d6277660ea︡{"done":true}
︠a31e09b3-e86f-4019-a32d-ec6a8e469983︠
#############################
# Problem 1.b
#############################
︡0e547cb0-c1a9-4d9b-85b7-c483c856b17c︡{"done":true}
︠51159cd5-56db-4627-838c-77eeb386da23︠
N = 980824291547
e = 65537
c = 879689845782
factor(N)
p = 7331
q = 133791337
ie = inverse_mod(e,N)
mod(ie, p-1*q-1)
︡e3bb1a91-5d27-4f85-b3fd-f8d837888ecc︡{"stdout":"7331 * 133791337\n"}︡{"stdout":"2370792\n"}︡{"done":true}
︠44620832-ed8e-426f-8965-ef599b1a291e︠
#############################
# Problem 1.c
#############################
︡fe13ee4f-0749-4d8d-a1eb-ed14bdf4430c︡{"done":true}
︠a14296d4-90a0-42fa-96a6-0abb7d43d982︠
p = 8675309
q = 2168827
g = 16
A = 5970389
e = 1337
D = 143
a = babystep_giantstep(g,A,p)
a
S1 = Integer(mod(power_mod(g,e,p),q))
print 'S1 =',S1
S2 = Integer(mod((D + a*S1)*inverse_mod(e,q),q))
print 'S2 =',S2
V1 = Integer(mod(D*inverse_mod(S2,q),q))
print 'V1 =',V1
V2 = Integer(mod(S1*inverse_mod(S2,q),q))
print 'V2 =',V2
if mod(mod(power_mod(g,V1,p)*power_mod(A,V2,p),p),q) == S1:
    print True
else:
    print False
︡9da042e3-5876-4e47-b5bb-3348ba7b279d︡{"stdout":"7331\n"}︡{"stdout":"S1 = 1524911\n"}︡{"stdout":"S2 = 782620\n"}︡{"stdout":"V1 = 727259\n"}︡{"stdout":"V2 = 1330604\n"}︡{"stdout":"True\n"}︡{"done":true}
︠dcbcb6df-7e81-41f9-abdf-098d6a173218︠
#############################
# Problem 2 (Example)
#############################
#i
gcd = 7
77 * 1337 / gcd
#ii
gcd = 7
1337 * 2310 / gcd
#iii
gcd = 2
312 * 7330 / gcd
#iv
gcd = 2
7330 * 8675308 / gcd
lcm(7330, 8675308)
︡8a0696c3-5b7f-4d45-a0e2-4857b451e0cd︡{"stdout":"14707\n"}︡{"stdout":"441210\n"}︡{"stdout":"1143480\n"}︡{"stdout":"31795003820\n"}︡{"stdout":"31795003820\n"}︡{"done":true}
︠445f5bc6-f30d-4db9-b013-9ec60d46b762︠
p = 7331
q = 8675309
N = p^2*q
N
d = inverse_mod(N,lcm(p-1,q-1))
d
︡cb72feeb-caef-4cb4-b90a-55ed593064b3︡{"stdout":"466241998435349\n"}︡{"stdout":"14803088829\n"}︡{"done":true}
︠fb722aa6-e917-403e-96a8-e3f54b6555c0︠
m = 143
c = power_mod(m,N,N)
c
︡234b150e-80c6-4fc1-a564-390ce3432ba3︡{"stdout":"442849959266951\n"}︡{"done":true}
︠06aea33e-845b-41af-8ad9-a10d2de8b0f3︠
power_mod(c,d,p*q)
︡68b3a881-b3ff-48a4-9b0c-a3a9c86e9970︡{"stdout":"143\n"}︡{"done":true}
︠0a9e5696-b18a-4f2e-b1a1-40a80e290d61︠
#part c
N = 652912461846270019591
c = 567785301794293380164
p = factor(N)[0][0]^2
q = factor(N)[1][0]^1
p
q
d = inverse_mod(N,lcm(p-1,q-1))
d
power_mod(c,d,p*q)
︡6c45f859-a670-4c60-9ccf-3d3a3a943cb2︡{"stdout":"75260986245481\n"}︡{"stdout":"8675311\n"}︡{"stdout":"25086992523391\n"}︡{"stdout":"365642791601169446007\n"}︡{"done":true}
︠2d7b67df-59d9-4dd6-af83-bde97324bfcd︠
#############################
# Problem 3.a
#############################
︡13a804d3-15a2-4a38-87ec-94f038707d82︡{"done":true}
︠67194d50-0518-4076-8f9c-116a4a6ae486︠
p1 = 3
p2 = 5
p3 = 13
p4 = 17
u = p1*p2
v = p3*p4
sigma = u*v
sigma
︡77ca117a-8e6e-4478-ad66-dfd0b73313de︡{"stdout":"3315\n"}︡{"done":true}
︠54f5de9e-2c0a-4a50-aa2f-f2768d01e564︠
a = 113
is_prime(a)
p = 2*a*u + 1
is_prime(p)
p
︡150e7997-f302-43f8-8203-3354b84af963︡{"stdout":"True\n"}︡{"stdout":"True\n"}︡{"stdout":"3391\n"}︡{"done":true}
︠c329f598-2974-4927-bbda-5554193fde7b︠
b = 211
is_prime(b)
q = 2*b*v + 1
is_prime(q)
q
︡92e20337-b748-4ad7-9e6c-06fce748742b︡{"stdout":"True\n"}︡{"stdout":"True\n"}︡{"stdout":"93263\n"}︡{"done":true}
︠96115deb-8c71-4a66-89b8-9eebdc7acc0a︠
N = p*q
N
g = 31
order(g,N) == (p-1)*(q-1)/4
︡082efcea-c579-4363-b4b2-51b204dab3cb︡{"stdout":"316254833\n"}︡{"stdout":"True\n"}︡{"done":true}
︠bc6a5c6e-f1ff-4767-beba-bf2510503c9b︠
x = 42
m = 1337
c = (power_mod(x,sigma,N)*power_mod(g,m,N))%N
c
︡99812c98-e14a-4066-b872-1bb40ac59f86︡{"stdout":"204495910\n"}︡{"done":true}
︠5312b043-df5f-47e6-85eb-ba2dcf8ea4c3︠
#Computation to Find m1!
c1 = power_mod(c,int((p-1)*(q-1)/p1),N)
c1

for j in range(p1):
    if c1 == power_mod(g,int(j*(p-1)*(q-1)/p1),N):
        m1 = j
        print 'm1 =', m1
︡6ffae477-79f7-47b3-a47d-69951b93caba︡{"stdout":"281187946\n"}︡{"stdout":"m1 = 2\n"}︡{"done":true}
︠8a10c783-78bb-4af7-a437-c9055e8516a6︠
#Computation to Find m2!
c2 = power_mod(c,int((p-1)*(q-1)/p2),N)
c2

for j in range(p2):
    if c2 == power_mod(g,int(j*(p-1)*(q-1)/p2),N):
        m2 = j
        print 'm2 =', m2
︡42466821-ec0c-4f7f-9683-1612ad1a8b31︡{"stdout":"206857335\n"}︡{"stdout":"m2 = 2\n"}︡{"done":true}
︠fcbe33ba-2f19-4839-bc8b-96b1ef4d4e02︠
#Computation to Find m3!
c3 = power_mod(c,int((p-1)*(q-1)/p3),N)
c3

for j in range(p3):
    if c3 == power_mod(g,int(j*(p-1)*(q-1)/p3),N):
        m3 = j
        print 'm3 =', m3
︡82cd7426-7815-490a-8f80-99c7b763f200︡{"stdout":"275783249\n"}︡{"stdout":"m3 = 11\n"}︡{"done":true}
︠0acf0c13-6ab7-4d88-a9c3-928e2f93ca67︠
#Computation to Find m4!
c4 = power_mod(c,int((p-1)*(q-1)/p4),N)
c4

for j in range(p4):
    if c4 == power_mod(g,int(j*(p-1)*(q-1)/p4),N):
        m4 = j
        print 'm4 =', m4
︡2b3cd659-24f7-4532-a72f-ff9f277c3c35︡{"stdout":"154321020\n"}︡{"stdout":"m4 = 11\n"}︡{"done":true}
︠dadf805a-a1a9-48bf-8b0c-477a0f2ecdcb︠
m1 = 2
m2 = 2
m3 = 11
m4 = 11
#Find m via a CRT
crt([m1,m2,m3,m4],[p1,p2,p3,p4])
︡0dbfbaf2-0130-4e1f-a9b7-3208f4ad744f︡{"stdout":"1337\n"}︡{"done":true}
︠2640bf86-6dcf-4c35-ae7e-e0088ae40736︠
#############################
# Problem 3.b - Data
#############################
sigma = 1029457
N = 759776831797
g = 321
c = 650213404789
factor(sigma)
factor(N)
p = 87803
q = 8653199
p1 = 11
p2 = 13
p3 = 23
p4 = 313
︡539fccac-65ac-4eb0-8046-3e46b5ed15b5︡{"stdout":"11 * 13 * 23 * 313\n"}︡{"stdout":"87803 * 8653199\n"}︡{"done":true}
︠4d18bff7-5204-44f7-b084-423f9edb0c9b︠
#Computation to Find m1!
c1 = power_mod(c,int((p-1)*(q-1)/p1),N)
c1
for j in range(p1):
    if c1 == power_mod(g,int(j*(p-1)*(q-1)/p1),N):
        m1 = j
        print 'm1 =', m1
︡c829247d-1bff-48c2-b49b-e656c26e18bf︡{"stdout":"413406582226\n"}︡{"stdout":"m1 = 5\n"}︡{"done":true}
︠e692803f-7513-425e-90f6-61a555cc6700︠
#Computation to Find m2!
c2 = power_mod(c,int((p-1)*(q-1)/p2),N)
c2

for j in range(p2):
    if c2 == power_mod(g,int(j*(p-1)*(q-1)/p2),N):
        m2 = j
        print 'm2 =', m2
︡ab1e5f7c-5823-47b7-af8b-ad2d0a7d67eb︡{"stdout":"260712232672\n"}︡{"stdout":"m2 = 12\n"}︡{"done":true}
︠1479695c-e5fa-4de4-a3e6-2e452e431b62︠
#Computation to Find m3!
c3 = power_mod(c,int((p-1)*(q-1)/p3),N)
c3

for j in range(p3):
    if c3 == power_mod(g,int(j*(p-1)*(q-1)/p3),N):
        m3 = j
        print 'm3 =', m3
︡5d4b583e-8951-47c8-af06-da63b8e7fa22︡{"stdout":"582741837973\n"}︡{"stdout":"m3 = 17\n"}︡{"done":true}
︠4a6aba7c-4234-46de-a4a1-36072bbdbd02︠
#Computation to Find m4!
c4 = power_mod(c,int((p-1)*(q-1)/p4),N)
c4

for j in range(p4):
    if c4 == power_mod(g,int(j*(p-1)*(q-1)/p4),N):
        m4 = j
        print 'm4 =', m4
︡b63871e0-2366-437f-8159-704801af60c9︡{"stdout":"46412490195\n"}︡{"stdout":"m4 = 132\n"}︡{"done":true}
︠a062648d-49d0-4775-a6d3-a344791a1539︠
m1 = 5
m2 = 12
m3 = 17
m4 = 132
#Find m via a CRT
crt([m1,m2,m3,m4],[p1,p2,p3,p4])
︡b6e55144-183d-4cad-a82d-b61aeede9222︡{"stdout":"7331\n"}︡{"done":true}
︠cee9453e-e380-4557-8f40-081a6a33c355︠
#############################
# Problem 4 - Miller Rabin
#############################
︡db5e8928-8284-47da-9c1e-ca2daa39ac98︡{"done":true}
︠6aa62da2-3bb4-4a03-88b1-4386badad54d︠
#True if N is Composite (witness found)
miller_rabin_witness(21,2)
︡f9ddf638-531d-4874-a2cd-724cf66095af︡{"stdout":"True\n"}︡{"done":true}
︠6bbf4083-65ce-4028-a18b-1f6cd6a8045f︠
#True if N is Composite (witness found)
miller_rabin_witness(13,2)
︡d763abe8-5edc-4f58-a0ee-c8149a25b50c︡{"stdout":"False\n"}︡{"done":true}
︠cd92ebfd-4654-4219-bc07-f5884dd54545︠
#True if N is Composite (witness found)
miller_rabin_witness(41,2)
︡f5896796-2235-4acb-816f-8ad2df072a8e︡{"stdout":"False\n"}︡{"done":true}
︠9c5eee3e-a3a1-4291-9512-fd17096ac328︠
#True if N is Composite (witness found)
miller_rabin_witness(8675309,2)
miller_rabin_witness(8675309,3)
miller_rabin_witness(8675309,5)
miller_rabin_witness(8675309,7)
miller_rabin_witness(8675309,11)
1 - 0.25^5
︡7d6158ae-0b0d-4276-94d3-075f1aaa7521︡{"stdout":"False\n"}︡{"stdout":"False\n"}︡{"stdout":"False\n"}︡{"stdout":"False\n"}︡{"stdout":"False\n"}︡{"stdout":"0.999023437500000\n"}︡{"done":true}
︠604addfe-2985-4918-b329-7966b7cc4b01︠
#part d
def MillerRabinTest(n, t):
    trials = t
    anser = []
    while trials != 0:
        random = randint(1,n-1)
        anser.append(miller_rabin_witness(n, random))
        trials = trials - 1
    if anser[0] == True:
        print 1 - .25^t, ":::certainty:::", "composite", (factor(n))
    if anser[0] == False:
        print 1 - .25^t, ":::certainty:::", "prime", factor(n)
MillerRabinTest(561, 4)
MillerRabinTest(8675309, 4)
MillerRabinTest(133791337, 4)
︡4e1a5dbd-8994-4ea3-9c63-2787be01146a︡{"stdout":"0.996093750000000 :::certainty::: composite 3 * 11 * 17\n"}︡{"stdout":"0.996093750000000 :::certainty::: prime 8675309\n"}︡{"stdout":"0.996093750000000 :::certainty::: prime 133791337\n"}︡{"done":true}
︠ad9a46a9-d700-48e7-aa8f-6681f8de7f82︠
#############################
# Problem 5 - Named Primes!
#############################
︡05b35877-cbf9-4c31-b146-ecb63d71b999︡{"done":true}
︠43d5aced-be18-4903-82d5-5ee8608e8957︠
#F4
F4 = 2^(2^4) + 1
'F4 =',F4
power_mod(3,int((F4 - 1)/2),F4)
F4 - 1
print '3^((Fn-1)/2) mod Fn = -1?',power_mod(3,int((F4 - 1)/2),F4) == (F4 - 1)

#F5
F5 = 2^(2^5) + 1
'F5 =',F5
power_mod(3,int((F5 - 1)/2),F5)
F5 - 1
print '3^((Fn-1)/2) mod Fn = -1?',power_mod(3,int((F5 - 1)/2),F5) == (F5 - 1)
factor(F5)
︡a49ec7f7-1d8c-4062-8f80-b3698e0e606a︡{"stdout":"('F4 =', 65537)\n"}︡{"stdout":"65536\n"}︡{"stdout":"65536\n"}︡{"stdout":"3^((Fn-1)/2) mod Fn = -1? True\n"}︡{"stdout":"('F5 =', 4294967297)\n"}︡{"stdout":"10324303\n"}︡{"stdout":"4294967296\n"}︡{"stdout":"3^((Fn-1)/2) mod Fn = -1? False\n"}︡{"stdout":"641 * 6700417\n"}︡{"done":true}
︠3be92367-0bae-4489-b78e-aaba7db2cd8c︠
def find_primes(base):
    #p = Primes()
    i = 0
    for p in Primes():
        if power_mod(base,p-1,p^2) == 1:
            print p
            i = i + 1
        if i == 2:
            return
find_primes(2)
find_primes(3)
find_primes(4)
find_primes(5)
find_primes(7)
︡ae9fa264-b09c-4907-bf47-133f74e3945a︡{"stdout":"1093\n3511\n"}︡{"stdout":"11\n1006003"}︡{"stdout":"\n"}︡{"stdout":"1093\n3511\n"}︡{"stdout":"2\n20771\n"}︡{"stdout":"5\n491531"}︡{"stdout":"\n"}︡{"done":true}
︠7a4d4c81-97d4-41cf-b7da-04468823e935︠
#############################
# Problem 6 - Palindromes!
#############################
︡44a58de2-fb33-41b2-b680-74c35869b4a6︡{"stdout":"5^3\n"}︡{"done":true}
︠455d5b59-c793-49e1-9eed-495ab9054381︠
def is_it_palindrome_base_b(n,b):
    d = n.digits(b);
    for i in range(len(d)/2):
        if d[i] != d[len(d) - i - 1]  :
            return False
    return True
︡83f21e68-79da-4f37-b95b-eaf758bcc48a︡{"done":true}
︠5540cbe8-bdc2-4808-a09c-e002afffd232︠
is_it_palindrome_base_b(5,10)
is_it_palindrome_base_b(5,2)
︡b225262f-0ab9-4925-a32a-43f00ea1052c︡{"stdout":"True\n"}︡{"stdout":"True\n"}︡{"done":true}
︠047d7ae1-6170-4847-8802-3698bcd5df46︠
is_it_palindrome_base_b(11,10)
is_it_palindrome_base_b(11,2)
︡29474764-49d7-4b19-83e1-e126497dc8fe︡{"stdout":"True\n"}︡{"stdout":"False\n"}︡{"done":true}
︠e472c0a7-4ba0-4e07-8ca8-534afef5b829︠
is_it_palindrome_base_b(313,10)
is_it_palindrome_base_b(313,2)
︡95d735af-d2c7-4ca8-8637-ad1fa71d6d22︡{"stdout":"True\n"}︡{"stdout":"True\n"}︡{"done":true}
︠dc426c4c-104c-4101-ad64-1076c52a4012︠
is_it_palindrome_base_b(7331,10)
is_it_palindrome_base_b(7331,2)
︡dd4060b0-9518-4d31-becd-3ac0bbc51979︡{"stdout":"False\n"}︡{"stdout":"False\n"}︡{"done":true}
︠f8ef525a-fc74-4d10-b08d-1eb7291ec508︠
is_it_palindrome_base_b(8675309,10)
is_it_palindrome_base_b(8675309,2)
︡6220a11d-f9bf-4fca-b99b-86eb6f677eb4︡{"stdout":"False\n"}︡{"stdout":"False\n"}︡{"done":true}
︠6f12c03b-9fea-4e6c-8f3e-31aa324fabe7︠
is_it_palindrome_base_b(700666007,10)
is_it_palindrome_base_b(700666007,2)
︡71dca30c-79b8-454a-bf8b-fe75d43d3180︡{"stdout":"True\n"}︡{"stdout":"False\n"}︡{"done":true}
︠6be3b53c-a878-4351-b09d-48ac8c21a363︠
#############################
# Problem 6 - Highly Composite Numbers
#############################
def tau_bf(N):
    counter = 0
    for d in [1..N]:
        if mod(N,d) == 0:
            counter += 1
    return counter
︡f9cc7b24-05f5-491e-a975-1f4a8b0092d4︡{"done":true}
︠ffce54bd-d9fc-47a8-b03b-2ea375fd9470︠
tau_bf(5)
︡4cb62e51-cd5d-414c-8cb0-d684d3c228eb︡{"stdout":"2\n"}︡{"done":true}
︠8df3e9e2-094d-42a1-800d-3253ef1b1161︠
tau_bf(25)
︡a7a58c51-3d05-415f-8a7b-cfa60277ae5d︡{"stdout":"3\n"}︡{"done":true}
︠3b3a346e-476c-4274-9c7f-f3712700ff1f︠
divisors(25)
len(divisors(25))
︡15c454e1-f3e4-4f61-8584-78be8c08dbc0︡{"stdout":"[1, 5, 25]\n"}︡{"stdout":"3\n"}︡{"done":true}
︠82eb523c-df57-4562-8c8a-8c2238e97f0b︠
def highlyComposite(N):
    prime = N
    for k in [1..N]:
        print N,"^",k, ":", tau_bf(prime^k)
︡c39d5a3b-45a0-43c5-b317-b269b1db3b5d︡{"done":true}
︠a4895a97-30e8-48d3-bd15-9644e3e2f559︠
#part d
list = []
high = 1
count = 1
list.append(high)
for p in [1..10000]:
    if(len(divisors(p)) > high):
        high = len(divisors(p))
        list.append(p)
        count = count + 1
print list
︡68b0680a-6188-4f15-bdd4-66b466cd53fe︡{"stdout":"[1, 2, 4, 6, 12, 24, 36, 48, 60, 120, 180, 240, 360, 720, 840, 1260, 1680, 2520, 5040, 7560]\n"}︡{"done":true}
︠8fbfcbd5-e281-4e88-b783-db83e73a5c21︠
index = 0
for p in Primes():
    index = index + 1
    if index < 5:
        highlyComposite(p)
    else:
        break
︡ab5af46b-8356-4048-bdd7-2ffc2462e52c︡{"stdout":"2 ^ 1 : 2\n2 ^ 2 : 3\n3 ^ 1 : 2\n3 ^ 2 : 3\n3 ^ 3 : 4\n5 ^ 1 : 2\n5 ^ 2 : 3\n5 ^ 3 : 4\n5 ^ 4 : "}︡{"stdout":"5\n5 ^ 5 : "}︡{"stdout":"6\n7 ^ 1 : 2\n7 ^ 2 : 3\n7 ^ 3 : "}︡{"stdout":"4\n7 ^ 4 : "}︡{"stdout":"5\n7 ^ 5 : "}︡{"stdout":"6\n7 ^ 6 : "}︡{"stdout":"7\n7 ^ 7 :"}︡{"stderr":"Error in lines 2-7\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1188, in execute\n    flags=compile_flags) in namespace, locals\n  File \"\", line 4, in <module>\n  File \"\", line 4, in highlyComposite\n  File \"\", line 3, in tau_bf\n  File \"src/cysignals/signals.pyx\", line 320, in cysignals.signals.python_check_interrupt\nKeyboardInterrupt\n"}︡{"done":true}
︠5a003b10-8cb9-409d-a281-389cc758d17f︠
def tau(N):
    return len(divisors(N))
︡a74b7bbb-cddf-4fcd-8ab3-562c54e990a0︡{"done":true}
︠1ad45d05-2597-4a88-a4a5-30b3b8d90f97︠
tau(12)
︡2c49f675-313c-428c-bd9e-853dc8952f3b︡{"stdout":"6\n"}︡{"done":true}
︠1e3efa6b-ab15-4f09-b7e4-e12287e16d56︠
def other_tau(N):
    i = 0
    factors = factor(N)
    while i < len(factors):
        exp = factors[i][0]^factors[i][1]
        print len(divisors(exp))
        i = i + 1
other_tau(12)
︡f6a9f258-72cf-4ab9-a324-8dd2ce7db5a2︡{"stdout":"3\n2\n"}︡{"done":true}
︠54ef7c7e-cf3d-422e-a669-d4d4fa6bd4ca︠
other_tau(245)
︡aba24e43-0d62-452e-8db7-f4fcc21e4033︡{"stdout":"2\n3\n"}︡{"done":true}
︠134abf98-6480-44a3-99da-e96c0b8891e7︠
other_tau(1337)
︡dc8a06f2-2f55-4118-9bce-7a985a59119e︡{"stdout":"2\n2\n"}︡{"done":true}
︠3e7f3ffa-6410-4650-8f24-90303f82c9f6︠
other_tau(5040)
︡53031a74-d4e7-4ec4-8654-2f33bfdf8dda︡{"stdout":"5\n3\n2\n2\n"}︡{"done":true}
︠421c0bf7-0754-4c48-8366-acc4f843814e︠
other_tau(5402250)
︡8254727d-f5b5-425c-8db8-6520618ddfb9︡{"stdout":"2\n3\n4\n5\n"}︡{"done":true}
︠1682375f-4e43-49dc-8075-bc250c87d923︠
#############################
# Problem 7
#############################
︡1585a2b9-99f6-4cd7-ba0d-733ff4d466cf︡{"done":true}
︠81280d5f-dc45-4ecd-965c-c6c770cfa7d5︠
def sigma(N):
    return sum(d for d in divisors(N))
︡47012f32-c9b6-4acb-9a25-fb5881410165︡{"done":true}
︠73822f93-6a57-4adb-9f35-94893f8e316b︠
sigma(6)
sigma(7)
sigma(12)
sigma(28)
︡79990b7c-7d3a-4597-b2e5-4254295c5e31︡{"stdout":"12\n"}︡{"stdout":"8\n"}︡{"stdout":"28\n"}︡{"stdout":"56\n"}︡{"done":true}
︠c52254fb-6b24-493f-ade7-bdbefc767f49s︠
mersenne = [3,7,31,127,8191,131071, 524287]
def is_perfect(N):
    if sigma(N) == 2*N and mod(N,2) == 0:
        count = 0
        for p in Primes():
            if ((2^p)-1) in mersenne:
                print (2^(p-1))*((2^p)-1), p
            if count > 25:
                break
            count = count + 1
        return
︡c8af364f-e50d-4d25-8181-d2a42e411b8e︡{"done":true}
︠98fda550-193d-4fc5-891a-1e319fc06d99s︠
for prime in [1..10]:
    is_perfect(prime)
︡3522361f-cd75-4a76-92a6-b4db2f236670︡{"stdout":"6 2\n28 3\n496 5\n8128 7\n33550336 13\n8589869056 17\n137438691328 19\n"}︡{"done":true}
︠3db71849-d84d-4e56-9eb6-1a6fb597f908s︠
def is_abundant(N):
    if sigma(N) > 2*N:
        return True
    return False
︡365385c6-54c1-410f-a300-fee9741f7f57︡{"done":true}
︠2e5232ac-5388-4dba-a4ed-7c86b5c28bdfs︠
is_abundant(18)
is_abundant(24)
︡28499e4c-5766-477b-9617-5c452b07c296︡{"stdout":"True\n"}︡{"stdout":"True\n"}︡{"done":true}
︠b652522a-13d7-4307-82f8-6db072541fa2s︠
#problem 7 e and g
def highlyAbundant(min, max):
    list = []
    high = 1
    count = 1
    list.append(high)
    for p in [min..max]:
        if(sigma(p) > high):
            high = sigma(p)
            list.append(p)
            count = count + 1
    print list
︡ac4535ae-c559-4ed5-b692-12a415d8c466︡{"done":true}
︠53900c8a-cf6e-4182-9eb8-78dc44c8800fs︠
highlyAbundant(1,50)
︡3d77c77a-d79a-47ce-b09b-60e40142eb6e︡{"stdout":"[1, 2, 3, 4, 6, 8, 10, 12, 16, 18, 20, 24, 30, 36, 42, 48]\n"}︡{"done":true}
︠2b0bab5f-ca9e-4dfe-83ce-b26ad6b148a5︠
#exclude 1 and 500
highlyAbundant(500,1000)
︡5b7e470d-9916-45cd-bdcf-520fd3749ad9︡{"stdout":"[1, 500, 504, 540, 600, 630, 660, 720, 840, 960]\n"}︡{"done":true}
︠34df25cb-ff17-4f9a-ac64-27462a42aa12︠









