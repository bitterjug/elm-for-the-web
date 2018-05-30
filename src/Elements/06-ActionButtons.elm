module Elements exposing (main)

import Element exposing (Element, button, column, layout, row, text)
import Element.Attributes exposing (padding, spacing)
import Html exposing (Html)
import Style exposing (StyleSheet, style, styleSheet)
import Style.Font exposing (sansSerif, typeface)


main : Html msg
main =
    layout style content


content : Element Class variation msg
content =
    column Default
        [ spacing 10, padding 10 ]
        [ row Default
            [ spacing 10 ]
            [ actionButton "Inc"
            , actionButton "Reset"
            , actionButton "Reset"
            ]
        , text (toString 0)
        ]


actionButton : String -> Element Class variation msg
actionButton label =
    button Action [ padding 10 ] (text label)


type Class
    = Default
    | Action


style : StyleSheet Class variation
style =
    Style.styleSheet
        [ style Action [ typeface [ sansSerif ] ]
        ]
