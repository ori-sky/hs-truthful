module Data.Truthful where

import Data.Maybe (isJust)
import Data.Either (isRight)

class Truthful a where
    isTruthful :: a -> Bool
    isTruthful = not . notTruthful
    {-# INLINE isTruthful #-}

    notTruthful :: a -> Bool
    notTruthful = not . isTruthful
    {-# INLINE notTruthful #-}

    {-# MINIMAL isTruthful | notTruthful #-}

instance Truthful Bool where isTruthful = id
instance Truthful [a] where notTruthful = null
instance Truthful (Maybe a) where isTruthful = isJust
instance Truthful (Either l r) where isTruthful = isRight
