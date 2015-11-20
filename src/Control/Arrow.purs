-- | Type classes and standard instances for Arrows.

module Control.Arrow where

import Prelude

import Data.Profunctor.Strong

-- | The `Arrow` type class combines the operations of a `Category` with those of
-- | a `Strong` profunctor.
class (Category a, Strong a) <= Arrow a

instance arrowFunction :: Arrow (->)

-- | Arrows with zero morphisms
class (Arrow a) <= ArrowZero a where
  azero :: forall b c. a b c

infixr 5 <+>

-- | Arrows with a monoidal operation on morphisms
class (ArrowZero a) <= ArrowPlus a where
  aplus :: forall b c. a b c -> a b c -> a b c

-- | An infix alias for `aplus`. 
(<+>) :: forall a b c. (ArrowPlus a) => a b c -> a b c -> a b c
(<+>) = aplus
