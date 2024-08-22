%Задание 1
%max(+X,+Y,+Z,-U) - находит максимум XYZ
max(X,Y,Z,X):- X>Y,X>Z,!.
max(_,Y,Z,Y):- Y>Z,!.
max(_,_,Z,Z).

%factUp(+N,?X) - вычисляет факториал N в X рекурсией вверх
factUp(1,1):-!.
factUp(N,X):-N1 is N-1,fact(N1,X1),X is N*X1.

%factDown(+N,?X) - вычисляет факториал N в X рекурсией вниsз
factDown(N,X):-factD(0,1,N,X).
factD(N,Y,N,Y):-!.
factD(I,Y,N,X):-I1 is I+1, Y1 is Y*I1, fact2(I1,Y1,N,X).

%summ_cifrUp - высичляет сумму цифр рекурсией вверх
summ_cifrUp(0,0):-!.
summ_cifrUp(X,SummCifr):-X1 is X // 10, Ost is X mod 10,
    summ_cifrUp(X1,SummCifr1), SummCifr is SummCifr1 + Ost.

%summ_cifrDown - высичляет сумму цифр рекурсией вниз
summ_cifrDown(N,X):-summ_cifr(N,0,X).
summ_cifr(0,X,X):-!.
summ_cifr(N,CurX,X):-N1 is N // 10, Ost is N mod 10,
	NewX is CurX + Ost, summ_cifr(N1, NewX, X).

%free_num(+N)- предикат проверки числа на свободу от квадратов
free_num(N):- f_n(2,N),!,true.
f_n(N,N):-!.
f_n(Del,N):- DelDel is Del*Del,Ost is N mod DelDel,Ost\=0,NextDel is Del+1, f_n(NextDel,N).

% read_list(+N,-List)- предикат чтения, где N - количество элементов
read_list(N,List):- rList(0,N,List,[]).
rList(N,N,List,List):-!.
rList(CurN,N,List,NewList):-read(X), append(NewList,[X],NL), CurN1 is CurN+1, rList(CurN1,N,List,NL).

%write_list(+List) - предикат вывода
write_list([]):-!,true.
write_list([H|T]):- write(H),write(" "), write_list(T).

% sum_list_down(+List,?Summ) - Рекурсия вниз, проверка либо сбор суммы элементов массива
sum_list_down(List,Summ):-s_l_d(List, 0, Summ).
s_l_d([],Summ,Summ):-!,true.
s_l_d([H|T],CurSumm, Summ):- NewCurSumm is CurSumm + H,s_l_d(T,NewCurSumm,Summ).

% sum_list_up(+List,?Summ) - Рекурсия вверх, проверка либо сбор суммы элементов массива
sum_list_up([],0).
sum_list_up([H|T],Summ):- sum_list_up(T,NewSumm), Summ is NewSumm+H.

% del_el_equal_sum(+List,+Summ) - удаляет все элементы, сумма цифр которых равна Summ
delete_element(List,Summ):- del_el_equal_sum(List,Summ,[]).
del_el_equal_sum([],_,ResList):-!,write_list(ResList).
del_el_equal_sum([H|T],Summ,ResList):- numSumUp(H,X),Summ is X, del_el_equal_sum(T,Summ,ResList).
del_el_equal_sum([H|T],Summ,ResList):-append(ResList,[H],NewResList),del_el_equal_sum(T,Summ,NewResList).

