module Control.Arrow.CoKleisli where

import Data.Tuple
import Data.Profunctor
import Data.Profunctor.Strong

import Control.Arrow
import Control.Extend
import Control.Comonad

newtype CoKleisli w a b = CoKleisli (w a -> b)

runCoKleisli :: forall w a b. CoKleisli w a b -> w a -> b
runCoKleisli (CoKleisli f) = f

instance semigroupoidCoKleisli :: (Extend m) => Semigroupoid (CoKleisli m) where
  (<<<) (CoKleisli f) (CoKleisli g) = CoKleisli (f =<= g)

instance categoryCoKleisli :: (Comonad m) => Category (CoKleisli m) where
  id = CoKleisli extract

instance profunctorCoKleisli :: (Functor f) => Profunctor (CoKleisli f) where
  dimap f g (CoKleisli h) = CoKleisli (g <<< h <<< (f <$>))

instance strongCoKleisli :: (Comonad m) => Strong (CoKleisli m) where
  first (CoKleisli f) = CoKleisli \w -> Tuple (f (fst <$> w)) (snd (extract w)) 
  second (CoKleisli f) = CoKleisli \w -> Tuple (fst (extract w)) (f (snd <$> w))

instance arrowCoKleisli :: (Comonad m) => Arrow (CoKleisli m) where
  arr f = CoKleisli (f <<< extract)
