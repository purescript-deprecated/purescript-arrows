## Module Control.Arrow.Static

The `Static` arrow transformer for an `Applicative` functor.

#### `Static`

``` purescript
newtype Static f a b c
  = Static (f (a b c))
```

`Static` gives an `Arrow` instance for the static arrows of an `Applicative` functor.

##### Instances
``` purescript
instance semigroupoidStatic :: (Applicative f, Semigroupoid a) => Semigroupoid (Static f a)
instance categoryStatic :: (Applicative f, Category a) => Category (Static f a)
instance profunctorStatic :: (Functor f, Profunctor a) => Profunctor (Static f a)
instance strongStatic :: (Functor f, Strong a) => Strong (Static f a)
instance choiceStatic :: (Functor f, Choice a) => Choice (Static f a)
instance arrowStatic :: (Applicative f, Arrow a) => Arrow (Static f a)
```

#### `runStatic`

``` purescript
runStatic :: forall f a b c. Static f a b c -> f (a b c)
```

Unpack a `Static` arrow.


