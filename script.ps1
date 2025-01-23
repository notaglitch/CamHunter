param(
    [string]$filePath,
    [string]$range
)

# Check if file exists
if (-Not (Test-Path $filePath)) {
    Write-Host "File does not exist!"
    exit
}

# Read URLs from the file
$urls = Get-Content $filePath

# Check if the range is provided and valid
if ($range -match '^\d+-\d+$') {
    $rangeParts = $range.Split('-')
    $startIndex = [int]$rangeParts[0] - 1   # Adjust for 0-based index
    $endIndex = [int]$rangeParts[1] - 1     # Adjust for 0-based index

    # Ensure indices are within valid bounds
    if ($startIndex -lt 0 -or $endIndex -ge $urls.Length) {
        Write-Host "Invalid range, indices are out of bounds!"
        exit
    }

    # Extract the subset of URLs based on the given range
    $urlsToOpen = $urls[$startIndex..$endIndex]
    
    Write-Host "Opening links from index $startIndex to $endIndex"

    # Define Firefox path
    $firefoxPath = "C:\Program Files\Mozilla Firefox\firefox.exe"

    foreach ($url in $urlsToOpen) {
        Write-Host "Opening $url in Firefox (Private Window)..."
        Start-Process -FilePath $firefoxPath -ArgumentList "--private-window", $url
        Start-Sleep -Seconds 1
    }

    Write-Host "Done opening URLs!"
}
else {
    Write-Host "Invalid range format! Please use a format like 1-10"
    exit
}
