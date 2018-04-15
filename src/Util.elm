module Util exposing (pickCountry, pickName)

import Types exposing (..)
import Maybe


pickCountry : Int -> List Country -> Maybe Country
pickCountry =
    iterate 0


iterate : Int -> Int -> List Country -> Maybe Country
iterate accumulated target countries =
    let
        ( country, tailCountries ) =
            ( List.head countries, List.tail countries )

        inRange =
            Maybe.map (\c -> target <= accumulated + c.pop) country
    in
        case ( country, inRange, tailCountries ) of
            ( _, Just True, _ ) ->
                country

            ( Just c, Just False, Just remainder ) ->
                iterate (accumulated + c.pop) target remainder

            _ ->
                Nothing


pickName : Int -> Gender -> Country -> String
pickName randomNumber gender country =
    let
        ( names, defaultName ) =
            case gender of
                Male ->
                    ( country.names.boys, "Bob" )

                Female ->
                    ( country.names.girls, "Alice" )

        index =
            rem randomNumber (List.length names)
    in
        Maybe.withDefault defaultName (atIndex index names)


atIndex : Int -> List a -> Maybe a
atIndex index =
    List.drop index >> List.head
