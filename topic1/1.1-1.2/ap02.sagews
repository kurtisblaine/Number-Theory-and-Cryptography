︠6e8b0b17-9fc1-4f5f-972a-fa30bc1ba74as︠
def gcd(a, b):
    u=1
    g=a
    x=0
    y=b
    while(y != 0):
        q = floor(g/y)
        t = int(mod(g,y))
        s = u-q * x
        u = x
        g = y
        x = s
        y = t
    v = (g - a*u)/b
    if u < 0:
        u = u + b / g
        v = v - a / g
    return g,u,v
a = 31313
b = 519
gcd(a, b)
c = 167181
d = 163961
gcd(c, d)
e = 8675309
f = 3892394
gcd(e, f)
︡9c1dea11-4a9d-4817-b282-0152514bb572︡{"stdout":"(173, 1, -60)\n"}︡{"stdout":"(7, 18993, -19366)\n"}︡{"stdout":"(1, 3048549, -6794560)\n"}︡{"done":true}
︠6d0d46cc-5295-4af8-8ab0-18a3967cad0ds︠
ans1 = a * 1 + b * (-60)
if ans1 == 173:
    print 'yes'
else:
    print 'no'
︡45a1305a-8649-4823-bec1-eb9aa059e9ae︡{"stdout":"yes\n"}︡{"done":true}
︠6e51c427-5a7e-464f-8e2c-d9bdfd9343ebs︠

ans2 = c * (18993) + d * (-19366)
if ans2 == 7:
    print 'yes'
else:
    print 'no'
︡caa5fd3b-b8a2-4f44-af15-c8cbcf6ced8e︡{"stdout":"yes\n"}︡{"done":true}
︠6ce36f2d-b45f-4456-ac9b-5160f4f66114s︠
ans3 = e * (3048549) + f * (-6794560)
if ans3 == 1:
    print 'yes'
else:
    print 'no'
︡8abdbf47-2747-4157-a6d8-b06fe72e6cc9︡{"stdout":"yes\n"}︡{"done":true}
︠7d4b7988-b59c-47dd-a62c-6f6abc4d8eb3︠









