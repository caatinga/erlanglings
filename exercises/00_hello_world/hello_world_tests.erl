-module(hello_world_tests).

-include_lib("eunit/include/eunit.hrl").

hello_test() ->
    ?assertEqual("Hello, World!", hello_world:hello()).
