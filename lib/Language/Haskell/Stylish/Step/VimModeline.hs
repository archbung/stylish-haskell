module Language.Haskell.Stylish.Step.VimModeline
    ( step
    ) where

import Language.Haskell.Stylish.Step


step :: Int -> Step
step spaces = makeStep "VimModeline" $ \ls _ -> modeline:ls
    where
        modeline = "-- vim:set ts=" ++ show spaces ++
                   " sts=" ++ show spaces ++ " sw=" ++ show spaces ++ " et:"

