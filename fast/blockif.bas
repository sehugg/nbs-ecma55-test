OPTION DIALECT MODERN
h = t = 0
FOR toss = 1 to 10
	IF (toss mod 2) = 0 THEN
		PRINT "Heads, you win"
                h = h + 1
        ELSE
                t = t + 1
        	PRINT "Tails, you lose"
        END IF
NEXT toss
if h <> 5 or t <> 5 then ?"TEST FAILED"
END
