CommElm := elm -> elm[1]^-1 * elm[2]^-1 * elm[1] * elm[2];;

GetIdentityList := function(g, len)  
    local id, id_list, idx;;

    id := Identity(g);;
    id_list := [];;

    for idx in [1..len] do;
        Append(id_list, [id]);;
    od;
    
    return id_list;;
end;;