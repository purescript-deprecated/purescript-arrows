# Module Documentation

## Module Control.Arrow

#### `Arrow`

``` purescript
class (Category a, Strong a) <= Arrow a where
  arr :: forall b c. (b -> c) -> a b c
```


#### `arrowFunction`

``` purescript
instance arrowFunction :: Arrow Prim.Function
```


#### `ArrowZero`

``` purescript
class ArrowZero a where
  azero :: forall b c. a b c
```


#### `ArrowPlus`

``` purescript
class ArrowPlus a where
  (<+>) :: forall b c. a b c -> a b c -> a b c
```



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