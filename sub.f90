module sub
use params

CONTAINS

subroutine pendulum

REAL :: x1n(0:t),x2n(0:t),y1n(0:t),y2n(0:t)
REAL :: t1n,t2n,w1n,w2n,num1,num2,den1,den2
REAL ::x1coord,x2coord,y1coord,y2coord
REAL dt1,dt2,dw1,dw2
REAL t1,t2
t1 = Pi/4.!45.*PI/180.
t2 = Pi!45.*PI/180.
w1 = 0
w2 = 0

m1 = 5
m2 = 5

do i = 0,t

  dt1 = w1
  dt2 = w2

  num1 = m2*L*(w1*w1)*SIN(t2-t1)*COS(t2-t1) + m2*g*SIN(t2)*COS(t2-t1) + m2*L*(w2*w2)*SIN(t2-t1)-(m1+m2)*g*SIN(t1)
  den1 = (m1+m2)*L - m2*L*COS(t2-t1)*COS(t2-t1)

  dw1 = num1/den1

  num2 = -m2*L*(w2*w2)*SIN(t2-t1)*COS(t2-t1) + (m1+m2)*(g*SIN(t1)*COS(t2-t1)-L*(w1*w1)*SIN(t2-t1)-g*SIN(t2))
  den2 = (m1+m2)*L - m2*L*COS(t2-t1)*COS(t2-t1)

  dw2 = num2/den2

  t1n = t1 + dt1*dt
  t2n = t2 + dt2*dt

  w1n = w1 + dw1*dt
  w2n = w2 + dw2*dt

  t1 = t1n
  t2 = t2n
  w1 = w1n
  w2 = w2n

  x1coord = L*SIN(t1)
  y1coord = -L*COS(t1)

  x2coord = L*SIN(t1)+L*SIN(t2)!L*(SIN(t1)+0.5*SIN(t2))
  y2coord = -L*COS(t1)-L*COS(t2)!-L*(COS(t1)+0.5*COS(t2))

  x1(i) = x1coord
  y1(i) = y1coord
  x2(i) = x2coord
  y2(i) = y2coord

end do


end subroutine pendulum


end module sub
