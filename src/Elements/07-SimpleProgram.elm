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
import Html exposing (Html, beginnerProgram)
import Style
    exposing
        ( StyleSheet
        , style
        , styleSheet
        )
import Style.Font exposing (sansSerif, typeface)


{-
   At this point we need an explanation of TEA

-}


main : Program Never Int msg
main =
    beginnerProgram
        { model = 0
        , view = \model -> layout css html
        , update = \m n -> 0
        }


html : Element Class variation msg
html =
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


css : StyleSheet Class variation
css =
    Style.styleSheet
        [ style Action [ typeface [ sansSerif ] ]
        ]
