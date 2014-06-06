Require Import Arith.

Fixpoint sum_odd ( n : nat ) : nat :=
  match n with
  | 0 => 0
  | S m => n * 2 - 1 + sum_odd m
  end.

Goal forall n : nat , n * n = sum_odd n.
Proof.
  intros.
  induction n.
    simpl.
    reflexivity.

    simpl.
    f_equal.
    rewrite mult_comm.
    simpl.
    rewrite mult_succ_r.
    rewrite mult_1_r.
    rewrite plus_assoc_reverse.
    f_equal.
    f_equal.
    apply IHn.
Qed.