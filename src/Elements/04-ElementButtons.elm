module Elements exposing (main)

import Element exposing (Element, button, column, layout, row, text)
import Html exposing (Html)
import Style exposing (StyleSheet, styleSheet)


main : Html msg
main =
    layout styles content


content : Element () variation msg
content =
    column ()
        []
        [ row ()
            []
            [ button () [] (text "Inc")
            , button () [] (text "Dec")
            , button () [] (text "Reset")
            ]
        , text (toString 0)
        ]


styles : StyleSheet class variation
styles =
    Style.styleSheet []
