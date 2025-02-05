-module(basic_types_tests).

-include_lib("eunit/include/eunit.hrl").

get_integer_test() ->
    ?assertEqual(42, basic_types:get_integer()).

get_atom_test() ->
    ?assertEqual(erlang, basic_types:get_atom()).

get_string_test() ->
    ?assertEqual("Hello, Erlang!", basic_types:get_string()).

get_list_test() ->
    ?assertEqual([1, 2, 3], basic_types:get_list()).

get_tuple_test() ->
    ?assertEqual({ok, 42}, basic_types:get_tuple()).
