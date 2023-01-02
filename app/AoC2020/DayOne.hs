module AoC2020.DayOne (dayOneAnswerOne, dayOneAnswerTwo) where

{- AoC 2020 Day 1
-- Conceptually, this puzzle is easy with list comprehensions, but doing it that way
-- runs into some efficiency issues.
--
-- For the first problem, we use a list comprehension which figures out which numbers add up to 2020
-- and then returns their product. However, the inefficiency starts even here in the fact that it
-- computes the values more than once. As a result, we need to take the head of the list. 
--
-- For the second problem, we do the same except that we want to find the triples instead of
-- the doubles. This adds a lot of computation time to the problem, which is made even worse by
-- the fact that we don't stop after we find the first result, and instead compute the entire
-- list with repeated values.
--
-- TODO: Use a better, more efficient implementation that 1 doesn't do redundant calculations and
-- 2 doesn't need to traverse the list as many times as this does.
-}

toInts :: String -> [Int]
toInts = fmap read . lines

getProduct :: [Int] -> [Int]
getProduct xs = [x * y | x <- xs, y <- xs, x + y == 2020 && x /= y]

-- | Gets the answer to the first question
-- 
-- Answer to my data is 158916
dayOneAnswerOne :: String -> Int
dayOneAnswerOne = head . getProduct . toInts

getProduct' :: [Int] -> [Int]
getProduct' xs = [x * y * z | x <- xs, y <- xs, z <- xs, x + y + z == 2020 && x /= y && y /= z && z /= x]

-- | Gets the answer to the second question
-- 
-- Answer to my data is 165795564
dayOneAnswerTwo :: String -> Int
dayOneAnswerTwo = head . getProduct' . toInts

