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
import Element.Attributes
    exposing
        ( padding
        , spacing
        )
import Html exposing (Html)
import Style
    exposing
        ( StyleSheet
        , style
        , styleSheet
        )
import Style.Font exposing (sansSerif, typeface)


main : Html msg
main =
    layout css html


html : Element Class variation msg
html =
    column Default
        [ spacing 10, padding 10 ]
        [ row Default
            [ spacing 10 ]
            [ button Action [ padding 10 ] (text "Inc")
            , button Action [ padding 10 ] (text "Dec")
            , button Action [ padding 10 ] (text "Reset")
            ]
        , text (toString 0)
        ]


type Class
    = Default
    | Action


css : StyleSheet Class variation
css =
    Style.styleSheet
        [ style Action [ typeface [ sansSerif ] ]
        ]
