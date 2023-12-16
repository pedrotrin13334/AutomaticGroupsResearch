Display("Initializing some basic Polycyclic groups experiments...");

f := FreeGroup( "a", "b", "c");;

comm := elm -> elm[1]^-1 * elm[2]^-1 * elm[1] * elm[2];;

g := f/[comm([f.1, f.2]), comm([f.1, f.3]), (f.2^f.3)*f.2^-1 * f.1 ^-1 ];

h := Group([g.1^2, g.2, g.3^2]);

Display("Index of the Subgroup H: ");
Display(Index(g,h));

h_gens := GeneratorsOfGroup(h);;

hom := GroupHomomorphismByImages(h, g, h_gens, [g.1, g.2, g.3]);

check_phi_kernel := function(g, h, hom, index) 
    local subgrp_list, resulting_groups, idx;;
    resulting_groups := [];;

    subgrp_list := LowIndexSubgroupsFpGroup(h, index);;

    for idx in [1..Length(subgrp_list)] do
        if IsNormal(g, subgrp_list[idx]) and
         IsSubgroup(subgrp_list[idx], Image(hom, subgrp_list[idx])) then 
            Append(resulting_groups, [subgrp_list[idx]]);;
        fi;
    od;

    return resulting_groups;;

end;;

li := check_phi_kernel(g, h, hom, 10);
