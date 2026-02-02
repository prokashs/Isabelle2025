{-# LANGUAGE EmptyDataDecls, RankNTypes, ScopedTypeVariables #-}

module Sorting(Nat, insort, sort, sorted) where {

import Prelude ((==), (/=), (<), (<=), (>=), (>), (+), (-), (*), (/), (**),
  (>>=), (>>), (=<<), (&&), (||), (^), (^^), (.), ($), ($!), (++), (!!), Eq,
  error, id, return, not, fst, snd, map, filter, concat, concatMap, reverse,
  zip, null, takeWhile, dropWhile, all, any, Integer, negate, abs, divMod,
  String, Bool(True, False), Maybe(Nothing, Just));
import Data.Bits ((.&.), (.|.), (.^.));
import qualified Prelude;
import qualified Data.Bits;

data Nat = Zero_nat | Suc Nat;

less_eq_nat :: Nat -> Nat -> Bool;
less_eq_nat (Suc m) n = less_nat m n;
less_eq_nat Zero_nat n = True;

less_nat :: Nat -> Nat -> Bool;
less_nat m (Suc n) = less_eq_nat m n;
less_nat n Zero_nat = False;

insort :: Nat -> [Nat] -> [Nat];
insort a [] = [a];
insort a (x : xs) = (if less_eq_nat a x then a : x : xs else x : insort a xs);

sort :: [Nat] -> [Nat];
sort [] = [];
sort (x : xs) = insort x (sort xs);

sorted :: [Nat] -> Bool;
sorted [] = True;
sorted (x : xs) = all (less_eq_nat x) xs && sorted xs;

}

