        !COMPILER-GENERATED INTERFACE MODULE: Sat Jun 18 13:19:40 2022
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE IMPEDANCE__genmod
          INTERFACE 
            SUBROUTINE IMPEDANCE(N,DC,UM,EM,DZ0)
              INTEGER(KIND=4) :: N
              REAL(KIND=8) :: DC(N*N)
              REAL(KIND=8) :: UM(N*N)
              REAL(KIND=8) :: EM(N)
              REAL(KIND=8) :: DZ0(N,N)
            END SUBROUTINE IMPEDANCE
          END INTERFACE 
        END MODULE IMPEDANCE__genmod
