        !COMPILER-GENERATED INTERFACE MODULE: Sun Jul 31 22:53:38 2022
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE IMPEDANCE__genmod
          INTERFACE 
            SUBROUTINE IMPEDANCE(N,DC,EM,UM,ZO)
              INTEGER(KIND=4) :: N
              REAL(KIND=8) :: DC(N*N)
              REAL(KIND=8) :: EM(N)
              REAL(KIND=8) :: UM(N*N)
              REAL(KIND=8) :: ZO(N*N)
            END SUBROUTINE IMPEDANCE
          END INTERFACE 
        END MODULE IMPEDANCE__genmod
