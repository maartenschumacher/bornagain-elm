module Styles exposing (stylesheet)

import Types exposing (..)
import Style exposing (..)
import Style.Border as Border
import Style.Font as Font


stylesheet : StyleSheet Styles variation
stylesheet =
    styleSheet
        [ style Title [ Font.size 80 ]
        , style Body [ Font.size 20 ]
        , style Button [ Border.all 1, Border.rounded 3 ]
        , style GridStyle [ Border.all 1 ]
        , style GridCell [ Border.all 1 ]
        , style None []
        ]
