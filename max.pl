max(X,Y,U,X):-X>Y,X>U,!.
max(X,Y,U,Y):-Y>X,Y>U,!.
max(X,Y,U,U):-U>X,U>Y.

fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is N*X1.

fact1(N,X):-fact2(0,1,N,X).    /*С верху вниз*/
fact2(N,Y,N,Y):-!.
fact2(I,Y,N,X):-I1 is I+1, Y1 is Y*I1, fact2(I1,Y1,N,X).

fib(N,X):-fb(1,1,2,N,X).
fb(_,X,N,N,X):-!.
fb(F,S,I,N,X):-I1 is I+1, S1 is F+S, F1 is S, fb(F1,S1,I1,N,X).

