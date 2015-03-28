defmodule Rendezvous do
  def get algorithm, key, buckets do
    List.first(buckets)
  end
end
