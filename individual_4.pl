subject(bio).
subject(math).
subject(history).
subject(fr).
subject(eng).
subject(geo).

:-dynamic teacherConfirm/2.

writeTeach(Name):-teacher(Name,S),write(S," "),fail.
writeTeach(_):-!.

both(Subj1, Subj2):-teacher(Teach,Subj1),teacher(Teach,Subj2).

nosubj(Name,Subj):-teacher(Name,Subj).

myassert(Name,Subj,Subj2):-retractall(teacher(_,_)), assert(teacher(Name,Subj)),assert(teacher(Name,Subj2)).

main:-assert(teacher(0,0)), subject(S1), subject(S2), not(S1=S2), subject(S3), not(S1=S3), not(S2=S3), subject(S4), not(S1=S4), subject(S5), not(S2=S5), subject(S6), not(S3=S6), myassert(mor,S1,S4), myassert(tok,S2,S5), myassert(vas,S3,S6),
    not(both(geo,fr)), not(both(bio,math)), not(teacher(mor,bio)),
    not(teacher(tok,bio)),not(teacher(tok,fr)), not(teacher(mor,math)),not(teacher(mor,eng)),
    assert(teacherConfirm(mor,S1)), assert(teacherConfirm(tok,S2)), assert(teacherConfirm(vas,S3)).
