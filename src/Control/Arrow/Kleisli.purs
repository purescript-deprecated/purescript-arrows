-- | The `Kleisli` arrow for a `Monad`.

module Control.Arrow.Kleisli where

import Prelude

import Data.Profunctor
import Data.Profunctor.Strong
import Data.Tuple (Tuple(..), swap)

import Control.Arrow
import Control.Plus
import Control.Alt
import Control.MonadPlus

-- | `Kleisli` gives an `Arrow` instance for the Kleisli category of a `Monad`.
-- |
-- | Composition is defined using `>=>` with `return` as the identity morhism.
newtype Kleisli m a b = Kleisli (a -> m b)

-- | Unpack a `Kleisli` arrow.
runKleisli :: forall m a b. Kleisli m a b -> a -> m b
runKleisli (Kleisli f) = f

instance semigroupoidKleisli :: (Bind m) => Semigroupoid (Kleisli m) where
  compose (Kleisli f) (Kleisli g) = Kleisli (\b -> g b >>= f)

instance categoryKleisli :: (Monad m) => Category (Kleisli m) where
  id = Kleisli return

instance profunctorKleisli :: (Functor f) => Profunctor (Kleisli f) where
  dimap f g (Kleisli h) = Kleisli ((<$>) g <<< h <<< f)

instance strongKleisli :: (Functor m) => Strong (Kleisli m) where
  first (Kleisli f) = Kleisli \(Tuple a c) -> (`Tuple` c) <$> f a
  second (Kleisli f) = Kleisli \(Tuple c a) -> (c `Tuple`) <$> f a

instance arrowKleisli :: (Monad m) => Arrow (Kleisli m)

instance arrowZeroKleisli :: (MonadPlus m) => ArrowZero (Kleisli m) where
  azero = Kleisli \_ -> empty

instance arrowPlusKleisli :: (MonadPlus m) => ArrowPlus (Kleisli m) where
  aplus f g = Kleisli \a -> runKleisli f a <|> runKleisli g a
