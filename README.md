# Ansible Role: Firewall (iptables)

This role was originally created in 2014 by [Jeff Geerling](http://jeffgeerling.com/), author of [Ansible for DevOps](http://ansiblefordevops.com/). I have forked it however, to use as a boilerplate as everything Jeff has done is perfect, I just wanted more customisable rules. :)

## Role Variables

Available variables are listed below, along with default values (see `vars/main.yml`):

    firewall_rules:
    - { dport: 22, comment: 'Allow SSH incoming' }
    - { loop_zones: 'cn', jump: 'DROP', comment: 'Drop connections from China' }
    - { loop_dports: '80 443' }
    - { loop_sources: '10.0.0.{10,20,30}/24', dport: 22 }

A list of firewall rules, which pretty much pass arguments directly to iptables.
In the case of loop properties, this is a bash loop (so you can use bash expansion)
loop_zones will take advantage of /etc/ipblocks/4/\*.zone to block entire zones (see, ipdeny.com)

    firewall_forwarded_tcp_ports:
      - { src: "22", dest: "2222" }
      - { src: "80", dest: "8080" }
    firewall_forwarded_udp_ports: []

Forward `src` port to `dest` port, either TCP or UDP (respectively).

    firewall_drop_incoming: true
    firewall_drop_outgoing: false

Whether or not to drop INPUT/OUTPUT by default

    firewall_log_drops: true

Whether to log dropped packets to syslog (messages will be prefixed with "Dropped by firewall: ").

## TODO

  - iptables6/IPv6 support

## License

MIT / BSD
