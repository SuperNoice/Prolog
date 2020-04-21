num(Fr,To,X):-ToN is To+1, num2(Fr,ToN,X).
num2(Fr,To,X):-FrN is Fr+1, FrN<To, num2(FrN,To,X).
num2(X,_,X).

st(Os,St,X):-st2(Os,St,X,Os,1).
st2(_,0,1,_,_):-!.
st2(_,St,R,R,St):-!.
st2(Os,St,X,R,I):-I<St, RN is R*Os, IN is I+1, st2(Os,St,X,RN,IN).

all_st(X,N,M):-num(2,N,Os),num(2,M,St),st(Os,St,X).

unic_count(_,N,M):-asserta(count(0)), asserta(mem(0)),asserta(i(0)), all_st(A,N,M), uc(A), fail.
unic_count(X,_,_):-!,count(X),!, retractall(mem(_)), retractall(count(_)).
uc(A):-not(mem(A)), asserta(mem(A)), count(C),!, NewI is C+1, asserta(count(NewI)).
