ZZ:=Integers();
Q3:=pAdicField(3,500);
R<x>:=PolynomialRing(Q3);
Q9<a>:=ext<Q3|x^2-2>;
O9:=Integers(Q9);
RR<t>:=PolynomialRing(Q9);
y:=[3,3*(1+a),1+a];

u:=[* *];
u[1]:=1+a;
u[2]:=4;
O9f:=ChangePrecision(O9,2);
U9,m9:=UnitGroup(O9f);

K:=[* *];
K[1]:=ext<Q9|t^2-3>;
K[2]:=ext<Q9|t^2-3*u[1]>;
K[3]:=ext<Q9|t^2-u[1]>;

z:=[*Sqrt(K[i]!y[i]): i in [1..#y]*];
OK:=[Integers(F): F in K];
OKf:=[ChangePrecision(OK[i],4): i in [1..2]];
OKf:=Append(OKf,ChangePrecision(OK[3],2));

g:=[[* *],[* *],[* *]];
g[1,1]:=z[1]*a-8*z[1]+5*a+2;
g[1,2]:=-z[1]*a+3*a+1;
g[1,3]:=3*z[1]*a-6*z[1]-5*a-6;

g[2,1]:=-z[2]*a+z[2]-2*a+1;
g[2,2]:=-4*z[2]-3*a-2;

g[3,1]:=28*z[3]*a-21*z[3]+8;
g[3,2]:=3*z[3]*a+6*z[3]+1;

UK:=[* *];
for i in [1..3] do 
    U,m:=UnitGroup(OKf[i]);
    UK:=Append(UK,[*U,m*]);
end for;

Uf:=[sub<UK[i,1]|[Inverse(UK[i,2])(OKf[i]!Norm(ChangePrecision(K[i]!UK[i,2](g),Precision(K[i])))):g in Generators(UK[i,1])]> : i in [1..3]];

ConG:=[* *];
for i in [1..3] do 
    Q,m:=quo<UK[i,1]|Uf[i]>;
    ConG:=Append(ConG,[*Q,m*]);
end for;

Gen:=[* *];
for i in [1..3] do
    Aux:=[ConG[i,2](Inverse(UK[i,2])(OKf[i]!z)): z in g[i]];
    assert sub<ConG[i,1]|Aux> eq ConG[i,1]; //This lines check that the generators we have define in the paper do indeed generate the groups
    Gen:=Append(Gen,Aux); 
end for;

function TorsionField5(E1)
//We Pick and Elliptic Curve and a WeierstrassModel y^2=f(x)
    K:=BaseRing(E1);
    P<x>:=PolynomialRing(K);
    E:=WeierstrassModel(E1);
    v2:=aInvariants(E);
// Then we adjoint the roots of f(x) to Q9 to obtain a field L;
    f:=x^3+v2[2]*x^2+v2[4]*x+v2[5]*1;
    g:=DivisionPolynomial(E,5);
    L:=SplittingField(g);
    R<x>:=PolynomialRing(L);
    g2:=R!g;
    Rot:=Roots(g2);
    for r in Rot  do
    z1:=Evaluate(R!f,r[1]);
    L:=SplittingField(R!(x^2-z1));
    R<x>:=PolynomialRing(L);
    end for;
return DefiningPolynomial(L,K),L,K;
end function;





