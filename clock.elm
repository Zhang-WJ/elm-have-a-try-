import Html exposing (Html, button)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, second)
import Html.Events exposing (onClick)

main = 
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


--MODEL

type alias Model = Time

init : (Model, Cmd Msg)
init =
    (0, Cmd.none)

--UPDATE

type Msg
    = Tick Time

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Tick newtime ->
            (newtime, Cmd.none)
       

--SUNSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model = 
    Time.every second Tick

--VIEW

view : Model -> Html Msg
view model = 
    let 
        angle = 
            turns (Time.inMinutes model)

        handX =
            toString (50 + 40 * cos angle)

        handY = 
            toString (50 + 40 * sin angle)
    in 
        svg [ viewBox "0 0 100 100", width "300px" ] 
            [ circle [cx "50", cy "50", r "45", fill "#0B&9CE"] []
            , line [ x1 "50", y1 "50", x2 handX, y2 handY, stroke "#023963" ] []          
            --, button [] [ onClick  ]
            ]
