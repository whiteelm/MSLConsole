        !COMPILER-GENERATED INTERFACE MODULE: Thu Sep 23 14:39:30 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DGEDI__genmod
          INTERFACE 
            SUBROUTINE DGEDI(A,LDA,N,IPVT,DET,WORK,JOB)
              INTEGER(KIND=4) :: LDA
              REAL(KIND=8) :: A(LDA,1)
              INTEGER(KIND=4) :: N
              INTEGER(KIND=4) :: IPVT(1)
              REAL(KIND=8) :: DET(20)
              REAL(KIND=8) :: WORK(1)
              INTEGER(KIND=4) :: JOB
            END SUBROUTINE DGEDI
          END INTERFACE 
        END MODULE DGEDI__genmod
