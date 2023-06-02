-module(f).
-compile([debug_info, export_all]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Researching Erlang functions %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

first([F|_]) -> F.

second([_, S|_]) -> S.

%% last([]) -> L. % _|L, todo

same(A,A) -> true;
same(_,_) -> false.

valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
    io:format("Date (~p) format: ~p~p~p~n", [Date,Y,M,D]),
    io:format("Time (~p) format: ~p:~p:~p~n", [Time,H,Min,S]);
valid_time(_) ->
    io:format("Incorrect date/time format").

correct_value(X) when X >= 25 -> true;
correct_value(_) -> false.

correct_value_complex(Y) when Y >= 25, Y =< 50 -> true;
correct_value_complex(_) -> false.

incorrect_value(X) when X < 25; X > 50 -> true;
incorrect_value(_) -> false.

try_if() ->
    if 1 =:= 1 ->
        works
    end,
    if 1 =:= 2; 1 =:= 1 ->
        works
    end,
    if 1 =:= 2, 1 =:= 1 ->
        fails;
        true -> 8
    end.

try_if_again(N) ->
    if N =:= 2 -> might_succeed;
       true    -> always_does     % like 'else'
    end.

animal_voice(Animal) -> 
    Talk = if Animal == cat -> "meow";
           Animal == beef -> "moo";
           Animal == dog -> "bark";
           Animal == tree -> "bark";
           true -> "hdsjahderwui"
    end,
    {Animal, "say " ++ Talk ++ "!"}.

    
























