# integration-deployment-pipelines
My work on prototyping or setting up small Ci/CD pipelines


This pipeline demonstrates CI/CD capabilities in two ways (maybe it's overkill, but I wanted to show my knowledge of Python, Fabric, my learnings around CircleCI and what infrastructure provisioning
looks like, in addition to Ansible configuration.

The pipeline works fine without the Ansible...but I wanted to add it as a way of showing a more mature way of provisioning a server rather than just via requirements.txt and Fabric.

A 'git push' should kick off the pipeline.  I've included screen caps.  The Ansible isn't fully tested as I ran out of time and had too much on my plate.  But out of sheer interest, I plan on
returning to it for completion this week.

Needed:

1) Terraform...install terraform and run 'terraform apply' AFTER first adjusting the variables (plug in a VPC id, AWS creds, etc).  You will see an EC2 come to life.
2) Ansible (if you want to play with the Ansible scripts)
3) Add the new IP to fabfile.py (if that's your deployment route) or to Ansible's hosts file.  Or both.  The Ansible can be used to do the original provisioning
and fabric and requirements can be used for subsequent pushes.
4) Run the Ansible playbook with something like:
        ansible-playbook playbook.yml -u ubuntu --private-key "~/.ssh/flask-deploy.pem"
5) I can provide the key separately if you like.
6) I tested the pipeline when I just originally did it with fabfile.py and circleci and code changes deployed fine.
7) If I'd done this with ECS, I could provision a cluster and scale it..in this case, I added logic in my Terraform to add more instances.
8) Not tested with feature branch merging
9) Port 443 is open...did not have time to set up a Let's Encrypt cert, etc
10) http://54.208.14.246:5000/


