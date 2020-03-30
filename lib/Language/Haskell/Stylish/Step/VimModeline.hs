module Language.Haskell.Stylish.Step.VimModeline
    ( step
    ) where

import Language.Haskell.Stylish.Step
import Data.List


step :: Int -> Step
step spaces = makeStep "VimModeline" $ \ls _ -> 
    if existsModeline ls
       then modeline:(tail ls)
       else modeline:ls
    where
        modeline = "-- vim:set ts=" ++ show spaces ++
                   " sts=" ++ show spaces ++ " sw=" ++ show spaces ++ " et:"

existsModeline :: Lines -> Bool
existsModeline [] = False
existsModeline (x:_) = "-- vim:" `isPrefixOf` x
