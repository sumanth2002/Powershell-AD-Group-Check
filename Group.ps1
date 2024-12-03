$inputFile = "input.txt"
# Specify the output file
$outputFile = "group.txt"
# Read each line from the input file
foreach ($line in Get-Content $inputFile) {
    try {
        # Execute the command and capture the output
        $output = Invoke-Expression $line
	
        # Split the output into lines
        $lines = $output -split "`n"
	
        # Check if the number of lines is exactly 2
        if ($lines.Count -eq 2) {
            # Print the line to the console with yellow color
            Write-Host $line -ForegroundColor yellow
            # Append the line to the output file
            Add-Content -Path $outputFile -Value $line
        }
    } catch {
        # Handle errors if needed
    }
}
