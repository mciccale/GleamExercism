import gleam/list

pub type Tree {
  Nil
  Node(data: Int, left: Tree, right: Tree)
}

pub fn to_tree(data: List(Int)) -> Tree {
  to_tree_rec(data, Nil)
}

fn to_tree_rec(data: List(Int), tree: Tree) -> Tree {
  case data, tree {
    [], _ -> tree
    [head, ..tail], tree -> to_tree_rec(tail, insert(head, tree))
  }
}

fn insert(number: Int, tree: Tree) -> Tree {
  case tree {
    Nil -> Node(number, Nil, Nil)

    Node(data, left, right) if number > data ->
      Node(data, left, insert(number, right))

    Node(data, left, right) -> Node(data, insert(number, left), right)
  }
}

pub fn sorted_data(data: List(Int)) -> List(Int) {
  to_list(to_tree(data))
}

fn to_list(tree: Tree) -> List(Int) {
  case tree {
    Nil -> []
    Node(data, left, right) ->
      list.flatten([to_list(left), [data], to_list(right)])
  }
}
