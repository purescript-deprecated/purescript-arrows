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


#### `(***)`

``` purescript
(***) :: forall a b b' c c'. (Arrow a) => a b c -> a b' c' -> a (Tuple b b') (Tuple c c')
```


#### `(&&&)`

``` purescript
(&&&) :: forall a b b' c c'. (Arrow a) => a b c -> a b c' -> a b (Tuple c c')
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