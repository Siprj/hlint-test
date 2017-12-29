# hlint-test

[![Build Status](https://travis-ci.org/Siprj/hlint-test.svg?branch=master)](https://travis-ci.org/Siprj/hlint-test)
[![Hackage](https://img.shields.io/hackage/v/hlint-test.svg?style=flat)](https://hackage.haskell.org/package/hlint-test)
[![Hackage Dependencies](https://img.shields.io/hackage-deps/v/hlint-test.svg?style=flat)](http://packdeps.haskellers.com/reverse/hlint-test)
[![Stackage LTS](http://stackage.org/package/hlint-test/badge/lts)](http://stackage.org/lts/package/hlint-test)
[![Stackage Nightly](http://stackage.org/package/hlint-test/badge/nightly)](http://stackage.org/nightly/package/hlint-test)
[![BSD3 License](http://img.shields.io/badge/license-BSD3-brightgreen.svg?style=flat)](https://tldrlegal.com/license/bsd-3-clause-license-(revised))

This package aims to make easy to automatically run hlint as part of unit tests.
That means hlint will be run when you execute `cabal test` or `stack test`.

## How to make it work

Hlint-test package contains GHC preprocessor which will generate the code
containing hlint runner. To invoke the preprocessor, create new test and put
following line into it:

```
{-# OPTIONS_GHC -F -pgmF hlint-test #-}
```

Don't forget to add the test into cabal file (or package.yaml respectively) as
separated test runner ;).

Now you can run the test simply by `stack test` or `cabal test`.

## Hlint options

If you need to you can use the preprocessor macro to pass some additional
arguments to the hlint. As it's shown on following line:

```
{-# OPTIONS_GHC -F -pgmF hlint-test -optF src -optF -r #-}
```

This will tell hlint to look for source codes only in `src` directory and to
generate html report if some suggestions are found.

Also you can use hlint configuration file too ;).

## Example

Simple example of the use can be seen in
https://github.com/Siprj/hlint-test-example
