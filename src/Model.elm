module Model exposing (..)

import Types exposing (..)
import Commands exposing (loadData)


init : ( Model, Cmd Msg )
init =
    ( { countries = [], birth = Nothing }, loadData )


genderDescription : Gender -> String
genderDescription gender =
    case gender of
        Male ->
            "boy"

        Female ->
            "girl"
