module WebData exposing (main)

-- send the request, case on the result

import Html exposing (Html, button, div, program, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Http exposing (Error, getString, send)
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
            ( RemoteData.Loading
            , send Response (getString "http://localhost:8000/api/test.json")
            )

        Response (Ok value) ->
            ( RemoteData.Success value
            , Cmd.none
            )

        Response (Err error) ->
            ( RemoteData.Failure error
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Request ] [ text "Request" ]
        , viewModel model
        ]


viewModel : Model -> Html Msg
viewModel webdataString =
    case webdataString of
        RemoteData.NotAsked ->
            div [] []

        RemoteData.Loading ->
            div [ style [ ( "background", "yellow" ) ] ]
                [ text "Loading ..." ]

        RemoteData.Failure err ->
            div [ style [ ( "color", "red" ) ] ]
                [ text (toString err) ]

        RemoteData.Success value ->
            div [ style [ ( "color", "grey" ) ] ]
                [ text value ]
