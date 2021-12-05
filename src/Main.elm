module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Attributes as A
import Http
import Markdown


type alias Model =
    { markdown : Maybe String }


type Msg
    = GetSlide
    | RcvSlide (Result Http.Error String)


getSlide : Cmd Msg
getSlide =
    Http.send RcvSlide (Http.getString "text.md")


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Nothing
    , getSlide
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetSlide ->
            ( model
            , getSlide
            )

        RcvSlide (Ok resp) ->
            ( { model | markdown = Just resp }
            , Cmd.none
            )

        _ ->
            ( model
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    case .markdown model of
        Just md ->
            Markdown.toHtml [ A.class "slide" ] md

        Nothing ->
            Html.text "No slides found"


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
