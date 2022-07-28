        !COMPILER-GENERATED INTERFACE MODULE: Thu Sep 23 14:39:29 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MSL__genmod
          INTERFACE 
            SUBROUTINE MSL(N,T,H,E,AW,S,DCN,DLN,DUN,DEMN,DZ0)
              INTEGER(KIND=4) ,VALUE :: N
              REAL(KIND=8) ,VALUE :: T
              REAL(KIND=8) ,VALUE :: H
              REAL(KIND=8) ,VALUE :: E
              REAL(KIND=8) :: AW(10)
              REAL(KIND=8) :: S(9)
              REAL(KIND=8) :: DCN(N,N)
              REAL(KIND=8) :: DLN(N,N)
              REAL(KIND=8) :: DUN(N,N)
              REAL(KIND=8) :: DEMN(N)
              REAL(KIND=8) :: DZ0(N,N)
            END SUBROUTINE MSL
          END INTERFACE 
        END MODULE MSL__genmod
