// This file defines all the objects needed for the computations done in other files.

// Here we define the field Q4 and the y_i defined in the paper. 
ZZ:=Integers();
Q2:=pAdicField(2,100);
R<x>:=PolynomialRing(Q2);
Q4<phi>:=ext<Q2|x^2-x-1>;
O4:=Integers(Q4);
RR<t>:=PolynomialRing(Q4);
b:=Roots(t^2-5)[1][1];
c:=1+2*b;
y:=[-c*b,b,-1,c,c*b,-b,-2,2*c,2*c*b,-2*b,2,-2*c,2*b,-2*b*c,-c];



// Here we set up the group (O4/2^4) with its explicit generators u[1],u[2],u[3]
u:=[];
u[1]:=(3*b+11)/2;
u[2]:=2+b;
u[3]:=-1;
O4f:=ChangePrecision(O4,4);
U4,m4:=UnitGroup(O4);



// Now we set up the group (OK/p^f)/Uf for the 15 quadratic extensions K/Q4 with explicit generators as in the paper
K:=[SplittingField(t^2-y[i]): i in [1..#y]];
OK:=[Integers(F): F in K];
z:=[*Sqrt(K[i]!y[i]): i in [1..#y]*];


g:=[[**],[**],[**],[**],[**],[**],[**],[**],[**],[**],[**],[**],[**],[**],[**]];

g[1,1]:=z[1]+(b+3)/2;
g[2,1]:=b*z[2]+(b+3)/2;
g[3,1]:=((-3*b+1)/2)*z[3]-1;
g[4,1]:=(2*b-5)*z[4]-(b+3)/2;
g[5,1]:=((-b-3)/2)*z[5]+b-2;
g[6,1]:=((-3*b-1)/2)*z[6]-1;

g[1,2]:=z[1]+2;
g[2,2]:=z[2]+2;
g[3,2]:=(b-3)*z[3]+b-2;
g[4,2]:=(b-1)*z[4]-b+2;
g[5,2]:=((b+1)/2)*z[5]-b+3;
g[6,2]:=((b+1)/2)*z[6]+b-3;

g[1,3]:=(1-b)*z[1]+1;
g[2,3]:=(b+3)*z[2]+1;
g[3,3]:=-4*z[3]-(3*b+3)/2;
g[4,3]:=(-3*b+3)/2;
g[5,3]:=(b+3)*z[5]-b-2;
g[6,3]:=(b+3)*z[6]-b-2;

g[3,4]:=2-2*b-((b+1)/2)*z[3];
g[4,4]:=((-3*b+3)/2)*z[4]+4;

g[7,1]:=-z[7]+1;
g[8,1]:=-b*z[8]+b+2;
g[9,1]:=z[9]+1;
g[10,1]:=z[10]+1;

g[7,2]:=(b+2)*z[7]-(3*b+1)/2;
g[8,2]:=z[8]+(b+5)/2;
g[9,2]:=z[9]+(3*b-1)/2;
g[10,2]:=(b+2)*z[10]-(3*b+1)/2;

g[7,3]:=(3*b+3)/2;
g[8,3]:=(b-1)/2;
g[9,3]:=(b-1)/2;
g[10,3]:=(-b+7)/2;

g[11,1]:=(b+2)*z[11]+b-2;
g[12,1]:=z[12]+1;
g[13,1]:=z[13]+1;
g[14,1]:=z[14]+1;

g[11,2]:=z[11]+(3*b+5)/2;
g[12,2]:=z[12]+(3*b-1)/2;
g[13,2]:=b*z[13]-(3*b+1)/2;
g[14,2]:=-b*z[14]-(3*b+1)/2;

g[11,3]:=2*b+1;
g[12,3]:=(-3*b-5)/2;
g[13,3]:=(-b-1)/2;
g[14,3]:=(-b-1)/2;

g[15,1]:=((3*b+4)/2)*z[15]-(5*b+6)/2;
g[15,2]:=((3*b-1)/2)*z[15]+2*b+8;
g[15,3]:=((-3*b+5)/2)*z[15]-2*b-10;


//Here we compute the groups (OK/p^f)/Uf the value of f depends on the valuation of the discriminant of the field
m2Fields:=[ChangePrecision(OK[i],6): i in [1..6]];
m3Fields:=[ChangePrecision(OK[i],5): i in [7..14]];
OKf:=m2Fields cat m3Fields;
OKf:=Append(OKf,ChangePrecision(OK[15],4));


UK:=[* *];
for i in [1..15] do 
    U,m:=UnitGroup(OKf[i]);
    UK:=Append(UK,[*U,m*]);
end for;

Uf:=[sub<UK[i,1]|[Inverse(UK[i,2])(OKf[i]!Norm(ChangePrecision(K[i]!UK[i,2](g),Precision(K[i])))):g in Generators(UK[i,1])]> : i in [1..15]];

ConG:=[* *];
for i in [1..15] do 
    Q,m:=quo<UK[i,1]|Uf[i]>;
    ConG:=Append(ConG,[*Q,m*]);
end for;

Gen:=[* *];
for i in [1..15] do
    Aux:=[ConG[i,2](Inverse(UK[i,2])(OKf[i]!z)): z in g[i]];
    assert sub<ConG[i,1]|Aux> eq ConG[i,1]; //This lines check that the generators we have define in the paper do indeed generate the groups
    Gen:=Append(Gen,Aux); 
end for;
// The list Gen contains the images of the g[i,j] inside the group (OK_i/p^f)/Uf, this will be useful later.



// Finally we define the function we will use to compute the 3-torsion field of an elliptic curve.
function TorsionField3(E1)
    K:=BaseRing(E1);
    P<x>:=PolynomialRing(K);
    E:=WeierstrassModel(E1);
    v2:=aInvariants(E);
    f:=x^3+v2[2]*x^2+v2[4]*x+v2[5]*1;
    g:=DivisionPolynomial(E,3);
    L:=SplittingField(g);
    R<x>:=PolynomialRing(L);
    Rot:=Roots(R!g);
    z:=Rot[1,1]; 
    z1:=Evaluate(R!f,z);
    L:=SplittingField(x^2-z1);
    R<x>:=PolynomialRing(L);
return DefiningPolynomial(L,K),L,K;
end function;



