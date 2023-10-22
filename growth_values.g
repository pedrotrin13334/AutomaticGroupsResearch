LoadPackage("kbmag");
F := FreeGroup(3);;
G := F/[F.1^2, F.2^2, F.3^2, (F.1*F.2)^2, (F.1*F.3)^3, (F.2*F.3)^7];;
R := KBMAGRewritingSystem(G);;
A := AutomaticStructure(R);;

Length(EnumerateReducedWords(R,0,3));
GrowthFunction(R);