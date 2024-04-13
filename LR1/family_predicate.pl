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
