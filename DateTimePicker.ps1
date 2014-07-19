# Original example posted at http://technet.microsoft.com/en-us/library/ff730942.aspx

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 

$objForm = New-Object Windows.Forms.Form 

$objForm.Text = "Select a Date" 
$objForm.Size = New-Object Drawing.Size @(190,190) 
$objForm.StartPosition = "CenterScreen"

$objForm.KeyPreview = $True

$objForm.Add_KeyDown({
    if ($_.KeyCode -eq "Enter") 
        {
            $dtmDate=$objCalendar.SelectionStart
            $objForm.Close()
        }
    })

$objForm.Add_KeyDown({
    if ($_.KeyCode -eq "Escape") 
        {
            $objForm.Close()
        }
    })

$objCalendar = New-Object System.Windows.Forms.MonthCalendar 
$objCalendar.ShowTodayCircle = $False
$objCalendar.MaxSelectionCount = 1
$objForm.Controls.Add($objCalendar) 

$objForm.Topmost = $True

$objForm.Add_Shown({$objForm.Activate()})  
[void] $objForm.ShowDialog() 

if ($dtmDate)
    {
        Write-Host "Date selected: $dtmDate"
    }
