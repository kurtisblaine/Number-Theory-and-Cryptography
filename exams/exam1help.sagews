︠b43a82ec-9650-4131-bdbe-0bd43773fabes︠

#################################################################
#Baby Step - Giant Step Algorithm
#################################################################
def order(x,p):
    for i in euler_phi(p).divisors():
        if power_mod(x,i,p) == 1:
            return i

def first_common_element(X,Y):
    '''
    Returns the first element from X that is also in Y.
    Returns None if no such element exists
    '''
    for i in X:
        if i in Y:
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
    shared = first_common_element(list1,list2)
    if shared == None:
        return 'No Solution'
    i = list1.index(shared)
    j = list2.index(shared)
    #print 'List 1:\t ',list1
    #print 'List 2:\t ',list2
    #print 'Int:\t ' ,shared, 'at i =',i,'and j =',j
    return i + j*n
babystep_giantstep(42,115837322,123484321)
︡8bdaad85-f299-41e5-be38-0b92a3753f2d︡{"stdout":"8675309"}︡{"stdout":"\n"}︡{"done":true}
︠899f3e12-3fb3-4a1a-95a2-d9a651c0006bs︠
#################################################################
#Chinese Remainder Theorem
#################################################################
def chinese_remainder_theorem(a_values,m_values):
    '''
    This procedure solves the system of congruences
    x = a_1 mod m_1
    x = a_2 mod m_2
    ...
    x = a_r mod m_r
    where
    a_values = List of a_i
    m_values = List of m_i (m_i's are pairwise co-prime)
    prod_M = m_1*m_2*...*m_r
    M_i = prod_M/m_values[i]
    y_i = (M_i)^(-1) mod m_i = xgcd(m_values[i],prod_M/m_values[i])[2]
    x = a_1*M_1*y_1 + a_2*M_2*y_2 + ... + a_r*M_r*y_r
    '''
    #Ensure m_i are co-prime
    for i in range(len(a_values)):
        for j in range(i+1,len(a_values)):
            if gcd(m_values[i],m_values[j]) != 1:
                return 'm_is are not pairwise co-prime'

    prod_M = prod(m_values) #prod_m = m_1*m_2*...*m_n

    x = sum([a_values[i]*(prod_M/m_values[i])*(xgcd(m_values[i],prod_M/m_values[i])[2]) for i in range(len(a_values))])
    return mod(x,prod_M) #Returns the value modulo m_1*m_2*...*m_n
#Number of Unknown Things
chinese_remainder_theorem([2,3,2],[3,5,7])
︡257bc49a-e328-45f9-a851-5ee8c94966e6︡{"stdout":"23\n"}︡{"done":true}
︠4697758a-c783-4999-bcf2-23863790a031s︠
#################################################################
#Pohlig-Hellman Algorithm
#################################################################
p = 437401
g = 7
h = 54321
N = order(g,p) #Calls Local Order Function
N
factored_N = factor(N)
factored_N
factored_N[0]
#We can read off the 2^3 term in this factorization via the following
(factored_N[0][0])^(factored_N[0][1])
︡9c9c6285-08c4-4204-a324-6d33f7dddb65︡{"stdout":"437400\n"}︡{"stdout":"2^3 * 3^7 * 5^2\n"}︡{"stdout":"(2, 3)\n"}︡{"stdout":"8\n"}︡{"done":true}
︠1e6dfb7a-32bf-4cb4-b5ae-965f5bdfba5cs︠
chinese_remainder_theorem([5,319,10],[2^3,3^7,5^2])
︡513ea5cf-8826-44e6-8fcf-d22d9e56799a︡{"stdout":"39685\n"}︡{"done":true}
︠0a1b3012-4115-4d99-82e6-14d1346c43e3s︠
power_mod(7,39685,437401)
︡4b090827-2b7d-478e-ab67-dbf7f6dcb9a8︡{"stdout":"54321\n"}︡{"done":true}
︠987a46e4-0273-450f-846e-cc60fd478647s︠
17.inverse_mod(26)
︡f7ad6dde-2ced-4a17-976d-8b496448f273︡{"stdout":"23\n"}︡{"done":true}
︠6883e5cb-a4ab-4cda-9ac3-85416ef4f942s︠
xgcd(54321, 313)
︡df79509d-671a-4c9a-af29-3f28151a97cf︡{"stdout":"(1, -111, 19264)\n"}︡{"done":true}
︠7414ddf7-d862-445f-a69c-6b144992388as︠
def blumblum(p, x):
    list = []
    i = 0
    newX = 0
    list.append(x)
    for i in [1 .. 15]:
        newX = mod(x^2,p)
        list.append(newX)
        x = newX
    return list
