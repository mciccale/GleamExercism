import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(name) -> name
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    0 if player.level < 10 -> Some(Player(..player, health: 100, mana: None))
    0 -> Some(Player(..player, health: 100, mana: Some(100)))
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(mana) if mana >= cost -> #(
      Player(..player, mana: Some(mana - cost)),
      cost * 2,
    )
    Some(_) -> #(player, 0)
    None -> #(decrease_health(player, cost), 0)
  }
}

fn decrease_health(player: Player, damage: Int) -> Player {
  case player.health {
    h if h < damage -> Player(..player, health: 0)
    h -> Player(..player, health: h - damage)
  }
}
