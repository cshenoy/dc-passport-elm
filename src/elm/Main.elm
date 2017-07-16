module Main exposing (..)

import Http
import Html exposing (..)
import Html.Attributes exposing (..)

import Commands exposing (fetchVenues)
import Models exposing (..)
import Msgs exposing (Msg(..))
import Updates exposing (update)
-- component import example
--import Components.Restaurant exposing ( restaurant )


init : ( Model, Cmd Msg )
init =
    ( initialModel, fetchVenues )

-- APP
main : Program Never Model Msg
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = \_ -> Sub.none
    }

-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib
view : Model -> Html Msg
view model =
  div [ class "container", style [("margin-top", "30px"), ( "text-align", "center" )] ][    -- inline CSS (literal)
    div [ class "row" ][
      div [ class "col-xs-12" ][
        div [ class "jumbotron" ][
          viewPlaces model.venues
        ]
      ]
    ]
  ]

viewPlaces : List Venue -> Html Msg
viewPlaces venues = 
  section
    [ class "main" ]
    [ ul [] (List.map viewSinglePlace venues)
    ]

viewSinglePlace : Venue -> Html Msg
viewSinglePlace place =
  li []
    [ p [] [ text ( toString place.name ) ]
    ]


-- CSS STYLES
styles : { img : List ( String, String ) }
styles =
  {
    img =
      [ ( "width", "33%" )
      , ( "border", "4px solid #337AB7")
      ]
  }
