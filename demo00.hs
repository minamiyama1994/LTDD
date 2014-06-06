main :: IO ( )
main = getLine >>= \ x -> putStrLn ( x ++ "さんこんにちは！" )