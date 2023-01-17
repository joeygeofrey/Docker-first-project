setup:
	python3 -m venv ~/.dockerproject
	

install:
	pip install --upgrade pip &&\
	pip install -r requirements.txt
	sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
		sudo chmod +x /bin/hadolint


test:
	python -m pytest -vv --cov=myrepolib tests/*.py
	python -m pytest --nbval notebook.ipynb


lint:
	pylint --disable=R,C,W1203 app.py

all: install lint test