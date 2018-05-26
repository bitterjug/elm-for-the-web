module Buttons exposing (main)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main : Html ()
main =
    div []
        [ button [ onClick () ] [ text "Inc" ]
        , button [ onClick () ] [ text "Dec" ]
        ]
