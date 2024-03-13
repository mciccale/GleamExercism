import gleam/list
import gleam/set

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  factors
  |> list.map(get_multiples(of: _, less_than: limit))
  |> list.flatten
  |> set.from_list
  |> set.fold(from: 0, with: fn(a, m) { a + m })
}

fn get_multiples(of n: Int, less_than max: Int) -> List(Int) {
  case n {
    0 -> [0]
    _ -> get_multiples_rec(n, n, max)
  }
}

fn get_multiples_rec(n: Int, base: Int, max: Int) -> List(Int) {
  case n {
    n if n >= max -> []
    n -> [n, ..get_multiples_rec(n + base, base, max)]
  }
}

