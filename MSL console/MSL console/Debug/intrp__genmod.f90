        !COMPILER-GENERATED INTERFACE MODULE: Thu Sep 23 14:39:30 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE INTRP__genmod
          INTERFACE 
            SUBROUTINE INTRP(X,Y,XOUT,YOUT,YPOUT,NEQN,KOLD,PHI,PSI)
              INTEGER(KIND=4) :: NEQN
              REAL(KIND=8) :: X
              REAL(KIND=8) :: Y(NEQN)
              REAL(KIND=8) :: XOUT
              REAL(KIND=8) :: YOUT(NEQN)
              REAL(KIND=8) :: YPOUT(NEQN)
              INTEGER(KIND=4) :: KOLD
              REAL(KIND=8) :: PHI(NEQN,16)
              REAL(KIND=8) :: PSI(12)
            END SUBROUTINE INTRP
          END INTERFACE 
        END MODULE INTRP__genmod
