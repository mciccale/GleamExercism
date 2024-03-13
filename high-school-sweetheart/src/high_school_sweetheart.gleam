import gleam/string
import gleam/result

pub fn first_letter(name: String) -> String {
  name
  |> string.trim_left()
  |> string.first()
  |> result.unwrap("")
}

pub fn initial(name: String) {
  name
  |> first_letter()
  |> string.uppercase()
  |> string.append(".")
}

pub fn initials(full_name: String) {
  let name_surname =
    full_name
    |> string.split(" ")

  case name_surname {
    [name, surname] -> initial(name) <> " " <> initial(surname)
    _ -> ""
  }
}

pub fn pair(full_name1: String, full_name2: String) {
  let initials1 = full_name1 |> initials()
  let initials2 = full_name2 |> initials()
  let cntnt = initials1 <> "  +  " <> initials2
     "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> cntnt <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}
