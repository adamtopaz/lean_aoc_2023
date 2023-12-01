import Lean
open Lean System

def datafile : FilePath := "." / "data" / "day01"

def digits : String := "0123456789"

def String.onlyDigits (S : String) : List Char :=
  S.toList.filter (fun x => x ∈ digits.toList)

def day01_part1 : IO Nat := do
  let data ← IO.FS.lines datafile
  let mut out : Nat := 0
  for d in data do
    let d := d.onlyDigits
    let fst := d.head! |>.toString |>.toNat!
    let snd := d.getLast! |>.toString |>.toNat!
    out := out + 10 * fst + snd
  return out

--#eval day01_part1
