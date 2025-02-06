-module(pattern_matching_tests).

-include_lib("eunit/include/eunit.hrl").

match_tuple_test() ->
    ?assertEqual(3, pattern_matching:match_tuple({1, 2})).

match_list_test() ->
    ?assertEqual(1, pattern_matching:match_list([1, 2, 3])).

match_map_test() ->
    ?assertEqual(42, #{key => 42}).
