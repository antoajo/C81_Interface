! This program reads the E387_Re10k_JohnMcArthur.csv and writes it to E387_Re10k.C81
! an output file naca6403_Re20k.C81. Both files are in the Samples/ directory.

program c81_builder

  use libC81
  implicit none

  integer, parameter :: rows = 28
  integer, parameter :: cols = 4
  integer, parameter :: nMach = 10
  integer :: i

  character(len=30) :: airfoil_name
  real, allocatable, dimension(:) :: MaL, MaD, MaM
  real, allocatable, dimension(:) :: AL, AD, AM
  real, allocatable, dimension(:,:) :: CL, CD, CM
  real, dimension(rows,cols) :: A


  ! Read airfoil data from CSV file
  A=getTable('Airfoil_data/E387/E387_Re10k_JohnMcArthur.csv',rows,cols)

  ! Allocate arrays
  allocate(MaL(nMach))
  allocate(MaD(nMach))
  allocate(MaM(nMach))
  allocate(AL(rows))
  allocate(AD(rows))
  allocate(AM(rows))
  allocate(CL(rows,nMach))
  allocate(CD(rows,nMach))
  allocate(CM(rows,nMach))

  ! Specify airfoil name
  airfoil_name = 'Eppler 387'

  ! Copy values from read array to variables
  MaL = (/0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0/) ! in fortran, arrays start with curved bracket ( and slash /, and end with /)
  MaD = MaL
  MaM = MaL

  AL = A(:,1)
  AD = A(:,3)
  AM = AL

 do i=1,nMach
    CL(:,i) = A(:,2)
 enddo

 do j=1, nMach
    CD(:,j) = A(:,4)
 enddo

 CM = CL

  ! Write airfoil data to C81 file
  call writeC81('Airfoil_data/E387/E387_Re10k.C81',airfoil_name,MaL,AL,CL,MaD,AD,CD,MaM,AM,CM)

end program c81_builder
