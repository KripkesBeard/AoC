module AoC2015.DayOne (dayOneAnswerOne) where

{- AoC 2015 Day One
--
-- This problem has a very straightfoward solution, as well as a more
-- complicated one, but the complicated one doesn't really save that
-- much time.
--
-- For the first problem, we just want to mask 1 to '(' and -1 to ')',
-- and then sum the resulting list. We can do this at the same time with
-- a fold.
--
-- For the second problem,
--
-}

-- | Masks parentheses to numerical value based on the input rules
maskToDigit :: Char -> Int
maskToDigit '(' =  1
maskToDigit ')' = -1
maskToDigit _   =  0

-- | Folds a list into a value according to the mask
sumToValue :: String -> Int
sumToValue = foldr ((+) . maskToDigit) 0


-- | Gets the answer to the first question
-- 
-- Answer to my data is 280
dayOneAnswerOne :: String -> Int
dayOneAnswerOne = sumToValue

