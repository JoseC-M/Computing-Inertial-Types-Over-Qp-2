load "SettingQ4.m";

//In this file we define the elliptic curves appearing in the tables of the article the list E contains the nonexeptional ones and the list ExE contains the exceptional ones.
// The first number correspond to the conductor of the curve and the second one enumerates the curves for a given conductor.
// For example the curve 8E5 of table 16 is E[8,5] and the curve 7E1 of table 19 is ExE[7,1]

E:=[[],[],[],[],[],[],[],[]];   // This list will containthe curves realizing nonexceptional elliptic curves ordered by conductor
ExE:=[[],[],[],[],[],[],[],[]]; // This list will contain the curves realizing exceptional elliptic curves ordered by conductor


//Non-Exceptional Curves Of Conductor 2
E[2,1] := EllipticCurve([0,Q4!1,0,2^2,2^2]);

//Non-Exceptional Curves Of Conductor 4
E[4,1] := EllipticCurve([0, 0, 0, 2^4*(-135), 2^4*(-5130*phi + 2565)]);  
E[4,2] := EllipticCurve([0, 0, 0, Q4!2^4*(-27), 2^4*(-513)]);               
E[4,3] := EllipticCurve([0, 0, 0, 2^4*(-135), 2^4*(5130*phi - 2565)]);   
E[4,4] := EllipticCurve([0, 2*phi-1, 0, 2^2*5, 2^2*(10*phi-5)]);        
E[4,5] := EllipticCurve([0, -1, Q4!0, 2^2, -2^2]);                           
E[4,6] := EllipticCurve([0, -2*phi+1, 0, 2^2*5, 2^2*(-10*phi+5)]);   

//Non-Exceptional Curves Of Conductor 5
E[5,1] := EllipticCurve([0, 1, 0, 2, 2^2*phi]);         
E[5,2] := EllipticCurve([0, 0, Q4!0, -1, 0]);              
E[5,3] := EllipticCurve([0, Q4!1, 0, 2, 2^2]);             
E[5,4] := EllipticCurve([0, 1, 0, 2, 2^2*(phi + 1)]);  

//Non-Exceptional Curves Of Conductor 6
E[6,1]  := EllipticCurve([0, 1, 0, 2*(3*phi+2), 2*(phi+1)]);
E[6,2]  := EllipticCurve([0, -2*phi+1, 0, 2*(15*phi+10), 2*(-15*phi-5)]);
E[6,3]  := EllipticCurve([0, 2*(2*phi-1), 0, 2^3*(15*phi+10), 2^4*(15*phi+5)]);
E[6,4]  := EllipticCurve([0, 1, 0, 2*phi, 2*(phi+1)]);
E[6,5]  := EllipticCurve([0, 1, 0, 2^2, 2*(2*phi+1)]);
E[6,6]  := EllipticCurve([0, 2, 0, 2^3*(3*phi+2), 2^4*(phi+1)]);
E[6,7]  := EllipticCurve([0, 0, 0, Q4!2^6*(-27), 2^7*513]);
E[6,8]  := EllipticCurve([0, 2*(2*phi-1), 0, 2^3*5*phi, 2^4*(15*phi+5)]);
E[6,9]  := EllipticCurve([0, 0, 0, Q4!2^6*(-135), 2^7*(-5130*phi+2565)]);
E[6,10] := EllipticCurve([0, 1, 0, Q4!2^2, 2]);
E[6,11] := EllipticCurve([0, 1, 0, Q4!2^3, 2]);
E[6,12] := EllipticCurve([0, 0, 0, Q4!2^6*(-27), 2^7*(-513)]);
E[6,13] := EllipticCurve([0, 1, 0, 2^4, 2*(2*phi+1)]);
E[6,14] := EllipticCurve([0, 1, 0, 2*(phi+1), 2*phi]);
E[6,15] := EllipticCurve([0, 2*phi-1, 0, 2*5*phi, 2*(15*phi+5)]);
E[6,16] := EllipticCurve([0, 0, 0, 2^6*(-135), 2^7*(5130*phi-2565)]);
E[6,17] := EllipticCurve([0, -2, 0, Q4!2^4, 2^5*(-1)]);
E[6,18] := EllipticCurve([0, 2*(2*phi-1), 0, 2^4*5, 2^5*(10*phi-5)]);
E[6,19] := EllipticCurve([0, 2, Q4!0, 2^4, 2^5]);
E[6,20] := EllipticCurve([0, 2*(-2*phi+1), 0, 2^4*5, 2^5*(-10*phi+5)]);

