      subroutine capa(bC,dC,e,n)
! Результирующая матрица емкостей (пФ/м)
      real*8 bC(1), dC(1), e
	do 1 i=1,n*n
1	dC(i) = 8.854 * ( bC(i) + (e-1.) * dC(i) )
      return
	end