import gleam/int

pub fn convert(number: Int) -> String {
  convert_rec("", number, 3)
}

fn convert_rec(acc: String, n: Int, div: Int) -> String {
  case div {
    9 -> case acc {
           "" -> int.to_string(n)
           _ -> acc
         }
    7 -> case n % 7 {
           0 -> convert_rec(acc <> "Plong", n, div + 2)
           _ -> convert_rec(acc, n, div + 2)
         }
    5 -> case n % 5 {
           0 -> convert_rec(acc <> "Plang", n, div + 2)
           _ -> convert_rec(acc, n, div + 2)
         }  
    3 -> case n % 3 {
           0 -> convert_rec(acc <> "Pling", n, div + 2)
           _ -> convert_rec(acc, n, div + 2)
         }
    _ -> ""
  }
}
