Read("./src/shared/operations.g");;
Read("./src/FPGroups/RecursiveConstruction/kernel_functions.g");;

Display("Checking Automata Structure of Z^n...");

n := 3;;

g := FreeAbelianGroup(n);; 
g_gens := GeneratorsOfGroup(g);;

# Gets subgroup squaring the first generator and then maintaining the rest
h := Group(Concatenation([g_gens[1]^2], g_gens{[2..Length(g_gens)]}));

Display("Index of the Subgroup H: ");
Display(Index(g,h));

h_gens := GeneratorsOfGroup(h);;

g_id_tail :=  Concatenation([g.1], GetIdentityList(g, Length(g_gens) -1 ));;

hom := GroupHomomorphismByImages(h, g, h_gens, g_id_tail);

Display("Non Trivial Kernel? ");;

is_kernel_trivial := IsKernelTrivial(g, h, hom, 10);;

Display(not (is_kernel_trivial = fail));;

if is_kernel_trivial = false then 
    Display("Non Trivial Kernel Element: ");;
    Display(GetNonTrivialKernelElem(g, h, hom, 10));
fi;



