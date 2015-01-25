module Control.Arrow.Kleisli where

import Control.Arrow
import Data.Profunctor
import Data.Profunctor.Strong
import Data.Tuple (Tuple(..), swap)

newtype Kleisli m a b = Kleisli (a -> m b)

runKleisli :: forall m a b. Kleisli m a b -> a -> m b
runKleisli (Kleisli f) = f

instance semigroupoidKleisli :: (Monad m) => Semigroupoid (Kleisli m) where
  (<<<) (Kleisli f) (Kleisli g) = Kleisli (\b -> g b >>= f)

instance categoryKleisli :: (Monad m) => Category (Kleisli m) where
  id = Kleisli return

instance profuncorKleisli :: (Monad m) => Profunctor (Kleisli m) where
  dimap f g (Kleisli h) = Kleisli ((<$>) g <<< h <<< f)

instance strongKleisli :: (Monad m) => Strong (Kleisli m) where
  first (Kleisli f) = Kleisli \(Tuple a c) -> f a >>= \b -> return (Tuple b c)
  second (Kleisli f) = Kleisli \(Tuple c a) -> f a >>= \b -> return (Tuple c b)

instance arrowKleisli :: (Monad m) => Arrow (Kleisli m) where
  arr f = Kleisli (return <<< f)
