-module(grains).

-export([square/1, total/0, test_version/0]).

square(N) ->
  trunc(math:pow(2,N-1)).

total() ->
  lists:foldl(fun (SquareNum,Total) -> square(SquareNum) + Total end, 0 , lists:seq(1,64)).

test_version() -> 1.
