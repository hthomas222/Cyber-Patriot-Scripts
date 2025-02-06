# Enforce strong password policies
secedit /export /cfg C:\password_policy.cfg

# Modify the exported security settings file
(Get-Content C:\password_policy.cfg) -replace "MinimumPasswordLength = .*", "MinimumPasswordLength = 12" | 
    Set-Content C:\password_policy.cfg
(Get-Content C:\password_policy.cfg) -replace "PasswordComplexity = .*", "PasswordComplexity = 1" | 
    Set-Content C:\password_policy.cfg
(Get-Content C:\password_policy.cfg) -replace "MaximumPasswordAge = .*", "MaximumPasswordAge = 90" | 
    Set-Content C:\password_policy.cfg
(Get-Content C:\password_policy.cfg) -replace "EnforcePasswordHistory = .*", "EnforcePasswordHistory = 24" | 
    Set-Content C:\password_policy.cfg

# Apply the updated security settings
secedit /configure /db secedit.sdb /cfg C:\password_policy.cfg /areas SECURITYPOLICY

# Refresh Group Policy settings
gpupdate /force

Write-Host "✅ Password complexity policies applied successfully!"
