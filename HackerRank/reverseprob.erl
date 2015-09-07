% Enter your code here. Read input from STDIN. Print output to STDOUT
% Your class should be named solution

-module(reverseprob).
-export([main/0]).

reverse_list() ->
    {ok, [Number1, Number2]} = io:fread("", "~d~d"),
    reverse_list(Number2,[Number1]).

reverse_list(Number2,List) ->
    New_List = [Number2] ++ List,
    try 
       {ok,[New_String]} = io:fread("", "~s"),
       {New_Number, _} = string:to_integer(New_String),
       reverse_list(New_Number,New_List)
    catch
        _:Exception -> print_list(New_List)
    end.


print_list([]) ->
    ok;

print_list([H|T]) ->
    io:format("~p~n", [H]),
    print_list(T).




main() ->
        
        reverse_list().
