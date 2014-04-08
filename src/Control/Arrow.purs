module Control.Arrow where

import Data.Tuple (Tuple(..), swap)

class (Category a) <= Arrow a where
  arr :: forall b c. (b -> c) -> a b c
  first :: forall b c d. a b c -> a (Tuple b d) (Tuple c d)

instance arrowFunction :: Arrow (->) where
  arr f = f
  first f (Tuple b d) = Tuple (f b) d

second :: forall a b c d. (Arrow a) => a b c -> a (Tuple d b) (Tuple d c)
second f = arr swap >>> first f >>> arr swap

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
