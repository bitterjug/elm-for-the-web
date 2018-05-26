module Buttons exposing (main)

import Html
    exposing
        ( Html
        , button
        , div
        , text
        )
import Html.Events exposing (onClick)


main : Html ()
main =
    button [ onClick () ] [ text "Inc" ]
