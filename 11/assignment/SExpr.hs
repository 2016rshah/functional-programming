{- CIS 194 HW 11
   due Monday, 8 April
-}

module SExpr where

import AParser
import Control.Applicative
import Data.Char

------------------------------------------------------------
--  1. Parsing repetitions
------------------------------------------------------------

zeroOrMore :: Parser a -> Parser [a]
zeroOrMore p = oneOrMore p <|> pure []
  
oneOrMore :: Parser a -> Parser [a]
oneOrMore p = (\x y -> x:y) <$> p <*> zeroOrMore p

--The applicative is really just how you manage things inside a functor without actually being able to wrap/unwrap the functor

------------------------------------------------------------
--  2. Utilities
------------------------------------------------------------

spaces :: Parser String
spaces = undefined

ident :: Parser String
ident = undefined

------------------------------------------------------------
--  3. Parsing S-expressions
------------------------------------------------------------

-- An "identifier" is represented as just a String; however, only
-- those Strings consisting of a letter followed by any number of
-- letters and digits are valid identifiers.
type Ident = String

-- An "atom" is either an integer value or an identifier.
data Atom = N Integer | I Ident
  deriving Show

-- An S-expression is either an atom, or a list of S-expressions.
data SExpr = A Atom
           | Comb [SExpr]
  deriving Show