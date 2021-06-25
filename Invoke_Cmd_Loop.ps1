#Loops an Invoke-Command down a list of machines

$list = Get-Content -Path "c:\path_to\input.txt"
$output = "c:\path_to\output.txt"

forEach ($i in $list){
    try{
    #$info = systeminfo /s $i
    Write-host $i
    invoke-command -ComputerName $i -ScriptBlock {systeminfo}
    }
    catch {#[System.Management.Automation.RemoteException]{
    Write-host "Error"
    add-content $file "Machine $i not found"
    Continue
    }
    #add-content $file $info    
} 

#try {
#    foreach ($i in $list){
#    $info = invoke-command -ComputerName $i -ScriptBlock {systeminfo}
#    add-content $output $info 
#    }
#}
#catch {
#    #Write-host "Error"
#    continue
#}

