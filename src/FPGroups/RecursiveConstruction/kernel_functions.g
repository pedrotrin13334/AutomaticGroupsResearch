CheckKernelConditions := function(g, subgrp, hom) 
    if IsNormal(g, subgrp) and
    IsSubgroup(subgrp, Image(hom, subgrp)) then 
        return true;;
    else 
        return false;;
    fi;
end;; 

## Iterates over the many candidates for the kernel over the recursive
## construction of the automata group, given a virtual endomorphism and 
## a construction homorphism hom and up to a given subgroup index. 
## Obs: This function can run indefitenily, unless the user passes
## an optional parameter "max_iter" that defines how many iterations 
## to go through.
GetNonTrivialKernelElem := function(g, h, hom, max_index, arg...)
    local subgrp, iter, curr_iter, max_iter, elm_found, test;;

    curr_iter := 0;;

    if Length(arg) = 0 then
        max_iter := 1;;
    else 
        max_iter := arg[1];;
    fi;

    elm_found := false;;
    iter := LowIndexSubgroupsFpGroupIterator(h, max_index);;

    while not (elm_found or IsDoneIterator(iter) or curr_iter > max_iter) do 

        if max_iter > 1 then 
            curr_iter := curr_iter + 1;;
        fi;

        subgrp := NextIterator(iter);;
        elm_found := CheckKernelConditions(g, subgrp, hom);;
    od;;
    
    if elm_found then 
        return subgrp;;
    else  
        return fail;;
    fi;
end;;


IsKernelTrivial := function(g, h, hom, max_index, arg...)  
    local elm_found, max_iter;;

    if Length(arg) = 0 then 
        elm_found := GetNonTrivialKernelElem(g, h, hom, max_index);; 
    else 
        max_iter := arg[1];;
        elm_found := GetNonTrivialKernelElem(g, h, hom, max_index, max_iter);;
    fi;

    if not (elm_found = fail) then
        return false;; 
    else 
        return fail;;
    fi;
end;;