module Types exposing (..)

import Http


type alias Model =
    { countries : List Country
    , births : List Birth
    }


type alias Country =
    { name : String
    , pop : Int
    , names : Names
    }


type alias Names =
    { girls : List String
    , boys : List String
    }


type alias Birth =
    { country : String
    , gender : Gender
    , name : String
    }


type Gender
    = Male
    | Female


type Msg
    = BirthMe
    | LoadData (Result Http.Error (List Country))
    | RandomNumber Int


type Styles
    = Title
    | Body
    | Bold
    | Button
    | None
