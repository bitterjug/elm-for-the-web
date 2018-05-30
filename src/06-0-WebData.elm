module WebData exposing (main)

import Html exposing (Html, button, div, program, text)
import Html.Events exposing (onClick)
import Http exposing (Error, getString)
import RemoteData exposing (WebData)


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = \model -> Sub.none
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
