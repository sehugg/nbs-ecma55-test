
BASRUN=node $(HOME)/PuzzlingPlans/8bitworkshop/gen/common/basic/run.js
ARGS=-d ECMA55

OUTFILES := $(patsubst %.BAS,%.out,$(wildcard *.BAS))

all: $(OUTFILES) fails

clean:
	rm -f $(OUTFILES)

fails:
	@egrep "TEST FAIL|FAILED" *.out | grep -v INFORMATIVE | wc -l
	@egrep "^###" *.out | wc -l
	@egrep "^@@@" *.out | wc -l
	@egrep "^###|^@@@|TEST FAIL|FAILED" *.out | grep -v INFORMATIVE > fails.txt
	diff expected.txt fails.txt

%.out: %.BAS
	-grep -hs ^ $*.in | $(BASRUN) $< $(ARGS) > $@
