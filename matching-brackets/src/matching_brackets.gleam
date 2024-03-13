import gleam/list
import gleam/string

pub fn is_paired(value: String) -> Bool {
  let graphemes =
    value
    |> string.to_graphemes
    |> list.filter(fn(g) {
      case g {
        "(" | ")" | "{" | "}" | "[" | "]" -> True
        _ -> False
      }
    })

  is_paired_rec(graphemes, [])
}

fn is_paired_rec(graphemes: List(String), stack: List(String)) -> Bool {
  case graphemes, stack {
    [], [] -> True

    [head, ..tail], _ if head == "{" || head == "(" || head == "[" ->
      is_paired_rec(tail, [head, ..stack])

    [head, ..tail], [stack_head, ..stack_tail] -> {
      case get_opening_bracket_from_closed_bracket(head) == stack_head {
        True -> is_paired_rec(tail, stack_tail)
        False -> False
      }
    }

    _, _ -> False
  }
}

fn get_opening_bracket_from_closed_bracket(bracket: String) -> String {
  case bracket {
    "}" -> "{"
    ")" -> "("
    "]" -> "["
    _ -> ""
  }
}
