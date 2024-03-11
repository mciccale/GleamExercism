import gleam/io
import gleam/list.{fold}

pub fn egg_count(number: Int) -> Int {
  convert_int_to_bin(number, acc: [])
  |> fold(0, fn(a,x) { a + x })
}

fn convert_int_to_bin(number: Int, acc acc: List(Int)) -> List(Int) {
  case number == 0 {
    True -> acc
    False -> {
      let rem = number % 2
      let quotient = number / 2
      convert_int_to_bin(quotient, [rem, ..acc])
    }
  }
}

pub fn main() {
  io.debug(egg_count(89)) 
  io.debug(egg_count(16)) 
}
