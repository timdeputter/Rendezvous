defmodule RendezvousTest do
  use ExUnit.Case

  setup do
    buckets = ["Node A", "Node B", "Node C"]
    {:ok, buckets: buckets}
  end

  test "Determines for a given key the appropriate bucket", context do
    bucket = get_hrwbucket("some key", context[:buckets])
    assert is_bucket(context[:buckets], bucket)
  end

  test "Allways uses the same bucket for the same object", context do
     buckets = get_buckets(["key","key","key"], context[:buckets])
     assert all_equal?(buckets)
  end

  test "Distributes objects evenly on buckets", context do
    buckets_for_objects = get_buckets(generate_randoms(600), context[:buckets])
    assert objects_evenly_distributed_on buckets_for_objects, context[:buckets]
  end

  defp objects_evenly_distributed_on buckets_for_objects, buckets =[current_bucket | rest] do
    between get_percentage_of(buckets_for_objects, current_bucket), 32, 34
    && objects_evenly_distributed_on(buckets_for_objects,rest)
  end

  defp objects_evenly_distributed_on _, [] do
    true
  end

  defp between value, lower, upper do
    lower <= value && value <= upper
  end

  defp generate_randoms(1) do
    [generate_random_number()]
  end

  defp generate_randoms(count) do
    [generate_random_number()] ++ generate_randoms(count-1)
  end

  defp generate_random_number do
    to_string(:random.uniform)
  end

  defp get_percentage_of(collection, object) do
    number_of_eq_to_object = Enum.filter(collection, fn(e) -> e == object end) |> Enum.count
    Float.round(100 / Enum.count(collection) * number_of_eq_to_object,0)
  end

  defp get_buckets(objects,buckets) do
    Enum.map(objects, fn(object) -> get_hrwbucket(object, buckets) end)
  end

  defp get_hrwbucket(object,buckets) do
    Rendezvous.get(:sha, object, buckets)
  end

  defp is_bucket(buckets, may_be_bucket) do
    Enum.any?(buckets, fn e -> e == may_be_bucket end)
  end

  defp all_equal?(collection) do
    Enum.uniq(collection) |> Enum.count == 1
  end

end
