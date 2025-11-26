
This repository contains pdf tables and MAGMA files in support of "Inertial Types of Elliptic Curves over Q_p^2" by Jose Castro-Moreno and Nuno Freitas.

# Index
    MAGMA Files.  
* [p=2Setting.magma] and [p=3Setting.magma] In this files we define, for p=2 and p=3 respectively the field extensions, groups and generators appearing in the paper. Also we define a function that computes the m-torsion field of an elliptic curve. 
* [p=2Curves.magma] and [p=3Curves.magma] In this files we define the curves realizing each of the possible inertial types appearing on the paper. 
* [p=2Fields.magma] and [p=3Fields.magma] This files defines contain the explicit polynomials and fields defining the field cut out by the inertial types of the curves. 
* [p=2MainChecks.magma] and [p=3MainChecks.magma] This files contains several functions that allows the reader to check all the claims made in the paper.
* [p=2Exceptionals.magma] This file contains the computations supporting the proof of theorem 8.4. and a function that computes the characters describing the exceptionals the inertial types.  

    Tables
* [TablesOfExceptionalsp=2.pdf] Tables containing for each exceptional inertial type of Q4, an explicit Weierstrass model of a curve realizing it and a polynomial describing its inertial field.
* [TablesOfNONExceptionalsp=2.pdf]Tables containing for each nonexceptional inertial type of Q4, an explicit Weierstrass model of a curve realizing it and a polynomial describing its inertial field.
* [Tablesp=3.pdf] Tables containing for each inertial type of Q9, an explicit Weierstrass model of a curve realizing it and a polynomial describing its inertial field.

# Installation

Clone this repository using

```
git clone https://github.com/roed314/padic_db.git
```
Start Magma within the `InertialTypes` folder, then load the file of interest, it will autoatically load the other files it needs to work.

# Usage

Inside each of the files there are detailed comments and examples explaining the intended way of use.