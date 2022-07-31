      subroutine impedance(n,dC,em,Um,Zo)
! �������������� ������� ���������� (��)
      implicit complex*16(c,w,z), real*8(a-b,d-h,o-v,x-y)
      dimension em(n), v(n), Um(n*n)
      dimension dC(n*n)
      real*8 Im(n*n),Zo(n*n)
!--------------------------------------------------------------------------
! ��������� ������ d�*Um ��� ��������
      do 30 i=1,n
          do 30 j=1,n
              ij = i + (j-1)*n
              Im(ij) = 0.0
              do 30 k=1,n
                  ik = i + (k-1)*n
                  kj = k + (j-1)*n
30    Im(ij) = Im(ij) + dC(ik)*Um(kj)
      
! ���������� �������-������� ��������� v (�/��). �������� ��� ��������� �������
      v=.2998/sqrt(em)				  !	�=0.2998 �/�� - �������� ����� 10^9
! ��������� ���������� ������� [] �� ������������ ������� v ��� �������� Im=[C*Um]*v
      do 32 i=1,n
          do 32 j=1,n
              ij = i + n*(j-1)
32    Im(ij) = Im(ij)*v(j)/1000.  ! ���������, ���� �� 1000 (��� ������� �� 0.001)
! ��������� ������� Im=Im^-1
      call dminv(Im,n,x)
! ��������� ������ ��� �������� Zo=Um*Im^-1
      do 33 i=1,n
          do 33 j=1,n
              ij = i + (j-1)*n
              xx=0.
              do 34 k=1,N
                  ik = i + (k-1)*n
                  kj = k + (j-1)*n
34            xx = xx + Um(ik)*Im(kj)
33    Zo(ij) = xx     
      return
      end