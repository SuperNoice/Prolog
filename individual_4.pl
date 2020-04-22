subject(bio).
subject(math).
subject(history).
subject(fr).
subject(eng).
subject(geo).

num(1).
num(2).
num(3).
num(4).

:-dynamic teacherConfirm/2.

writeTeach(Name):-teacher(Name,S),write(S," "),fail.
writeTeach(_):-!.

both(Subj1, Subj2):-teacher(Teach,Subj1),teacher(Teach,Subj2).

nosubj(Name,Subj):-teacher(Name,Subj).

myassert(Name,Subj,Subj2):-retractall(teacher(_,_)), assert(teacher(Name,Subj)),assert(teacher(Name,Subj2)).

soch(X,Y):-subject(X), subject(Y), not(X=Y).

prov(X1,X2,X3,X4,X5,X6):-
    not(X1=X2), not(X1=X3), not(X1=X4), not(X1=X5), not(X1=X6),
    not(X2=X3), not(X2=X4), not(X2=X5), not(X2=X6),
    not(X3=X4), not(X3=X5), not(X3=X6),
    not(X4=X5), not(X4=X6),
    not(X5=X6).

gen:-assert(teacher(0,0)), soch(Sm1,Sm2), soch(St1,St2), soch(Sv1,Sv2), prov(Sm1,Sm2,St1,St2,Sv1,Sv2), retractall(teacher(_,_)),
    assert(teacher(mor,Sm1)), assert(teacher(mor,Sm2)),
    assert(teacher(tok,St1)), assert(teacher(tok,St2)),
    assert(teacher(vas,Sv1)), assert(teacher(vas,Sv2)).
gen:-!,retractall(teacher(_,_)),fail.

main:-gen, not(both(geo,fr)), not(both(bio,math)), not(teacher(mor,bio)),
    not(teacher(tok,bio)),not(teacher(tok,fr)), not(teacher(mor,math)),not(teacher(mor,eng)).

test:-gen,teacher(X,Y),write(X),write("-"),write(Y),nl,fail.
test.
