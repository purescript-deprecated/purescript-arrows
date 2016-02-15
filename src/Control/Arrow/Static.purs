-- | The `Static` arrow transformer for an `Applicative` functor.

module Control.Arrow.Static where

import Prelude (class Applicative, class Functor, class Category, class Semigroupoid, (<$>), id, pure, (<*>), compose)

import Data.Profunctor (class Profunctor, dimap)
import Data.Profunctor.Strong (class Strong, second, first)
import Data.Profunctor.Choice (class Choice, right, left)

import Control.Arrow (class Arrow)

-- | `Static` gives an `Arrow` instance for the static arrows of an `Applicative` functor.
newtype Static f a b c = Static (f (a b c))

-- | Unpack a `Static` arrow.
runStatic :: forall f a b c. Static f a b c -> f (a b c)
runStatic (Static f) = f

instance semigroupoidStatic :: (Applicative f, Semigroupoid a) => Semigroupoid (Static f a) where
  compose (Static f) (Static g) = Static (compose <$> f <*> g)

instance categoryStatic :: (Applicative f, Category a) => Category (Static f a) where
  id = Static (pure id)

instance profunctorStatic :: (Functor f, Profunctor a) => Profunctor (Static f a) where
  dimap f g (Static fa) = Static (dimap f g <$> fa)

instance strongStatic :: (Functor f, Strong a) => Strong (Static f a) where
  first  (Static f) = Static (first  <$> f)
  second (Static f) = Static (second <$> f)

instance choiceStatic :: (Functor f, Choice a) => Choice (Static f a) where
  left  (Static f) = Static (left  <$> f)
  right (Static f) = Static (right <$> f)

instance arrowStatic :: (Applicative f, Arrow a) => Arrow (Static f a)
