$recipients = "tbobst@craneconnectivity.com"
$ccRecipients = "botobi@gmail.com", "tobias.bobst@gmail.com"
$sender = "e-vending<noreply@e-vending.net>"

$subject = "e-vending Statistics"

$date = get-date -format "dd.MM.yyy"
$body = "Please find the statistics of " + $date + " of the productive e-vending server in the attachment."
$attachment1 = "D:\e-vending_statistics\Data\e-vending_active_accounts_with_devices_" + $date + ".txt"
$attachment2 = "D:\e-vending_statistics\Data\e-vending_transactions_" + $date + ".txt"

# $content = get-content "D:\mailscript\Text.txt"

# Send E-Mail using SMTP
# 
# Informations: https://www.windowspro.de/script/send-mailmessage-e-mails-versenden-powershell
# Credentials: Username (AKIAISEFJRL455WGTEVA) and password (AuGLkHidi5/lPRA9YaJyHKPQismxrGSK+sxCRZRrsgj+) to authenticate on SMTP server needs to be stored crypted.
# This can be done on powershell console using command:
#  "(Get-Credential).password | ConvertFrom-SecureString > MailPW.txt"
# A dialog opens asking for username and password. THE CRYPTED CONTENT ALSO DEPENDS ON THE USER LOGGED IN!!!
#$pw = Get-Content D:\mailscript\MailPW.txt | ConvertTo-SecureString
#$cred = New-Object System.Management.Automation.PSCredential "noreplyevending", $pw
Send-MailMessage -to $recipients -cc $ccRecipients -from $sender -subject $subject -body $body -attachments $attachment1, $attachment2 -SmtpServer "10.82.201.59"
