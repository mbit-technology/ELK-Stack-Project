## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

- (Images/ELK_Stack_Network_Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YML file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly responsive, in addition to restricting traffic to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the containers and system files.

- Filebeat watches for and collects log files

The configuration details of each machine may be found below.

| Name                     | Function   | IO Address | Operation System           |
|--------------------------|------------|------------|----------------------------|
| Jump-Box-<br>Provisioner | Gateway    | 10.4.0.4   | Linux Ubuntu 18.04-<br>LTS |
| Web-1                    | Web Server | 10.4.0.5   | Linux Ubuntu 18.04-<br>LTS |
| Web-2                    | Web Server | 10.4.0.6   | Linux Ubuntu 18.04-<br>LTS |
| ELK-SERVER               | Kibana IDS | 10.5.0.4   | Linux Ubuntu 18.04-<br>LTS |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

- 98.171.32.131

Machines within the network can only be accessed byJump-Box-Provisioner.

- Web-1:10.4.0.5
- Web-2:10.4.0.6

A summary of the access policies in place can be found in the table below.

| Name                     | Publicly <br>Accessible | Function   | IP Address          |
|--------------------------|-------------------------|------------|---------------------|
| Jump-Box-<br>Provisioner | Yes                     | SSH        | 10.4.0.4<br>168.62.218.194 |
| Web-1                    | No                      | Web Server | 10.4.0.5            |
| Web-2                    | No                      | Web Server | 10.4.0.6            |
| ELK-SERVER               | Yes                     | Kibana IDS | 10.5.0.4<br>40.117.140.8 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because:

- Allows for quick and effecient deployment
- Ability to streamline containers with doscker and configure common VMs that have the same configurats at the same time and ensure they are all consistant. 

The playbook implements the following tasks:
- Uses spy module docker.io
- Installs pip3 adn docker python module
- Increases and uses more virtual memory for ELK-SERVER
- Downloads and launches docker ELK container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

- (Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

- Web-1: 10.4.0.5
- Web-1: 10.4.0.6

We have installed the following Beats on these machines:

- Web-1: Filebeat
- Web-2: Filebeat

These Beats allow us to collect the following information from each machine:

- Filebeat collects and monitors log events of remote machines.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the elk_playbook.yml file to /etc/Ansible.
- Update the host file to include:
  - [webservers]
    - 10.4.0.5 ansible_python_interpreter=/usr/bin/python3
    - 10.4.0.6 ansible_python_interpreter=/usr/bin/python3
  - [elkservers]
    - 10.5.0.4 ansible_python_interpreter=/usr/bin/python3
- Run the playbook, and navigate to PLAY RECAP to check that the installation worked as expected. Navigate to Kibana using 40.117.140.8:5601 to chek that the ELK Server is running.
