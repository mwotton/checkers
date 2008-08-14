module Control.Monad.Extensions (satisfiesM) where

import Control.Applicative
import Control.Monad

satisfiesM :: Monad m => (a -> Bool) -> m a -> m a
satisfiesM p x = x >>= if' p return (const (satisfiesM p x))

if' :: Applicative f => f Bool -> f a -> f a -> f a
if' = liftA3 (\ c t e -> if c then t else e)