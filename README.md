# Elm-Fundamentals
This is a repo to learn the fundamentals of Elm Programming Language.

## Tutorial 1
### Creating a json file
```
    > elm init
```
 - The **elm.json** file decribes your project.
 - It lists all of the packages you depend on, so it will say the particular version of *elm/core* and *elm/html* that you are using.
 - It makes builds reproducible.
 - The **src/** is where all of your Elm files live.
 - Always start with a file called ```src/Main.elm```.
### Compiling your project
```
    > elm reactor
```
  - You can go to *http://localhost:8000* and browse through all the files in your project.
  - If you navigate to the .elm files, it will compile them for you.

You can also navigate to the src folder and run the command *elm make Main.elm*. After that you can run the *elm reactor* command.
```
    > elm make Main.elm
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