lit(a).
lit(b).
lit(c).
lit(d).
lit(e).
lit(f).

uniq_el(Ref,Res):-uniq_el(Ref,Res,[]).
uniq_el([],Res,Res):-!.
uniq_el([H|T],Res,Cur):-check(H,Cur,Cur,R), uniq_el(T,Res,R).
check(El,[El|_],Ref,Ref):-!.
check(E1,[],Ref,R):-append(Ref,[E1],R),!.
check(El,[_|T],Ref,R):-check(El,T,Ref,R).

count_el(El,List,Count):-count_el(El,List,Count,0).
count_el(_,[],Count,Count):-!.
count_el(El,[El|T],Count,Cur):-Cur1 is Cur+1, count_el(El,T,Count,Cur1),!.
count_el(El,[_|T],Count,Cur):-count_el(El,T,Count,Cur).

listofkolunic(In,Out):-uniq_el(In,L1), kolinit(In,L1,Out).
kolinit(L,L1,L2):-kol(L,L1,L2,[]).
kol(_,[],L2,L2):-!.
kol(L,[H|T],L2,Tmp):-count_el(H,L,C), append(Tmp,[C],L2new), kol(L,T,L2,L2new).

