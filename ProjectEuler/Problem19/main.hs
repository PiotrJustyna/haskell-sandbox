-- 1 Jan 1900 was a Monday.
-- 2 Jan 1900 was a Tuesday.
-- 3 Jan 1900 was a Wednesday.
-- 4 Jan 1900 was a Thursday.
-- 5 Jan 1900 was a Friday.
-- 6 Jan 1900 was a Saturday.
-- 7 Jan 1900 was a Sunday.

startDay = 7
startMonth = 1
startYear = 1900
startCountingDay = 1
startCountingMonth = 1
startCountingYear = 1901
endDay = 31
endMonth = 12
endYear = 2000

main = do
  total <- scan (startDay, startMonth, startYear) 0
  putStrLn $ show total

scan :: (Int, Int, Int) -> Int -> IO Int
scan (day, month, year) total = do
  putStrLn $ "Day: " ++ show day ++ " Month: " ++ show month ++ " Year: " ++ show year

  if isFirstDateLater (day, month, year) (endDay, endMonth, endYear)
    then return total
    else if day == 1 && isFirstDateLater (day, month, year) (startCountingDay, startCountingMonth, startCountingYear)
      then scan (getNextSunday (day, month, year)) (total + 1)
      else scan (getNextSunday (day, month, year)) total

getNextSunday :: (Int, Int, Int) -> (Int, Int, Int)
getNextSunday (day, month, year) =
  if day == 31
    then if isDecember month
      then (7, 1, year + 1)
      else (7, month + 1, year)
    else if day == 30
      then if isDecember month
        then (6, 1, year + 1)
        else if is31DayMonth month
          then (6, month + 1, year)
          else (7, month + 1, year)
      else if day == 29
        then if isDecember month
          then (5, 1, year + 1)
          else if is31DayMonth month
            then (5, month + 1, year)
            else if is30DayMonth month
              then (6, month + 1, year)
              else (7, month + 1, year)
        else if day == 28
          then if isDecember month
            then (4, 1, year + 1)
            else if is31DayMonth month
              then (4, month + 1, year)
              else if is30DayMonth month
                then (5, month + 1, year)
                else if isLeapYearFebruary month year
                  then (6, month + 1, year)
                  else (7, month + 1, year)
          else if day < 28 && day > 21
            then if isDecember month
              then (if 31 - day >= 7 then (day + 7, month, year) else (day - 31 + 7, 1, year + 1))
              else if is31DayMonth month
                then (if 31 - day >= 7 then (day + 7, month, year) else (day - 31 + 7, month + 1, year))
                else if is30DayMonth month
                  then (if 30 - day >= 7 then (day + 7, month, year) else (day - 30 + 7, month + 1, year))
                  else if isLeapYearFebruary month year
                    then (if 29 - day >= 7 then (day + 7, month, year) else (day - 29 + 7, month + 1, year))
                    else (if 28 - day >= 7 then (day + 7, month, year) else (day - 28 + 7, month + 1, year))
            else (day + 7, month, year)

isLeapYearFebruary :: Int -> Int -> Bool
isLeapYearFebruary month year = month == 2 && isLeapYear year

isNonLeapYearFebruary :: Int -> Int -> Bool
isNonLeapYearFebruary month year = month == 2 && not (isLeapYear year)

is30DayMonth :: Int -> Bool
is30DayMonth month = month == 9 || month == 4 || month == 6 || month == 11

is31DayMonth :: Int -> Bool
is31DayMonth month = month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10

isDecember :: Int -> Bool
isDecember month = month == 12

isLeapYear :: Int -> Bool
isLeapYear year =
  if year `mod` 100 == 0
    then year `mod` 400 == 0
    else year `mod` 4 == 0

isFirstDateLater (day1, month1, year1) (day2, month2, year2) =
  year1 * 10000 + month1 * 100 + day1 > year2 * 10000 + month2 * 100 + day2
