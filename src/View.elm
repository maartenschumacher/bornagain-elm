module View exposing (view)

import Html
import Types exposing (..)
import Styles exposing (stylesheet)
import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Events exposing (onClick)
import Model exposing (genderDescription)


view : Model -> Html.Html Msg
view model =
    Element.layout stylesheet <|
        column None
            [ center, width fill, spacing 30, padding 15 ]
            [ el Title [] (text "born again")
            , whenJust (List.head model.births) body
            , button Button [ onClick BirthMe, padding 7 ] (text "Click here to be born again")
            , whenJust
                (if List.length model.births > 1 then
                    List.tail model.births
                 else
                    Nothing
                )
                pastLives
            ]


body : Birth -> Element Styles variation msg
body birth =
    paragraph Body
        []
        [ text "Congratulations! You've been born again as a "
        , bold (genderDescription birth.gender)
        , text " from "
        , bold birth.country
        , text " named "
        , bold birth.name
        ]


pastLives : List Birth -> Element Styles variation msg
pastLives births =
    let
        cell attributes caption =
            el GridCell (padding 3 :: attributes) (text caption)

        header caption =
            el GridCell [ padding 3 ] (bold caption)

        toColumn attributes accessor =
            List.map (accessor >> (cell attributes)) births

        ( genders, countries, names ) =
            ( toColumn [ width <| px 100 ] (.gender >> genderDescription)
            , toColumn [ minWidth <| px 200 ] .country
            , toColumn [ minWidth <| px 200 ] .name
            )
    in
        column None
            [ spacing 10 ]
            [ el None [ center ] (text "PAST LIVES")
            , table GridStyle
                [ spacing 3, padding 3 ]
                [ header "Gender" :: genders, header "Country" :: countries, header "Name" :: names ]
            ]
