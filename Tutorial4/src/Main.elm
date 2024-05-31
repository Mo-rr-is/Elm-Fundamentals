module Main exposing (main)

import Browser
import Html exposing (text, div)
import String exposing (fromInt)

add a b = 
    a + b

init =
    {value = 99,
    name = "Morris"}

view model =
    div [] [text (fromInt model.value)]

update model =
    model

main =
    Browser.sandbox
        {
            init = init,
            view = view,
            update = update
        }