# Elm for the web


## 1. Hello World

It's for the web: We need a way to affect the DOM:

Html gives us a type for DOM nodes:

```elm
type alias Html msg =
    Node msg
```

And functions to create them:

```elm
div : List (Attribute msg) -> List (Html msg) -> Html msg

text : String -> Html msg
```


## 2. Render a buton

- From Hello World to two buttons
- Use unit for msg

```elm
button : List (Attribute msg) -> List (Html msg) -> Html msg
```


## 3. But it doesn't do anything

Elm can render `Html`, `Svg` or a `Program`:

``` elm
type Program flags model msg
```

- `model`: The entire state of your app
- `msg`: messages from the runtime to your app
- `flags`: data passed to your app on startup

TODO: insert diagram of app/run-time

We can use `Html.beginnerProgram`:

```elm
beginnerProgram
    : { model : model
      , view : model -> Html msg
      , update : msg -> model -> model
      }
    -> Program Never model msg
```

And we need:
- an initial model: `0 :Int`
- `view` that renders a model as Html that might generate a (Int) message
- `update` that combines a (Int) message with a (Int) model to give a new (Int) model

```elm
onClick : msg -> Attribute msg
```


## 4. Inc Dec or Reset

Use a custom message type:

```elm
type Msg
    = Add Int
    | Reset
```

Define an alias for Model

```elm
type alias Model = Int
```

## 6. Program with Commands

TODO: explain how commands invoke effects

Upgrade to `Html.Program`:
```elm
program
    :  { init : (model, Cmd msg)
       , update : msg -> model -> (model, Cmd msg)
       , subscriptions : model -> Sub msg
       , view : model -> Html msg
       }
    -> Program Never model msg
```

## 6. WebData

TODO: diagram of remote data life-cycle

```elm
type RemoteData e a
    = NotAsked
    | Loading
    | Failure e
    | Success a
```

Change model to:

```elm
type alias Model =
    WebData String

init : ( Model, Cmd Msg )
init =
    ( RemoteData.NotAsked
    , Cmd.none
    )
```

### Sending Requests

Starting from the URL:

```elm
url : String`
url = "localhost:8000"
```

we need to get a command `: Cmd Msg` that will send a GET request to the url,
and return the result in a message of type `Msg`.

Use `getString`.

```elm
getString : String -> Request String
```

`Request` is an opaque type representing the request.  So we need another function:

```elm
send : (Result Error a -> msg) -> Request a -> Cmd msg
```

The result of an Http request is represented by `Result` (like `Either`):

```elm
type Result error value
    = Ok value
    | Err error
```

Where `Error` is `Http.Error`:

```elm
type Error
    = BadUrl String
    | Timeout
    | NetworkError
    | BadStatus (Response String)
    | BadPayload String (Response String)
```

To turn a `Result Error String` into a value of our message type we add a
constructor `Response`:

```elm
type Msg
    = Request
    | Response (Result Error String)
```

```elm
  msg = send Response (getString url)
```
