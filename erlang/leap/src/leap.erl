-module(leap).

-export([leap_year/1, test_version/0]).


leap_year(Year) when Year rem 4 =:= 0 ->
  true;

leap_year(Year) when Year rem 4 =:= 0 andalso Year rem 100 =/= 0 ->
   true;

leap_year(Year) when Year rem 400 =:= 0 ->
  true;



leap_year(Year) when Year rem 4 =:= 0 andalso Year rem 100 =:= 0 ->
  leap_year(400);

leap_year(Year) when Year rem 400 =/= 0  ->
  false;

leap_year(_) ->
    false.


test_version() -> 4.



