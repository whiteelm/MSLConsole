    program msln_
! ���� ������������ msln(ip,aa,aw,s,dL,dC)
! MSLN - Microstrip Coupled Lines, N-strip 
! ����� - �������������� ��������� ��������������� �����
    implicit complex*16(c,w,z), real*8(a-b,d-h,o-v,x-y)
    dimension aa(5), aw(10), s(9)			 ! Nmax=9. ������������ ����� ����� = 9. 
    dimension bC(81), dC(81), dCC(81), dL(81), em(9), Um(81), dZ0(81)

    data aw/0.4,0.1,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0/  ! ������ ����� �������������� ����� (��)
    data s /0.02,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0 /	! ������ ����������� ������� (��)
    n=1; t=0.001;  h1=0.1;  e1=10.; e2=1. ! ������ �.�.: e1>e2 !!!
!	n=3; aw(1)=1.;aw(2)=1.;aw(3)=2.;s(1)=.5;s(2)=1.;t=0.05;  h1=1.; e1=10.;  e2=1 ! ���'14_1
!	n=3; aw(1)=60;aw(2)=60;aw(3)=60; s(1)=10;s(2)=10; t=1.4; h1=60; e1=4.65; e2=1 ! ���'14_2
!	n=5; aw(1)=3;aw(2)=3;aw(3)=3;aw(4)=3;aw(5)=3;s(1)=2;s(2)=2;s(3)=2;s(4)=2;t=1;h1=1;e1=2;e2=1 !���'14_3
!	�������� ������:
	aa(1) = n 	! ���������� �������������� ����� �������� 
    aa(2) = h1 	! ������� ��������������� �������� (��)
	aa(3) = t 	! ������� ��������������� ����� (��)
    aa(4) = e1 	! ����.���������. ��������������� ��������
	aa(5) = e2 	! ����.���������. ������� �����.�����
!	aw(9) = aw(9) ! ������ ������� (�����) �� �������� 
!	 s(8) = s(8)  ! ������ ����� ���������

!==============================================================================
! ����������� ������ �������� ������ (�����.��������������)
    print*,'Input MSLN:'; 
	write(*,'('' w'',i1,'' ='',f8.3)')(i, aw(i),i=1,n); 
	write(*,'('' s'',i1,'' ='',f8.3)')(i, s(i),i=1,n-1);
	write(*,1) ,h1,t,e1,e2
1   format(' h1 =',f5.2,'  t=',f5.3/' e1 =',f5.2,'  e2 =',f5.2/)
!==============================================================================
!	ip=0 ! ������ ������ = -2,-1,0,1. ���� ip=0, �� �����. ���� ip=-2, ������ �� �����. 
!		   ip=iprint
   ip=-2

	call  msln(ip,aa,aw,s,dL,dC)  ! ��������� � ������������

	print*,'Capacitance matrix [C] (pF/m)';		call DPRINT(dC, n)
    print*,'Inductance matrix [L] (uH/m)';		call DPRINT(dL, n)

    dCC = dC ! ��� ���������� �� ������ nroot(n,dC,bC,em,Um)
	call dminv(dL,n,ad)
	call nroot(n,dC,11.127*dL,em,Um)
    !call nroot(n,dC,8.854*bC,em,Um)  ! old
    dC=dCC  ! ��� ���������� ����� ������ nroot(n,dC,bC,em,Um)

	print*,'Modal voltage matrix [Um] (V)'; 	call DPRINT(Um, n)
    print*,'Modal dielectric permitivities [em]' 
	do i =1,n; print '(f8.2)',em(i); enddo;
	if(n==2) print'(a20,f8.4)','m = sqrt(em1/em2) =', sqrt(em(1)/em(2));  print*
    print*,'Impedance [Z0] (Ohm)'
    call impedance(n,dCC,Um,em,dZ0)
    call DPRINT(dZ0, n)
	end