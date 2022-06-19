module AoC2021.DayTwo (dayTwoAnswerOne, dayTwoAnswerTwo) where

{- AoC Day 2
-- This puzzle involves mapping a set of directions to numerical values and then doing something with those values.
--
-- For the first problem, we turn the input text into a data type representing a directional input and magnitude.
-- Then we define a function that updates a position (tuple of Ints) based on the input rules. Finally
-- We calculate the answer by recursively updating a starting position using the list of directions.
-- 
-- For the second problem, the idea is the exact same except that we need to add a new parameter to keep track of,
-- and we need to change how position is updated according to the new puzzle rules.
--
-- TODO: The recursion is naive and ugly, I need to think of a better way to write it.
-}

import Data.Char (toUpper)


-- Problem 1


-- Type aliases for Position value
type Horizontal = Int
type Depth      = Int
type Position    = (Horizontal, Depth)

-- Data type for directions, wraps an int in the direction the movement happens in
data Direction
  = Forward Int
  | Down Int
  | Up Int
  deriving (Show, Read, Eq)

-- A helper function to capitalize the first letter of a string, so that we can read the directions into the Direction type
firstToUpper :: String -> String
firstToUpper []     = []
firstToUpper (x:xs) = toUpper x : xs

-- Reads the directions into a list of Direction
readDirection :: [String] -> [Direction]
readDirection = fmap read

-- Composes the above with lines to turn the raw string into a list of Directions
intoDirection :: String -> [Direction]
intoDirection = readDirection . fmap firstToUpper . lines

-- Updates a position given a direction according to the puzzle rules
updatePosition :: Direction -> Position -> Position
updatePosition (Forward n) (h, d) = (h + n, d)
updatePosition (Down n)    (h, d) = (h, d + n)
updatePosition (Up n)      (h, d) = (h, d - n)

-- Calculates the end position from a starting one and a list of directions
calcPosition :: [Direction] -> Position -> Position
calcPosition []     (h,d) = (h,d)
calcPosition (x:xs) (h,d) = calcPosition xs (updatePosition x (h,d))

-- Calculates the final position from a string of directions
-- Answer to my data is 1654760
dayTwoAnswerOne :: String -> Int
dayTwoAnswerOne = mult . (`calcPosition` (0, 0)) . intoDirection
  where
    mult (x, y) = x*y


-- Problem 2


-- Type aliasing for new position type
type Aim        = Int
type Position'   = (Horizontal, Depth, Aim)

-- Update a Position 
updatePosition' :: Direction -> Position' -> Position'
updatePosition' (Forward n) (h,d,a) = (h + n, a*n + d, a) 
updatePosition' (Down n)    (h,d,a) = (h, d, a + n)
updatePosition' (Up n)      (h,d,a) = (h, d, a - n)

-- Recursively turn a list of Directions into a Position
calcPosition' :: [Direction] -> Position' -> Position'
calcPosition' []     (h,d,a) = (h,d,a)
calcPosition' (x:xs) (h,d,a) = calcPosition' xs (updatePosition' x (h,d,a))

-- Finds the answer by taking a string of directions, composing all of the above
-- and then multiplying the final horizontal by depth
-- Answer to my data is 1956047400
dayTwoAnswerTwo :: String -> Int
dayTwoAnswerTwo = mult . (`calcPosition'` (0, 0, 0)) . intoDirection
  where
    mult (x,y,z) = x*y