# Path to AVHDX
$PathToVHDX = "C:\ClusterStorage\SPT-CSV-016-7C-ST-PU-120-SM\60c96f8df8f542abb44832b14e3007e8\Ide0-0"

$AlleFiles = Get-ChildItem -path $PathToVHDX
$AlleFiles = $AlleFiles | Sort-Object LastWriteTime

## Filter on avhdx and select the youngest
$LatestAHVDX = $AlleFiles | Where-Object { $_.Name -like "*.avhdx" } | Sort-Object LastWriteTime -Descending | Select-Object -First 1
While ( $LatestAHVDX.count -gt 0)
{
    ## ## Filter on avhdx and select the youngest
    Write-host "Youngest AVHDX = $($LatestAHVDX.Name) - $($LatestAHVDX.LastWriteTime)"

    # Merge youngest AVHDX into VDX
    $Source = $($PathToVHDX + "\" + $($LatestAHVDX.Name))
    $VHDSource = get-vhd $Source

    write-host "Merge: $source to $($VHDSource.ParentPath)"
    Merge-VHD -Path $Source -DestinationPath $VHDSource.ParentPath


    $AlleFiles = Get-ChildItem -path $PathToVHDX
    $AlleFiles = $AlleFiles | Sort-Object LastWriteTime
    Write-host "Number of files: $($AlleFiles.count)" 

    ## ## Filter on avhdx and select the youngest
    $LatestAHVDX = $AlleFiles | Where-Object { $_.Name -like "*.avhdx" } | Sort-Object LastWriteTime -Descending | Select-Object -First 1


}
