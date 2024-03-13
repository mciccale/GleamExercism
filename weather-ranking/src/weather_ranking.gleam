import gleam/list
import gleam/order.{type Order, Eq, Gt, Lt}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  let #(l, r) = case left, right {
    Celsius(t1), Fahrenheit(t2) -> #(t1, fahrenheit_to_celsius(t2))
    Fahrenheit(t1), Celsius(t2) -> #(fahrenheit_to_celsius(t1), t2)
    Celsius(t1), Celsius(t2) | Fahrenheit(t1), Fahrenheit(t2) -> #(t1, t2)
  }

  case l -. r {
    0.0 -> Eq
    n if n >. 0.0 -> Gt
    _ -> Lt
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  cities
  |> list.sort(by: fn(c1, c2) { compare_temperature(c1.temperature, c2.temperature) })
}
