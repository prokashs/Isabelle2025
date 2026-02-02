theory Sorting
  imports Main "HOL-Library.Code_Target_Int"
begin

primrec sorted :: "nat list \<Rightarrow> bool" where
  "sorted [] = True" |
  "sorted (x # xs) = ((\<forall>y \<in> set xs. x \<le> y) \<and> sorted xs)"

primrec insort :: "nat \<Rightarrow> nat list \<Rightarrow> nat list" where
  "insort a [] = [a]" |
  "insort a (x # xs) = (if a \<le> x then a # x # xs else x # insort a xs)"

primrec sort :: "nat list \<Rightarrow> nat list" where
  "sort [] = []" |
  "sort (x # xs) = insort x (sort xs)"

(* Helper lemma needed for the main proof *)
(* 1. First, prove that insort only adds the new element 'a' to the existing set *)
lemma set_insort [simp]: "set (insort a xs) = insert a (set xs)"
  by (induct xs) auto

(* 2. Now your sorted_insort lemma will work perfectly with auto *)
lemma sorted_insort: "sorted xs \<Longrightarrow> sorted (insort x xs)"
  apply (induct xs)
   apply auto
  done

theorem "sorted (sort xs)"
  by (induct xs) (auto simp: sorted_insort)

(* Updated Export Command *)
export_code sort insort sorted in Haskell
  module_name Sorting
  file_prefix "./sort_export"

end