//Non-Exceptional Curves Of Conductor 8
E[8,1] := EllipticCurve([0, 2, 0, 2, 136*phi + 84]);
E[8,2] := EllipticCurve([0, 1, 0, 1, 8*phi + 5]);
E[8,3] := EllipticCurve([0, 6*phi + 2, 0, 10*phi + 10, 20*phi - 40]);
E[8,4] := EllipticCurve([0, -2*phi, 0, 6*phi + 4, -4*phi - 4]);
E[8,5] := EllipticCurve([0, -1, Q4!0, -3, -1]);
E[8,6] := EllipticCurve([0, 0, 0, 2*phi - 2, 0]);
E[8,7] := EllipticCurve([0, 2*phi, 0, 4*phi + 2, 12*phi + 8]);
E[8,8] := EllipticCurve([0,2*phi,0,2*(3*phi+2),2^2*(phi+1)]);
E[8,9] := EllipticCurve([0, 0, 0, (4050*phi + 675)*2^5, (30375*phi + 64125)*2^10]);
E[8,10] := EllipticCurve([0, 2*phi, 0, 68*phi + 42, 4*phi]);
E[8,11] := EllipticCurve([0, 4*phi, 0, 2*phi, 16*phi]);
E[8,12] := EllipticCurve([0, -1, 0, -8*phi - 5, 24*phi - 3]);
E[8,13] := EllipticCurve([0, -1, 0, 2*phi - 3, 2*phi - 1]);
E[8,14] := EllipticCurve([2,(phi+1)*2,2,2*phi+1,4*(phi+1)]);
E[8,15] := EllipticCurve([0, 4*phi, 0, 2*phi, 8*phi]);
E[8,16] := EllipticCurve([0, -1, 0, 1, -8*phi - 5]);
E[8,17] := EllipticCurve([0, -6*phi - 2, 0, 10*phi + 10, -20*phi + 40]);
E[8,18] := EllipticCurve([0, 2*(phi+2), 0, 2*(170*phi + 105), 2^2*(5*phi+10)]);
E[8,19] := EllipticCurve([0, 1, 0, -8*phi - 5, -24*phi + 3]);
E[8,20] := EllipticCurve([0, -4*phi, 0, 2*phi, -8*phi]);
E[8,21] := EllipticCurve([0, -2*phi + 1, 0, -15, -10*phi + 5]);
E[8,22] := EllipticCurve([0, -2, 0, 2, -136*phi - 84]);
E[8,23] := EllipticCurve([0, 0, 0, 10*phi - 10, 0]);
E[8,24] := EllipticCurve([0, 0, 0, 2^7*(-135*phi-54) , 2^13*(297*phi+270)]);
E[8,25] := EllipticCurve([0,2*(5*phi+5),0,2*(25*phi+25),4*(-75*phi+100)]);
E[8,26] := EllipticCurve([0, -4*phi, 0, 2*phi, -16*phi]);
E[8,27] := EllipticCurve([0, 1, 0, 2*phi - 3, -2*phi + 1]);
E[8,28] := EllipticCurve([0, 0, Q4!0, -2, 0]);
E[8,29] := EllipticCurve([0, -2*phi, 0, 4*phi + 2, -12*phi - 8]);
E[8,30] := EllipticCurve([0, 0, 0, 25920*phi + 4320, -6497280*phi + 138240]);
E[8,31] := EllipticCurve([0, 2*phi - 1, 0, -15, 10*phi - 5]);
E[8,32] := EllipticCurve([0, -2*phi - 4, 0, 340*phi + 210, -20*phi - 40]);
E[8,33] := EllipticCurve([0, 0, Q4!0, -8, 0]);
E[8,34] := EllipticCurve([0, -8*phi, 0, 8*phi, -64*phi]);
E[8,35] := EllipticCurve([0,2*phi,0,2*(5*phi+3),4*(2*phi+1)]);
E[8,36] := EllipticCurve([0, -2*phi, 0, 2*(5*phi + 3), -8*phi - 4]);
E[8,37] := EllipticCurve([0, Q4!1, 0, -3, 1]);
E[8,38] := EllipticCurve([0, 12*phi + 4, 0, 40*phi + 40, 160*phi - 320]);
E[8,39] := EllipticCurve([0, 8*phi, 0, 8*phi, 64*phi]);
E[8,40] := EllipticCurve([0, -2*phi, 0, 68*phi + 42, -4*phi]);


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////777

