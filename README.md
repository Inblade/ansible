До:
ansible-lint -v *.yml
WARNING  Listing 11 violation(s) that are fatal
[701] Role info should contain platforms
roles/nginx-settings/meta/main.yml:2
{'meta/main.yml': {'allow_duplicates': True, 'galaxy_info': {'author': 'your name', 'description': 'your role description', 'company': 'your company (optional)', 'license': 'license (GPL-2.0-or-later, MIT, etc)', 'min_ansible_version': 2.9, 'galaxy_tags': [], 'dependencies': None, '__line__': 4, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-settings/meta/main.yml'}, '__line__': 2, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-settings/meta/main.yml', 'skipped_rules': []}}

[703] Should change default metadata: author
roles/nginx-settings/meta/main.yml:2
{'meta/main.yml': {'allow_duplicates': True, 'galaxy_info': {'author': 'your name', 'description': 'your role description', 'company': 'your company (optional)', 'license': 'license (GPL-2.0-or-later, MIT, etc)', 'min_ansible_version': 2.9, 'galaxy_tags': [], 'dependencies': None, '__line__': 4, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-settings/meta/main.yml'}, '__line__': 2, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-settings/meta/main.yml', 'skipped_rules': []}}

[703] Should change default metadata: company
roles/nginx-settings/meta/main.yml:2
{'meta/main.yml': {'allow_duplicates': True, 'galaxy_info': {'author': 'your name', 'description': 'your role description', 'company': 'your company (optional)', 'license': 'license (GPL-2.0-or-later, MIT, etc)', 'min_ansible_version': 2.9, 'galaxy_tags': [], 'dependencies': None, '__line__': 4, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-settings/meta/main.yml'}, '__line__': 2, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-settings/meta/main.yml', 'skipped_rules': []}}

[703] Should change default metadata: license
roles/nginx-settings/meta/main.yml:2
{'meta/main.yml': {'allow_duplicates': True, 'galaxy_info': {'author': 'your name', 'description': 'your role description', 'company': 'your company (optional)', 'license': 'license (GPL-2.0-or-later, MIT, etc)', 'min_ansible_version': 2.9, 'galaxy_tags': [], 'dependencies': None, '__line__': 4, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-settings/meta/main.yml'}, '__line__': 2, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-settings/meta/main.yml', 'skipped_rules': []}}

[106] Role name nginx-settings does not match ``^[a-z][a-z0-9_]+$`` pattern
roles/nginx-settings/tasks/main.yml:1
---

[208] File permissions unset or incorrect
roles/nginx-settings/tasks/main.yml:10
Task/Handler: Create site folder

[701] Role info should contain platforms
roles/nginx-vhosts/meta/main.yml:2
{'meta/main.yml': {'allow_duplicates': True, 'galaxy_info': {'author': 'your name', 'description': 'your role description', 'company': 'your company (optional)', 'license': 'license (GPL-2.0-or-later, MIT, etc)', 'min_ansible_version': 2.9, 'galaxy_tags': [], '__line__': 5, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-vhosts/meta/main.yml'}, 'dependencies': [{'role': 'nginx-settings', '__line__': 54, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-vhosts/meta/main.yml'}], '__line__': 2, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-vhosts/meta/main.yml', 'skipped_rules': []}}

[703] Should change default metadata: author
roles/nginx-vhosts/meta/main.yml:2
{'meta/main.yml': {'allow_duplicates': True, 'galaxy_info': {'author': 'your name', 'description': 'your role description', 'company': 'your company (optional)', 'license': 'license (GPL-2.0-or-later, MIT, etc)', 'min_ansible_version': 2.9, 'galaxy_tags': [], '__line__': 5, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-vhosts/meta/main.yml'}, 'dependencies': [{'role': 'nginx-settings', '__line__': 54, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-vhosts/meta/main.yml'}], '__line__': 2, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-vhosts/meta/main.yml', 'skipped_rules': []}}

[703] Should change default metadata: company
roles/nginx-vhosts/meta/main.yml:2
{'meta/main.yml': {'allow_duplicates': True, 'galaxy_info': {'author': 'your name', 'description': 'your role description', 'company': 'your company (optional)', 'license': 'license (GPL-2.0-or-later, MIT, etc)', 'min_ansible_version': 2.9, 'galaxy_tags': [], '__line__': 5, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-vhosts/meta/main.yml'}, 'dependencies': [{'role': 'nginx-settings', '__line__': 54, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-vhosts/meta/main.yml'}], '__line__': 2, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-vhosts/meta/main.yml', 'skipped_rules': []}}

[703] Should change default metadata: license
roles/nginx-vhosts/meta/main.yml:2
{'meta/main.yml': {'allow_duplicates': True, 'galaxy_info': {'author': 'your name', 'description': 'your role description', 'company': 'your company (optional)', 'license': 'license (GPL-2.0-or-later, MIT, etc)', 'min_ansible_version': 2.9, 'galaxy_tags': [], '__line__': 5, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-vhosts/meta/main.yml'}, 'dependencies': [{'role': 'nginx-settings', '__line__': 54, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-vhosts/meta/main.yml'}], '__line__': 2, '__file__': '/home/inblade/Devops/Ansible/ans11/roles/nginx-vhosts/meta/main.yml', 'skipped_rules': []}}

[106] Role name nginx-vhosts does not match ``^[a-z][a-z0-9_]+$`` pattern
roles/nginx-vhosts/tasks/main.yml:1
---

You can skip specific rules or tags by adding them to your configuration file:                                                                                         

┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ # .ansible-lint                                                                                                                                                     │
│ warn_list:  # or 'skip_list' to silence them completely                                                                                                             │
│   - '106'  # Role name {} does not match ``^[a-z][a-z0-9_]+$`` pattern                                                                                              │
│   - '208'  # File permissions unset or incorrect                                                                                                                    │
│   - '701'  # meta/main.yml should contain relevant info                                                                                                             │
│   - '703'  # meta/main.yml default values should be changed                                                                                                         │
│   - experimental  # all rules tagged as experimental                                                                                                                │
└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘



Вывод после:
а нет никакого выврда
