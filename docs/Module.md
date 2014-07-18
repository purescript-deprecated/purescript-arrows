# Module Documentation

## Module Control.Arrow

### Type Classes

    class (Category a) <= Arrow a where
      arr :: forall b c. (b -> c) -> a b c
      first :: forall b c d. a b c -> a (Tuple b d) (Tuple c d)

    class ArrowPlus a where
      (<+>) :: forall b c. a b c -> a b c -> a b c

    class ArrowZero a where
      azero :: forall b c. a b c


### Type Class Instances

    instance arrowFunction :: Arrow Prim.Function


### Values

    (&&&) :: forall a b b' c c'. (Arrow a) => a b c -> a b c' -> a b (Tuple c c')

    (***) :: forall a b b' c c'. (Arrow a) => a b c -> a b' c' -> a (Tuple b b') (Tuple c c')

    second :: forall a b c d. (Arrow a) => a b c -> a (Tuple d b) (Tuple d c)


## Module Control.Arrow.Kleisli

### Types

    data Kleisli m a b where
      Kleisli :: a -> m b -> Kleisli m a b


### Type Class Instances

    instance arrowKleisli :: (Monad m) => Arrow (Kleisli m)

    instance categoryKleisli :: (Monad m) => Category (Kleisli m)

    instance semigroupoidKleisli :: (Monad m) => Semigroupoid (Kleisli m)


### Values

    runKleisli :: forall m a b. Kleisli m a b -> a -> m b