Goal forall A B : Prop , A -> ( A -> B ) -> B.
Proof.
  intros.
  apply H0.
  apply H.
Qed.

Lemma plus_0_r_ : forall n : nat , n + 0 = n.
Proof.
  intros.
  induction n.
    simpl.
    reflexivity.

    simpl.
    f_equal.
    apply IHn.
Qed.

Lemma plus_succ_comm_ : forall n m : nat , n + S m = S ( n + m ).
Proof.
  intros.
  induction n.
    simpl.
    reflexivity.

    simpl.
    f_equal.
    apply IHn.
Qed.

Goal forall n m : nat , n + m = m + n.
Proof.
  intros.
  induction n.
    rewrite plus_0_r_.
    simpl.
    reflexivity.

    simpl.
    rewrite plus_succ_comm_.
    f_equal.
    apply IHn.
Qed.

Require Import List.

Goal forall A : Prop , forall l1 l2 l3 : list A , ( l1 ++ l2 ) ++ l3 = l1 ++ ( l2 ++ l3 ).
Proof.
  intros.
  induction l1.
    simpl.
    reflexivity.

    simpl.
    f_equal.
    apply IHl1.
Qed.