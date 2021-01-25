defmodule Pushxer.HttpClient do
  use HTTPoison.Base
  alias Pushxer.RequestSigner
  alias Pushxer.Client

  def process_response_body(body) do
    case Jason.decode(body) do
      {:ok, response} -> response
      {:error, _reason} -> body
    end
  end

  @doc """
  More info at: https://pusher.com/docs/channels/library_auth_reference/rest-api#generating-authentication-signatures
  """
  def request(method, path, body \\ "", headers \\ [], options \\ []) do
    client = Keyword.get(options, :client, %Client{})

    query_string =
      Keyword.get(options, :qs, %{})
      |> RequestSigner.sign_query_string(body, client.app_key, client.secret, method, path)
      |> URI.encode_query()

    super(method, "#{client.endpoint}#{path}?#{query_string}", body, headers, options)
  end
end
