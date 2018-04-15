module Styles exposing (stylesheet)

import Types exposing (..)
import Color
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font


stylesheet : StyleSheet Styles variation
stylesheet =
    styleSheet
        [ style Title
            [ Color.text Color.black
            , Color.background Color.white
            , Font.size 80
            ]
        , style Body
            [ Color.text Color.black
            , Color.background Color.white
            , Font.size 20
            ]
        , style Bold [ Font.size 30 ]
        , style Button [ Border.all 1, Border.rounded 3 ]
        , style None []
        ]
