local_security_policy { 'Audit account logon events': <- Title / Name
  ensure         => present,              <- Always present
  policy_setting => "AuditAccountLogon",  <- The secedit file key. Informational purposes only, not for use in manifest definitions
  policy_type    => "Event Audit",        <- The secedit file section, Informational purposes only, not for use in manifest definitions
  policy_value   => 'Success,Failure',    <- Values
}

1.1

1.1.1
Enforce password history
24

1.1.2
Maximum password age
60

1.1.3
Minimum password age
1

1.1.4
Minimum password length
14

1.1.5
Password must meet complexity requirements
Enabled

1.1.6
Store passwords using reversible encryption
Disabled

1.2

1.2.1
Account lockout duration
15 or more minute(s)

1.2.2
Account lockout threshold
10 or fewer invalid logon attempt(s), but not 0. 

1.2.3
Reset account lockout counter after 
15 or more minute(s)

2

2.1

2.2

2.2.1
Access Credential Manager as a trusted caller 
No One

2.2.2
Access this computer from the network 
Administrators, Authenticated Users

2.2.3
Act as part of the operating system 
No One

2.2.4 (DC Only)

2.2.5
Adjust memory quotas for a process 
Administrators, LOCAL SERVICE, NETWORK SERVICE

2.2.6
Allow log on locally 
Administrators

2.2.7
Allow log on through Remote Desktop Services 
Administrators, Remote Desktop Users

2.2.8
Back up files and directories 
Administrators

2.2.9
Change the system time
Administrators, LOCAL SERVICE

2.2.10
Change the time zone 
Administrators, LOCAL SERVICE

2.2.11
Create a pagefile 
Administrators

2.2.12
Create a token object
No One

2.2.13
Create global objects
Administrators, LOCAL SERVICE, NETWORK SERVICE, SERVICE

2.2.14
Create permanent shared objects
No One

2.2.15
Create symbolic links 
Administrators

2.2.16
Debug programs 
Administrators

2.2.17
Deny access to this computer from the network 
Guests, Local account and member of Administrators group

2.2.18
Deny log on as a batch job 
Guests

2.2.19
Deny log on as a service 
Guests

2.2.20
Deny log on locally 
Guests

2.2.21
Deny log on through Remote Desktop Services
Guests, Local account

2.2.22
Enable computer and user accounts to be trusted for delegation
No One

2.2.23
Force shutdown from a remote system 
Administrators

2.2.24
Generate security audits
LOCAL SERVICE, NETWORK SERVICE

2.2.25
Impersonate a client after authentication 
Administrators, LOCAL SERVICE, NETWORK SERVICE, SERVICE 

2.2.26
Increase scheduling priority 
Administrators

2.2.27
Load and unload device drivers 
Administrators

2.2.28
Lock pages in memory 
No One

2.2.29 (DC Only)

2.2.30
Manage auditing and security log 
Administrators

2.2.31
Modify an object label 
No One

2.2.32
Modify firmware environment values
Administrators

2.2.33
Perform volume maintenance tasks 
Administrators

2.2.34
Profile single process 
Administrators

2.2.35
Profile system performance 
Administrators, NT SERVICE\WdiServiceHost

2.2.36
Replace a process level token 
LOCAL SERVICE, NETWORK SERVICE

2.2.37
Restore files and directories 
Administrators

2.2.38
Shut down the system
Administrators

2.2.39 (DC Only)

2.2.40
Take ownership of files or other objects 
Administrators

2.3

2.3.1
Accounts: Administrator account status 
Disabled

2.3.1.2
Accounts: Block Microsoft accounts 
Users can't add or log on with Microsoft accounts

2.3.1.3
Accounts: Guest account status
Disabled

2.3.1.4
Lsa:LimitBlankPasswordUse 
Enabled

2.3.1.5
Accounts: Rename administrator account 
<unknown>

2.3.1.6
Accounts: Rename guest account 
<unknown>

