module Elements exposing (main)

import Element
    exposing
        ( Element
        , button
        , column
        , layout
        , row
        , text
        )
import Html exposing (Html)
import Style exposing (StyleSheet, styleSheet)


main : Html msg
main =
    layout css html


html : Element () variation msg
html =
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


css : StyleSheet class variation
css =
    Style.styleSheet []
