man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

%Задание - 1
men :- man(X), write(X), nl, fail. %men - вывод всех мужчин
women :- woman(X), write(X) , nl, fail. %women - вывод всех женщин
children(X) :- parent(X,Y), write(Y), nl, fail. %children(+X) - вывод всех детей X
mother(X,Y) :- parent(X,Y), woman(X). %+mother(?X,+Y) - +X проверяет является ли X матерью Y. -X вывод матери Y
mother(X) :- mother(Y,X),  write(Y), fail. %mother(+X) - выводит матери X
brother(X,Y) :- man(X),parent(F,X),parent(F,Y), man(F). %brother(?X,+Y) - проверяет является ли X братом Y. -X выводит брата Y
brothers(X) :- brother(Y,X), not(X==Y), write(Y), nl, fail. %brothers(+X) - вывод всех братьев X.
b_s(X, Y) :- parent(Z, X), parent(Z, Y), man(Z), not(X==Y). %b_s(+X, ?Y) - +Y проверяет являются ли X и Y братьями, или сестрами, или братом и сестрой; -Y вывод брата или сестры X.
b_s(X) :- b_s(X, Y), not(X==Y), write(Y), nl, fail. %b_s(+X) - вывод всех братьев и сестёр X

%Задание - 2
father(X,Y) :- parent(X,Y), man(X). %father(?X,+Y) - +X проверяет является ли X отцом Y. -X выводит отца Y.
father(X) :- father(Y,X), write(Y). %father(+X) - выводит отца X.

wife(X,Y) :- mother(X,Z),father(Y,Z). %wife(?X,+Y) - +X проверяет является ли X женой Y. -X выводит жену Y.
wife(X) :- wife(Y,X), write(Y). %wife(+X) - выводит жену X.

%Задание - 3
sister(X,Y) :- woman(X), parent(F,X), parent(F,Y), man(F), not(X==Y). %sister(?X,+Y) - +X проверяет является ли X сестрой Y.
grand_da(X,Y) :- woman(X),parent(Z,X),parent(Y,Z). %grand_da(?X,+Y) - +X проверяет является ли X внучкой Y. -X - выводит внучку Y.
grand_dats(X) :- grand_da(Y,X),write(Y),nl,fail. %grand_dats(+X) - выводит всех внучек X.
grand_pa_and_da(X,Y) :- grand_da(Y,X). %grand_pa_and_da(+X,+Y) - проверяет является ли X дедушкой Y.
grand_pa_and_da(X,Y) :- grand_da(X,Y). %grand_pa_and_da(+X,+Y) - проверяет является ли Y внучкой X.

aunt(X,Y) :- parent(P,Y),sister(X,P). %aunt(?X,+Y) - +X проверяет является ли X тётей Y. -X выводит тётю Y.
aunts(X) :- aunt(Y,X),write(Y),nl,fail.

