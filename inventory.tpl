[all]
${join("\n", "${formatlist("%s",
        "${ip}",
        )}",
      )}
[all:vars]
ansible_ssh_user=root
ansible_python_interpreter=/usr/bin/python3
