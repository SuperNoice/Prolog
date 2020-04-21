num(Fr,To,X):-ToN is To+1, num2(Fr,ToN,X).
num2(Fr,To,X):-FrN is Fr+1, FrN<To, num2(FrN,To,X).
num2(X,_,X).

st(Os,St,X):-st2(Os,St,X,Os,1).
st2(_,0,1,_,_):-!.
st2(_,St,R,R,St):-!.
st2(Os,St,X,R,I):-I<St, RN is R*Os, IN is I+1, st2(Os,St,X,RN,IN).

all_st(X):-num(2,5,St),num(2,5,Os),st(Os,St,X).


