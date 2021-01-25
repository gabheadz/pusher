# Pushxer

## Description

Elixir library to access the Pusher REST API.

## Usage

### Rest client

Define your Pushxer.Client

```elixir
client = %Pushxer.Client{app_id: "app_id", app_key: "app_key", secret: "my_secret"}
client = %Pushxer.Client{endpoint: "https://my_custom_pusher:8080", app_id: "app_id", app_key: "app_key", secret: "my_secret"}
```

```elixir
Pushxer.trigger(client, "message", %{ text: "Hello!" }, "chat-channel")
```

To get occupied channels:

```elixir
Pushxer.channels(client)
```

To get users connected to a presence channel

```elixir
Pushxer.users(client, "presence-demo")
```
