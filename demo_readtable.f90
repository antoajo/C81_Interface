!asedasasdasd

	program readcsv

	use libC81
 	implicit none
	
	integer, parameter :: rows = 31
	integer, parameter :: cols = 6
	real, dimension(rows,cols) :: A

	A = getTable('Airfoil_data/E387/E387_Re10k_JohnMcArthur.csv',rows,cols)
	print*,A

	end program readcsv
