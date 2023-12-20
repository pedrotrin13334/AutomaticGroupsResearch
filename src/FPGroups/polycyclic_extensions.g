Read("./src/shared/operations.g");;
Read("./src/FPGroups/RecursiveConstruction/kernel_functions.g");;

Display("Initializing some basic Polycyclic groups experiments...");

f := FreeGroup( "a", "b", "c");;
#f := FreeGroup( "a", "b");;

comm := CommElm;;

g := f/[comm([f.1, f.2]), comm([f.1, f.3]), (f.2^f.3)*f.2^-1 * f.1 ^-1 ];
#g := f/[comm([f.1, f.2])];

h := Group([g.1^2, g.2, g.3^2]);
#h := Group([g.1^2, g.2]);

Display("Index of the Subgroup H: ");
Display(Index(g,h));

h_gens := GeneratorsOfGroup(h);;

hom := GroupHomomorphismByImages(h, g, h_gens, [g.1, g.2, g.3]);

Display("Non Trivial Kernel Element: ");;
Display(GetNonTrivialKernelElem(h, g, hom, 10));;


#li := check_phi_kernel(g, h, hom, 10);
