module Elements exposing (main)

import Element exposing (layout, text)
import Html exposing (Html)
import Style exposing (styleSheet)


main : Html msg
main =
    layout style content


style : StyleSheet class variation
style =
    Style.styleSheet []


content : Element () variation msg
content =
    text "Hello, World!"



{- refefine as css and html, use infered types -}
