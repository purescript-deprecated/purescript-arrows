## Module Control.Arrow

Type classes and standard instances for Arrows.

#### `Arrow`

``` purescript
class (Category a, Strong a) <= Arrow a
```

The `Arrow` type class combines the operations of a `Category` with those of
a `Strong` profunctor.

##### Instances
``` purescript
instance arrowFunction :: Arrow Function
```

#### `ArrowZero`

``` purescript
class (Arrow a) <= ArrowZero a where
  azero :: forall b c. a b c
```

Arrows with zero morphisms

#### `ArrowPlus`

``` purescript
class (ArrowZero a) <= ArrowPlus a where
  aplus :: forall b c. a b c -> a b c -> a b c
```

Arrows with a monoidal operation on morphisms

#### `(<+>)`

``` purescript
(<+>) :: forall a b c. (ArrowPlus a) => a b c -> a b c -> a b c
```

An infix alias for `aplus`. 


