# Module Documentation

## Module Control.Arrow.Kleisli

#### `Kleisli`

``` purescript
newtype Kleisli m a b
  = Kleisli (a -> m b)
```


#### `runKleisli`

``` purescript
runKleisli :: forall m a b. Kleisli m a b -> a -> m b
```


#### `semigroupoidKleisli`

``` purescript
instance semigroupoidKleisli :: (Monad m) => Semigroupoid (Kleisli m)
```


#### `categoryKleisli`

``` purescript
instance categoryKleisli :: (Monad m) => Category (Kleisli m)
```


#### `profunctorKleisli`

``` purescript
instance profunctorKleisli :: (Functor f) => Profunctor (Kleisli f)
```


#### `strongKleisli`

``` purescript
instance strongKleisli :: (Monad m) => Strong (Kleisli m)
```


#### `arrowKleisli`

``` purescript
instance arrowKleisli :: (Monad m) => Arrow (Kleisli m)
```




