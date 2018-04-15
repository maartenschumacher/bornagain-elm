module Country exposing (decoder)

import Json.Decode as D
import Http exposing (decodeUri)
import Types exposing (..)


decoder : D.Decoder Country
decoder =
    D.map3 Country
        (D.field "name" D.string)
        (D.field "pop" popDecoder)
        (D.field "names" namesDecoder)



-- because Elm ints are 32 bit


popDecoder : D.Decoder Int
popDecoder =
    D.map (\x -> x // 10) D.int


namesDecoder : D.Decoder Names
namesDecoder =
    D.map2 Names
        (D.field "girls" (D.map (List.filterMap decodeUri) (D.list D.string)))
        (D.field "boys" (D.map (List.filterMap decodeUri) (D.list D.string)))
