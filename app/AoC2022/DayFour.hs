module AoC2022.DayFour (dayFourAnswerOne, dayFourAnswerTwo) where

import Control.Applicative (liftA2)
import Data.List.Split (splitOn)
import Data.List (union, intersect, sort)



-- Problem 1


-- | takes a list of two numbers and enumerates from the first to the second 
--
-- Unsafe because of head
generateIntervals :: [Int] -> [Int]
generateIntervals [] = []
generateIntervals (x:xs) = enumFromTo x (head xs)

-- | Takes a list of strings and does a couple of things. First it splits them into sublists on ','
--   then it splits those sublists on '-' and reads those into ints, then it uses those the resulting
--   ints to generate an interval from the first to the second. fmap fmap fmap fmap fmap
--
-- This is an abomination.
splitAndGenerateIntervals :: Functor f => f String -> f [[Int]]
splitAndGenerateIntervals = fmap (fmap (generateIntervals . (fmap read . splitOn "-")) . splitOn ",")


-- | Tests to see whether one list is a super set of the other by checking to see if their union is the same as either.
contains :: [Int] -> [Int] -> Int
contains xs ys
  | xs == unin || ys == unin = 1
  | otherwise                = 0
  where
    unin = sort $ xs `union` ys

-- | Takes a list of lists of ints and tests for the super set relation on each pair.
-- 
-- Unsafe
grabListsForContains :: [[Int]] -> Int
grabListsForContains = liftA2 contains head (head . tail)

-- | 
foldListsContains :: [[[Int]]] -> Int
foldListsContains = foldr ((+) . grabListsForContains) 0

-- | 
--
-- Answer to my data is 576
dayFourAnswerOne :: String -> Int
dayFourAnswerOne = foldListsContains . splitAndGenerateIntervals . lines

-- | 
overlap :: [Int] -> [Int] -> Int
overlap xs ys
  | null inter = 0
  | otherwise = 1
  where
    inter = xs `intersect` ys

-- | 
--
-- Unsafe
grabListsForOverlap :: [[Int]] -> Int
grabListsForOverlap = liftA2 overlap head (head . tail)

-- | 
foldListsOverlap :: [[[Int]]] -> Int
foldListsOverlap = foldr ((+) . grabListsForOverlap) 0

-- | 
--
-- Answer to my data is 905
dayFourAnswerTwo :: String -> Int
dayFourAnswerTwo = foldListsOverlap . splitAndGenerateIntervals . lines