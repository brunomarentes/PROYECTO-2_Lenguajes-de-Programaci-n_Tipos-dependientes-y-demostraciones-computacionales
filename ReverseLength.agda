module ReverseLength where

-- Igualdad proposicional y números naturales
open import Agda.Builtin.Equality
open import Agda.Builtin.Nat
open import Relation.Binary.PropositionalEquality using (cong; trans; sym)

-- Definición de listas propia
data List (A : Set) : Set where
  []  : List A                  -- lista vacía
  _∷_ : A → List A → List A     -- constructor cons

-- Concatenación de listas (asociativa a la derecha)
infixr 5 _++_
_++_ : {A : Set} → List A → List A → List A
[]       ++ ys = ys             -- concatenar vacío no cambia nada
(x ∷ xs) ++ ys = x ∷ (xs ++ ys) -- se conserva la cabeza y se concatena el resto

-- Reverse definido de forma recursiva usando concatenación
reverse : {A : Set} → List A → List A
reverse []       = []                 -- el reverso del vacío es vacío
reverse (x ∷ xs) = reverse xs ++ (x ∷ []) -- se invierte el resto y se agrega x al final

-- Longitud de una lista
length : {A : Set} → List A → Nat
length []       = zero           -- longitud del vacío es 0
length (_ ∷ xs) = suc (length xs) -- cada cons incrementa la longitud

-- Lema: la longitud de una concatenación es la suma de longitudes
length-++ : {A : Set} → (xs ys : List A) →
            length (xs ++ ys) ≡ length xs + length ys
length-++ [] ys = refl                          -- caso base
length-++ (x ∷ xs) ys =
  cong suc (length-++ xs ys)                    -- se preserva suc en ambos lados

-- Lema aritmético: sumar 1 por la derecha equivale a suc
+-suc : (n : Nat) → n + 1 ≡ suc n
+-suc zero    = refl
+-suc (suc n) = cong suc (+-suc n)

-- Teorema principal: reverse preserva la longitud
reverse-length : {A : Set} → (xs : List A) →
                 length (reverse xs) ≡ length xs
reverse-length [] = refl                         -- caso base
reverse-length (x ∷ xs) =
  trans
    (length-++ (reverse xs) (x ∷ []))            -- longitud del ++
    (trans
      (cong (λ n → n + 1) (reverse-length xs))   -- hipótesis inductiva
      (+-suc (length xs)))                       -- simplificación aritmética

