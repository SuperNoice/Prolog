subject(bio).
subject(math).
subject(history).
subject(fr).
subject(eng).
subject(geo).

:-dynamic mem/2.
:-dynamic teacher/2.

both(Subj1, Subj2):-teacher(Teach,Subj1),teacher(Teach,Subj2).

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

start:-assert(mem(0,0)), st, fail.   %Главная функция
start:-retractall(mem(_,_)).

st:-gen, teacher(P1,P2),not(mem(P1,P2)), not(both(geo,fr)), not(both(bio,math)), not(teacher(mor,bio)),
    not(teacher(tok,bio)),not(teacher(tok,fr)), not(both(bio,fr)), not(teacher(mor,math)),not(teacher(mor,eng)), not(both(eng,math)),
    teacher(X,Y),assert(mem(X,Y)),write(X),write("-"),write(Y),nl.

