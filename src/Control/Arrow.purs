module Control.Arrow where

import Data.Profunctor.Strong
import Data.Tuple (Tuple(..), swap)

class (Category a, Strong a) <= Arrow a where
  arr :: forall b c. (b -> c) -> a b c

instance arrowFunction :: Arrow (->) where
  arr f = f

infixr 3 ***
infixr 3 &&&

(***) :: forall a b b' c c'. (Arrow a) => a b c -> a b' c' -> a (Tuple b b') (Tuple c c')
(***) f g = first f >>> second g

(&&&) :: forall a b b' c c'. (Arrow a) => a b c -> a b c' -> a b (Tuple c c')
(&&&) f g = arr (\b -> Tuple b b) >>> (f *** g)

class ArrowZero a where
  azero :: forall b c. a b c

infixr 5 <+>

class ArrowPlus a where
  (<+>) :: forall b c. a b c -> a b c -> a b c