//Exceptional Curves Of Conductor 3
ExE[3,1] := EllipticCurve([0,1,0,2,(phi+1)]);
ExE[3,2] := EllipticCurve([0,Q4!1,0,1,2]);
ExE[3,3] := EllipticCurve([0,2^2,0,2^2,(phi+1)*2^2]);

//Exceptional Curves Of Conductor 4
ExE[4,1] := EllipticCurve([0,Q4!-1,0,1,-2]);
ExE[4,2] := EllipticCurve([0,(-2*phi+11),0,(-40*phi+125),(-610*phi+1455)*2]);
ExE[4,3] := EllipticCurve([0,(-2*phi+11),0,(-40*phi+125)*2,(235*phi+845)]);
ExE[4,4] := EllipticCurve([0,-1,0,2,(-phi-1)]);
ExE[4,5] := EllipticCurve([0,(2*phi-11)*2^2,0,(-40*phi+125)*2^2,(-235*phi-845)*2^2]);
ExE[4,6] := EllipticCurve([0,(2*phi-11),0,(-40*phi+125)*2,(-235*phi-845)]);
ExE[4,7] := EllipticCurve([0,-2^2,0,2^2,(-phi-1)*2^2]);
ExE[4,8] := EllipticCurve([0,(-2*phi+11)*2^2,0,(-40*phi+125)*2^2,(235*phi+845)*2^2]);
ExE[4,9] := EllipticCurve([0,(2*phi-11),0,(-40*phi+125),(610*phi-1455)*2]);

//Exceptional Curves Of Conductor 5
ExE[5,1] := EllipticCurve([0,1,0,2*phi,(phi+1)*2^2]);
ExE[5,2] := EllipticCurve([0,1,0,2^2,phi*2^2]);
ExE[5,3] := EllipticCurve([0,phi,0,2,phi*2^2]);
ExE[5,4] := EllipticCurve([0,phi,0,2,(phi+1)*2^2]);
ExE[5,5] := EllipticCurve([0,phi*2^2,0,1,2]);
ExE[5,6] := EllipticCurve([0,(phi+1),0,2,phi*2^2]);
ExE[5,7] := EllipticCurve([0,phi,0,2*phi,phi*2^2]);
ExE[5,8] := EllipticCurve([0,phi,0,2,2^2]);

