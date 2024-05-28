.PHONY: help unbundle

all:
	echo "TODO"

unbundle: ## extract the files from within the ccsb bundle
	unzip -d all_spells all_spells.ccsb

bundle: ## put bundle contents from a directory back into the ccsb file
	 cd all_spells && zip -r ../all_spells.ccsb ./* && cd ..

help: ## Shows this help.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done
