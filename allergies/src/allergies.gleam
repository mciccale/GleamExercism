import gleam/int
import gleam/list

pub type Allergen {
  Eggs
  Peanuts
  Shellfish
  Strawberries
  Tomatoes
  Chocolate
  Pollen
  Cats
}

pub fn allergic_to(allergen: Allergen, score: Int) -> Bool {
  {
    allergen
    |> get_allergen_code
    |> int.bitwise_and(score)
  }
  != 0
}

pub fn list(score: Int) -> List(Allergen) {
  [Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats]
  |> list.filter(allergic_to(_, score))
}

fn get_allergen_code(a: Allergen) -> Int {
  case a {
    Eggs -> 1
    Peanuts -> 2
    Shellfish -> 4
    Strawberries -> 8
    Tomatoes -> 16
    Chocolate -> 32
    Pollen -> 64
    Cats -> 128
  }
}
