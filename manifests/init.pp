class base inherits base::params {
    package { [ 'tree','wget','unzip','git' ]: }
    user { 'deploy':
            ensure => present,
            uid         => '5000',
            home        => '/home/deploy',
            shell       => '/bin/bash',
            managehome  => true,
            password    => '$1$bPsFB/TR$bfR.w2bUGaLVkL65lzjJS/',
    }
    user {
        'dojo':
        ensure => absent, 
    }
   # service { $::base::ntp_service:
   #        ensure => running,
    }
    file { '/etc/motd':
        ensure => 'file',
        owner => 'root',
        group => 'root',
        mode => '0644',
        content => "
        This server is property of XYZ Inc.

        SYSTEM INFO:
        ***************************************************************
        
        IPADDRESS            :${::ipaddress}
        HOSTNAME             :${::fqdn} 
        MEMORY               :${::memory['system'][total]}
        CPU CORES            :${::processors['count']}
        OPERATING SYSTEM     :${os['name']}
        
        ",
    }
}
