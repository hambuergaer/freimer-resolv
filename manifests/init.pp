class resolv (
	$resolvDomain = 'example.com',
	$resolvSearch = 'example.com',
	$resolvNameserver = '172.0.0.1',)
{

file { '/etc/resolv.conf':
	ensure => file,
	content => template('resolv/resolv.erb'), 
	owner => 'root',
	group => 'root',
	mode => '0644',
	}

if $operatingsystem == 'RedHat' and $operatingsystemmajrelease == 7 {
	
	file { '/etc/NetworkManager/NetworkManager.conf':
		ensure => file,
		content => template('resolv/NetworkManager.erb'), 
		owner => 'root',
		group => 'root',
		mode => '0644',
		}
	}

}
