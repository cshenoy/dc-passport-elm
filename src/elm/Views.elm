module Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Models exposing (..)
import Msgs exposing (Msg(..))

-- VIEW

gmap : List (Attribute a) -> List (Html a) -> Html a
gmap =
  node "maps"

-- CSS can be applied via class names or inline style attrib
view : Model -> Html Msg
view model =
  div [ class "app" ]
    [ div [ class "mask" ]
      [ div [ class "leftside" ]
        [ div [ class "col1" ]
          [ div [ class "map-wrapper" ]
            [ div [ class "map" ]
              [ gmap [ mapStyles ] []]
            ]
          ]
        , div [ class "col2" ]
          [ div [ class "list-container" ]
            [ div [ class "list "]
              [ viewPlaces model.venues ]
            ]
          ]
        ]
      ]
    ]

viewPlaces : List Venue -> Html Msg
viewPlaces venues =
  div [ class "list-item-container" ]
    (List.indexedMap viewSinglePlace venues)

viewSinglePlace : Int -> Venue -> Html Msg
viewSinglePlace index place =
  div [ class "list-item", id ( "venue" ++ (toString place.id ) ) ]
    [ div [ class "list-item-content" ]
      [ h4 [] [ text ( place.name ) ]
      , p [] [ text (place.neighborhood) ]
      , p [] [ text ( place.phone ) ]
      ]
    ]

-- CSS STYLES

mapStyles : Attribute msg
mapStyles =
  style
    [ ( "display", "block" )
    , ( "left", "0px" )
    , ( "right", "0px" )
    , ( "bottom", "0px" )
    , ( "top", "0px" )
    , ( "position", "absolute" )
    ]