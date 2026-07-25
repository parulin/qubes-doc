COMMAND_BASE = python3 -m sphinx --show-traceback --keep-going --fail-on-warning --define html_theme=sphinx_rtd_theme
OUTPUT ?= $(or $(READTHEDOCS_OUTPUT),_build)
ifeq ($(READTHEDOCS_VERSION_TYPE),external)
	FULL_HTML_REQUIREMENTS=
else
	FULL_HTML_REQUIREMENTS=full-objects core-admin-full-html core-admin-client-full-html core-qrexec-full-html
	COMMAND_BASE:=$(COMMAND_BASE) --tag full
endif

.PHONY: autoxml
autoxml:
	make --keep-going --ignore-errors --directory core-admin/doc autoxml.rst

.PHONY: core-admin-objects
core-admin-objects :
	$(COMMAND_BASE) --builder objects core-admin/doc $(OUTPUT)/core-admin/html

.PHONY: core-admin-client-objects
core-admin-client-objects :
	$(COMMAND_BASE) --builder objects core-admin-client/doc $(OUTPUT)/core-admin-client/html

.PHONY: core-qrexec-objects
core-qrexec-objects :
	$(COMMAND_BASE) --builder objects core-qrexec/doc $(OUTPUT)/core-qrexec/html

.PHONY: qubes-doc-objects
qubes-doc-objects :
	$(COMMAND_BASE) --builder objects . $(OUTPUT)/html

.PHONY: full-objects
full-objects: autoxml core-admin-objects core-admin-client-objects core-qrexec-objects qubes-doc-objects

.PHONY: core-admin-full-html
core-admin-full-html:
	$(COMMAND_BASE) --builder html core-admin/doc $(OUTPUT)/html/core-admin

.PHONY: core-admin-client-full-html
core-admin-client-full-html:
	$(COMMAND_BASE) --builder html core-admin-client/doc $(OUTPUT)/html/core-admin-client

.PHONY: core-qrexec-full-html
core-qrexec-full-html:
	$(COMMAND_BASE) --builder html core-qrexec/doc $(OUTPUT)/html/core-qrexec

.PHONY: full-html
full-html: $(FULL_HTML_REQUIREMENTS)
	$(COMMAND_BASE) --builder html --doctree-dir _build/doctrees . $(OUTPUT)/html
	exit $$?

