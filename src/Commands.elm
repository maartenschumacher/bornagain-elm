module Commands exposing (..)

import Http
import Random
import Json.Decode as Decode
import Types exposing (..)
import Country


loadData : Cmd Msg
loadData =
    Http.send LoadData <| Http.get "./data/countries.json" (Decode.list Country.decoder)


getRandomNumber : List Country -> Cmd Msg
getRandomNumber countries =
    Random.generate RandomNumber <| Random.int 0 (totalPop countries)


totalPop : List Country -> Int
totalPop =
    List.sum << List.map .pop
