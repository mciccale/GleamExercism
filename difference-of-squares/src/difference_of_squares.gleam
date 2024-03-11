pub fn square_of_sum(n: Int) -> Int {
  let x = n * {n + 1} / 2
  x * x
}

pub fn sum_of_squares(n: Int) -> Int {
  {n * {n + 1} * {2*n + 1}} / 6
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
