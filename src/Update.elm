module Update exposing (update)

import Types exposing (..)
import Commands exposing (getRandomNumber)
import Util exposing (pickCountry, pickName)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LoadData (Ok countries) ->
            ( { model | countries = countries }, Cmd.none )

        BirthMe ->
            ( model, getRandomNumber model.countries )

        RandomNumber number ->
            ( { model | births = addBirth number model }, Cmd.none )

        _ ->
            ( model, Cmd.none )


addBirth : Int -> Model -> List Birth
addBirth number model =
    let
        birth =
            toBirth model.countries number
    in
        case birth of
            Just b ->
                b :: model.births

            Nothing ->
                model.births


toBirth : List Country -> Int -> Maybe Birth
toBirth countries randomNumber =
    let
        country =
            pickCountry randomNumber countries

        isEven number =
            rem number 2 == 0

        gender =
            if isEven randomNumber then
                Female
            else
                Male

        name =
            Maybe.map (pickName randomNumber gender) country
    in
        Maybe.map2 (\c n -> { country = c.name, gender = gender, name = n }) country name
