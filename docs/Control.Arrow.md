# Module Documentation

## Module Control.Arrow

#### `Arrow`

``` purescript
class (Category a, Strong a) <= Arrow a where
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




