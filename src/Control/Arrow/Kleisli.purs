module Control.Arrow.Kleisli where

import Control.Arrow
import Data.Tuple (Tuple(..), swap)

newtype Kleisli m a b = Kleisli (a -> m b)

runKleisli :: forall m a b. Kleisli m a b -> a -> m b
runKleisli (Kleisli f) = f

instance semigroupoidKleisli :: (Monad m) => Semigroupoid (Kleisli m) where
  (<<<) (Kleisli f) (Kleisli g) = Kleisli (\b -> g b >>= f)

instance categoryKleisli :: (Monad m) => Category (Kleisli m) where
  id = Kleisli return

instance arrowKleisli :: (Monad m) => Arrow (Kleisli m) where
  arr f = Kleisli (return <<< f)
  first (Kleisli f) = Kleisli \(Tuple b d) -> f b >>= \c -> return (Tuple c d)
