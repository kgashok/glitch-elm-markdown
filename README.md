Hello from Elm!
=================

This is a simple hello-world app, with an Elm frontend hosted by a 
simple Express.js backend. 

The Elm tools are installed as an NPM dependency, and available from 
the command line. `npm start` calls `elm make` to compile `Main.elm` 
as `public/elm.js`, which is then used in the body of `index.html`.

To make stuff, just edit `Main.elm` in the root directory. The compile
times are a bit long so it can take a minute for changes to go live.

To add new Elm dependencies, you can use `elm install` from the console.

`elm repl` also works, but seems a bit slow. `elm reactor` doesn't work,
as the port doesn't seem to be redirected, but this is probably for the best,
as otherwise this would give a public tree view to the whole project!

*WARNING*: do not update the `elm` npm package with the Glitch tool! 
It defaults to a defunct version "2.0.0" that is actually quite old and will not work properly. 