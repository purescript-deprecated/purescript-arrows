## Module Control.Arrow.Cokleisli

The `Cokleisli` arrow for a `Comonad`.

#### `Cokleisli`

``` purescript
newtype Cokleisli w a b
  = Cokleisli (w a -> b)
```

`Cokleisli` gives an `Arrow` instance for the Co-Kleisli category of a `Comonad`.

Composition is defined using `=>=` with `extract` as the identity morhism.

##### Instances
``` purescript
instance semigroupoidCokleisli :: (Extend m) => Semigroupoid (Cokleisli m)
instance categoryCokleisli :: (Comonad m) => Category (Cokleisli m)
instance profunctorCokleisli :: (Functor f) => Profunctor (Cokleisli f)
instance strongCokleisli :: (Comonad m) => Strong (Cokleisli m)
instance arrowCokleisli :: (Comonad m) => Arrow (Cokleisli m)
```

#### `runCokleisli`

``` purescript
runCokleisli :: forall w a b. Cokleisli w a b -> w a -> b
```

Unpack a `Cokleisli` arrow.


