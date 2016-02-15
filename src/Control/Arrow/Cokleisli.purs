-- | The `Cokleisli` arrow for a `Comonad`.
module Control.Arrow.Cokleisli where

import Prelude (class Functor, class Category, class Semigroupoid, (<$>), (<<<))

import Data.Tuple (Tuple(Tuple), snd, fst)
import Data.Profunctor (class Profunctor)
import Data.Profunctor.Strong (class Strong)

import Control.Arrow (class Arrow)
import Control.Extend (class Extend, (=<=))
import Control.Comonad (class Comonad, extract)

-- | `Cokleisli` gives an `Arrow` instance for the Co-Kleisli category of a `Comonad`.
-- |
-- | Composition is defined using `=>=` with `extract` as the identity morhism.
newtype Cokleisli w a b = Cokleisli (w a -> b)

-- | Unpack a `Cokleisli` arrow.
runCokleisli :: forall w a b. Cokleisli w a b -> w a -> b
runCokleisli (Cokleisli f) = f

instance semigroupoidCokleisli :: (Extend m) => Semigroupoid (Cokleisli m) where
  compose (Cokleisli f) (Cokleisli g) = Cokleisli (f =<= g)

instance categoryCokleisli :: (Comonad m) => Category (Cokleisli m) where
  id = Cokleisli extract

instance profunctorCokleisli :: (Functor f) => Profunctor (Cokleisli f) where
  dimap f g (Cokleisli h) = Cokleisli (g <<< h <<< (f <$>))

instance strongCokleisli :: (Comonad m) => Strong (Cokleisli m) where
  first (Cokleisli f) = Cokleisli \w -> Tuple (f (fst <$> w)) (snd (extract w))
  second (Cokleisli f) = Cokleisli \w -> Tuple (fst (extract w)) (f (snd <$> w))

instance arrowCokleisli :: (Comonad m) => Arrow (Cokleisli m)
