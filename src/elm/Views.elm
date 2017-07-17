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
  div
    [ class "container"
    , style
      [("margin-top", "30px"), ( "text-align", "center" )] 
    ]
    [ div []
      [ gmap [ mapStyles ] []]
    , div [ class "row" ]
      [ div [ class "col-xs-12" ]
        [ div [ class "jumbotron" ]
          [ viewPlaces model.venues ]
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
    [ p [] [ text ( toString place.name ), text ( toString place.coords.lat ) ]
    ]

-- CSS STYLES

mapStyles : Attribute msg
mapStyles =
    style
        [ ( "display", "block" )
        , ( "height", "500px" )
        , ( "width", "800px" )
        ]
        
--styles : { img : List ( String, String ) }
--styles =
--  {
--    img =
--      [ ( "width", "33%" )
--      , ( "border", "4px solid #337AB7")
--      ]
--  }
