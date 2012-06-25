PYTHON=python

.PHONY: test unit full-test pep8 clean

#
# testing
#
test:
	$(PYTHON) -m nose.core -v solace/tests

test-with-coverage:
	$(PYTHON) -m nose.core --with-coverage --cover-erase \
	   	--cover-package=solace solace/tests

#
# Everything else
#
run: 
	$(PYTHON) setup.py runserver

full-test:
	tox -e py27

pep8:
	pep8 -r --ignore E111,E225,E501 *.py solace

clean:
	find . -name "*.pyc" | xargs rm -f

tidy: clean
	rm -rf .tox

