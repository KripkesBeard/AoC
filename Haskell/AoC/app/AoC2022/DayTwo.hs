module AoC2022.DayTwo (dayTwoAnswerOne, dayTwoAnswerTwo) where

import Control.Applicative

{- 
-- A more CS style answer would involve using a dictonary to map letter inputs to int values
-- but that's kind of what I'm doing with the zipWith function, the dictionary is just a pair.
-- But an even better Haskell answer would be to convert the input into a custom datatype and 
-- then pattern match on it instead of using these ad hoc guards.
-}



-- Problem 1


-- | Creates a list of the first character of each string
grabFirst :: [String] -> [Char]
grabFirst = fmap head

-- | Creates a list of the third character of each string
grabSecond :: [String] -> [Char]
grabSecond = fmap $ head . tail . tail 

-- | Calculates user score by matching on the inputs
-- This is really ugly, and a better way would be to create a custom data type read from the character input 
-- and pattern match on it.
calcScore :: Char -> Char -> Int
calcScore x y 
  | (x == 'A' && y == 'Z') || (x == 'B' && y == 'X') || (x == 'C' && y == 'Y') = 0 + userShapeScore -- loss
  | (x == 'A' && y == 'X') || (x == 'B' && y == 'Y') || (x == 'C' && y == 'Z') = 3 + userShapeScore -- tie
  | (x == 'A' && y == 'Y') || (x == 'B' && y == 'Z') || (x == 'C' && y == 'X') = 6 + userShapeScore -- win
  | otherwise = 0
  where
    shapeScore s 
      | s == 'X'  = 1
      | s == 'Y'  = 2
      | s == 'Z'  = 3
      | otherwise = 0
    userShapeScore = shapeScore y

-- | Lines the input, then calculate the score for each round, then sum the totals 
-- 
-- Answer to my data is 13809
dayTwoAnswerOne :: String -> Int
dayTwoAnswerOne = sum . liftA2 (zipWith calcScore) grabFirst grabSecond . lines 


-- Problem 2


-- | Calculate user score based off of the second question's rules change
calcScore' :: Char -> Char -> Int
calcScore' x y 
  | y == 'X' = losePath x
  | y == 'Y' = drawPath x
  | y == 'Z' = winPath  x
  | otherwise = 0
  where
    losePath c -- 0 for losing plus
      | c == 'A' = 3 -- lose against rock is play scissors
      | c == 'B' = 1 -- lose against paper is play rock
      | c == 'C' = 2 -- lose against scissors = play paper
      | otherwise = 0
    drawPath c -- 3 for drawing plus
      | c == 'A' = 3 + 1
      | c == 'B' = 3 + 2
      | c == 'C' = 3 + 3
      | otherwise = 0
    winPath c -- 6 for winning plus
      | c == 'A' = 6 + 2
      | c == 'B' = 6 + 3
      | c == 'C' = 6 + 1
      | otherwise = 0

-- | Same as first answer but with the altered score calculation
-- 
-- Answer to my data is 12316
dayTwoAnswerTwo :: String -> Int
dayTwoAnswerTwo = sum . liftA2 (zipWith calcScore') grabFirst grabSecond . lines 