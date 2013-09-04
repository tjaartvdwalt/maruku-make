SHELL = /bin/sh
MARUKU = /home/tjaart/.rvm/gems/ruby-2.0.0-p195/bin/maruku
TMP_DIR = tmp
MATH_ENGINE = blahtex
OUTPUT_DIR = rendered

%.html:	%.md create_dirs
	cd $(TMP_DIR); $(MARUKU) --math-engine $(MATH_ENGINE) --html  -o ../$(OUTPUT_DIR)/$@ ../$<

# For some reason the pdf option does not respect the output dir option. move the file manually.
%.pdf: %.md create_dirs
	cd $(TMP_DIR); $(MARUKU) --math-engine $(MATH_ENGINE) --pdf  -o ../$(OUTPUT_DIR)/$@ ../$<; mv $@ ../$(OUTPUT_DIR)

%.tex: %.md create_dirs
	cd $(TMP_DIR); $(MARUKU) --math-engine $(MATH_ENGINE) --tex  -o ../$(OUTPUT_DIR)/$@ ../$<

create_dirs:
	mkdir -p $(TMP_DIR)
	mkdir -p $(OUTPUT_DIR)

clean: clean_tmp clean_output

clean_tmp:
	rm -rf $(TMP_DIR)

clean_output:
	rm -rf $(OUTPUT_DIR)

