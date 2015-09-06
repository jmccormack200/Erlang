-module(helloworldntimes).
-export([main/0]).

print_n_times(1,P)->
    io:write(P);
print_n_times(N,P)->
    io:write(P),
    print_n_times(N-1,P).

main() ->
	 {ok, [A]} = io:fread("", "~d"),
     print_n_times(A,"Hello World").

