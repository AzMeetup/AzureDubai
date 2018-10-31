New-Item C:\LabVMs -ItemType directory
				$url = "https://azcopy.azureedge.net/azcopy-8-1-0/MicrosoftAzureStorageAzCopy_netcore_x64.msi"
				$output = "C:\LabVMs1\azcopy.msi"
				$wc = New-Object System.Net.WebClient
				$wc.DownloadFile($url, $output)
				Start-Process msiexec.exe -Wait -ArgumentList '/I C:\LabVMs1\azcopy.msi /quiet'
				Set-Location 'C:\Program Files (x86)\Microsoft SDKs\Azure\AzCopy\'
				.\AzCopy.exe /Source:https://azuremeetupdubai.blob.core.windows.net/labvhds /Dest:C:\labvms1 /SourceKey:m1NxLXh8fvJatPmOfN3YtlffTzzeacn5p2MgUcd6oQWMqbkGg9JR5OU1pepoF6XlvUZRv6lboU959PmX8ERZuQ== /S 
				
							$NatSwitch = Get-NetAdapter -Name "vEthernet (NAT Switch)"
							New-NetIPAddress -IPAddress 192.168.0.1 -PrefixLength 24 -InterfaceIndex $NatSwitch.ifIndex
							New-NetNat -Name NestedVMNATnetwork -InternalIPInterfaceAddressPrefix 192.168.0.0/24 -Verbose
							New-VM -Name DBServer1 -MemoryStartupBytes 2GB -BootDevice VHD -VHDPath 'C:\LabVMs\DBServer.vhdx' -Path 'C:\' -Generation 1 -Switch "NAT Switch"
								Start-VM -Name DBServer1
							New-VM -Name WebServer1 -MemoryStartupBytes 2GB -BootDevice VHD -VHDPath 'C:\LabVMs\WebServer.vhdx' -Path 'C:\' -Generation 1 -Switch "NAT Switch"
								Start-VM -Name Webserver1
