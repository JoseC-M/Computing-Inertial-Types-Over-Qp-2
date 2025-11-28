load "p=3Fields.m";

// The function QuickCheck ensures that all the curves have potentially good reduction, that they have the conductor we claim and that they obtain good reduction over the corresponding inertia field. 
function QuickCheck3()
    for c in [1..#E] do
        for i in [1..#E[c]] do
            assert Valuation(jInvariant(E[c,i])) ge 0;
            assert (Valuation(Conductor(E[c,i])) eq c);
            assert Valuation(Conductor(BaseChange(E[c,i],InertiaFields[c,i]))) eq 0;
        end for;
    end for;
    return "Checked";
end function;

// Since curves with diferent conductors cannot have the same inertial type thank to the above function is enough to shows that all curves in the list with the same conductor have different inertial types.
// this function does precisely that.
function DetailedCheck3()
    for c in [1..5] do
        Index:={1..#E[c]};
        Pairs:=Subsets(Index,2);
        for s in Pairs do
            Pair:=[i : i in s];
            assert (not (Valuation(Conductor(BaseChange(E[Pair[1]],InertiaFields[Pair[2]]))) eq 0)) or (not (Valuation(Conductor(BaseChange(E[Pair[2]],InertiaFields[Pair[1]]))) eq 0));
        end for;
    end for;
    return "Checked";
end function;

//This function allows to compute the inertial type of an elliptic curve E1 by comparing against our list.
function Compare3(E1)
    if Valuation(jInvariant(E1)) lt 0 then return "The curve does not have good reduction";end if;
    c:=Valuation(Conductor(E1));
    f,L:=TorsionField5(E1);
    e:=RamificationDegree(L,Q9);
    if c eq 0 then return "The curve has good reduction, trivial inertial type"; end if;
    for i in [1..#InertiaFields[c]] do
        if ((Valuation(Conductor(BaseChange(E1,InertiaFields[c,i]))) eq 0) and (RamificationDegree(InertiaFields[c,i],Q9) eq e)) then return "Type of the curve E",[c,i]; end if;
    end for;
    return 0;
end function;

//The following functions compute the explicit character associated to a nonexeptional type of an elliptic Curve

//This function computes the character associated to the inertial type of E when it is a Principal Series
//The output is the value of the character on the generators u[1],u[2] defined in the paper
//This image is given in terms of a primitive fourth root of unity I, a primitive third root of unity zeta3 or a primitive sixth root of unity zeta6
//depending on the order of the character, (Note that zeta6^2=zeta6-1);
//Note also that the function can output the character appearing on the paper or its inverse since both produce the same type.
function PSChar3(E)
    f,L:=TorsionField5(E);
    ord:=RamificationDegree(L,Q9);
    if ord eq 4 then 
        Q:=Rationals();
        QPoly<X>:=PolynomialRing(Q);
        Q<I>:=ext<Q|(X^2+1)>;
    elif ord eq 3 then
        Q:=Rationals();
        QPoly<X>:=PolynomialRing(Q);
        Q<zeta3>:=ext<Q|(X^2+X+1)>;
    elif ord eq 6 then
        Q:=Rationals();
        QPoly<X>:=PolynomialRing(Q);
        Q<zeta6>:=ext<Q|(X^2-X+1)>;
    end if;

    qx,L:=TorsionField5(E);
    OL:=Integers(L);
    OL:=ChangePrecision(OL,25);
    UL,mL:=UnitGroup(OL);
    NormGen:=[Inverse(m9)(ChangePrecision(O9!Norm(L!OL!mL(g),Q9),Precision(Q9))): g in Generators(UL)];
    Zn:=AdditiveGroup(Integers(ord));
    Characters,tau:=Hom(U9,Zn);
    for generator in NormGen do
        Characters:=[chi : chi in Characters | IsIdentity(tau(chi)(generator))];
    end for;
    Characters:=[chi : chi in Characters | Order(chi) eq ord];

    chi:=tau(Characters[1]);

    if ord eq 4 then 
        CharVal:=[I^ZZ!ElementToSequence(chi(Inverse(m9)(u[j]))): j in [1..#u]];
    elif ord eq 3 then
        CharVal:=[zeta3^ZZ!ElementToSequence(chi(Inverse(m9)(u[j]))): j in [1..#u]];
    elif ord eq 6 then
        CharVal:=[zeta6^ZZ!ElementToSequence(chi(Inverse(m9)(u[j]))): j in [1..#u]];
    end if;
    return CharVal;
end function;

//This function computes the character associated to the inertial type of E when it is Supercuspiald Unramified of order ord
//More precisely it returns the value of the character evaluated on the generaotrs g1 and g2 as defined in the paper.
//This image is given in terms of a primitive fourth root of unity I, a primitive third root of unity zeta3 or a primitive sixth root of unity zeta6
//depending on the order of the character, (Note that zeta6^2=zeta6-1);
//Note also that the function can output the character appearing on the paper or its inverse since both produce the same induction.
function SCUnRamChar3(E)
    f,L:=TorsionField5(E);
    ord:=RamificationDegree(L,Q9);
    if  ord eq 3 then
        Q:=Rationals();
        QPoly<X>:=PolynomialRing(Q);
        Q<zeta3>:=ext<Q|(X^2+X+1)>;
    elif ord eq 6 then
        Q:=Rationals();
        QPoly<X>:=PolynomialRing(Q);
        Q<zeta6>:=ext<Q|(X^2-X+1)>;
    end if;
    El:=BaseChange(E,K[3]);
    qx,L:=TorsionField5(El);
    OL:=Integers(L);
    OL:=ChangePrecision(OL,25);
    UL,mL:=UnitGroup(OL);
    NormGen:=[ConG[3,2](Inverse(UK[3,2])(OKf[3]!Norm(L!OL!mL(g),K[3]))): g in Generators(UL)];
    Zn:=AdditiveGroup(Integers(ord));
    Characters,tau:=Hom(ConG[3,1],Zn);

    for generator in NormGen do
        Characters:=[chi : chi in Characters | IsIdentity(tau(chi)(generator))];
    end for;
    Characters:=[chi : chi in Characters | Order(chi) eq ord];
    chi:=tau(Characters[1]);
    GenOK:=Gen[3];
    if ord eq 3 then
        CharVal:=[zeta3^ZZ!ElementToSequence(chi(GenOK[j])): j in [1..#GenOK]];
    elif ord eq 6 then
        CharVal:=[zeta6^ZZ!ElementToSequence(chi(GenOK[j])): j in [1..#GenOK]];
    end if;
    return CharVal;
end function;


//This function computes the character chi of K_i associated to the Supercuspidal ramified inertial type of the elliptic curve E
//More precisely it returns the value of the character evaluated on the generaotrs g1,g2,g3 and g4 (if there is g4) as defined in the article. In the output of this function the imaginary unit is denoted as I.
//Note also that the function can output the character appearing on the paper or its inverse since both produce the same induction.
function SCRamChar3(E,i)
    Q:=Rationals();
    QPoly<X>:=PolynomialRing(Q);
    Q<zeta6>:=ext<Q|(X^2-X+1)>;
    El:=BaseChange(E,K[i]);
    qx,L:=TorsionField5(El);
    OL:=Integers(L);
    OL:=ChangePrecision(OL,25);
    UL,mL:=UnitGroup(OL);
    NormGen:=[ConG[i,2](Inverse(UK[i,2])(OKf[i]!Norm(L!OL!mL(g),K[i]))): g in Generators(UL)];
    Z4,Intm:=AdditiveGroup(Integers(6));
    Characters,tau:=Hom(ConG[i,1],Z4);
    for generator in NormGen do
        Characters:=[chi : chi in Characters | IsIdentity(tau(chi)(generator))];
    end for;
    Characters:=[chi : chi in Characters | Order(chi) eq 6];
    chi:=tau(Characters[1]);
    GenOK:=Gen[i];
    CharVal:=[zeta6^ZZ!ElementToSequence(chi(GenOK[j])): j in [1..#GenOK]];
    return CharVal,#Characters;
end function;





