Host example
    HostName example.com
    Port 22
    User anselal
    IdentityFile ~/.ssh/id_rsa
    ForwardX11 yes
    LocalForward 1999 192.168.1.109:80

Host 192.168.1.1, 192.168.1.3, 192.168.1.4, 192.168.1.5
    PubkeyAcceptedKeyTypes +ssh-rsa
    HostKeyAlgorithms +ssh-rsa
    User root

