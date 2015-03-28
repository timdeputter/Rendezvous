defmodule RendezvousTest do
  use ExUnit.Case

  test "Returns for a given key the appropriate bucket" do
    buckets = ["Node A", "Node B", "Node C"]
    found_bucket = Rendezvous.get(:sha, "some key",buckets)
    assert Enum.any?(buckets, fn e -> e == found_bucket end)
  end

  test "Equally distirbutes objects over the buckets" do

  end
  
  test "Allways returns the same bucket for the same object" do
  end

end
