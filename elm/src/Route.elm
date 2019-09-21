module Route exposing (Route(..), fromUrl, href, replaceUrl)

import Browser.Navigation as Nav
import Html exposing (Attribute)
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Parser as Parser exposing (Parser, oneOf, s)


type Route
    = Home
    | Missions
    | Characters


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home Parser.top
        , Parser.map Missions (s "missions")
        , Parser.map Characters (s "characters")
        ]



-- PUBLIC HELPERS


href : Route -> Attribute msg
href route =
    Attr.href (routeToString route)


replaceUrl : Nav.Key -> Route -> Cmd msg
replaceUrl navKey route =
    Nav.replaceUrl navKey (routeToString route)


fromUrl : Url -> Maybe Route
fromUrl url =
    Parser.parse parser url



-- INTERNAL


routeToString : Route -> String
routeToString route =
    let
        pieces =
            case route of
                Home ->
                    []

                Missions ->
                    [ "missions" ]

                Characters ->
                    [ "characters" ]
    in
    "/" ++ String.join "/" pieces
