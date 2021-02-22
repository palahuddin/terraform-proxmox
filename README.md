# Vultr-Terraform

Create Server Host on [Vultr](https://vultr.com/) using [terraform](https://github.com/vultr/terraform-provider-vultr) official provider and [ansible](https://docs.ansible.com/ansible/latest/index.html) 

## Overview

Use [Jenkins](https://www.jenkins.io/) webhook to trigger automation 
```bash
https://builders.example.com/
```

## How To Deploy
```bash
git clone https://gitlab.com/example.com/devops/vultr-terraform.git
nano vultr-terraform/list
```
Update list of hostname file srv.list, and then run exec:
```bash
./deploy.sh
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[example](https://example.com)