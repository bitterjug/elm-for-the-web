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
    WebData String


init : ( Model, Cmd Msg )
init =
    ( RemoteData.NotAsked
    , Cmd.none
    )


type Msg
    = Request
    | Response (Result Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Request ->
            ( model
            , Cmd.none
            )

        Response result ->
            ( model
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Request ] [ text "Request" ]
        , text (toString model)
        ]
