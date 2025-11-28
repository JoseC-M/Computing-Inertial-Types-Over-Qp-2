load "p=3Setting.m";


E:=[[],[],[],[],[]];

//Exceptional Curves of Conductor 2
E[2,1]:=EllipticCurve([0,0,0,Q9!9,2*3^3]);
E[2,2]:=EllipticCurve([0,3*a,0,3*a,9*a]);


//Curves of conductor 3
E[3,1] := EllipticCurve([3*a, 3*a, 3*a, 3^2*a, 3^2*a]);
E[3,2] := EllipticCurve([0, 3^3*a, 0, 3^3*a, 3^3*a]);
E[3,3] := EllipticCurve([0, 3*a, 0, 2*3*a, 3*a]);
E[3,4] := EllipticCurve([0, 3^3*a, 0, 3^3*a, 2*3^3]);
E[3,5] := EllipticCurve([0, 3*a, 0, 2*3, 2*3]);
E[3,6] := EllipticCurve([0, 3*a, 0, 2*3, 3*a]);
E[3,7] := EllipticCurve([0, 3^2*a, 0, 3^3*a, 2*3^3*a]);
E[3,8] := EllipticCurve([0, 3*a, 0, 3*a, 3*a]);

//Curves of conductor 4
E[4,1] := EllipticCurve([0, 0, 0, 3^8*(-200*a - 379), 3^11*(6520*a + 10398)]);
E[4,2] := EllipticCurve([0, a*3^3, 0, 2*3^4, a*3^5]);
E[4,3] := EllipticCurve([0, a*3^3, 0, a*3^4, 2*3^5]);
E[4,4] := EllipticCurve([0, a*3^3, 0, a*3^4, a*3^5]);
E[4,5] := EllipticCurve([0, 3^3*a, 0, 2*3^4, 2*3^5]);
E[4,6] := EllipticCurve([0, 0, 0, 3^8*(176*a - 611), 3^11*(-7568*a + 18598)]);
E[4,7] := EllipticCurve([0, 0, 0, 3^8*(-104*a - 347), 3^11*(3160*a + 8126)]);
E[4,8] := EllipticCurve([0, 0, 0, 3^8*(-176*a - 379), 3^11*(5776*a + 9982)]);
E[4,9] := EllipticCurve([2*a + 9, 1, 3*2*a, 3^2, 1]);
E[4,10] := EllipticCurve([0, 3^2*a, 0, 2*3^2, 3^2*a]);
E[4,11] := EllipticCurve([0, 3^2*a, 0, 3^2*a, 2*3^2]);
E[4,12] := EllipticCurve([0, 3^2*a, 0, 3^2*a, 3^2*a]);
E[4,13] := EllipticCurve([0, 3^2*a, 0, 2*3^2, 2*3^2]);
E[4,14] := EllipticCurve([11, 2, 2*3^2*a, 3, 1]);
E[4,15] := EllipticCurve([0, 0, 0, (-104*a - 347)*3^10, (3160*a + 8126)*3^14]);
E[4,16] := EllipticCurve([2*a + 9, 1, 3^2*a, 3, 1]);

//Curves of conductor 5
E[5,1] := EllipticCurve([0, 3^2*a, 0, 3^2*a, 2*3]);
E[5,2] := EllipticCurve([0, 3^2*a, 0, 2*3^2*a, 2*3]);
E[5,3] := EllipticCurve([0, 3^2*a, 0, 2*3^2*a, 3*a]);
E[5,4] := EllipticCurve([0, 3^2*a, 0, 3^3*a, 3*a]);
E[5,5] := EllipticCurve([0, 3^2*a, 0, 3^3*a, 2*3*a]);
E[5,6] := EllipticCurve([0, 3^2*a, 0, 3^2*a, 3*a]);
E[5,7] := EllipticCurve([0, 3^2*a, 0, 3^2*a, 2*3*a]);
E[5,8] := EllipticCurve([0, 3^2*a, 0, 3^3*a, 2*3]);
E[5,9] := EllipticCurve([0, 3^2*a, 0, 2*3^2*a, 2*3*a]);






