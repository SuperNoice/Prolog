pr3_00:-read(N),write(N).

pr3_0:-write("N="),read(N),r_list(A,N),w_list(A).
r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,K,B):-read(X),append(B,[X],B1),K1 is K+1,r_list(A,N,K1,B1).
w_list([]):-!.
w_list([H|T]):-write(H),nl,w_list(T).

pr3_1:-write("N="),read(N),r_list(A,N),list_sum(A,S),write(S).
list_sum(A,S):-list_sum(A,S,0).
list_sum([],S,S):-!.
list_sum([H|T],S,Sum):-Sum1 is Sum+H,list_sum(T,S,Sum1).

pr3_2():-write("N="),read(N),r_list(A,N),read(I),el_no(A,I,X),write(X).
el_no(A,I,X):-el_no(A,I,1,X).
el_no([H|_],I,I,H):-!.
el_no([_|T],I,K,X):-K1 is K+1,el_no(T,I,K1,X).

pr3_3():-write("N="),read(N),r_list(A,N),list_min(A,M),write(M).
list_min([H|T],M):-list_min(T,M,H).
list_min([],M,M):-!.
list_min([H|T],M,Min):-H<Min,!,list_min(T,M,H).
list_min([_|T],M,Min):-list_min(T,M,Min).

w1_list([]):-!.
w1_list([H|T]):-write(H),nl,w_list(T).

updown:-write("N="),read(N),r_list(A,N),up(A,B),w_list(B).
up([H|T],B):-up(H,T,B).
up(B,[],B):-!.
up(H,T,B):-append(B,[H],B1),up(T,B1).
