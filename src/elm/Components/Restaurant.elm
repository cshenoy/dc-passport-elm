module Components.Restaurant exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String

-- restaurant component
restaurant : Int -> Html a
restaurant model =
  div
    [ class "h1" ]
    [ text ( "Hello, Elm" ++ ( "!" |> String.repeat model ) ) ]
