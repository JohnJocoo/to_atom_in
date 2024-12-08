defmodule ToAtomInTest do
  use ExUnit.Case

  import TAI

  doctest TAI

  @array1 [:price]
  @array3 [:one, :two, :three]

  test "exists one" do
    assert to_atom_in("world", [:world]) == :world
  end

  test "exists one sigil_w" do
    assert to_atom_in("hello", ~w"hello"a) == :hello
  end

  test "exists one sigil_W" do
    assert to_atom_in("date", ~W"date"a) == :date
  end

  test "exists one attr" do
    assert to_atom_in("price", @array1) == :price
  end

  test "exists one enum" do
    atoms = [:status]

    assert to_atom_in("status", atoms) == :status
  end

  test "exists three" do
    assert to_atom_in("one", [:one, :two, :three]) == :one
  end

  test "exists three sigil_w" do
    assert to_atom_in("two", ~w"one two three"a) == :two
  end

  test "exists three sigil_W" do
    assert to_atom_in("three", ~W"one two three"a) == :three
  end

  test "exists three attr" do
    assert to_atom_in("one", @array3) == :one
  end

  test "exists three enum" do
    atoms = [:one, :two, :three]

    assert to_atom_in("two", atoms) == :two
  end

  test "empty list" do
    assert_raise ArgumentError, fn -> to_atom_in("world", []) end
  end

  test "empty list enum" do
    atoms = []

    assert_raise ArgumentError, fn -> to_atom_in("world", atoms) end
  end

  test "not exists" do
    assert_raise ArgumentError, fn -> to_atom_in("four", [:one, :two, :three]) end
  end

  test "not exists sigil_w" do
    assert_raise ArgumentError, fn -> to_atom_in("four", ~w"one two three"a) end
  end

  test "not exists sigil_W" do
    assert_raise ArgumentError, fn -> to_atom_in("four", ~W"one two three"a) end
  end

  test "not exists attr" do
    assert_raise ArgumentError, fn -> to_atom_in("four", @array3) end
  end

  test " not exists enum" do
    atoms = [:one, :two, :three]

    assert_raise ArgumentError, fn -> to_atom_in("four", atoms) end
  end
end
