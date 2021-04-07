ansible-playbook -i hosts playbook.yml --ask-vault-pass
Vault password: 

PLAY [Install Nginx] **************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************
ok: [165.227.190.164]

TASK [nginx-settings : Install package nginx] *************************************************************************************************************************
ok: [165.227.190.164]

TASK [nginx-settings : Create site folder] ****************************************************************************************************************************
ok: [165.227.190.164]

TASK [nginx-settings : Generate (HTTP nginx.conf; title page; ssh-key)] ***********************************************************************************************
ok: [165.227.190.164] => (item={'src': 'nginx.j2', 'dest': '/etc/nginx/nginx.conf'})
ok: [165.227.190.164] => (item={'src': 'index.j2', 'dest': '/home/dkocheto.devops.rebrain.srwx.net/index.html'})
ok: [165.227.190.164] => (item={'src': 'id_rsa', 'dest': '/root/.ssh/'})

TASK [nginx-vhosts : Generate (virtual_host HTTP; virtual_host HTTPS; sertificate; key)] ******************************************************************************
changed: [165.227.190.164] => (item={'src': 'host1.j2', 'dest': '/etc/nginx/conf.d/dkocheto.devops.rebrain.srwx.net.conf'})
changed: [165.227.190.164] => (item={'src': 'host2.j2', 'dest': '/etc/nginx/conf.d/dkocheto.devops.rebrain.srwx.net.conf'})
ok: [165.227.190.164] => (item={'src': 'cert.crt', 'dest': '/etc/nginx/conf.d/cert.crt'})
ok: [165.227.190.164] => (item={'src': 'cert.key', 'dest': '/etc/nginx/conf.d/cert.key'})

RUNNING HANDLER [nginx-vhosts : Reload nginx] *************************************************************************************************************************
changed: [165.227.190.164]

PLAY RECAP ************************************************************************************************************************************************************
165.227.190.164            : ok=6    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
