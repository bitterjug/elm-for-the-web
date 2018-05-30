module Elements exposing (main)

import Element exposing (Element, button, column, layout, row, text)
import Html exposing (Html)
import Style exposing (StyleSheet, styleSheet)


main : Html msg
main =
    layout styles content


styles : StyleSheet class variation
styles =
    Style.styleSheet []


content : Element () variation msg
content =
    text "Hello, World!"



{- refefine as css and html, use infered types -}
