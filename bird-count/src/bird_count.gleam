pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [head, ..] -> head
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [head, ..tail] -> [head + 1, ..tail]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [0, ..] -> True
    [_, ..tail] -> has_day_without_birds(tail)
  }  
}

pub fn total(days: List(Int)) -> Int {
  total_rec(days, 0)
}

// Tail Call Optimization
fn total_rec(days: List(Int), acc: Int) -> Int {
  case days {
    [] -> acc
    [head, ..tail] -> total_rec(tail, acc + head)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  busy_days_rec(days, 0)
}

// Tail Call Optimization
fn busy_days_rec(days: List(Int), acc: Int) -> Int {
  case days {
    [] -> acc
    [head, ..tail] if head >= 5 -> busy_days_rec(tail, acc + 1)
    [_, ..tail] -> busy_days_rec(tail, acc)
  }
}
