
BASRUN=node $(HOME)/PuzzlingPlans/8bitworkshop/gen/common/basic/run.js
ARGS=

OUTFILES := \
	$(patsubst NBS/%.BAS,NBS/%.test,$(wildcard NBS/*.BAS)) \
	$(patsubst basic_computer_games/%.bas,basic_computer_games/%.test,$(wildcard basic_computer_games/*.bas)) \
	$(patsubst fast/%.bas,fast/%.test,$(wildcard fast/*.bas)) \
	$(patsubst PCC/%.HPB,PCC/%.test,$(wildcard PCC/*.HPB)) \
	$(patsubst presets/%.bas,presets/%.test,$(wildcard presets/*.bas)) \

all: $(OUTFILES) fails

clean:
	rm -f $(OUTFILES)

fails:
	@egrep "TEST FAIL|FAILED" $(OUTFILES) | grep -v INFORMATIVE | wc -l
	@egrep "^###" $(OUTFILES) | wc -l
	@egrep "^@@@" $(OUTFILES) | wc -l
	@egrep "^###|^@@@|TEST FAIL|FAILED" $(OUTFILES) | grep -v INFORMATIVE > fails.txt
	diff expected.txt fails.txt

NBS/%.test: NBS/%.BAS
	-grep -hs ^ NBS/$*.in | $(BASRUN) -d ECMA55 $< $(ARGS) > $@

fast/%.test: fast/%.bas
	-cat fast/$*.input | $(BASRUN) -d BASIC80 $< $(ARGS) > $@
	-diff fast/$*.output $@

basic_computer_games/%.test: basic_computer_games/%.bas
	-cat basic_computer_games/$*.input | $(BASRUN) -d BASIC80 $< $(ARGS) > $@
	-diff basic_computer_games/$*.output $@

PCC/%.test: PCC/%.HPB
	-cat PCC/$*.input | $(BASRUN) -d HPBASIC $< $(ARGS) > $@
	-diff PCC/$*.output $@

presets/%.test: presets/%.bas
	-cat presets/$*.input | $(BASRUN) $< $(ARGS) > $@
	-diff presets/$*.output $@

