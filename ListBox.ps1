# Original example posted at http://technet.microsoft.com/en-us/library/ff730949.aspx

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form 
$form.Text = "Select a Computer"
$form.Size = New-Object System.Drawing.Size(300,200) 
$form.StartPosition = "CenterScreen"

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Size(75,120)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = "OK"
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Size(150,120)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = "Cancel"
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Size(10,20) 
$label.Size = New-Object System.Drawing.Size(280,20) 
$label.Text = "Please select a computer:"
$form.Controls.Add($label) 

$listBox = New-Object System.Windows.Forms.ListBox 
$listBox.Location = New-Object System.Drawing.Size(10,40) 
$listBox.Size = New-Object System.Drawing.Size(260,20) 
$listBox.Height = 80

[void] $listBox.Items.Add("atl-dc-001")
[void] $listBox.Items.Add("atl-dc-002")
[void] $listBox.Items.Add("atl-dc-003")
[void] $listBox.Items.Add("atl-dc-004")
[void] $listBox.Items.Add("atl-dc-005")
[void] $listBox.Items.Add("atl-dc-006")
[void] $listBox.Items.Add("atl-dc-007")

$form.Controls.Add($listBox) 

$form.Topmost = $True

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $listBox.SelectedItem
    $x
}
