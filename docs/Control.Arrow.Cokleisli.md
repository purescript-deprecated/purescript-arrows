# Module Documentation

## Module Control.Arrow.Cokleisli

#### `Cokleisli`

``` purescript
newtype Cokleisli w a b
  = Cokleisli (w a -> b)
```


#### `runCokleisli`

``` purescript
runCokleisli :: forall w a b. Cokleisli w a b -> w a -> b
```


#### `semigroupoidCokleisli`

``` purescript
instance semigroupoidCokleisli :: (Extend m) => Semigroupoid (Cokleisli m)
```


#### `categoryCokleisli`

``` purescript
instance categoryCokleisli :: (Comonad m) => Category (Cokleisli m)
```


#### `profunctorCokleisli`

``` purescript
instance profunctorCokleisli :: (Functor f) => Profunctor (Cokleisli f)
```


#### `strongCokleisli`

``` purescript
instance strongCokleisli :: (Comonad m) => Strong (Cokleisli m)
```


#### `arrowCokleisli`

``` purescript
instance arrowCokleisli :: (Comonad m) => Arrow (Cokleisli m)
```




