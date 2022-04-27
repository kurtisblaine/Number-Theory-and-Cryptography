︠80c3632f-6ba0-4107-a231-3d4eec6ddb69s︠
########################################################################
# Problem 1
########################################################################
def discrete_log_brute_force(g,b,p):
    for k in [0..p-2]:
        if power_mod(g,k,p) == mod(b,p):
            return k
    return 'No Solution'
#discrete_log_brute_force(42,115837322,123484321)
︡4d6c7571-4b6b-4e68-8c77-e0bb8e1d6c4d︡{"done":true}
︠d0dcbcbe-f457-4fd2-b7c0-44b3405ca24es︠
power_mod(7,605,2027)
︡4cf8d0e9-3f87-4f80-8085-f79b6fe5eca7︡{"stdout":"819\n"}︡{"done":true}
︠2a384e05-aa5d-47fe-b578-bd41f892b224s︠
########################################################################
# Problem 2
########################################################################
p = 94321
g = 51
A = 21168
b = 2222
m = 313
c_1 = power_mod(g,b,p)
c_1
︡197fd0dd-1711-4e17-a7b4-dfdd3319c658︡{"stdout":"30002\n"}︡{"done":true}
︠bafb697a-c4fa-417f-9d94-13b44ddac4a2s︠
c_2 = mod(m*power_mod(A,b,p),p)
c_2
︡bce7343b-fa16-4487-876c-9d9f3c660cf2︡{"stdout":"50096\n"}︡{"done":true}
︠99ec912a-8239-443a-b496-45317bb6b04fs︠
########################################################################
# Problem 3
########################################################################
p = 123484321
g = 42
A = 115837322
a = 8675309 #From Problem 1
c_1 = 69740486
c_2 = 46894276
#Inverse of c_1^a ?
ans = power_mod(c_1,a,p) #Compute c_1^a
anse = xgcd(p,ans)[2]
anser = mod(ans*anse,p) #Check it is an inverse
###########
mod(anse*anser,p) #Secret Message
︡00373033-c9f2-414a-b62c-854059bf777b︡{"stdout":"118927354\n"}︡{"done":true}
︠c6b4ec20-fb5d-47f6-833d-ed6af10b6480s︠
#Secret Message - all in one step!
mod(xgcd(p,power_mod(c_1,a,p))[2]*c_2,p)
︡4ee77032-8be4-4f98-b4bd-ff076d92c3cd︡{"stdout":"506\n"}︡{"done":true}
︠5870b542-f970-42ea-94c3-7b0ceaa3d796s︠
########################################################################
# Problem 4
########################################################################
discrete_log_brute_force(7,229,2027)
︡e541739d-7db1-41ea-bf85-9b28b833e675︡{"stdout":"609\n"}︡{"done":true}
︠c0367ff5-1e89-45ce-81c2-d7505729705cs︠
discrete_log_brute_force(5,2023,2027)
discrete_log_brute_force(7,2023,2027)
︡d33a9bec-0477-4fb9-8860-ea40fbb0a254︡{"stdout":"231\n"}︡{"stdout":"699\n"}︡{"done":true}
︠a5ffd600-b4b8-4624-9c0e-ddb8a5394776︠









