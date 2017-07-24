from __future__ import with_statement
import json
from fabric.api import *
from contextlib import contextmanager as _contextmanager
from fabric.network import ssh
ssh.util.log_to_file("paramiko.log", 10)

env.user = 'ubuntu'
env.directory = '/home/ubuntu/flaskapp'
env.use_ssh_config = True
env.activate = 'source /home/ubuntu/flaskapp/env/bin/activate'
env.hosts = ['54.208.14.246']


@ _contextmanager
def virtualenv():
    with cd(env.directory):
        with prefix(env.activate):
            yield


def deploy():
    with virtualenv():
        run('git pull')
        run('pip install -r requirements.txt')
        run('sudo supervisorctl restart web:')
        # TODO send email