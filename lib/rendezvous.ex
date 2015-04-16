defmodule Rendezvous do
  def get algorithm, key, buckets do
    {bucket, hash} = Enum.map(buckets, fn(b) -> {b, compute_bucket_hash(algorithm,b,key)} end) |> Enum.max_by fn {b, hash} -> hash end
    bucket
  end

  defp compute_bucket_hash(algorithm, bucket,key) do
    :crypto.hash(algorithm,[bucket,key] )
  end
end
