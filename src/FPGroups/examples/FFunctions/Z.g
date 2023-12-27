Read("./src/shared/operations.g");;
Read("./src/FPGroups/RecursiveConstruction/kernel_functions.g");;

Display("Checking Automata Structure for Z...");

g := FreeAbelianGroup(1); 

h := Group([g.1^2]);

Display("Index of the Subgroup H: ");
Display(Index(g,h));

h_gens := GeneratorsOfGroup(h);;

#hom := GroupHomomorphismByImages(h, g, h_gens, [g.2, g.1]);
hom := GroupHomomorphismByImages(h, g, h_gens, [g.1]);

Display("Non Trivial Kernel? ");;

is_kernel_trivial := IsKernelTrivial(g, h, hom, 20);;

Display(not (is_kernel_trivial = fail));;

if is_kernel_trivial = false then 
    Display("Non Trivial Kernel Element: ");;
    Display(GetNonTrivialKernelElem(g, h, hom, 20));
fi;
