$inputFile = "input.txt"
$outputFile = "group.txt"

# Read the input file, ignoring empty lines and trimming spaces
$groups = Get-Content $inputFile | Where-Object { $_.Trim() -ne "" }

foreach ($line in $groups) {
    try {
        # Run the command safely without Invoke-Expression
        $output = & cmd /c "net group /domain `"$line`""

        # Split the output into lines
        $lines = $output -split "`r?`n"

        # If the output has exactly 2 lines, consider it an invalid group
        if ($lines.Count -eq 2) {
            Write-Host "Invalid Group: $line" -ForegroundColor cyan
            Add-Content -Path $outputFile -Value $line
        }
    } catch {
        Write-Host "Error checking group: $line" -ForegroundColor Red
        Write-Host $_.Exception.Message
    }
}
Write-Host "The above list Invalid AD groups are saved in group.txt" -ForegroundColor Green