module Main exposing (main)

import Browser
import Html exposing (text, div, button, input)
import String exposing (fromInt)

import Html.Events exposing (onClick)
import Debug exposing (log)

add a b = 
    a + b

type Message = 
    Add

init =
    {value = 99,
    name = "Morris"}

view model =
    div [] [
        text (fromInt model.value),
        div [] [],
        input [] [],
        button [onClick Add] [text "Add"]
        ]

update msg model =
    let
        logmessage = log "here" "Button Clicked"
        logmessage2 = log "model" model
    in
    case msg of 
        Add ->
            model

main =
    Browser.sandbox
        {
            init = init,
            view = view,
            update = update
        }