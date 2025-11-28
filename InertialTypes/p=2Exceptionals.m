
load "p=2Fields.m";

//We explicitely define the cubic extensions of Q4.
KC:=[];
OKC:=[];
KCPoly:=[];

Cubic<alpha1>:=ext<Q4|t^3-2>;
KC:=Append(KC,Cubic);
Polys<x1>:=PolynomialRing(Cubic);
KCPoly:=Append(KCPoly,Polys);


Cubic<alpha2>:=ext<Q4|t^3+2*phi>;
KC:=Append(KC,Cubic);
Polys<x2>:=PolynomialRing(Cubic);
KCPoly:=Append(KCPoly,Polys);

Cubic<alpha3>:=ext<Q4|t^3+2*phi+2>;
KC:=Append(KC,Cubic);
Polys<x3>:=PolynomialRing(Cubic);
KCPoly:=Append(KCPoly,Polys);

Cubic<alpha4>:=ext<Q4|t^3+phi>;
KC:=Append(KC,Cubic);
Polys<x4>:=PolynomialRing(Cubic);
KCPoly:=Append(KCPoly,Polys);


// This function computes all the field extension that are the fixed field of the kernel of an exceptional inertial type that becomes triple imprimitive over the cubic extension K_i/Q4, with 0<i<5. The output consist of 2 object, the first one is a list whose i-th entry is another list containing, for each orbits M_ij, all the fields L that are, quadratic over the compositum M of the M_ij and such that L/Q4 has Galois group SL_2(F3). The second output is a list with a generator for each the three quadratic extensions of M_ij that form a Galois orbit that is a subgroup of order 4. See the example below for a more concrete explanation.
function Exceptionals(i)
    K<s>:=KC[i];
    Gal,GaltoAut:=AutomorphismGroup(K,Q4);
    sigma:=GaltoAut(Gal.2); // Gal.1 is the identity, Gal.2 is a generator.
    SelGr,fK:=pSelmerGroup(2,K);


    //We tansform the elements in the gorup SelGr to elements in K
    Sel:=[Inverse(fK)(z): z in SelGr];

    // This function computes the Orbits that are also subgroups, that is, Galois submodules of the selmer Galois Module  
    SubgroupOrbits:=[ ];
    OrbitsInSel:=[];
    for z in Sel do
        z1:=z;
        z2:=sigma(z);
        z3:=sigma(sigma(z));
        zOrbit:={fK(z1),fK(z2),fK(z3)};
        if zOrbit notin OrbitsInSel then
            if (fK(z1)*fK(z2) eq fK(z3)) and not IsIdentity(fK(z1)) then 
                OrbitsInSel:=Append(OrbitsInSel,{fK(z1),fK(z2),fK(z3)}); // We need this list to check that we are not considering the same orbit twice 
                SubgroupOrbits:=Append(SubgroupOrbits,[z1,z2,z3]);      // We cannot check with the list of elements in K beacuse each element in SelGr has different representatives in K
            end if;
        end if;
    end for;

    // Now for each orbit we build the composite M of the M_ij, and compute the quadratic extensions of M
    // that are Galois over Q4 with Galois group SL2F3.
    SL2F3Ext:=[];
    for k in [1..#SubgroupOrbits] do
        Orbit:=[ChangePrecision(z,Precision(K)): z in SubgroupOrbits[k]];
        R<x>:=PolynomialRing(K);
        E1:=SplittingField(x^2-Orbit[1]);
        R<x>:=PolynomialRing(E1);
        E:=SplittingField(x^2-Orbit[2]);
        R<x>:=PolynomialRing(E); 
        // Since the orbits are subgroups it is superflous to add the root of x^2-z3 so we can stop here. 


        GalE,GalEtoAutE:=AutomorphismGroup(E,Q4);
        GalEGen:=[GalEtoAutE(GalE.j) : j in [2..#Generators(GalE)+1]]; // j starts in 2 because GalE.1 is the identity.
        ESelGr,fE:=pSelmerGroup(2,E);
        ESelGen:=[Inverse(fE)(ESelGr.j) : j in [1..#Generators(ESelGr)]];

        V:=VectorSpace(GF(2),#ESelGen);
        for g in GalEGen do
            G:=[];
            for z in ESelGen do 
                G:=Append(G,ElementToSequence(fE(g(z))));
            end for;
            FixedByG:=Eigenspace(Matrix(GF(2),G),1);
            V:=V meet FixedByG;
        end for;
        
        // Then for each v in V we check if the field L=M(sqrt{v}) has Galois group SL2F3
        // Of course this is computationally heavy and the programme may take some time to finish.
        ExtensionsAux:=[ ];
        for v in V do
            z:=ChangePrecision(Inverse(fE)(ESelGr!ElementToSequence(v)),Precision(E));
            L:=SplittingField(x^2-z);
            //if (not IsZero(v)) and (RamificationDegree(L,E) eq 1) then print("The quadratic unramified extension of M is in V"); end if;
            // The above line checks that the quadratic unramified extension of M is in V and thus half of the extensions we obtain produce the same inertia field.
            // Since it is just a check one can comment the above line to speed up the code.
            if IsIsomorphic(AutomorphismGroup(L,Q4),SL(2,3)) then 
                ExtensionsAux:=Append(ExtensionsAux,L);
            end if;
        end for;
        SL2F3Ext:=Append(SL2F3Ext,ExtensionsAux);
    end for;
    return SL2F3Ext, SubgroupOrbits;
end function;

//Example:
//We compute all inertia fields L corresponding to exceptional inertial types that become triply imprimitive over K_1 with the following command:

// SL2F3K1,SubgroupOrbits:=Exceptionals(1);

// Both SubgroupOrbits and SL2F3 are lists of 5 elements corresponding to the 5 Subgroup Orbits of K_1/(K_1)^2.
// The following comand shows representatives of the three elements in the first Subgroup Orbit of K_1/(K_1)^2

// SubgroupOrbits[1];

// The square root of any of these representatives produces a quadratic extension M_1j/K_1 from which the inertial type can be induced. All the possible inertia fields L that come from types induced from a quadratic extension of K_1 are: 

//#SL2F3K1[1];
//#SL2F3K1[2];
//#SL2F3K1[3];
//#SL2F3K1[4];
//#SL2F3K1[5];

//Note that two of the above are empty, since there are no exceptional types induced from the quadratic extensions generated by the elements in the corresponding orbit.


//This function computes the inertial fields for all cubics K_i/Q4
function AllExceptionals()
    SL2F3:=[* *];
    GalOrbits:=[* *];
    for i in [1..4] do
        Aux1,Aux2:=Exceptionals(i);
        Aux3:=[* *];
        Aux4:=[* *];
        for j in [1..#Aux1] do
            if not IsEmpty(Aux1[j]) then Aux3:=Append(Aux3,Aux1[j]); Aux4:=Append(Aux4,Aux2[j]); end if;
        end for;
        SL2F3:=Append(SL2F3,Aux3);
        GalOrbits:=Append(GalOrbits,Aux4);
    end for;
    return SL2F3,GalOrbits;
end function;



// To avoid computing the tower M/K/Q4 each time one need to compute a character defining an inertial type, we explicitely define here all the quadratic extensions M/K_i of the cubic extensions K_i/Q4. 

M:=[*0,0,0,0*];
Aux:=[];
Aux cat:= [ ext<KC[1] | KCPoly[1]!(1)*x1^2 + KCPoly[1]!(phi*alpha1)*x1 + KCPoly[1]!(alpha1) >];
Aux cat:= [ ext<KC[1] | KCPoly[1]!(1)*x1^2 + KCPoly[1]!(alpha1)*x1 + KCPoly[1]!(alpha1) >];
Aux cat:= [ ext<KC[1] | KCPoly[1]!(1)*x1^2 + KCPoly[1]!((phi + 1)*alpha1)*x1 + KCPoly[1]!(alpha1) >];
Aux cat:= [ ext<KC[1] | KCPoly[1]!(1)*x1^2 + KCPoly[1]!(phi*alpha1^3)*x1 + KCPoly[1]!(((phi + 1)*alpha1^2 + 1)*alpha1) >];
Aux cat:= [ ext<KC[1] | KCPoly[1]!(1)*x1^2 + KCPoly[1]!(phi*alpha1^3)*x1 + KCPoly[1]!(((phi + 1)*alpha1^2 + 2*phi*alpha1 + 1)*alpha1) >];
Aux cat:= [ ext<KC[1] | KCPoly[1]!(1)*x1^2 + KCPoly[1]!(alpha1^3)*x1 + KCPoly[1]!((alpha1^2 + 1)*alpha1) >];
Aux cat:= [ ext<KC[1] | KCPoly[1]!(1)*x1^2 + KCPoly[1]!(alpha1^3)*x1 + KCPoly[1]!((alpha1^2 + 2*alpha1 + 1)*alpha1) >];
Aux cat:= [ ext<KC[1] | KCPoly[1]!(1)*x1^2 + KCPoly[1]!(((phi + 1)*alpha1^3))*x1 + KCPoly[1]!(((phi + 2)*alpha1^2 + 1)*alpha1) >];
Aux cat:= [ ext<KC[1] | KCPoly[1]!(1)*x1^2 + KCPoly[1]!(((phi + 1)*alpha1^3))*x1 + KCPoly[1]!(((phi + 2)*alpha1^2 + (2*phi + 2)*alpha1 + 1)*alpha1) >];
M[1]:=Aux;
Aux:=[];

Aux cat:=[ ext<KC[2] | KCPoly[2]!(1)*x2^2 + KCPoly[2]!(phi*alpha2)*x2 + KCPoly[2]!(alpha2) >];
Aux cat:=[ ext<KC[2] | KCPoly[2]!(1)*x2^2 + KCPoly[2]!(alpha2)*x2 + KCPoly[2]!(alpha2) >];
Aux cat:=[ ext<KC[2] | KCPoly[2]!(1)*x2^2 + KCPoly[2]!((phi + 1)*alpha2)*x2 + KCPoly[2]!(alpha2) >];
Aux cat:=[ ext<KC[2] | KCPoly[2]!(1)*x2^2 + KCPoly[2]!(phi*alpha2^3)*x2 + KCPoly[2]!((phi*alpha2^2 + 1)*alpha2) >];
Aux cat:=[ ext<KC[2] | KCPoly[2]!(1)*x2^2 + KCPoly[2]!(phi*alpha2^3)*x2 + KCPoly[2]!((phi*alpha2^2 - 2*phi*alpha2 + 1)*alpha2) >];
Aux cat:=[ ext<KC[2] | KCPoly[2]!(1)*x2^2 + KCPoly[2]!(alpha2^3)*x2 + KCPoly[2]!(((-phi - 1)*alpha2^2 + 1)*alpha2) >];
Aux cat:=[ ext<KC[2] | KCPoly[2]!(1)*x2^2 + KCPoly[2]!(alpha2^3)*x2 + KCPoly[2]!(((-phi - 1)*alpha2^2 + (-4*phi - 2)*alpha2 + 1)*alpha2) >];
Aux cat:=[ ext<KC[2] | KCPoly[2]!(1)*x2^2 + KCPoly[2]!(((phi + 1)*alpha2^3))*x2 + KCPoly[2]!(((-2*phi + 1)*alpha2^2 + 1)*alpha2) >];
Aux cat:=[ ext<KC[2] | KCPoly[2]!(1)*x2^2 + KCPoly[2]!(((phi + 1)*alpha2^3))*x2 + KCPoly[2]!(((-2*phi + 1)*alpha2^2 + (-2*phi - 2)*alpha2 + 1)*alpha2) >];
M[2]:=Aux;
Aux:=[];


Aux cat:=[ext<KC[3] | KCPoly[3]!(1)*x3^2 + KCPoly[3]!(phi*alpha3)*x3 + KCPoly[3]!(alpha3) >];
Aux cat:=[ext<KC[3] | KCPoly[3]!(1)*x3^2 + KCPoly[3]!(alpha3)*x3 + KCPoly[3]!(alpha3) >];
Aux cat:=[ext<KC[3] | KCPoly[3]!(1)*x3^2 + KCPoly[3]!((phi + 1)*alpha3)*x3 + KCPoly[3]!(alpha3) >];
Aux cat:=[ext<KC[3] | KCPoly[3]!(1)*x3^2 + KCPoly[3]!(phi*alpha3^3)*x3 + KCPoly[3]!(((-4*phi - 1)*alpha3^2 + 1)*alpha3) >];
Aux cat:=[ext<KC[3] | KCPoly[3]!(1)*x3^2 + KCPoly[3]!(phi*alpha3^3)*x3 + KCPoly[3]!(((-4*phi - 1)*alpha3^2 + (-6*phi - 4)*alpha3 + 1)*alpha3) >];
Aux cat:=[ext<KC[3] | KCPoly[3]!(1)*x3^2 + KCPoly[3]!(alpha3^3)*x3 + KCPoly[3]!(((-3*phi - 2)*alpha3^2 + 1)*alpha3) >];
Aux cat:=[ext<KC[3] | KCPoly[3]!(1)*x3^2 + KCPoly[3]!(alpha3^3)*x3 + KCPoly[3]!(((-3*phi - 2)*alpha3^2 + (-4*phi - 2)*alpha3 + 1)*alpha3) >];
Aux cat:=[ext<KC[3] | KCPoly[3]!(1)*x3^2 + KCPoly[3]!(((phi + 1)*alpha3^3))*x3 + KCPoly[3]!(((-phi - 1)*alpha3^2 + 1)*alpha3) >];
Aux cat:=[ext<KC[3] | KCPoly[3]!(1)*x3^2 + KCPoly[3]!(((phi + 1)*alpha3^3))*x3 + KCPoly[3]!(((-phi - 1)*alpha3^2 + (-2*phi - 2)*alpha3 + 1)*alpha3) >];
M[3]:=Aux;
Aux:=[];

Aux cat:=[ext<KC[4] | KCPoly[4]!(1)*x4^2 + KCPoly[4]!(2*phi*alpha4^2)*x4 + KCPoly[4]!(2) >];
Aux cat:=[ext<KC[4] | KCPoly[4]!(1)*x4^2 + KCPoly[4]!(2*phi*alpha4)*x4 + KCPoly[4]!(2) >];
Aux cat:=[ext<KC[4] | KCPoly[4]!(1)*x4^2 + KCPoly[4]!(2*alpha4^2)*x4 + KCPoly[4]!(2) >];
Aux cat:=[ext<KC[4] | KCPoly[4]!(1)*x4^2 + KCPoly[4]!((2*(phi + 1)*alpha4^2))*x4 + KCPoly[4]!(2) >];
Aux cat:=[ext<KC[4] | KCPoly[4]!(1)*x4^2 + KCPoly[4]!(2*alpha4)*x4 + KCPoly[4]!(2) >];
Aux cat:=[ext<KC[4] | KCPoly[4]!(1)*x4^2 + KCPoly[4]!((2*(phi + 1)*alpha4))*x4 + KCPoly[4]!(2) >];
Aux cat:=[ext<KC[4] | KCPoly[4]!(1)*x4^2 + KCPoly[4]!((2*(phi*alpha4^2 + phi*alpha4 + 1)))*x4 + KCPoly[4]!(2) >];
Aux cat:=[ext<KC[4] | KCPoly[4]!(1)*x4^2 + KCPoly[4]!((2*((phi + 1)*alpha4^2 + alpha4 + 1)))*x4 + KCPoly[4]!(2) >];
Aux cat:=[ext<KC[4] | KCPoly[4]!(1)*x4^2 + KCPoly[4]!((2*(alpha4^2 + (phi + 1)*alpha4 + 1)))*x4 + KCPoly[4]!(2) >];
M[4]:=Aux;
Aux:=[];

// This function checks that the quadratic extensions M/K_i define in the above list do indeed correspond to the quadratic extensions generated by the square roots of the elements in the orbits computed before.
function VerifyM(GalOrbit);
    for i in [1..4] do
        for j in [1..#GalOrbit[i]] do
            for k in [1..#GalOrbit[i,j]]do
                assert [F: F in M[i] | IsSquare(F!GalOrbit[i,j,k])] eq 1;
            end for;   
        end for;
    end for;
    return "Verified";
end function;

//We give the fields the same name as in the paper so they are easier to indentify
M1_1:=M[1,1];
M1_3:=M[1,2];
M1_5:=M[1,3];
M1_55:=M[1,4];
M1_57:=M[1,5];
M1_79:=M[1,6];
M1_83:=M[1,7];
M1_104:=M[1,8];
M1_110:=M[1,9];

M2_1:=M[2,1];
M2_3:=M[2,2];
M2_5:=M[2,3];
M2_39:=M[2,4];
M2_43:=M[2,5];
M2_88:=M[2,6];
M2_94:=M[2,7];
M2_112:=M[2,8];
M2_114:=M[2,9];

M3_1:=M[3,1];
M3_3:=M[3,2];
M3_5:=M[3,3];
M3_48:=M[3,4];
M3_54:=M[3,5];
M3_72:=M[3,6];
M3_74:=M[3,7];
M3_120:=M[3,8];
M3_124:=M[3,9];

M4_1:=M[4,1];
M4_3:=M[4,2];
M4_15:=M[4,3];
M4_17:=M[4,4];
M4_31:=M[4,5];
M4_35:=M[4,6];
M4_69:=M[4,7];
M4_113:=M[4,8];
M4_115:=M[4,9];

//The function ExceptionalChar(E,M) computes the character of M that induces the triply imprimitive inertial type of K_i. This triply imprimitive inertial types is the restriction to K_i of the exceptional type of Q4 corresponding to the elliptic curve E.
// If the function returns "ERROR in discrete logarithm (quadratic)" the field M is not one of the extension form which the type can be induced. 
// The function also returns the generators of the group UM as elements in the field M, the gorup UM and a map that from M to UM.
function ExceptionalChar(E,M)
    Q:=Rationals();
    QPoly<X>:=PolynomialRing(Q);
    Q<I>:=ext<Q|(X^2+1)>;
    K:=BaseField(M);
    ff:=Max(ZZ!Valuation(Conductor(BaseChange(E,K)))-Valuation(Discriminant(M,K)),RamificationDegree(M,Q4)+1);
    OM:=ChangePrecision(Integers(M),ff);
    UM,m:=UnitGroup(OM);
    GenUM:=[t:t in Generators(UM)];
    El:=BaseChange(E,M);
    qx,L:=TorsionField3(El);
    OL:=Integers(L);
    OL:=ChangePrecision(OL,49);
    UL,mL:=UnitGroup(OL);
    NormGen:=[(Inverse(m)(OM!M!Norm(L!OL!mL(g),M))): g in Generators(UL)];
    Z4,Intm:=AdditiveGroup(Integers(4));
    Characters,tau:=Hom(UM,Z4);
    Characters:=[chi : chi in Characters | Order(chi) eq 4];
    for generator in NormGen do
        Characters:=[chi : chi in Characters | IsIdentity(tau(chi)(generator))];
    end for;
    chi:=tau(Characters[1]);
    CharVal:=[I^ZZ!ElementToSequence(chi(GenUM[j])): j in [1..#GenUM]];
    GenList:=[M!OM!m(t): t in GenUM];
    return CharVal,GenList,UM,Inverse(m);
end function;

// The following line produces all the characters that can be used to describe the type of ExE[7,5]
//      ExceptionalChar(ExE[7,5],M1_55)
//      ExceptionalChar(ExE[7,5],M1_79)
//      ExceptionalChar(ExE[7,5],M1_104)

// Example of use of the other outputs of the function:
//      Val,Gen,UM,Map:=ExceptionalChar(ExE[7,5],M1_104)
//      Gen[1];
//      Order(Map(Gen[1]));
//      Gen[1]*Gen[2];
//      Map(Gen[1]*Gen[2]) eq Map(Gen[1])*Map(Gen[2]);
//      Order(Map(Gen[1]*Gen[2]));



// For the next functions we need to run the following line
    // SL2F3,GalOrbits:=AllExceptionals();

// The function MatchExceptionals(SL2F3) checks, for a given curve what is the corresponding field as computed above.
// Note that once we have checked with the function AllExceptionals() that the bound for the number of different fields is 96 it is enough to show 96 different inertial types 
// and compute its inertial fields. This is already done in "p=2MainChecks.magma" so this function is redundant. 
// However we leave it if someone is interested in further sanity checks comparing againts the fields computed by AllExceptionals().
// The fastes way to find the explicit type of an elliptic curve is to use the function Compare2(E) in the file "p=2MainChecks.magma".
function MatchExceptionals(SL2F3,E)
matches:=[];
f,L:=TorsionField3(E);
    if RamificationDegree(L,Q4) eq 8 then 

        for j in [1..#SL2F3[4]] do 
            for k in [1..#SL2F3[4,j]] do
            if Valuation(Conductor(BaseChange(E,SL2F3[4,j,k]))) eq 0 then matches:=Append(matches,[4,j,k]); end if; 
            end for;
        end for;

    else  
        for i in [1..3] do
    //        f,L:=TorsionField3(BaseChange(E,KC[i]));
    //        if RamificationDegree(L,KC[i]) lt 24 then l:=i; end if;
    //    end for;
            l:=i;
        for j in [1..#SL2F3[l]] do 
            for k in [1..#SL2F3[l,j]] do
            if Valuation(Conductor(BaseChange(E,SL2F3[l,j,k]))) eq 0 then matches:=Append(matches,[l,j,k]); end if; 
            end for;
        end for;
    end for;
    end if;
return matches;
end function;

// For example the following line
    // MatchExceptionals(SL2F3,ExE[7,40])
//returns [2,3,15] and [2,3,16]. This means that the fixed field of the kernel of the inerital type of $ExE[7,40]$ can be described as:
//SL2F3[2,3,15] compose with the maximal unramified extension of F
//SL2F3[2,3,16] compose with the maximal unramified extension of F 
