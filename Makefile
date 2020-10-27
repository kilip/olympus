-include ".env"

ansible 	:= "./.venv/bin/ansible"
playbook 	:= "./.venv/bin/ansible-playbook"
pip 		:= "./.venv/bin/pip"

.PHONY: pyenv
pyenv:
	@if [ ! -d ".venv" ]; then \
		echo "Creating python3 virtual environment"; \
		python3 -m venv .venv; \
	fi

.PHONY: deps
deps:
	$(pip) install --upgrade pip
	$(pip) install --upgrade wheel
	$(pip) install -r requirements.txt

.PHONY: ping
ping:
	$(.ansible) -m ping all

