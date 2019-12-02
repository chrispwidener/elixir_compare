defmodule Compare do
  @moduledoc """
  Implements comparisons for common types and an easier sorting interface based on comparisons.
  """

  #  PUBLIC METHODS
  def compare(arg1, arg2, method \\ :default) do
    type = cond do
      is_bitstring(arg1) and is_bitstring(arg2) -> :string
      is_integer(arg1)   and is_integer(arg2)   -> :integer
      is_float(arg1)     and is_float(arg2)     -> :float
      true -> :error
    end

    compare_with_type_specific_methods(arg1, arg2, method, type)
  end

  def sort(enumerable, order \\ :ascend, method \\ :default) do
    Enum.sort(enumerable,
      fn arg1, arg2 ->
        result = case compare(arg1, arg2, method) do
          :LT -> true
          _   -> false
        end
        if order == :ascend, do: result, else: !result
    end)
  end


#  PRIVATE METHODS

  defp compare_with_type_specific_methods(arg1, arg2, method, type) do
    methods = get_type_specific_methods(type)
    case Keyword.fetch(methods, method) do
      {:ok, compare_method} -> compare_method.(arg1, arg2)
      :error  -> :error
    end
  end

  def get_type_specific_methods(type) do
    case type do
      :string -> [
        {:default,      &string_compare_length/2},
        {:length,       &string_compare_length/2},
        {:alphabetical, &string_compare_alphabetical_order/2}
      ]
      :integer -> [
        {:default,      &num_compare_value/2}
      ]
      :float -> [
        {:default,      &num_compare_value/2}
      ]

    end
  end

  #  STRING COMPARE METHODS
  defp string_compare_length(arg1, arg2) do
    cond do
      String.length(arg1) < String.length(arg2)  -> :LT
      String.length(arg1) == String.length(arg2) -> :EQ
      true                                       -> :GT
    end
  end

  defp string_compare_alphabetical_order(arg1, arg2) do
    cond do
      arg1 < arg2 ->  :LT
      arg1 == arg2 -> :EQ
      true         -> :GT
    end
  end

  #  NUM COMPARE METHODS
  defp num_compare_value(arg1, arg2) do
    cond do
      arg1 < arg2 ->  :LT
      arg1 == arg2 -> :EQ
      true         -> :GT
    end
  end
end
