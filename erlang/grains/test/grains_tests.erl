-module(grains_tests).

%%-include_lib("erl_exercism/include/exercism.hrl").
-include_lib("eunit/include/eunit.hrl").

-define(assertGrains(Grains, Square), ?assertMatch(Grains, grains:square(Square))).

square_1_test() ->
  ?assertGrains(1, 1).

square_2_test() ->
  ?assertGrains(2, 2).

square_3_test() ->
  ?assertGrains(4, 3).

square_4_test() ->
  ?assertGrains(8, 4).

square_16_test() ->
  ?assertGrains(32768, 16).

square_32_test() ->
  ?assertGrains(2147483648, 32).

square_64_test() ->
  ?assertGrains(9223372036854775808, 64).

total_grains_test() ->
  ?assertMatch(18446744073709551615, grains:total()).

version_test() ->
  ?assertMatch(1, grains:test_version()).
