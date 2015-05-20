Rendezvous
==========

Implementation of the [Rendezvous or Highest Random Weight (HRW) hashing algorithm](https://en.wikipedia.org/wiki/Rendezvous_hashing) in the Elixir Programming Language ([elixir-lang.org](http://elixir-lang.org))

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

Use Rendezvous.get to obtain for an object the corresponding bucket from a list of buckets. The first parameter defines the hashing algorithm to use.

```elixir
object = "Some object to put in bucket"
buckets = ["bucket A", "bucket B", "bucket C"]
Rendezvous.get(:sha, object, buckets)
```

or use Rendezvous.get_node to obtain a nodename from the nodes in an elixir cluster:

```elixir
 Rendezvous.get_node object # returns name of elixir node
```

## License

Check [LICENSE](LICENSE) file for more information.
