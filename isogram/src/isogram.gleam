import gleam/string
import gleam/set

pub fn is_isogram(phrase phrase: String) -> Bool {
  let normalized_phrase =
    phrase
    |> string.replace(" ", "")
    |> string.replace("-", "")
    |> string.lowercase()

  let phrase_set =
    normalized_phrase
    |> string.split(on: "")
    |> set.from_list()

    set.size(phrase_set) == string.length(normalized_phrase)
}
