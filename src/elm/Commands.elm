module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline as Pipeline exposing (decode)
import Models exposing (Venue, Coords)
import Msgs exposing (Msg(..))

fetchVenues : Cmd Msg
fetchVenues =
  Http.get fetchVenuesUrl venuesDecoder
  |> Http.send FetchAllDone

fetchVenuesUrl : String
fetchVenuesUrl =
  "/static/venues.json"


venuesDecoder : Decode.Decoder (List Venue)
venuesDecoder =
  Decode.list venueDecoder


venueDecoder : Decode.Decoder Venue
venueDecoder =
  decode Venue
    |> Pipeline.required "name" Decode.string
    |> Pipeline.required "neighborhood" Decode.string
    |> Pipeline.optional "visited" Decode.bool False
    |> Pipeline.required "offer" Decode.string
    |> Pipeline.required "id" Decode.int
    |> Pipeline.required "phone" Decode.string
    |> Pipeline.required "site" Decode.string
    |> Pipeline.required "address1" Decode.string
    |> Pipeline.required "coords" coordsDecoder

coordsDecoder : Decode.Decoder Coords
coordsDecoder =
  decode Coords
    |> Pipeline.required "lat" Decode.float
    |> Pipeline.required "lng" Decode.float