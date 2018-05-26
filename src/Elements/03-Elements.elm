module Elements exposing (main)

import Element exposing (layout, text)
import Html exposing (Html)
import Style exposing (styleSheet)


main : Html msg
main =
    layout
        (Style.styleSheet [])
        (text "Hello, World!")



{- refefine as css and html, use infered types -}
