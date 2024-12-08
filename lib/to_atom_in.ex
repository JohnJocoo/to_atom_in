defmodule TAI do
  @moduledoc false

  @doc """
  Hello world.

  ## Examples

      iex> TAI.to_atom_in("world", [:hello, :world])
      :world

      iex> TAI.to_atom_in("hello", ~w(hello world)a)
      :hello

  """
  defmacro to_atom_in(string, atoms) when is_list(atoms) do
    with_compile_time_list(string, atoms)
  end

  defmacro to_atom_in(string, {:sigil_w, _, _} = atoms) do
    with_compile_time_list(string, atoms)
  end

  defmacro to_atom_in(string, {:sigil_W, _, _} = atoms) do
    with_compile_time_list(string, atoms)
  end

  defmacro to_atom_in(string, {:@, _, _} = atoms) do
    with_compile_time_list(string, atoms)
  end

  defmacro to_atom_in(string, atoms) do
    quote do
      result = String.to_existing_atom(unquote(string))

      if not Enum.member?(unquote(atoms), result) do
        raise ArgumentError, "The atom #{result} is not in the #{inspect(unquote(atoms))}"
      end

      result
    end
  end

  defp with_compile_time_list(string, atoms) do
    quote do
      result = String.to_existing_atom(unquote(string))

      if result not in unquote(atoms) do
        raise ArgumentError, "The atom #{result} is not in the #{inspect(unquote(atoms))}"
      end

      result
    end
  end
end
