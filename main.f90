program dpen
use params
use sub

  REAL :: coords(0:3,0:3000)


  OPEN(10,file ='coord1.dat',form='formatted')

  CALL pendulum

  do i =0,3000
    coords(0,i) = x1(i)
    coords(1,i) = y1(i)
    coords(2,i) = x2(i)
    coords(3,i) = y2(i)
  end do

  DO i = 0,3000
    WRITE(10,'(101F12.6)')(coords(:,i))
  end do

end program dpen
