gems        = zip "abcdefg" [1, 4, 1, 4, 2, 1, 3]

generate prefix gems len =
  let
    letters = gems >>= \(c, n) -> if n > 0 then [c] else []
    gems' c gs =
      gs >>= \(c', n) -> if c == c' then [(c', n - 1)] else [(c', n)]
  in
   if len > 0
   then
     prefix : (letters >>= \c ->
                generate (prefix ++ [c]) (gems' c gems) (len-1))
   else
     [prefix]

xs = zip [0..] (generate "" gems 16)

lookup_string goal ((i,s):xs) = 
  if s == goal
  then
    putStrLn $ (show i) ++ ":" ++  s
  else
    lookup_string goal xs

main = lookup_string "eagcdfbe" xs