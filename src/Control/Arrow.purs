module Control.Arrow where

import Data.Profunctor.Strong
import Data.Tuple (Tuple(..), swap)

class (Category a, Strong a) <= Arrow a where
  arr :: forall b c. (b -> c) -> a b c

instance arrowFunction :: Arrow (->) where
  arr f = f

class ArrowZero a where
  azero :: forall b c. a b c

infixr 5 <+>

class ArrowPlus a where
  (<+>) :: forall b c. a b c -> a b c -> a b c
