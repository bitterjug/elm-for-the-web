module Program exposing (main)

import Html exposing (Html, button, div, program, text)
import Html.Events exposing (onClick)


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


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )


type Msg
    = Add Int
    | Reset


update : Msg -> Model -> ( Model, Cmd Msg )
update msg n =
    case msg of
        Add m ->
            ( m + n, Cmd.none )

        Reset ->
            ( 0, Cmd.none )


view : Model -> Html Msg
view n =
    div []
        [ button [ onClick (Add 1) ] [ text "Inc" ]
        , button [ onClick (Add -1) ] [ text "Dec" ]
        , button [ onClick Reset ] [ text "Reset" ]
        , text (toString n)
        ]
