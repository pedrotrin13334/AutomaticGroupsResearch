gap> Read("./src/shared/operations.g");;
gap> Read("./src/FPGroups/RecursiveConstruction/kernel_functions.g");;
gap> f := FreeGroup( "a", "b", "c");;
gap> comm := CommElm;;
gap> g := f/[comm([f.1, f.2]), comm([f.1, f.3]), (f.2^f.3)*f.2^-1 * f.1 ^-1 ];
<fp group on the generators [ a, b, c ]>
gap> h := Group([g.1^2, g.2, g.3^2]);
Group([ a^2, b, c^2 ])
gap> h_gens := GeneratorsOfGroup(h);;
gap> 
gap> hom := GroupHomomorphismByImages(h, g, h_gens, [g.1, g.2, g.3]);
[ a^2, b, c^2 ] -> [ a, b, c ]
gap> IsKernelTrivial(g, h, hom, 10);
fail
gap> g := FreeAbelianGroup(2);;
gap> h := Group([g.1^2, g.2]);
Group([ f1^2, f2 ])
gap> h_gens := GeneratorsOfGroup(h);;
gap> hom := GroupHomomorphismByImages(h, g, h_gens, [g.2, g.1^2]);
[ f1^2, f2 ] -> [ f2, f1^2 ]
gap> GetNonTrivialKernelElem(g, h, hom, 10);
Group([ f1^-2, f2 ])
gap> IsKernelTrivial(g, h, hom, 10);
false
