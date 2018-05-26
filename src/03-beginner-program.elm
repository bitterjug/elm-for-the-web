module BeginnerProgram exposing (main)

import Html exposing (Html, beginnerProgram, button, div, text)
import Html.Events exposing (onClick)


main : Program Never Int Int
main =
    beginnerProgram
        { model = 0
        , view =
            \n ->
                div []
                    [ button [ onClick 1 ] [ text "Inc" ]
                    , button [ onClick -1 ] [ text "Dec" ]
                    , text (toString n)
                    ]
        , update = (+)
        }
