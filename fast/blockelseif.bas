OPTION DIALECT MODERN
h = t = 0
FOR toss = 1 to 15
	IF (toss mod 5) = 0 THEN
		PRINT "Fuzz"
                h = h + 1
        ELSE IF (toss mod 3) = 0 THEN
                t = t + 1
        	PRINT "Bizz"
        ELSE
                PRINT "."
        END IF
NEXT toss
if h <> 3 or t <> 4 then ?"TEST FAILED"
END
