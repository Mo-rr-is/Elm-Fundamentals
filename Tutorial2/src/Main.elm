module Main exposing (main)

import Browser
import Html exposing (text, div)

add a b = 
    a + b

init =
    {value = 0}

view model =
    div [] [text "My Second Elm Program"]

update model =
    model

main =
    Browser.sandbox
        {
            init = init,
            view = view,
            update = update
        }