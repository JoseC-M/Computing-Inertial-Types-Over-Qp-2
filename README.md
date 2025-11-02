# Computing-Inertial-Types-Over-Qp-2
This repository contains the supporting MAGMA files for the research article "Computing Inertial types over Qp^2"

Here is an index for the content of each file.

1-PRE-COMPUTED DATA

"CurvesForP=3.magma" Contains all elliptic curves realizing inertial types of curves with potentially good reduction over Q9.

"NonExCurvesForP=2" Contains all elliptic curves realizing non-exceptional inertial types of curves with potentially good reduction over Q4.

"ExceptionalCurvesForP=2" Contains all elliptic curves realizing exceptional inertial types of elliptic curves over Q4.

2-COMPUTATIONS AND CHECKS

"CheckForP>3" Is a script that verifies for a given field K that the curves given at the end of section 4 realize the types in Corollary 4.2

"ExceptionalInertiaFields.magma" Contains a function that, for a given cubic extension K/Q4, verifies the statements done in Theorem 8.4. That is, it computes all extensions of L/K such that L^un is the field cut out by the exceptional inertial type of an elliptitc curve over Q4.   
