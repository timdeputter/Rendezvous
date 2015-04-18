Rendezvous
==========

Implementation of the Rendezvous or Highest Random Weight (HRW) hashing algorithm in the Elixir Programming Language ([elixir-lang.org](http://elixir-lang.org))

## License

Check [LICENSE](LICENSE) file for more information.

## Installation

Add rendezvous as a dependency in your mix.exs file:

```elixir
  defp deps do
    [
      rendezvous: "~> 0.0.1"
    ]
  end
```

and run `mix deps.get`.

## Usage

Use Rendezvous.get to obtain for an object the corresponding buckets from a list of buckets. The first parameter defines the hashing algorithm to use.

```elixir
object = "Some object to put in bucket"
buckets = ["bucket A", "bucket B", "bucket C"]
Rendezvous.get(:sha, object, buckets)
```