//Exceptional Curves Of Conductor 6
ExE[6,1] := EllipticCurve([0,1,0,2,2*phi]);
ExE[6,2] := EllipticCurve([0,(2*phi-11),0,(-40*phi+125)*2,(-845*phi+610)*2]);
ExE[6,3] := EllipticCurve([0,-1,0,2,-2*phi]);
ExE[6,4] := EllipticCurve([0,(-2*phi+11),0,(-40*phi+125)*2,(845*phi-610)*2]);
ExE[6,5] := EllipticCurve([0,-2,0,2^3,-phi*2^4]);
ExE[6,6] := EllipticCurve([0,(-2*phi+11)*2,0,(-40*phi+125)*2^3,(845*phi-610)*2^4]);
ExE[6,7] := EllipticCurve([0,2,0,2^3,phi*2^4]);
ExE[6,8] := EllipticCurve([0,(-2*phi+1)*2,0,5*2^3,(-5*phi-10)*2^4]);
ExE[6,9] := EllipticCurve([0,-2,0,2^3,(-phi-1)*2^3]);
ExE[6,10] := EllipticCurve([0,(-2*phi+11)*2,0,(-40*phi+125)*2^3,(235*phi+845)*2^3]);
ExE[6,11] := EllipticCurve([0,2,0,2^3,(phi+1)*2^3]);
ExE[6,12] := EllipticCurve([0,(-2*phi+1)*2,0,5*2^3,(-15*phi-5)*2^3]);
ExE[6,13] := EllipticCurve([0,-2,0,Q4!2^2,-2^4]);
ExE[6,14] := EllipticCurve([0,(-2*phi+11)*2,0,(-40*phi+125)*2^2,(-610*phi+1455)*2^4]);
ExE[6,15] := EllipticCurve([0,Q4!2,0,2^2,2^4]);
ExE[6,16] := EllipticCurve([0,(-2*phi+1)*2,0,5*2^2,(-10*phi+5)*2^4]);
ExE[6,17] := EllipticCurve([0,-2^3,0,2^4,(-phi-1)*2^5]);
ExE[6,18] := EllipticCurve([0,(-2*phi+11)*2^3,0,(-40*phi+125)*2^4,(235*phi+845)*2^5]);
ExE[6,19] := EllipticCurve([0,2^3,0,2^4,(phi+1)*2^5]);
ExE[6,20] := EllipticCurve([0,(-2*phi+1)*2^3,0,5*2^4,(-15*phi-5)*2^5]);
ExE[6,21] := EllipticCurve([0,-2,0,phi*2^3,(-phi-1)*2^5]);
ExE[6,22] := EllipticCurve([0,(-2*phi+11)*2,0,(85*phi-40)*2^3,(235*phi+845)*2^5]);
ExE[6,23] := EllipticCurve([0,2,0,phi*2^3,(phi+1)*2^5]);
ExE[6,24] := EllipticCurve([0,(-2*phi+1)*2,0,5*phi*2^3,(-15*phi-5)*2^5]);
ExE[6,25] := EllipticCurve([0,-2,0,2^4,-phi*2^5]);
ExE[6,26] := EllipticCurve([0,(-2*phi+11)*2,0,(-40*phi+125)*2^4,(845*phi-610)*2^5]);
ExE[6,27] := EllipticCurve([0,2,0,2^4,phi*2^5]);
ExE[6,28] := EllipticCurve([0,(-2*phi+1)*2,0,5*2^4,(-5*phi-10)*2^5]);

