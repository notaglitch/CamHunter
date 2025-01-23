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

} elseif (-not $range) {
    $urlsToOpen = $urls
    Write-Host "Opening all URLs"
}
else {
    Write-Host "Invalid range format! Please use a format like 1-10"
    exit
}

$firefoxPath = "C:\Program Files\Mozilla Firefox\firefox.exe"

foreach ($url in $urlsToOpen) {
    Write-Host "Opening $url in Firefox (Private Window)..."
    Start-Process -FilePath $firefoxPath -ArgumentList "--private-window", $url
    Start-Sleep -Seconds 1
}

Write-Host "Done opening URLs!"

URL Opener Script

This PowerShell script opens a list of URLs in Firefox's private browsing mode. You can specify a range of URLs to open or open all URLs in the file.
Features

    Opens URLs listed in a text file.
    Supports opening a specific range of URLs (e.g., 1-10).
    Opens all URLs if no range is provided.
    Uses Firefox in private browsing mode to open URLs.

Requirements

    PowerShell (works on Windows).
    Firefox installed on the system.

How to Use

    Clone or download this repository.
    Prepare a text file with a list of URLs (one URL per line).
    Run the script:

    .\url_opener.ps1 -filePath "C:\path\to\your\file.txt" -range "1-10"

        Replace "C:\path\to\your\file.txt" with the path to your URL file.
        Replace "1-10" with the range of URLs you want to open (e.g., "11-20"). To open all URLs, leave the -range parameter empty.

Parameters

    $filePath: Path to the text file containing URLs.
    $range: A range of URLs to open in the format startIndex-endIndex. If no range is provided, all URLs will be opened.

Example Usage

To open URLs from lines 1 to 10 in a file:

.\url_opener.ps1 -filePath "C:\path\to\urls.txt" -range "1-10"

To open all URLs in the file:

.\url_opener.ps1 -filePath "C:\path\to\urls.txt"

Notes

    Ensure Firefox is installed at the default location (C:\Program Files\Mozilla Firefox\firefox.exe), or update the script with the correct path.
    The script opens the URLs in Firefox's private window for privacy.