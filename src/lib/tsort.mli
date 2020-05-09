(**
   Topological sort
*)

type 'a sort_result =
  | Sorted of 'a list
  | ErrorNonexistent of 'a list
  | ErrorCycle of 'a list

(** Perform a normal topological sort on a directed acyclic graph (DAG). *)
val sort : ('a * 'a list) list -> 'a sort_result

module Components : sig
  (** Perform a topological sort on a directed graph that may have cycles.
      Uses [partition] and [Tsort.sort].
  *)
  val sort : ('a * 'a list) list -> 'a list list

  (**
      Partition a graph into its strongly-connected components:
      Two vertices u, v belong to the same component iff there's a path from
      u to v and there's a path from v to u.

      See https://en.wikipedia.org/wiki/Strongly_connected_component

      The complexity is linear with respect to the input size.
      The current implementation uses the Kosaraju–Sharir algorithm,
      which is described at
      https://en.wikipedia.org/wiki/Kosaraju%27s_algorithm
  *)
  val partition : ('a * 'a list) list -> 'a list list
end
