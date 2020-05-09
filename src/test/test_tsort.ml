(*
   Test suite and entry point of the test executable.
*)

(* TODO: add meaningful tests *)
let test_tsort () =
  assert (Tsort.sort [] = Sorted [])

(* TODO: add meaningful tests *)
let test_partition () =
  assert (Tsort.Components.partition [] = [])

let main () =
  Alcotest.run "Tsort" [
    "Tsort", [
      "sort", `Quick, test_tsort;
    ];
    "Tsort.Components", [
      "partition", `Quick, test_partition;
    ];
  ]

let () = main ()
