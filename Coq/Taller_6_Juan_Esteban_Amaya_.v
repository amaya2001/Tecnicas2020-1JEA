(* Taller 6 =( *)

(* Parte 1 *)
Section Parte1.

(* Definición de NAT *)
Inductive NAT : Type := 
  | O : NAT
  | Succ : NAT -> NAT. 

(* Definición de la suma *)
Fixpoint Suma ( x y: NAT ): NAT :=
  match x with
  | O => y
  | Succ z => Succ ( Suma z y )
  end.

(* Propiedad identidad *)
Theorem PropIdentidad: forall a: NAT, ( Suma a O )  = a.
Proof.
  intro.
  induction a.
  simpl. 
  reflexivity.
  simpl. 
  rewrite IHa.
  reflexivity.
Qed.

(* Propiedad asociativa *)
Theorem PropAsociativa: forall a b c: NAT, Suma a ( Suma b c ) = Suma ( Suma a b ) c.
Proof.
  intros.
  induction a.
  simpl. 
  reflexivity.
  simpl. 
  rewrite IHa. 
  reflexivity.
Qed.

(* Definición para la suma con sucesor *)
Theorem SumaSucc: forall a b: NAT, Suma a ( Succ b ) = Suma( Succ a) b.
Proof.
  intros.
  induction a.
  simpl. 
  reflexivity.
  simpl. 
  rewrite IHa. 
  reflexivity.
Qed.


(* Propiedad conmutativa *)
Theorem PropConmutativa: forall a b: NAT, Suma a b = Suma b a.
Proof.
  intros.
  induction a.
  simpl. 
  rewrite PropIdentidad. 
  reflexivity.
  simpl. 
  rewrite SumaSucc. 
  rewrite IHa. 
  reflexivity.
Qed.

(* Propiedad cancelativa *)
Theorem PropCancelativa: forall a b c: NAT, a = b -> ( Suma a c ) = ( Suma b c ).
Proof.
  intros.
  rewrite H.
  rewrite PropConmutativa.
  reflexivity.
Qed.

End Parte1.

Section Parte2.

(* Definición de multiplicación usando Suma *)
Fixpoint Multi ( x y: NAT ): NAT :=
  match x with
  | O => O
  | Succ z => Suma ( Multi z y ) y
  end.

(* Propiedad modulativa *)
Theorem PropModulativa: forall a: NAT, Multi a ( Succ O ) = a.
Proof.
  intro.
  induction a.
  simpl.
  reflexivity.
  simpl.
  rewrite IHa. 
  rewrite PropConmutativa. 
  reflexivity.
Qed.

(* Propiedad producto O *)
Theorem PropProd0: forall a: NAT, ( Multi a O ) = O.
Proof.
  intros.
  induction a.
  simpl. 
  reflexivity.
  simpl.
  rewrite IHa.
  reflexivity.  
Qed.

(* Multiplicación con sucesor *)
Theorem MultiSucc: forall a b: NAT, Multi a ( Succ b ) = Suma a ( Multi a b ).
Proof.
  intros.
  induction a.
  simpl. 
  reflexivity.
  simpl. 
  rewrite IHa. 
  rewrite PropConmutativa.
  simpl.  
  rewrite PropConmutativa. 
  rewrite PropAsociativa.
  reflexivity.
Qed.

(* Propidad conmutativa *)
Theorem PropConmutativaMulti: forall a b: NAT,  Multi a b  =  Multi b a .
Proof.
  intros.
  induction a.
  simpl.
  rewrite PropProd0. 
  reflexivity.
  simpl. 
  rewrite MultiSucc. 
  rewrite IHa.
  rewrite PropConmutativa.  
  reflexivity.
Qed.

(* Propiedad distributiva *)
Theorem PropDistributiva: forall (a b c: NAT), Multi a ( Suma b c ) = Suma ( Multi a b ) ( Multi a c ).
Proof.
  pose proof PropAsociativa as Pa.  
  pose proof PropConmutativa as Pc.
  intros.
  induction a.
  simpl. 
  reflexivity.
  simpl. 
  rewrite IHa.
  rewrite Pa.
  rewrite Pa.
  symmetry.
  rewrite <- Pa with  ( Multi a b ) b ( Multi a c ).
  rewrite Pa.
  rewrite <- Pa with ( Multi a b ) b ( Multi a c ).
  rewrite Pa.
  rewrite <- Pa with ( Multi a b ) b ( Multi a c ).
  rewrite <- Pc with ( Multi a c ) b.
  rewrite Pa.
  reflexivity.
Qed.  

(* Propiedad asociativa *)
Theorem PropAsociativaMulti: forall a b c: NAT, Multi a ( Multi b c ) = Multi ( Multi a b ) c.
Proof.
  intros.
  induction a.
  simpl. 
  reflexivity.
  simpl. 
  rewrite IHa.
  symmetry.
  rewrite PropConmutativaMulti.
  rewrite PropDistributiva.
  rewrite PropConmutativaMulti.
  rewrite PropConmutativa. 
  rewrite PropConmutativaMulti.
  rewrite PropConmutativa. 
  reflexivity. 
Qed.

End Parte2.