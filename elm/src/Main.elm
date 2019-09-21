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
    | Home
    | Missions
    | Characters


init : Value -> Url -> Nav.Key -> ( Model, Cmd Msg )
init value url navKey =
    ( Home, Cmd.none )



--changeRouteTo (Route.fromUrl url) Redirect
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



-- changeRouteTo : Maybe Route -> Model -> ( Model, Cmd Msg )
-- changeRouteTo maybeRoute model =
--     case maybeRoute of
--         Nothing ->
--             ( NotFound, Cmd.none )
--         Just Route.Home ->
--             ( model, Route.replaceUrl )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
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
