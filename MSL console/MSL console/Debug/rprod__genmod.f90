        !COMPILER-GENERATED INTERFACE MODULE: Thu Sep 23 14:39:29 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RPROD__genmod
          INTERFACE 
            FUNCTION RPROD(ZZ,N,Z,BETAM)
              INTEGER(KIND=4) :: N
              COMPLEX(KIND=8) :: ZZ
              COMPLEX(KIND=8) :: Z(N)
              REAL(KIND=8) :: BETAM(N)
              REAL(KIND=8) :: RPROD
            END FUNCTION RPROD
          END INTERFACE 
        END MODULE RPROD__genmod
