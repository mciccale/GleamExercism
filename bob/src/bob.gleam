import gleam/string
import gleam/result

pub fn hey(remark: String) -> String {
  let trimmed_remark = string.trim(remark)
  let results = #(
    is_question(trimmed_remark),
    is_shout(trimmed_remark),
    is_silence(trimmed_remark),
  )

  case results {
    #(True, True, _) -> "Calm down, I know what I'm doing!"
    #(True, _, _) -> "Sure."
    #(_, True, _) -> "Whoa, chill out!"
    #(_, _, True) -> "Fine. Be that way!"
    _ -> "Whatever."
  }
}

fn is_question(remark: String) -> Bool {
  let result = string.last(remark)
  result.unwrap(result, "") == "?"
}

fn is_shout(remark: String) -> Bool {
  let uppercase = string.uppercase(remark)
  let lowercase = string.lowercase(remark)

  remark == string.uppercase(remark) && !{ uppercase == lowercase }
}

fn is_silence(remark: String) -> Bool {
  remark == ""
}
