-module(cb_tutorial_greeting_controller, [Req]).
-compile(export_all).

hello('GET', [])->
	{output, "Hello, World!!!"}.

hello2('GET', [])->
	{json, [{greeting, "Hello, world!"}]}.

hello3('GET', [])->
	{ok, [{greeting, "Hello, world!"}]}.
