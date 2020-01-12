% https://inf.ug.edu.pl/~schwarzw/zadania/ZadProlog2019d.html

% zad 1
%length(0, []).
%length(N, [_|L]) :-
%    length(M,L), N is M+1.

member(X, [X|_]).
member(X, [_|Xs]) :- member(X, Xs).

sil(0,1).
sil(N, F) :-
    N > 0,
    Prev is N-1,
    sil(Prev, R),
    F is R * N.

fib(0,0).
fib(1,1).
fib(X, F) :-
    X > 1,
    X1 is X-1,
    X2 is X-2,
    fib(X1, F1),
    fib(X2, F2),
    F is F1+F2.

nwd(0,X, X).
nwd(X, 0, X).
nwd(X, Y, Result) :-
    X =< Y,
    Z is Y - X,
    nwd(X, Z, Result).
nwd(X, Y, Result) :-
    nwd(Y, X, Result).

% zad 2
parent(bob, charlie).
parent(ann, charlie).

parent(bob, zoe).
parent(ann, zoe).

parent(charlie, john).

female(zoe).
female(ann).

male(bob).
male(charlie).

child(X,Y) :-
    parent(Y, X).

mother(X,Y) :-
    parent(X, Y),
    female(X).

sister(X,Y) :-
    parent(Z, X),
    parent(Z, Y),
    female(X).

has_a_child(X) :-
    parent(X, _).

grandparent(X, Y) :-
    parent(Z, Y),
    parent(X, Z).

predecessor(X, Y) :- parent(X, Y).
predecessor(X, Y) :-
    parent(Z, Y),
    predecessor(X, Z).

% zad 3
f(1, one).
f(s(1), two).
f(s(s(1)), three).
f(s(s(s(X))), N) :- f(X,N).

% zad 4
p(pam, bob).
p(tom,bob).
p(tom,liz).
p(bob,ann).
p(bob,pat).
p(pat,jim).

q1(X,Y) :-
    p(X,Y).
q1(X,Y) :-
    p(X,Z),
    q1(Z,Y).
q2(X,Y) :-
    p(X,Z),
    q2(Z,Y).
q2(X,Y) :-
    p(X,Y).
q3(X,Y) :-
    p(X,Y).
q3(X,Y) :-
    q3(X,Z),
    p(Z,Y).
q4(X,Y) :-
    q4(X,Z),
    p(Z,Y).
q4(X,Y) :-
    p(X,Y).

% zad 5
ostatni(X, [X]).
ostatni(X, [_|Z]) :-
    ostatni(X, Z).

delete(_, [], []).
delete(X, [X|T], L) :-
    delete(X, T, L).
delete(X, [H|T], [H|L]) :-
    delete(X, T, L).

delete_last_three([_, _, _], []).
delete_last_three([H|T], [H|NT]) :-
    delete_last_three(T, NT).


myReverse(List, Result) :-
    myReverse(List, [], Result).

myReverse([], ReversedList, ReversedList).
myReverse([Head|Tail], RestTail, ReverseList) :-
    myReverse(Tail,[Head|RestTail], ReverseList).

oddlength([_]).
oddlength([_,_|R]) :-
    oddlength(R).

evenlength([]).
evenlength([_,_|R]) :-
    evenlength(R).

shift([Head|Rest], Shifted) :-
    concatenation(Rest,[Head], Shifted).

concatenation([], L, L).
concatenation([X1|L1], L2, [X1|L3]) :-
    concatenation(L1, L2, L3).

quadrat([],[]).
quadrat([X|Xs], [Y|Ys]) :-
    Y is X ^ 2,
    quadrat(Xs, Ys).
    
combine([], [], []).
combine([L1H|L1T], [L2H|L2T], [[L1H,L2H]|Rest]) :-
    combine(L1T,L2T,Rest).

palindrom(X) :-
    reverse(X, X).

palindrom2(X) :-
    palindrom(X, X, []).
palindrom([], X, X).
palindrom([Y|Ys], Xs, Zs) :-
    palindrom(Ys, Xs, [Y|Zs]).

% j) ???

% k) ???

% zad 6
% a)
ordered([]).
ordered([_]).
ordered([X,Y|Z]) :-
    X =< Y,
    ordered([Y|Z]).

% b)
msort([], [] ).
msort([X], [X]).
msort(X, Y) :-
    split(X, L, R),
    msort(L, SL),
    msort(R, SR),
    merge(SL, SR, Y).
 
split([], [], []).
split([X], [X], []).
split([L,R|T], [L|LT], [R|RT]) :-
    split(T, LT, RT).

merge([], RS, RS).
merge(LS, [], LS).
merge([L|LS], [R|RS], [L|T]) :-
    L =< R,
    merge(LS, [R|RS], T).
merge([L|LS], [R|RS], [R|T]) :-
    L > R,
    merge([L|LS], RS, T).

% zad 7

append2([X|L1],L2,[X|L3]) :-
    append2(L1,L2,L3).
append2([],L,L). 

% zad 8 ???