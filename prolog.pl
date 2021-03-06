﻿man(anatoliy).
man(dimitriy).
man(vlad).
man(kirill).
man(mefodiy).
women(sveta).
women(zoya).
women(katrin).
women(vladina).
women(galya).
dite(dimitriy,anatoliy).
dite(dimitriy,galya).
dite(mefodiy,dimitriy).
dite(vladina,anatoliy).
dite(vladina,galya).
dite(kirill,dimitriy).
dite(mefodiy,sveta).
dite(kirill,sveta).

dite(zoya,vlad).
dite(zoya,vladina).
dite(katrin,vlad).
dite(katrin,vladina).

sin(X,Y):-dite(X,Y),man(X).
doch(X,Y):-dite(X,Y),women(X).

brak(X,Y):-dite(Z, X),dite(Z,Y),not(X=Y).

vnuk(X,Y):-dite(D,Y),dite(X,D).
sestra(X,Y):-dite(Y,R),!,doch(X,R),not(X=Y).
brat(X,Y):-dite(Y,R),!,sin(X,R),not(X=Y).
tetya(X,Y):-dite(Y,R),sestra(X,R).
dyadya(X,Y):-dite(Y,R),brat(X,R).

%--------------------------------------------

max(X,Y,U,X):-X>Y,X>U,!.
max(X,Y,U,Y):-Y>X,Y>U,!.
max(X,Y,U,U):-U>X,U>Y.

fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is N*X1.

fact1(N,X):-fact2(0,1,N,X).    /*РЎ РІРµСЂС…Сѓ РІРЅРёР·*/
fact2(N,Y,N,Y):-!.
fact2(I,Y,N,X):-I1 is I+1, Y1 is Y*I1, fact2(I1,Y1,N,X).

fib(N,X):-fb(1,1,2,N,X).
fb(_,X,N,N,X):-!.
fb(F,S,I,N,X):-I1 is I+1, S1 is F+S, F1 is S, fb(F1,S1,I1,N,X).

%----------------------------------------------

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

%----------------------------------------------

pr_list(A,Pr):-pr_list(A,Pr,1).
pr_list([],Pr,Pr).
pr_list([Head|Tail],Pr,P):-P1 is P*Head,pr_list(Tail,Pr,P1).
f(0,1):-!.
f(X,Y):-not(X=<0),X1 is X-1,f(X1,Y1),Y is Y1*X.
no(P):-P,!,fail.
no(_).
append1([],X,X).
append1([H|T],X,[H |Z]):-append1(T,X,Z).

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

pr5_2:-read(N),read_str(A,N),count_words(A,K),write(K).

count_words(A,K):-count_words(A,0,K).

count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[], I1 is I+1,count_words(A2,I1,K),!.
%count_words(A1,A1).
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

% ----------------------------------------------------------- 23.03.2020
% HomeWork

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

%Not work
max_el_numb([H|T],Num):-max_el_numb(T,Num,H,1,1).
max_el_numb([],Num,_,_,Num):-!.
max_el_numb([H|T],Num,Max,CurNum,Tmp):-NewCur is CurNum+1, max_el(H,Max, NewCur,Tmp, T, Num).

max_in_list([H|T],Imax):-max_in_list(T,H,1,2,Imax).
max_in_list([],_,Cur,_,Cur):-!.
max_in_list([H|T],Max,Cur,Ind,Imax):-H>Max,Ind1 is Ind+1,max_in_list(T,H,Ind,Ind1,Imax),!.
max_in_list([_|T],Max,Cur,Ind,Imax):-Ind1 is Ind+1,max_in_list(T,Max,Cur,Ind1,Imax).

read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).
r_str_f(-1,A,A,N,N,0):-!.
r_str_f(10,A,A,N,N,1):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).

read_list_str(List,List_len):-read_str_f(A,N,Flag),r_l_s(List,List_len,[A],[N],Flag).
r_l_s(List,List_len,List,List_len,0):-!.
r_l_s(List,List_len,Cur_list,Cur_list_len,_):-
	read_str_f(A,N,Flag),append(Cur_list,[A],C_l),append(Cur_list_len,[N],C_l_l),
	r_l_s(List,List_len,C_l,C_l_l,Flag).



pr5_6:-	see('c:/Prolog/29_1_prolog_F/29_1.txt'),read_list_str(List,List_len),seen,
		tell('c:/Prolog/29_1_prolog_F/test.txt'),write_list_str(List),told.

build_all_razm_p:-
		read_str(A,N),read(K),b_a_rp(A,K,[]).

b_a_rp(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

build_all_perm:-
		read_str(A,N),b_a_r(A,[]).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

b_a_r([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,Perm):-in_list_exlude(A,El,A1),b_a_r(A1,[El|Perm]).
/* íîìåð ìàêñèìàëüíîãî ýëåìåíòà â ñïèñêå íîìåðàöèÿ ñ 1 */
build_all_razm:-
		read_str(A,N),read(K),b_a_r(A,K,[]).

b_a_r(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,N,Perm):-in_list_exlude(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,K,B):-read(X),append(B,[X],B1),K1 is K+1,r_list(A,N,K1,B1).

pr_subset:-read(N),r_list(A,N),sub_set(B,A),write(B),nl,fail.

build_all_sochet:-
	read_str(A,N),read(K),sochet(B,A,K),write_str(B),nl,fail.

