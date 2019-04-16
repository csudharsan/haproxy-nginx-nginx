"""
Procedure to Install & Test the tool
"""

Pre-req:
=============
1. Install virtual box
2. Install vagrant

Steps:
================

In addition to above, we need to have the following,

3. We need additional plugin for rysncing files, install it using
   Run: # vagrant plugin install vagrant-gatling-rsync

4. Run # vagrant up
   The above command creates the following
     - ansible controller
     - haproxy Test1
     - nginx webserver Test2 and webserver Test3




Run Ansible Playbook for software isntallations 
=============================================
Login to ansible-controller, 
#vagrant ssh ac
# cd /vagrant/celera_automation
# export ANSIBLE_HOST_KEY_CHECKING=False
# ansible-playbook -i hosts site.yaml

The above installs the playbook with haproxy, nginx and nginx

How to Test?
==================

curl http://localhost/probe_local
---------------------------------

[vagrant@Test1 ~]$ curl http://localhost/probe_local
<html>
  <body>
    <p>Serving request from Test3</p>
  </body>
</html>

curl http://localhost/probe_applicant
------------------------

[vagrant@Test2 ~]$ curl http://localhost/probe_applicant
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Celera</title>
</head>
<body>
<b>
<u>24/7 on-call - </u> Sudharsan
</b>
  		
On call week March-17 to March 23, 2019
<table>
  
<tr>
 <td>Mon</td>
 <td>Tue</td>
 <td>Wed</td>
 <td>Thu</td>
 <td>Fri</td>
 <td>Sat</td>
 <td>Sun</td>
</tr>
<tr>
 <td>Sudharsan</td>
 <td>Chris</td>
 <td>Sam</td>
 <td>Sudharsan</td>
 <td>Chris</td>
 <td>Sudharsan</td>
 <td>Sam</td>
 
</tr>
</table>
</body>
</html>



curl http://localhost/probe_remote
---------------------------------

[vagrant@Test1 ~]$ curl http://localhost/probe_remote
Hello World!

curl http://localhost/*
------------------------

[vagrant@Test1 ~]$ curl http://localhost/*
<html>
<head><title>301 Moved Permanently</title></head>
<body bgcolor="white">
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx</center>
</body>
</html>




Additional's Handled
==================
In addition please make sure:
- Production settings should be reflected in the haproxy, nginx, sysctl, etc. settings
SE Linux enabled
sysctl settings done
Automated solution

- Please take the number of CPUs on the local machine into account for the nginx settings
Considered using ansible facts variable : ansible_processor_vcpus which uses the host cpu's


- All hosts are reboot safe
Persisted boot up configs

- Documentation is in place where applicable
- Document and comments added whereaver required.



Issues Faced:-
================

I was not able to use 192.168.30.1 due to routing ip issue in network card.
Used 30.2 to 30.5 IP's

I was using MAC sierra, which had problem with nfs mount, so need to using vagrant rsync plugin.

