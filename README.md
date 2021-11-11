# Config & run

1. docker installed
2. setup aws credential in awsenv file
3. run create.sh to create web server
4. copy output IP
5. change healthcheck.sh with copied IP address
6. run healthcheck.sh

# Code explain

- The main.tf file contains the resource for creating web server
- The setup.tf file sets up all the ancillary resources needed by the EC2 instance before it can be spun up.
