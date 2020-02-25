woman(ana).
woman(maria).
woman(dorina).
woman(irina).
woman(carmen).
woman(sara).
woman(ema).

man(sergiu).
man(marius).
man(mihai).
man(george).
man(andrei).
man(alex).
man(hablu).

parents(sergiu,mihai).
parents(sergiu,dorina).
parents(sergiu,hablu).
parents(marius,maria).
parents(dorina,maria).
parents(maria,ana).
parents(maria,andrei).
parents(mihai,george).
parents(mihai,carmen).
parents(irina,carmen).
parents(irina,george).
parents(carmen,sara).
parents(carmen,ema).
parents(alex,sara).
parents(alex,ema).



father(X,Y):-parents(X,Y),man(X).
mother(X,Y):-parents(X,Y),woman(X).

son(X,Y):-parents(Y,X),man(X).
daughter(X,Y):-parents(Y,X),woman(X).

sibling(X,Y):-parents(Z,X),parents(Z,Y),X\=Y.
brother(X,Y):-sibling(X,Y),man(X).
/*sister(X,Y):-sibling(X,Y),woman(X).*/
/*brother(X,Y):-parents(Z,X),parents(Z,Y),man(X),X\=Y.*/
sister(X,Y):-parents(Z,X),parents(Z,Y),woman(X),X\=Y.

grandfather(X,Y):-parents(X,Z),parents(Z,Y),man(X).
grandmother(X,Y):-parents(X,Z),parents(Z,Y),woman(X).

aunty(X,Y):-sister(X,Z),mother(Z,Y).
aunty(X,Y):-sister(X,Z),father(Z,Y).

uncle(X,Y):-brother(X,Z),father(Z,Y).
uncle(X,Y):-brother(X,Z),mother(Z,Y).

cousin(X,Y):-uncle(Z,X),parents(Z,Y).
ancestor(X,Y):-father(X,Y).
ancestor(X,Y):-parents(X,Z),ancestor(Z,Y).

