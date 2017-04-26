defmodule Plugger.Router do 
    use Plug.Router

    plug :match
    plug :dispatch

    def start_link do
        Plug.Adapters.Cowboy.http(Plugger.Router, [])
    end

    get "/" do
        
        %Plug.Conn{"query_string" => query_string}

        template = Mustache.render("Hello, my name is {{name}}, query string: {{query_string}}",
             %{name: "Victor", query_string: "hello"})

        conn
        |> send_resp(200, template)
    end
end