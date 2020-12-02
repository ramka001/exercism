defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do

    earth_seconds = (365.25 * 24 * 60 * 60)
    shared_value = (seconds / earth_seconds)

    earth_roundUp = shared_value |> roundUp
    mercury_roundUp = (shared_value / 0.2408467)  |> roundUp
    venus_roundUp =  (shared_value / 0.61519726) |> roundUp
    mars_roundUp = (shared_value / 1.8808158) |> roundUp
    jupiter_roundUp = (shared_value / 11.862615) |> roundUp
    saturn_roundUp = (shared_value / 29.447498) |> roundUp
    uranus_roundUp = (shared_value / 84.016846) |> roundUp
    neptune_roundUp = (shared_value / 164.79132) |> roundUp

    case planet do
      :earth -> earth_roundUp
      :mercury -> mercury_roundUp
      :venus -> venus_roundUp
      :mars ->  mars_roundUp
      :jupiter -> jupiter_roundUp
      :saturn -> saturn_roundUp
      :uranus -> uranus_roundUp
      :neptune -> neptune_roundUp
    end

  end

  defp roundUp(input) do
    input |> Float.round(2)
  end

end