//Exceptional Curves Of Conductor 7
ExE[7,1] := EllipticCurve([0,(phi+1)*2^2,0,phi*2,2^2]);
ExE[7,2] := EllipticCurve([0,0,0,(-120*phi+375)*2^2,(610*phi-1455)*2^4]);
ExE[7,3] := EllipticCurve([0,(-3*phi-1)*2^3,0,5*phi*2^3,(-10*phi+5)*2^5]);
ExE[7,4] := EllipticCurve([0,(phi+1)*2,0,phi,(phi+1)*2^2]);
ExE[7,5] := EllipticCurve([0,Q4!2,0,2^2,2^3]);
ExE[7,6] := EllipticCurve([0,phi*2^2,0,phi*2^2,phi*2^4]);
ExE[7,7] := EllipticCurve([0,2^2,0,(phi+1)*2,phi*2^2]);
ExE[7,8] := EllipticCurve([0,(7*phi+9)*2^3,0,(85*phi-40)*2^3,(-610*phi+1455)*2^5]);
ExE[7,9] := EllipticCurve([0,(-9*phi+2)*2^2,0,(85*phi-40)*2^2,(-845*phi+610)*2^4]);
ExE[7,10] := EllipticCurve([0,Q4!2^2,0,2,2^2]);
ExE[7,11] := EllipticCurve([0,phi*2,0,2,(phi+1)*2^2]);
ExE[7,12] := EllipticCurve([0,phi*2^2,0,phi*2,2^2]);
ExE[7,13] := EllipticCurve([0,Q4!1,0,1,1]);
ExE[7,14] := EllipticCurve([0,phi*2,0,phi*2,phi*2^3]);
ExE[7,15] := EllipticCurve([0,-2^2,0,2^3,-phi*2^5]);
ExE[7,16] := EllipticCurve([0,(9*phi-2)*2^2,0,(85*phi-40)*2^3,(845*phi-610)*2^6]);
ExE[7,17] := EllipticCurve([0,2,0,phi*2,2^2]);
ExE[7,18] := EllipticCurve([0,(2*phi-11)*2,0,(-40*phi+125)*2,(-845*phi+610)*2^2]);
ExE[7,19] := EllipticCurve([0,phi,0,phi*2,(phi+1)*2]);
ExE[7,20] := EllipticCurve([0,2^2,0,phi*2,2^2]);
ExE[7,21] := EllipticCurve([0,phi*2,0,phi*2,phi*2^2]);
ExE[7,22] := EllipticCurve([0,(phi+1)*2,0,2,phi*2^2]);
ExE[7,23] := EllipticCurve([0,2^2,0,2,phi*2^2]);
ExE[7,24] := EllipticCurve([0,phi,0,2,phi*2]);
ExE[7,25] := EllipticCurve([0,(phi+1)*2^2,0,2,phi*2^2]);
ExE[7,26] := EllipticCurve([0,(9*phi-2)*2^2,0,(85*phi-40)*2^2,(845*phi-610)*2^4]);
ExE[7,27] := EllipticCurve([0,phi*2,0,2,2^2]);
ExE[7,28] := EllipticCurve([0,(9*phi-2)*2,0,(85*phi-40)*2,(845*phi-610)*2^3]);
ExE[7,29] := EllipticCurve([0,2,0,2,phi*2^2]);
ExE[7,30] := EllipticCurve([0,2^2,0,(phi+1)*2,(phi+1)*2^2]);
ExE[7,31] := EllipticCurve([0,(-phi-2)*2^2,0,5*phi*2^3,(-5*phi-10)*2^6]);
ExE[7,32] := EllipticCurve([0,(phi+1)*2,0,phi,phi*2^2]);
ExE[7,33] := EllipticCurve([0,(phi+1)*2^2,0,2,(phi+1)*2^2]);
ExE[7,34] := EllipticCurve([0,(phi+1)*2^2,0,2,2^2]);
ExE[7,35] := EllipticCurve([0,phi*2,0,phi,phi*2]);
ExE[7,36] := EllipticCurve([0,2^2,0,phi*2,(phi+1)*2^2]);
ExE[7,37] := EllipticCurve([0,1,0,phi*2,phi*2]);
ExE[7,38] := EllipticCurve([0,2^2,0,phi,2]);
ExE[7,39] := EllipticCurve([0,Q4!1,0,2,2]);
ExE[7,40] := EllipticCurve([0,phi*2^2,0,phi*2,phi*2^2]);
ExE[7,41] := EllipticCurve([0,phi*2^2,0,phi*2,(phi+1)*2^2]);
ExE[7,42] := EllipticCurve([0,-phi*2^3,0,phi*2^4,-phi*2^7]);
ExE[7,43] := EllipticCurve([0,0,0,(-120*phi+375)*2^2,(-610*phi+1455)*2^4]);
ExE[7,44] := EllipticCurve([0,(phi+1)*2^2,0,phi,2]);
ExE[7,45] := EllipticCurve([0,(2*phi-11)*2^2,0,(-40*phi+125)*2^3,(-845*phi+610)*2^5]);
ExE[7,46] := EllipticCurve([0,1,0,(phi+1)*2,(phi+1)*2]);
ExE[7,47] := EllipticCurve([0,(-phi-1)*2^3,0,phi*2^3,-2^5]);
ExE[7,48] := EllipticCurve([0,2^2,0,phi*2,phi*2^2]);











