# Elm-Fundamentals
This is a repo to learn the fundamentals of Elm Programming Language.

## Tutorial 1 - First Interaction with Elm
### Creating a json file
```elm
    elm init
```
 - The **elm.json** file decribes your project.
 - It lists all of the packages you depend on, so it will say the particular version of *elm/core* and *elm/html* that you are using.
 - It makes builds reproducible.
 - The **src/** is where all of your Elm files live.
 - Always start with a file called ```src/Main.elm```.
### Compiling your project
```elm
    elm reactor
```
  - You can go to *http://localhost:8000* and browse through all the files in your project.
  - If you navigate to the .elm files, it will compile them for you.

You can also navigate to the src folder and run the command *elm make Main.elm*. After that you can run the *elm reactor* command.
```elm
    elm make Main.elm
```
So the first program is Hello World! To create this program simply navigate to the src folder and create a new file named **Main.elm**. Inside the Main.elm file, copy the follwing code.
```elm
module Main exposing (main)

import Html exposing (text)

main = 
    text "Hello World!"
```
- So we have created a function called main that contains datatype text. And the text is "Hello World!".
- You can then go ahead and compile it as discussed above.

## Tutorial 2 - View model in a HTML div and generate js code
In this tutorial, we create a program that creates a HTML Div and add text to it. We also create a function to add two parameters.\
The code is as shown below.
```elm
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
```
We can also generate a JavaScript code and save it in .js file.
```elm
    elm make Main.elm --output output.js
```

## Tutorial 3 - How model, view and update works
Lets explain the following code line by line.
```elm
module Main exposing (..)                   -- Line 1

import Browser                              -- Line 2
import Html exposing (text, div)            -- Line 3

-- Function to add two numbers
add a b =                                   -- Line 4
    a + b                                   -- Line 5

init =                                      -- Line 6
    {value = 0}                             -- Line 7

view model =                                -- Line 8
    div [] [text "How Elm Works"]           -- Line 9

update model =                              -- Line 10
    model                                   -- Line 11

main =                                      -- Line 12
    Browser.sandbox                         -- Line 13
        {                                   -- Line 14
            init = init,                    -- Line 15
            view = view,                    -- Line 16
            update = update                 -- Line 17
        }                                   -- Line 18
```
1. **Line 1**
    - This is a module declaration containing the name of the module and exposing indicates that all the functions in this module can be used by other modules.
2. **Line 2** and **3**
    - Imports modules which contains UI components (Browser and Html). They are necessary for rendering some content on a webpage.
3. **Line 4** and **5**
    - Comments in an elm begins with --.
    - Specify function add and specify two parameters a and b.
    - It adds the parameters and returns the sum.
4. **Line 6** and **7**
    - Sets initial value of the model.
5. **Line 8** and **9**
    - Takes the model as its first parameter. It returns a div tag which takes two parameters. The first is the list of attributes while the second is list of contents that go inside the div.
6. **Line 10** and **11**
    - The update function also takes the model as its first parameter. It should return the updated value of the model.
7. **Line 12 to 18**
    - This is the main method. It calls the Browser.sandbox() which takes a record having three properties:\
*init* - the initial model.\
*view* - function that renders the model on the screen.\
*update* - function that update the model when something changes.
### Rendering the Model
In the above example, the text that displays on the screen is a hardcoded text passed in to the view.\
But since the view takes the model as a parameter hence we would like to display the model rather than a hardcoded value.\
To achieve that we would need to replace the text with a ```model.value```.\
And since ```model.value``` is a number whereas text attribute of the dic tag expects a string, we would use **fromInt()** function.
```elm
    view model = 
        div [] [text (fromInt model.value)]
```
We would therefore need to import the fromInt() function from String module.
```elm
    import String exposing (fromInt)
```
## Tutorial 4 - Rendering the model from view
The next step is to apply what we have discussed in the Rendering a model section above.
```elm
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
```
## Tutorial 5 - Working with Button and TextBoxes
In this case you have to import the necessary functions from Html module. These functions include button and input functions.\
You can also add add a **ClickHandler** to the button by importing onClick() function from Html.Events and then add the onClick parameter to the button function. This is as shown below.\
**Step 1** - Import onClick() from Html.Events
```elm
    import Html.Events exposing (onClick)
```
**Step 2** - Add onClick as first parameter to the button.
```elm
    button [onClick Add] [text "Add"]
```
**Step 3** - Create a message. This is anything that can be done and affects the model.
```elm
    type Messages = 
        Add
```
**Step 4** - Update the model using the update function.
```elm
    update msg model = 
        case msg of
            Add ->
                model
```
**Step 5** - Logging messages
- Import Debug
```elm
    import Debug exposing (log)
```
- In the update function, write a code to log some messages enclosed in a ```let... in``` block.
```elm
    update msg model = 
        let
            logmessage = log "here" "Button Clicked"
            logmessage2 = log "model" model
        in
        case msg of
            Add ->
                model
```