!asedasasdasd

	program readcsv

	use libC81.f90
 	implicit none
	
	integer, parameter :: rows = 31
	integer, parameter :: cols = 6

	A = getTable('Airfoil_data/E387/E387_Re10k_JohnMcArthur.csv',rows,cols)
	print*,A

	end program readcsv
