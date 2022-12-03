module AoC2021.DayOne (dayOneAnswerOne, dayOneAnswerTwo) where

{- AoC 2021 Day 1
-- This puzzle is pretty easy when you take advantage of the power of zip.
--
-- For the first problem, we can zip a list of numbers to itself offset by one (using head)
-- in order to get pairs of adjacent measurements. zipWith takes an extra function and then
-- fmaps that funciton over the resulting of pairs, so we use a binary mask to tell which
-- intervals increase and which don't. The answer then is just the sum of the list.
--
-- For the second problem, we first need to group the list up into triples using the same sort of
-- offset, and this can also be done with zip3, but then we want to sum those into their total, which
-- one again can be automatically fmapped with zipWith3. We then feed that list into the same process
-- of masking and summing to get the final answer.
-}



-- Problem 1 


-- | Turn input into list of ints 
scanNums :: String -> [Int]
scanNums = fmap (\x -> read x :: Int) . words

-- | Masks 1 or 0 according to wether or not the first number is smaller than the second number
checkInc :: Ord a => a -> a -> Int
checkInc x y
  | x < y     = 1
  | otherwise = 0

-- | Turn the list into a pair of lists offset by one, zip them togehter, then map them into a list of 1,0s according to inc/dec
intervals :: [Int] -> [Int]
intervals xs = zipWith checkInc xs $ tail xs

-- | Gets the answer to the first question
-- 
-- Answer to my data is 1387
dayOneAnswerOne :: String -> Int
dayOneAnswerOne = sum . intervals . scanNums


-- Problem 2


-- | Sums the total measurements of three adjacent inputs
sumThreeAdj :: Num a => [a] -> [a]
sumThreeAdj xs = zipWith3 (\x y z -> x + y + z) xs (tail xs) (tail . tail $ xs)

-- | Gets the answer to the second question
-- 
-- Answer to my data is 1362
dayOneAnswerTwo :: String -> Int
dayOneAnswerTwo = sum . intervals . sumThreeAdj . scanNums