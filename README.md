# ToAtomIn

Small utility to safely convert strings to a limited set of atoms.

```elixir
require TAI

TAI.to_atom_in("world", [:hello, :world])
:world
```

```elixir
import TAI

to_atom_in("world", ~w(hello world)a)
:world
```

```elixir
import TAI

to_atom_in("three", ~w(one two)a)
# ** (ArgumentError) The atom three is not in the [:one, :two]
```

## Installation

The package can be installed
by adding `to_atom_in` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:to_atom_in, "~> 0.1.0"}
  ]
end
```

The docs can
be found at <https://hexdocs.pm/to_atom_in>.

