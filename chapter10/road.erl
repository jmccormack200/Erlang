-module(road).
-compile(export_all).

main()->
	File = "road.txt",
	{ok, Bin} = file:read_file(File),
	optimal_path(parse_map(Bin)).

parse_map(Bin) when is_binary(Bin) ->
	parse_map(binary_to_list(Bin));
parse_map(Str) when is_list(Str) ->
	[list_to_integer(X) || X <- string:tokens(Str,"\r\n\t")].

shortest_step({A,B,X}, {{DistA, PathA}, {DistB, PathB}}) ->
	OptA1 = {DistA + A, [{a,A}|PathA]},
	OptA2 = {DistA + B + X, [{x,X}, {b,B}|PathB]},
	OptB1 = {DistB + B, [{b,B}|PathB]},
	OptB2 = {DistA + A + X, [{x,X},{a,A}|PathA]},
	{erlang:min(OptA1, OptA2), erlang:min(OptB1, OptB2)}.

optimal_path(Map) ->
	{A, B} = lists:foldl(fun shortest_step/2, {{0,[]},{0,[]}}, Map),
        {_Dist, Path} =  if hd(element(2,A)) =/= {x,0} -> A;
			 hd(element(2,B)) =/= {x,0} -> B
		      end,
	lists:reverse(Path).
