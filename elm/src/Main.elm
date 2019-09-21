module Main exposing (..)

import Browser exposing (Document)
import Browser.Navigation as Nav
import Html exposing (..)
import Json.Decode exposing (Value)
import Route exposing (Route, fromUrl)
import Url exposing (Url)



-- MODEL


type Model
    = Redirect Nav.Key
    | NotFound Nav.Key
    | Home Nav.Key
    | Missions Nav.Key
    | Characters Nav.Key


init : Value -> Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url navKey =
    changeRouteTo (Route.fromUrl url) (Redirect navKey)



-- VIEW


view : Model -> Document Msg
view model =
    { title = "Band of Blades Generator"
    , body = [ text "test" ]
    }



-- UPDATE


type Msg
    = ChangedUrl Url
    | ClickedLink Browser.UrlRequest


changeRouteTo : Maybe Route -> Model -> ( Model, Cmd Msg )
changeRouteTo maybeRoute model =
    let
        navKey =
            toNavKey model
    in
    case maybeRoute of
        Nothing ->
            ( NotFound navKey, Cmd.none )

        Just Route.Home ->
            ( Home navKey, Cmd.none )

        Just Route.Missions ->
            ( Missions navKey, Cmd.none )

        Just Route.Characters ->
            ( Characters navKey, Cmd.none )


toNavKey : Model -> Nav.Key
toNavKey model =
    case model of
        Redirect navKey ->
            navKey

        NotFound navKey ->
            navKey

        Home navKey ->
            navKey

        Missions navKey ->
            navKey

        Characters navKey ->
            navKey


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


main : Program Value Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = ChangedUrl
        , onUrlRequest = ClickedLink
        }
