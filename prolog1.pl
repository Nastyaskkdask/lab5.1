min_max_digit(X, X, X) :-
    X >= 0, X < 10, !.

min_max_digit(N, Min, Max) :-
    N >= 10,
    LastDigit is N mod 10,
    RemainingNumber is N // 10,
    min_max_digit(RemainingNumber, RemainingMin, RemainingMax),

    Min is min(LastDigit, RemainingMin),

    Max is max(LastDigit, RemainingMax).

find_min_max_digits(N, Min, Max) :-
    integer(N),
    N >= 0,
    min_max_digit(N, Min, Max).

main :-
    write('Введите целое неотрицательное число: '),
    read(N),
    (   integer(N), N >= 0 ->
    find_min_max_digits(N, Min, Max),
        write('Минимальная цифра: '), write(Min), nl,
        write('Максимальная цифра: '), write(Max), nl
    ;   write('Ошибка: Введите целое неотрицательное число.'), nl
    ).

