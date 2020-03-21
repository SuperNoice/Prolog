pr_list(A,Pr):-pr_list(A,Pr,1).
pr_list([],Pr,Pr).
pr_list([Head|Tail],Pr,P):-P1 is P*Head,pr_list(Tail,Pr,P1).
f(0,1):-!.
f(X,Y):-not(X=<0),X1 is X-1,f(X1,Y1),Y is Y1*X.
no(P):-P,!,fail.
no(_).
append1([],X,X).
append1([H|T],X,[H |Z]):-append1(T,X,Z).

w_list([H]):-write(H),!.
w_list([H|T]):-write(H),write(", "),w_list(T).

read_word(A):-get0(X),r_w(X,A,[]).
r_w(32,A,A):-!.
r_w(X,A,B):-append(B,[X],B1),get0(X1),r_w(X1,A,B1).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

pr_lec3_1:-read_str(A,N),write("vsego "),write(N),nl,w_list(A).
% -----------------------------------------------------------------------

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

pr5_1:- read_str(A,N), write_str(A),write(', '),write_str(A),write(', '),write_str(A),write(', '),write(N).

pr5_2:-read_str(A,N),count_words(A,K),write(K).

count_words(A,K):-count_words(A,0,K).

count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[], I1 is I+1,count_words(A2,I1,K),!.
count_words(A1,A1).
get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).

get_words(A,Words,K):-get_words(A,[],Words,0,K).

get_words([],B,B,K,K):-!.
get_words(A,Temp_words,B,I,K):-
    skip_space(A,A1),get_word(A1,Word,A2),Word \=[], I1 is I+1,
    append(Temp_words,[Word],T_w),get_words(A2,T_w,B,I1,K),!.
get_words(_,B,B,K,K).

uniq_elements(A,B):-uniq_elements(A,B,).
