module WebData exposing (main)

import Html
    exposing
        ( Html
        , button
        , div
        , program
        , text
        )
import Html.Events exposing (onClick)
import Http exposing (Error, getString, send)
import Json.Decode as Decode exposing (Decoder)
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
    WebData (Result String String)


init : ( Model, Cmd Msg )
init =
    ( RemoteData.NotAsked
    , Cmd.none
    )


type Msg
    = Request
    | Response (WebData String)


decode : Decoder String
decode =
    Decode.field "text" Decode.string


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Request ->
            ( model
            , RemoteData.sendRequest (getString "http://localhost:8000/api/test.json")
                |> Cmd.map Response
            )

        Response result ->
            ( result
                |> RemoteData.map (Decode.decodeString decode)
            , Cmd.none
            )


view : Model -> Html Int
view model =
    div []
        [ button [ onClick Request ] [ text "Request" ]
        , text (toString model)
        ]