︡6eee58b2-eb01-4545-8468-b9dbab02f727︡{"done":true}
︠96549188-303b-4c97-8299-583e063ef5afs︠
blumblum(99,5)
︡9c7c2b4e-914c-451e-a664-46e940733bdb︡{"stdout":"[5, 25, 31, 70, 49, 25, 31, 70, 49, 25, 31, 70, 49, 25, 31, 70]\n"}︡{"done":true}
︠bf1b0044-b402-4957-90fe-f42d1b906cdds︠
chinese_remainder_theorem([5,2,16],[9,11,17])
chinese_remainder_theorem([5,2,0],[9,11,17])
chinese_remainder_theorem([19,83,0],[25,144,13])
︡4be1bf95-1b29-4e7c-ad7b-26b0e9b406a3︡{"stdout":"662\n"}︡{"stdout":"68\n"}︡{"stdout":"42419\n"}︡{"done":true}
︠24793bfc-08ef-4cc6-a4ad-dd304f128986s︠
4.inverse_mod(25)
︡3c4e6c87-6196-4785-a698-3382fd75a652︡{"stdout":"19\n"}︡{"done":true}
︠fe0eed3d-f5a8-441d-a615-8b7ae052ae0fs︠
7.inverse_mod(144)
order(437400,7)
factor(437401)
︡1083ad82-07de-490e-9d38-901c2d0d6ce8︡{"stdout":"103\n"}︡{"stdout":"6\n"}︡{"stdout":"437401\n"}︡{"done":true}
︠ac0a6fef-e875-4a83-a911-55cb02e926das︠
def PohligHellman(x,y,p):
    listF = []
    listG = []
    listH = []
    listY = []
    order = 0
    for i in euler_phi(p).divisors():
        if power_mod(x,i,p) == 1:
            order = i
    factorOfP = factor(order)
    i = 0
    #print 'order\t', factorOfP, '\n'
    while i < len(factorOfP):
        listF.append((factorOfP[i][0])^(factorOfP[i][1]))
        listG.append(power_mod(x,int(order / listF[i]), p))
        listH.append(power_mod(y,int(order / listF[i]), p))
        listY.append(babystep_giantstep(int(listG[i]),int(listH[i]),p))
        #print 'factor', ':\t', listF[i]
        #print 'g', i, ':\t', listG[i]
        #print 'h', i, ':\t', listH[i]
        #print 'y', i, ':\t', listY[i], '\n'
        i += 1
    print 'x =\t', chinese_remainder_theorem(listY,listF), '( mod ', p-1, ')'
︡464c645b-33b0-474f-83a6-3c5bd98e192b︡{"done":true}
︠9509611f-79a6-475f-a168-4a23f5d0d34ds︠

import time
t = time.time()
PohligHellman(7,54321,437401)
dt = time.time() - t
print 'Total time: \t', dt
︡074a0518-4509-4407-990c-ebfab93c0e30︡{"stdout":"x =\t39685 ( mod  437400 )\n"}︡{"stdout":"Total time: \t0.00465893745422\n"}︡{"done":true}
︠c7b4d1bb-e42a-4b39-b58e-7bde9e8c7f46s︠
import time
t = time.time()
PohligHellman(37,123,1235321)
dt = time.time() - t
print 'Total time: \t', dt
︡4f9df072-ede1-42e6-a092-84e077a2eeeb︡{"stdout":"x =\t503383 ( mod  1235320 )\n"}︡{"stdout":"Total time: \t0.00383400917053\n"}︡{"done":true}
︠88cc889f-885d-4c1a-8fc0-dece63032583s︠
import time
t = time.time()
PohligHellman(37,123,2352452423)
dt = time.time() - t
print 'Total time: \t', dt
︡dee07129-eb44-4e61-966e-2c7632689d9c︡{"stdout":"x =\t678958669 ( mod  2352452422 )\n"}︡{"stdout":"Total time: \t0.00520586967468\n"}︡{"done":true}
︠5a1ab9e0-e974-4b58-a226-43e346044e00s︠
import time
t = time.time()
PohligHellman(37,123, 23589024479)
dt = time.time() - t
print 'Total time: \t', dt
︡a952fadd-0783-4870-9882-9baa7e022882︡{"stdout":"x =\t"}︡{"stdout":"22708189035 ( mod  23589024478 )\n"}︡{"stdout":"Total time: \t139.924587011\n"}︡{"done":true}
︠a975e6a9-88e6-4020-bc04-f2e3273fdd9ds︠
print 'Problem 8:\t Pohlig-Hellman Algo\n'
import time
t = time.time()
PohligHellman(42,115837322,123484321)
dt = time.time() - t
print 'Total time: \t', dt,'\n\n'

︡84ffd37c-a949-4a75-86f6-bf417f878afb︡{"stdout":"Problem 8:\t Pohlig-Hellman Algo\n\n"}︡{"stdout":"x =\t8675309 ( mod  123484320 )\n"}︡{"stdout":"Total time: \t0.00668215751648 \n\n\n"}︡{"done":true}
︠529e7f9c-5c10-4699-a48c-dd6aecb98a69s︠
print 'Problem 8:\t Baby step- Giant step Algo\n'
import time
t = time.time()
babystep_giantstep(42,115837322,123484321)
dt = time.time() - t
print 'Total time: \t', dt
︡13ea1055-a688-44fc-8d5b-e3fff2bacfe2︡{"stdout":"Problem 8:\t Baby step- Giant step Algo\n\n"}︡{"stdout":"8675309"}︡{"stdout":"\n"}︡{"stdout":"Total time: \t0.133490800858\n"}︡{"done":true}
︠e1e46df2-07a6-4c42-8cb3-1c0a2cdd9909︠









