︠870f783d-57cf-4fe1-8623-70d77f87e15bs︠
#Example 1 (Via Brute Force - its really slow)
N = 1160681189998133
e = 313
c = 263380572002954

for m in range(10^7):
    if power_mod(m,e,N) == c:
        print m
        break
︡2e8a90fb-4239-4d14-a593-33b40e2c41dd︡{"stdout":"1337143"}︡{"stdout":"\n"}︡{"done":true}
︠85fa2946-a222-4c97-b497-b692c199e19as︠
def first_common_element(X,Y):
    '''
    Returns the first element from X that is also in Y.
    Returns None if no such element exists
    '''
    for i in X:
        if i in Y:
            return i
︡50b42e5a-4fa8-4a02-8d43-ec164668ae47︡{"done":true}
︠526363b4-98ba-45f8-b822-e1688f9140f4︠
#Example 1 (Via Collision)
N = 1160681189998133
e = 313
c = 263380572002954
︡07cee66f-bef1-4c3f-9e51-792921b23d62︡{"done":true}
︠5311551d-6be3-47c7-b519-e29df1e3e8b2s︠
L1 = [power_mod(x,e,N) for x in [1..10^4]]
L2 = [(c*power_mod(y,-e,N))%N for y in [1..10^4]]
︡d1556399-b4fe-4a6c-8f9a-8f9b83449ebf︡{"done":true}
︠13312229-d0b6-40f0-bca5-3b1d0115219bs︠
L1[0]
L2[0]
︡f6798ffc-eb91-474c-bb30-a7d8ddef7de6︡{"stdout":"1\n"}︡{"stdout":"263380572002954\n"}︡{"done":true}
︠5e45b28b-69c2-4bd7-a0ab-52175982b3e6s︠
#Find Shared Element
shared = first_common_element(L1,L2)
shared
︡f2a8ff57-39d7-435f-b040-d938ab3598fb︡{"stdout":"475729372147360\n"}︡{"done":true}
︠a60dfce1-6157-4784-a3d8-2fbb803e6221s︠
#Find the x and y value that create the shared element
L1.index(shared)
L2.index(shared)
︡d7822a0c-1616-447d-ae0e-52e4cee5c878︡{"stdout":"508\n"}︡{"stdout":"2626\n"}︡{"done":true}
︠6970242f-6150-4d15-8abb-7190b2f7ec7c︠
#Note! This corresponds to 508 + 1 = 509 and 2626 + 1 = 2627 since list starts at 0 but the x and y values shart at 0
︡1003e47a-fe62-47b6-87cf-2878ee100982︡
︠ffc4d2bc-6cf8-4e4c-888f-295eba40e5dd︠
x = L1.index(shared) + 1
y = L2.index(shared) + 1
︡bbeea6cf-7cac-466a-a12c-241cd47d1b3d︡{"stdout":"1337143\n"}︡{"done":true}
︠dd786ec3-d2b0-4c19-89e3-a0fbd02e53c4︠
#Notice we have the following (equality)
power_mod(x,e,N)
(c*power_mod(y,-e,N))%N
︡c3b9e9ed-0358-4d24-a94c-80b944220c8f︡{"stdout":"475729372147360\n"}︡{"stdout":"475729372147360\n"}︡{"done":true}
︠df38c468-41bb-48cd-aaec-da9fe4bf2630s︠
#More importanly, we have
power_mod(x*y,e,N)
c
︡7b51f17f-0314-4065-b52b-d7bfa3511273︡{"stdout":"263380572002954\n"}︡{"stdout":"263380572002954\n"}︡{"done":true}
︠efa2b791-8404-4461-8617-7e98920b7d4es︠
#So, the secrete message is x*y
x*y
︡3c6a3c7d-ce9e-408c-a5e1-92122a39629f︡{"stdout":"1337143\n"}︡{"done":true}
︠fa769e27-6c1d-4b04-b60e-ddf3a42d08c2s︠
#Doing it all at once!
N = 1160681189998133
e = 313
c = 263380572002954

L1 = [power_mod(x,e,N) for x in [1..10^4]]
L2 = [(c*power_mod(y,-e,N))%N for y in [1..10^4]]

shared = first_common_element(L1,L2)

x = L1.index(shared) + 1
y = L2.index(shared) + 1

print x*y
︡a0881f27-e2e1-4150-8397-7dc6bd773724︡{"stdout":"1337143\n"}︡{"done":true}
︠d07785d0-9964-4b49-b390-6faa235a7643︠









