european(bmw_m5_f90,0).
european(audi_tt,0).
european(bmw_4_m440i,0).
european(bmw_x5_g05_30d,0).
european(bmw_i3_17_22,0).
european(peugeot_308,0).
european(vaz_2107,1).
european(vaz_2105,1).
european(vaz_2110,1).
european(lada_niva,1).
european(vaz_2113,1).
european(vaz_21123,1).
european(lada_kalina_sport_2014,1).
european(tesla_plaid, 0).
european(mercedes_benz_amg_gt_63s,0).
european(zeekr_001,0).
european(bmw_3_series_320d,0).
european(mercedes_benz_e_400_d,0).
european(toyota_land_cruiser_300,0).
european(toyota_hilux_8_rest,0).
european(uaz_pickup,1).
european(kia_rio_3_rest,0).

body_type(bmw_m5_f90,0).
body_type(vaz_2107,0).
body_type(vaz_2105,0).
body_type(vaz_2110,0).
body_type(kia_rio_3_rest,0).
body_type(audi_tt,1).
body_type(vaz_2113,1).
body_type(vaz_21123,1).
body_type(bmw_4_m440i,2).
body_type(tesla_plaid, 2).
body_type(mercedes_benz_amg_gt_63s,2).
body_type(bmw_x5_g05_30d,3).
body_type(bmw_i3_17_22,4).
body_type(peugeot_308,4).
body_type(lada_kalina_sport_2014,4).
body_type(lada_niva,5).
body_type(toyota_land_cruiser_300,5).
body_type(zeekr_001,6).
body_type(bmw_3_series_320d,6).
body_type(mercedes_benz_e_400_d,6).
body_type(uaz_pickup,7).
body_type(toyota_hilux_8_rest,7).

engine_type(bmw_m5_f90,0).
engine_type(audi_tt,0).
engine_type(bmw_4_m440i,0).
engine_type(lada_kalina_sport_2014,0).
engine_type(vaz_2107,0).
engine_type(vaz_2105,0).
engine_type(vaz_2110,0).
engine_type(kia_rio_3_rest,0).
engine_type(vaz_2113,0).
engine_type(vaz_21123,0).
engine_type(lada_niva,0).
engine_type(uaz_pickup,0).
engine_type(mercedes_benz_amg_gt_63s,0).
engine_type(toyota_land_cruiser_300,0).
engine_type(peugeot_308,0).
engine_type(bmw_x5_g05_30d,1).
engine_type(bmw_3_series_320d,1).
engine_type(mercedes_benz_e_400_d,1).
engine_type(toyota_hilux_8_rest,1).
engine_type(tesla_plaid, 2).
engine_type(zeekr_001,2).
engine_type(bmw_i3_17_22,3).


speed(bmw_m5_f90,0).
speed(audi_tt,1).
speed(tesla_plaid, 0).
speed(mercedes_benz_amg_gt_63s,0).
speed(zeekr_001,0).
speed(bmw_4_m440i,1).
speed(bmw_x5_g05_30d,1).
speed(bmw_3_series_320d,1).
speed(mercedes_benz_e_400_d,1).
speed(toyota_land_cruiser_300,1).
speed(bmw_i3_17_22,2).
speed(peugeot_308,2).
speed(lada_kalina_sport_2014,2).
speed(vaz_2107,3).
speed(vaz_2105,3).
speed(vaz_2110,3).
speed(kia_rio_3_rest,3).
speed(vaz_2113,3).
speed(vaz_21123,3).
speed(lada_niva,3).
speed(uaz_pickup,3).
speed(toyota_hilux_8_rest,3).

type_drive(bmw_i3_17_22,0).
type_drive(vaz_2107,0).
type_drive(vaz_2105,0).
type_drive(bmw_3_series_320d,0).
type_drive(vaz_2110,1).
type_drive(vaz_2113,1).
type_drive(vaz_21123,1).
type_drive(peugeot_308,1).
type_drive(lada_kalina_sport_2014,1).
type_drive(kia_rio_3_rest,1).
type_drive(bmw_m5_f90,2).
type_drive(audi_tt,2).
type_drive(bmw_4_m440i,2).
type_drive(lada_niva,2).
type_drive(uaz_pickup,2).
type_drive(mercedes_benz_amg_gt_63s,2).
type_drive(toyota_land_cruiser_300,2).
type_drive(bmw_x5_g05_30d,2).
type_drive(mercedes_benz_e_400_d,2).
type_drive(toyota_hilux_8_rest,2).
type_drive(tesla_plaid, 2).
type_drive(zeekr_001,2).

kolvo_ls(vaz_2107,1).
kolvo_ls(vaz_2105,0).

vaz2112(vaz_2113,0).
vaz2112(vaz_21123,1).

% check_result(+Result) -  предикат проверяет длину листа с результатами и если количество элементов в результате равно 1, 
% то он извлекает этот единственный элемент и выводит его на экран. Если нет, то предикат завершается без вывода на экран
check_result(Result):-length(Result, Count), (Count =:= 1 -> [Answer | _] = Result, write(Answer), fail; true).

% проверяет наличие элемента в списке
in_list([El|_], El):-!.
in_list([_|T], El):- in_list(T, El).

start:-
    question1(X1),
    findall(Y, (european(Y, X1)), Result1),
    check_result(Result1),

    question2(X2),
    findall(Y, (european(Y, X1),body_type(Y,X2)), Result2),
    check_result(Result2),

    question3(X3),
    findall(Y, (european(Y, X1),body_type(Y,X2),engine_type(Y,X3)), Result3),
    check_result(Result3),

    question4(X4),
    findall(Y, (european(Y, X1),body_type(Y,X2),engine_type(Y,X3),speed(Y,X4)), Result4),
    check_result(Result4),

    question5(X5),
    findall(Y, (european(Y, X1),body_type(Y,X2),engine_type(Y,X3),speed(Y,X4),type_drive(Y,X5)), Result5),
    check_result(Result5),

     %vaz_2107 и vaz_2105 не распознаны после 5 вопроса, проверяем конкретно их
    (in_list(Result5,vaz_2107),in_list(Result5, vaz_2105)->
             question6(X6),
             findall(Y, (kolvo_ls(Y,X6)), Result6),
    check_result(Result6);true),

    %vaz_2113 и vaz_21123 не распознаны после 5 вопроса, проверяем конкретно их
    (in_list(Result5,vaz_2113),in_list(Result5, vaz_21123)->
             question7(X7),
             findall(Y, (vaz2112(Y,X7)), Result7),
    check_result(Result7),true;false).

