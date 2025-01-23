param(
    [string]$filePath,
    [string]$range
)

if (-Not (Test-Path $filePath)) {
    Write-Host "File does not exist!"
    exit
}

$urls = Get-Content $filePath

if ($range -match '^\d+-\d+$') {
    $rangeParts = $range.Split('-')
    $startIndex = [int]$rangeParts[0] - 1
    $endIndex = [int]$rangeParts[1] - 1

    if ($startIndex -lt 0 -or $endIndex -ge $urls.Length) {
        Write-Host "Invalid range, indices are out of bounds!"
        exit
    }

    $urlsToOpen = $urls[$startIndex..$endIndex]
    
    Write-Host "Opening links from index $startIndex to $endIndex"

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
