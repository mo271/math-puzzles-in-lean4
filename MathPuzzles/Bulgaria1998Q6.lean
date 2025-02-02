import Mathlib.Data.Int.Basic
import Mathlib.Order.WellFounded
import Mathlib.Tactic.LibrarySearch
import Mathlib.Tactic.Ring

/-
Bulgarian Mathematical Olympiad 1998, Problem 6

Prove that the equation

     x²y² = z²(z² - x² - y²)

has no solutions in positive integers.

-/

namespace Bulgaria1998Q6

lemma lemma_0
    (a b c x : ℤ)
    (h : a * x^2 + b * x + c = 0) :
    (∃ d : ℤ, d^2 = b^2 - 4 * a * c) := sorry

#check WellFounded.min_mem
#check WellFounded.not_lt_min

lemma lemma_1'
    (s t u : ℕ)
    (hs : 0 < s)
    (ht : 0 < t)
    (hu : 0 < u)
    (h : s^4 - t^4 = u^2) : False := by
  let S := { a : ℕ | 0 < a ∧ ∃ b c : ℕ, a^4 - b^4 = c^2 }
  have hns : S.Nonempty := ⟨s, hs, t, u, h⟩
  let a := WellFounded.min Nat.lt_wfRel.wf S hns
  have ha : a ∈ S := WellFounded.min_mem Nat.lt_wfRel.wf S hns
  obtain ⟨hap, b, c, habc⟩ := ha
  sorry

lemma lemma_1
    (s t u : ℤ)
    (hs : 0 < s)
    (ht : 0 < t)
    (hu : 0 < u)
    (h : s^4 - t^4 = u^2) : False := by
  let hs' := Int.toNat_of_nonneg (le_of_lt hs)
  let ht' := Int.toNat_of_nonneg (le_of_lt ht)
  rw [←hs'] at h
  sorry

theorem bulgaria1998_q6
    (x y z : ℤ)
    (hx : 0 < x)
    (hy : 0 < y)
    (hz : 0 < z)
    (h : x^2 * y^2 = z^2 * (z^2 - x^2 - y^2)) :
    False := by
  have : 0 = (z^2)^2 - z^2 * (x^2 + y^2) - x^2 * y^2 := by {rw[h]; ring}
  sorry
