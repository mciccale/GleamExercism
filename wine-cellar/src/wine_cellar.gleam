import gleam/list

pub fn wines_of_color(wines: List(Wine), color c: Color) -> List(Wine) {
  wines
  |> list.filter(fn(w) { w.color == c })
}

pub fn wines_from_country(wines: List(Wine), country c: String) -> List(Wine) {
  wines
  |> list.filter(fn(w) { w.country == c })
}

// Please define the required labelled arguments for this function
pub fn filter(
  wines: List(Wine),
  color cl: Color,
  country ct: String,
) -> List(Wine) {
  wines
  |> list.filter(fn(w) { w.color == cl && w.country == ct })
}

pub type Wine {
  Wine(name: String, year: Int, country: String, color: Color)
}

pub type Color {
  Red
  Rose
  White
}
