.DEFAULT_GOAL := init

DATA_DIR := /data
PDF_MASTER = $$(find $(DATA_DIR) -maxdepth 1 -name '*.pdf')

clean:
	@rm -rf $(DATA_DIR)/booklets/$${BOUCLETTES_LENGTH} $(DATA_DIR)/shards/$${BOUCLETTES_LENGTH}

shards: init
	@mkdir -p $(DATA_DIR)/shards/$${BOUCLETTES_LENGTH}
	@echo "[shards] Creating $${BOUCLETTES_LENGTH} pages shards"
	@qpdf --split-pages=$${BOUCLETTES_LENGTH} $(PDF_MASTER) $(DATA_DIR)/shards/$${BOUCLETTES_LENGTH}/%d.pdf
	@echo "[shards] Created $$(ls $(DATA_DIR)/shards/$${BOUCLETTES_LENGTH}/*.pdf | wc -l) shards"

booklets: init shards
	@mkdir -p $(DATA_DIR)/booklets/$${BOUCLETTES_LENGTH}
	@echo "[booklets] Creating $$(ls $(DATA_DIR)/shards/$${BOUCLETTES_LENGTH}/*.pdf | wc -l) booklets. This may take a while..."
	@for shard in $$(ls $(DATA_DIR)/shards/$${BOUCLETTES_LENGTH}/*.pdf); do \
		echo -n "."; \
		bookletimposer --no-gui --booklet --output=$(DATA_DIR)/booklets/$${BOUCLETTES_LENGTH}/$$(basename $${shard} .pdf).pdf $${shard} > /dev/null; \
	done
	@echo
	@echo "[booklets] Created $$(ls $(DATA_DIR)/booklets/$${BOUCLETTES_LENGTH}/*.pdf | wc -l) booklets"

init:
	@if [ -r $(PDF_MASTER) ]; then \
		echo "[system] Using PDF master file \"$$(basename $(PDF_MASTER))\""; \
	else \
		echo "[system] PDF master file \"$(PDF_MASTER)\" is missing"; \
		exit 1; \
	fi
