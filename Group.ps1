# Specify the input file
$inputFile = "input.txt"
# Read each line from the input file and execute it
foreach ($line in Get-Content $inputFile) {
    try {
        # Execute the command and capture the output without printing it
        $output = Invoke-Expression $line
	
        # Split the output into lines
        $lines = $output -split "`n"
	
        # Check if the number of lines is exactly 2
        if ($lines.Count -eq 2) {
            Write-Host $line -ForegroundColor yellow
        }
    } catch {
        # Handle errors if needed
    }
}
