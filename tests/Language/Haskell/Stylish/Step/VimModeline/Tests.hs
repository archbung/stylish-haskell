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
    , testCase "case 02" case02
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

-- | If there's a modeline already, overwrite it
case02 :: Assertion
case02 = expected @=? testStep (step 2) input
  where
    input = unlines
        [ "-- vim:set ts=4 sts=4 sw=4 et:"
        , "module Main"
        , "    where"
        , "data Foo"
        , "    = Bar"
        , "    | Qux"
        ]

    expected = unlines
        [ "-- vim:set ts=2 sts=2 sw=2 et:"
        , "module Main"
        , "    where"
        , "data Foo"
        , "    = Bar"
        , "    | Qux"
        ]
