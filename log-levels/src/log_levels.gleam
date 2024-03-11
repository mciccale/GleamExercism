import gleam/string.{trim}

pub fn message(log_line: String) -> String {
  case log_line {
    "[ERROR]:" <> msg -> trim(msg)
    "[WARNING]:" <> msg -> trim(msg)
    "[INFO]:" <> msg -> trim(msg)
    _ -> ""
  }
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[ERROR]" <> _ -> "error"
    "[WARNING]" <> _ -> "warning"
    "[INFO]" <> _ -> "info"
    _ -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
