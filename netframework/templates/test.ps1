$test =  Test-Path "HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319\SKUs\.NETFramework,Version=v4.5"
if ($test) { EXIT 0 } else { EXIT 1 }

