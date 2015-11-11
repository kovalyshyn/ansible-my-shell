#
# Tasks Makefile
# ==============
#
# Shortcuts for various tasks.
#

PRIVATE_KEY=~/.ssh/id_rsa

install:
	@(ansible-playbook -i hosts playbook.yml -u root -t my-shell --private-key $(PRIVATE_KEY))

install-docker:
	@(ansible-playbook -i hosts playbook.yml -u samael -t docker --private-key $(PRIVATE_KEY))

ufw:
	@(ansible-playbook -i hosts playbook.yml -u samael -t ufw --private-key $(PRIVATE_KEY))

setup:
	@(ansible common -i hosts -m setup -u samael --private-key $(PRIVATE_KEY))

ping:
	@(ansible common -i hosts -m ping -u samael --private-key $(PRIVATE_KEY))

show-tasks:
	@(ansible-playbook -i hosts playbook.yml --list-tasks)

show-hosts:
	@(ansible-playbook -i hosts playbook.yml --list-hosts)

