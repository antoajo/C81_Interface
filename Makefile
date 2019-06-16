FC = gfortran

all:
	make lib
	make demo

lib:
	$(FC) -c libC81.f90

demo1:
	make lib
	$(FC) demo1.f90 libC81.o -o demo1.out

demo_readtable:
	make lib
	$(FC) demo_readtable.f90 libC81.o -o demo_readtable.out

c81_builder:
	     make lib
	     $(FC) c81_builder.f90 libC81.o -o c81_builder.out

clean:
	rm -f *.o *.mod *.out
