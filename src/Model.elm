module Model exposing (..)

import Types exposing (..)
import Commands exposing (loadData)


init : ( Model, Cmd Msg )
init =
    ( { countries = [], births = [] }, loadData )


genderDescription : Gender -> String
genderDescription gender =
    case gender of
        Male ->
            "boy"

        Female ->
            "girl"
