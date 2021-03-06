% Enter your code here. Read input from STDIN. Print output to STDOUT
% Your class should be named solution

-module(listed).
-export([main/0]).

print_again(Repeat,Number) ->
    print_again(Repeat, Number, Repeat).

print_again(0,_,Repeat) ->
    try 
       {ok,[New_String]} = io:fread("", "~s"),
       {New_Number, _} = string:to_integer(New_String),
       print_again(Repeat,New_Number,Repeat)
    catch
        _:Exception -> ok
    end;


print_again(Iteration,Number,Repeat) when Number >= 1, Number =< 100 ->
    io:format("~p~n",[Number]),
    print_again(Iteration - 1, Number, Repeat);

print_again(_,_,_) ->
    false.

main() ->
        {ok, [Repeat, Number]} = io:fread("", "~d~d"),
        print_again(Repeat,Number).

