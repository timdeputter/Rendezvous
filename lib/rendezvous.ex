defmodule Rendezvous do
  def get algorithm, key, buckets do
    {bucket, hash} = Enum.map(buckets, fn(b) -> get_bucket_with_hash(algorithm, b, key) end) 
                      |> Enum.max_by fn {b, hash} -> hash end
    bucket
  end

  defp get_bucket_with_hash(algorithm, bucket, key) do
    {bucket, compute_bucket_hash(algorithm, bucket, key)}
  end

  defp compute_bucket_hash(algorithm, bucket,key) do
    :crypto.hash(algorithm,[bucket,key] )
  end
end
