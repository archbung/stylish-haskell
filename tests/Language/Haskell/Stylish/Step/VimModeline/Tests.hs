--------------------------------------------------------------------------------
module Language.Haskell.Stylish.Step.VimModeline.Tests
    ( tests
    ) where


--------------------------------------------------------------------------------
import           Test.Framework                 (Test, testGroup)
import           Test.Framework.Providers.HUnit (testCase)
import           Test.HUnit                     (Assertion, (@=?))


--------------------------------------------------------------------------------
import           Language.Haskell.Stylish.Step.VimModeline
import           Language.Haskell.Stylish.Tests.Util


--------------------------------------------------------------------------------
tests :: Test
tests = testGroup "Language.Haskell.Stylish.Step.VimModeline.Tests"
    [ testCase "case 01" case01
    ]


--------------------------------------------------------------------------------
case01 :: Assertion
case01 = expected @=? testStep (step 4) input
  where
    input = unlines
        [ "module Main"
        , "    where"
        , "data Foo"
        , "    = Bar"
        , "    | Qux"
        ]

    expected = unlines
        [ "-- vim:set ts=4 sts=4 sw=4 et:"
        , "module Main"
        , "    where"
        , "data Foo"
        , "    = Bar"
        , "    | Qux"
        ]
