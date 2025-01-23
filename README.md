CamHunter

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
