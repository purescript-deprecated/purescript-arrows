## Module Control.Arrow.Kleisli

The `Kleisli` arrow for a `Monad`.

#### `Kleisli`

``` purescript
newtype Kleisli m a b
  = Kleisli (a -> m b)
```

`Kleisli` gives an `Arrow` instance for the Kleisli category of a `Monad`.

Composition is defined using `>=>` with `return` as the identity morhism.

##### Instances
``` purescript
instance semigroupoidKleisli :: (Bind m) => Semigroupoid (Kleisli m)
instance categoryKleisli :: (Monad m) => Category (Kleisli m)
instance profunctorKleisli :: (Functor f) => Profunctor (Kleisli f)
instance strongKleisli :: (Functor m) => Strong (Kleisli m)
instance arrowKleisli :: (Monad m) => Arrow (Kleisli m)
instance arrowZeroKleisli :: (MonadPlus m) => ArrowZero (Kleisli m)
instance arrowPlusKleisli :: (MonadPlus m) => ArrowPlus (Kleisli m)
```

#### `runKleisli`

``` purescript
runKleisli :: forall m a b. Kleisli m a b -> a -> m b
```

Unpack a `Kleisli` arrow.


