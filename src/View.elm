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
            ]


body : Birth -> Element Styles variation msg
body birth =
    paragraph Body
        []
        [ text "Congratulations! You've been born again as a "
        , el Bold [] (text (genderDescription birth.gender))
        , text " from "
        , el Bold [] (text birth.country)
        , text " named "
        , el Bold [] (text birth.name)
        ]
