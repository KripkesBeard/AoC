module AoC2022.DayThree (dayThreeAnswerOne, dayThreeAnswerTwo) where

import Data.List (intersect, nub)
import Data.List.Split (chunksOf)
import Data.Char (ord, isAsciiLower, isAsciiUpper)



-- Problem 1


-- | Splits a list at half way
--
-- The problem input is always even, but this could be weird if the input is odd 
splitAtHalf :: [a] -> ([a], [a])
splitAtHalf xs = splitAt (length xs `div` 2) xs

-- | Wrapper for list intersection that also gets the item out
--
-- Unsafe because if the intersection is empty, head will throw an error
intersection :: Eq a => ([a], [a]) -> a
intersection = head . uncurry intersect

-- | Assigns an int value to a letter based on 'a' = 1, through 'Z' = 52
intMask :: Char -> Int
intMask c
  | isAsciiLower c = ord c - 96
  | isAsciiUpper c = ord c - 38
  | otherwise = 0

-- | fold over a list of strings with splitting in half, finding the intersection, 
--   masking that character to an int, and then summing.
calcSum :: [String] -> Int
calcSum = foldr ((+) . intMask . intersection . splitAtHalf) 0

-- | Lines the input, then calculate the sum
--
-- Answer to my data is 7446
dayThreeAnswerOne :: String -> Int
dayThreeAnswerOne = calcSum . lines


-- Problem 2


-- | Removes duplicate elements and then chunks the lists into groups of three
groupLists :: [String] -> [[String]]
groupLists = chunksOf 3 . nub

-- | Maps a fold over internal lists to get their intersection then 
--   takes the head of each to return a single list
--
-- Unsafe
getIntersections :: [[String]] -> String
getIntersections = fmap $ head . foldr1 intersect

-- | Folds the int mask over a string
foldMask :: String -> Int
foldMask = foldr ((+) . intMask) 0 


-- | Lines the input, group the lists together, get their intersections, fold the int mask for the total.
--
-- Answer to my data is 
dayThreeAnswerTwo :: String -> Int
dayThreeAnswerTwo = foldMask . getIntersections . groupLists . lines 

