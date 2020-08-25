OPTION DIALECT MODERN

sub printhello
  print "HELLO"
end sub

sub recurse(x)
  print x,
  for i = 1 to 5 : next i ' should be local var
  if (x > 1) then call recurse(x/2)
  total = total + x ' make sure x not touched
  print x,
end sub

sub dotoss(tosses)
  FOR toss = 1 to tosses
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
END SUB

call printhello
i = 10
x = 1
total = 0
call recurse(10)
print "---"
print x, total, i
if x <> 1 then print "TEST FAILED: X <> 1"
if i <> 10 then print "TEST FAILED: I <> 10"
if total <> 19.375 then print "TEST FAILED: TOTAL <> 19.375"
call printhello
h = 0
t = 0
call dotoss(15)
if h <> 3 or t <> 4 then ?"TEST FAILED"
print "TEST PASSED"
