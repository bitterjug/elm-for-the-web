module IncDecReset exposing (main)

import Html exposing (Html, beginnerProgram, button, div, program, text)
import Html.Events exposing (onClick)


main : Program Never Model Msg
main =
    beginnerProgram
        { model = 0
        , view = view
        , update = update
        }


type alias Model =
    Int


type Msg
    = Add Int
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Add n ->
            model + n

        Reset ->
            0


view : Model -> Html Msg
view n =
    div []
        [ button [ onClick (Add 1) ] [ text "Inc" ]
        , button [ onClick (Add -1) ] [ text "Dec" ]
        , button [ onClick Reset ] [ text "Reset" ]
        , text (toString n)
        ]
