    program Test5

    implicit complex*16(c,w,z), real*8(a-b,d-h,o-v,x-y)
    dimension z(82),w(82),betam(82),qwork(2004)  ! z(20),w(20),betam(20),qwork(344) - было
    dimension aw(10), s(9)
    dimension z1(82), z2(82), x2(82), x3(82),  x4(40), aC(361), bC(100), dZ0(100)
    dimension aws(22), xs(22), dC(100), dL(100), em(10), Um(100), dCC(100), dLL(100)

    data aw/0.3,0.1,1.,1.,1.,1.,1.,1.,1.,1./  ! вектор ширин микрополосквых линий (мм)
    data s /1,1.,1.,1.,1.,1.,1.,1.,1. /	! вектор межлинейных зазоров (мм)
    n = 2		! Количество микрополосквых линий передачи
    t = .035	! толщина микрополосквых линий (мм)
    h = 5		! толщина диэлектрической подложки (мм)
    e = 10.		! диэлектрическая проницаемость подложки
    pi =  3.141593d0
    zero =(0.d0,0.d0) ! Нуль
    zi = (0.d0,1.d0)	! Мнимая единица
    nn = 8*n+2
    dN = n
    do 10 i =1,n	 ! Формиров. угловых точек геометрии поперч.сечения микрополосковых линий
        i8=8*(i-1)
        sw=aw(i)/2
        do 9 j=1,i-1
9       sw=sw+aw(j)+s(j) ! Текущие координаты оснований "ножек грибов"
        z1(i8+1) = sw
        z1(i8+2) = z1(i8+1) + zi*h
        z1(i8+3) = z1(i8+2) - aw(i)/2
        z1(i8+4) = z1(i8+3) + zi*t
        z1(i8+5) = z1(i8+4) + aw(i)
        z1(i8+6) = z1(i8+5) - zi*t
        z1(i8+7) = z1(i8+2)
        z1(i8+8) = z1(i8+1)

        betam(i8+1) = -0.5		 ! beta = alpha - 1
        betam(i8+2) = -0.5
        betam(i8+3) =  0.5
        betam(i8+4) =  0.5
        betam(i8+5) =  0.5
        betam(i8+6) =  0.5
        betam(i8+7) = -0.5
        betam(i8+8) = -0.5
10      continue
    
    sww=sw+aw(n)/2           ! Сумма всех ширин полосок и зазоров между ними
    z1(8*n+1) = (1.d20,1.d20)  ! Машинная бесконечность (предпоследняя точка)
    z1(8*n+2) =-10000. ! Последняя точка (м.б. нулём). Найдена числен.экспериментом **
    if(n<4) z1(8*n+2) =-100.   ! Последняя точка (м.б. нулём). Найдена числен.экспериментом **
    betam(8*n+1) = -2.		 ! Угол в бесконечности =-180 град.
    betam(8*n+2) =  0.		 ! Угол в точке на оси 0Х =180 град.
       
    z10 = dcmplx(sww/2, sww/8+(h+t))
    nptsq =12

    call qinit(nn,betam,nptsq,qwork)
    iprint = -1
    iguess = 1
    do 1 k = 1,nn
        z(k) = exp(dcmplx(0.d0, k-4.0))
1   continue

    tol = 1.d-8
    call scsolv(iprint,iguess,tol,errest,nn,c,z,z10,z1,betam,nptsq,qwork)
    
    z20 = zi;
    z201=-zi;
    do 2 k = 1, nn-1
        z2(k)=(z(k)*z201-z20)/(z(k)-1)
        x2(k)=dreal(z2(k));
2   continue
    
    do 3 k = 1,nn-1
        x3(k) = 2 * (x2(k)-x2(1)) / (x2(nn-2)-x2(1)) - 1.
3   continue
    
    do 4 i=1,n
        i4=4*(i-1);
        i8=8*(i-1);
        x4(i4+1)=x3(i8+1);
        x4(i4+2)=x3(i8+2);
        x4(i4+3)=x3(i8+7);
4   x4(i4+4)=x3(i8+8);
    
    n2=2*n-1;
    M=1000
    call GHIONE(x4,aC,n2,M)
    call refor(aC,bC,n)
    aws(1)=0
    aws(2)=aw(1)
    do 7 i=1,n-1
        aws(2*i+1)=aws(2*i) + s(i)
        aws(2*i+2)=aws(2*i+1)+aw(i+1)
7   continue
    aws=aws-aws(2*n)/2
    
    xs(1)=-1
    do 8 k=1,2*n
8   xs(k+1)=tanh(pi*aws(k)/(2*h))
    xs(2*n+2)=1
    
    M=1000
    call GHIONE(xs,dC,n,M)
    call capa(bC,dC,e,n)
    call induc(bC,dL,n)
    dCC = dC
    dLL = dL
    call nroot(n,dC,bC,em,Um)
    em=sqrt(em/8.854187817)
    print*,'Capacitance matrix [C] (pF/m)'
    call DPRINT(dC, n)
    print*,'Capacitance matrix [L] (uH/m)'
    call DPRINT(dL, n)
    print*,'Um [Um] (V)'
    call DPRINT(Um, n)
    print*,' [em]'
    do 212 i =1,n
212 print*,em(i)
    print*,'Impedance [Z0] (Ohm)'
    call impedance(n,dCC,Um,em,dZ0)
    call DPRINT(dZ0, n)
end