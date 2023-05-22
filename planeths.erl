%%%
%%% Module for describing planeths in our Universum.
%%%
-module(planeths).
-export([describe_planeth/1, list_planeths/0]).
-compile([debug_info]).
-copyright(["Milkyway Telecommunications", "Sergey Serov"]).

-define(LIGHT_SPEED, 300000). % km/s
-define(light_time(Distance), Distance / ?LIGHT_SPEED). % secunds

-define(BOLD, "\e[1m").

describe_planeth(Name) ->
    print_title(Name),
    io:format("Air: *** ~n"),
    io:format("Surface: *** ~n"),
    io:format("Core: *** ~n"),
    io:format("Ready for live: *** ~n"),
    Light_time = ?light_time(1500000),
    io:format("Light time: "),
    io:format(float_to_list(Light_time)),
    io:format(" sec. ~n"),
    print_bottom().

%% [A * A - B || A <- [30,70,80], B <- [1,2,3], B rem 2 =:= 1].
list_planeths() ->
    [Planeth || Planeth <- [mercury, vien, earth, mars, upiter]].

%%%
%%% Module helpers
%%%
print_title(Title) ->
    io:format("~n----------~n> "),
    io:format("\e[0;35m"),
    %%%% \e[1mText
    io:format(Title),
    io:format("\e[0m"),
    io:format("~n----------~n").

print_bottom() ->
    io:format("~n##########~n").


