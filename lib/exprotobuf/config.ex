defmodule Protobuf.ConfigError do
  defexception [:message]
end

defmodule Protobuf.Config do
  @moduledoc """
  Defines a struct used for configuring the parser behavior.

  defstruct namespace: nil,  # The root module which will define the namespace of generated modules.
            schema: "",      # The schema as a string, either provided direct, or read from file.
            only: [],        # The list of types to load, if empty, all are loaded.
            erl_module: nil, # The Erlang module (record) to be used as base for (en|de)coding proto messages.
            inject: false,   # Flag which determines whether the types loaded are injected in the 'using' module.
                             # `inject: true` requires only with a single type defined, since no more than one struct
                             # can be defined per-module.
            options: []      # Other options the could be passed to the Erlang's record compilation, e.g. :mapfields_as_maps.
  """
  defstruct namespace: nil,
            schema: "",
            only: [],
            inject: false,
            from_file: nil,
            erl_module: nil,
            use_package_names: false,
            doc: nil,
            options: []


  def doc_quote(false) do
    quote do: @moduledoc unquote(false)
  end

  def doc_quote(_), do: nil
end
