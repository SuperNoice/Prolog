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

prov(In,K1,K2):-listofkolunic(In,Out),count_el(1,Out,Count1),K1=Count1,count_el(2,Out,Count2),K2=Count2.

start(8):-tell('.\\word8_out.txt'),
    lit(X1),lit(X2),lit(X3),lit(X4),lit(X5),lit(X6),lit(X7),lit(X8),
    prov([X1,X2,X3,X4,X5,X6,X7,X8],0,4),
    write(X1),write(X2),write(X3),write(X4),write(X5),write(X6),write(X7),write(X8),nl,fail.
start(8):-!,told.

start(9):-tell('.\\word9_out.txt'),
    lit(X1),lit(X2),lit(X3),lit(X4),lit(X5),lit(X6),lit(X7),lit(X8),lit(X9),
    prov([X1,X2,X3,X4,X5,X6,X7,X8,X9],1,4),
    write(X1),write(X2),write(X3),write(X4),write(X5),write(X6),write(X7),write(X8),write(X9),nl,fail.
start(9):-!,told.

start(10):-tell('.\\word10_out.txt'),
    lit(X1),lit(X2),lit(X3),lit(X4),lit(X5),lit(X6),lit(X7),lit(X8),lit(X9),lit(X10),
    prov([X1,X2,X3,X4,X5,X6,X7,X8,X9,X10],2,4),
    write(X1),write(X2),write(X3),write(X4),write(X5),write(X6),write(X7),write(X8),write(X9),write(X10),nl,fail.
start(10):-!,told.
