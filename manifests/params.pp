class base::params {
    case $::os[family] {
        'RedHat': {
            $ntp_service = 'ntpd'
        }
        'Debian':{
            $ntp_service = 'ntp'
        }
    }
}