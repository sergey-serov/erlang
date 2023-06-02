%%%
%%% Module for describing planeths in our Universum.
%%%
-module(planeths).
-export([describe_planeth/1, list_planeths/0]).
-compile([debug_info]). % export_all
-copyright(["Milkyway Telecommunications", "Sergey Serov"]).

-define(LIGHT_SPEED, 300000). % km/s
-define(light_time(Distance), Distance / ?LIGHT_SPEED). % seconds

% todo move FORMATS to new module
-define(END_COLOR, "\e[0m").
-define(LILAC, "\e[0;35m").
-define(YELLOW, "\e[0;33m").
-define(WHITE, "\e[0;30m").
-define(GREEN, "\e[0;32m").
-define(BOLD, "\e[1m").

describe_planeth(Name) ->
    print_title(Name),
    print_label("Air", ?YELLOW),
    io:format("*** ~n"),
    print_row("Surface", "Water, earth, forest."),
    %io:format("Surface: *** ~n"),
    io:format("Core: *** ~n"),
    io:format("Ready for live: *** ~n"),
    io:format("Light time: "),
    io:format(float_to_list(?light_time(1500000))), % io:format("~f~n", [4.0]).
    io:format(" sec. ~n"),
    print_bottom().

%% [A * A - B || A <- [30,70,80], B <- [1,2,3], B rem 2 =:= 1].
list_planeths() ->
    [Planeth || Planeth <- [mercury, venus, earth, mars, jupiter]].
%    {mercury, [
%        {atmospher, [{dyoxen, 15}, {carbon, 25.3}]},
%        {surface, [{}]},
%        {core, [{hot}, {iron, 60}, {nikel, 20}]},
%        {light time, 1.2345}, % from Sun
%    ]}
    % todo load from file from nasa, esa etc.

%%%
%%% Module helpers
%%%
print_title(Title) ->
    io:format(?LILAC),
    io:format("----------~n "),
    io:format("~p", [Title]),
    io:format("~n----------~n"),
    io:format(?END_COLOR).

print_row(Label, Value) ->
    print_label(Label, ?WHITE),
    print_value(Value, ?YELLOW).

print_label(Label, Color) -> 
    io:format(Color),
    io:format(Label),
    io:format(": "),
    io:format(?END_COLOR).

print_value(Value, Color) ->
    io:format(Color),
    io:format(Value),
    io:format(?END_COLOR),
    io:format("~n").
    
print_bottom() ->
    io:format("~n##########~n").
