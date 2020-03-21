man(anatoliy).
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

