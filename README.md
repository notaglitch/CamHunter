# CamHunter

This Python tool helps you gather publicly available CCTV camera streams from Insecam, an online directory of unsecured cameras.
Features

    Fetches camera IPs by country.
    Saves camera IPs into a text file for later use.
    Displays the list of countries and their camera counts.
    Works with a custom country code input.

Requirements

    Python 3.x
    requests module (pip install requests)

How to Use

    Clone or download this repository.
    Install the required modules:

pip install requests

Run the script:

    python camera_finder.py

    Enter a country code (e.g., "US" for the United States).
    The tool will fetch the available camera IPs and save them to a text file named with the country code.

Example Usage

python camera_finder.py

    Input country code when prompted.
    The IPs of CCTV cameras in the selected country will be saved in a .txt file.

Notes

    This tool scrapes public camera data from Insecam, so it's important to use it responsibly.
    Ensure that you are compliant with any relevant laws and regulations when accessing publicly available cameras.

# URL Opener Script

## Automate browsing through cameras

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
