pub fn reply(guess: Int) -> String {
  case guess {
    n if n == 43 || n == 41 -> "So close"
    n if n < 41 -> "Too low"
    n if n > 43 -> "Too high"
    _ -> "Correct"
  }
}
