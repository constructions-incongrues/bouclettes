.DEFAULT_GOAL := init

PDF_MASTER = $$(find $${BOUCLETTES_DATA_DIR} -maxdepth 1 -name '*.pdf')

clean:
	@rm -rf $${BOUCLETTES_DATA_DIR}/booklets/$${BOUCLETTES_LENGTH} $${BOUCLETTES_DATA_DIR}/shards/$${BOUCLETTES_LENGTH}

shards: init
	@mkdir -p $${BOUCLETTES_DATA_DIR}/shards/$${BOUCLETTES_LENGTH}
	@echo "[shards] Creating $${BOUCLETTES_LENGTH} pages shards"
	@qpdf --split-pages=$${BOUCLETTES_LENGTH} $(PDF_MASTER) $${BOUCLETTES_DATA_DIR}/shards/$${BOUCLETTES_LENGTH}/%d.pdf
	@echo "[shards] Created $$(ls $${BOUCLETTES_DATA_DIR}/shards/$${BOUCLETTES_LENGTH}/*.pdf | wc -l) shards"

booklets: init shards
	@mkdir -p $${BOUCLETTES_DATA_DIR}/booklets/$${BOUCLETTES_LENGTH}
	@echo "[booklets] Creating $$(ls $${BOUCLETTES_DATA_DIR}/shards/$${BOUCLETTES_LENGTH}/*.pdf | wc -l) booklets. This may take a while..."
	@for shard in $$(ls $${BOUCLETTES_DATA_DIR}/shards/$${BOUCLETTES_LENGTH}/*.pdf); do \
		echo -n "."; \
		bookletimposer --no-gui --booklet --output=$${BOUCLETTES_DATA_DIR}/booklets/$${BOUCLETTES_LENGTH}/$$(basename $${shard} .pdf).pdf $${shard} > /dev/null; \
	done
	@echo
	@echo "[booklets] Created $$(ls $${BOUCLETTES_DATA_DIR}/booklets/$${BOUCLETTES_LENGTH}/*.pdf | wc -l) booklets"

permissions:
	@chown -R 1000:1000 $${BOUCLETTES_DATA_DIR}

init:
	@if [ -r $(PDF_MASTER) ]; then \
		echo "[system] Using PDF master file \"$$(basename $(PDF_MASTER))\""; \
	else \
		echo "[system] PDF master file \"$(PDF_MASTER)\" is missing"; \
		$(MAKE) --no-print-directory dump; \
		exit 1; \
	fi

dump:
	@echo "[system] Dumping configuration"
	@env | grep BOUCLETTES_ | sort