# Automated Disk Imaging with `sudo dd`

This script automates the process of writing an ISO image to a disk using the `dd` command. It provides a menu-driven interface for selecting the target disk and the ISO image file.  **Use extreme caution:** This script will overwrite all data on the selected disk.


## Usage

1.  **Prerequisites:** Ensure you have the `lsblk` and `pv` commands available (e.g., install `pv` using `sudo apt-get install pv` on Debian/Ubuntu).
2.  **Run the script:** Execute the script using `bash dd.sh`.
3.  **Disk Selection:** The script will prompt you to enter the target disk path (e.g., `/dev/sda1`). Input validation ensures a correct format. **Double-check your selection to avoid data loss.**
4.  **ISO Image Path:** Enter the full path to your ISO image file. Input validation checks for file existence.
5.  **Confirmation:** The script will prompt you to explicitly type 'YES' to confirm before proceeding.
6.  **Execution:** The script uses `pv` for a progress bar and `sudo dd` to write the ISO image.  Error handling will catch various potential problems.
7.  **Completion:** Upon completion, you'll have the option to exit or image another disk.


## Important Safety Precautions

*   **Data Loss:** This script will erase all data on the selected disk partition.  **Double-check your disk selection and type 'YES' to confirm before proceeding.** There is no undo.
*   **Root Privileges:** The script requires root privileges (`sudo`) to execute the `dd` command.
*   **Correct Disk Selection:** Incorrect disk selection can lead to irreversible data loss. Carefully review the prompt and ensure you select the correct target disk.
*   **ISO Image Integrity:** Verify the integrity of your ISO image before using this script.


## Script Enhancements

*   The script now includes input validation to prevent common errors.
*   A progress bar (`pv`) is used to display the write progress.
*   Robust error handling is included to catch and report potential issues.
*   A more explicit confirmation prompt helps prevent accidental data loss.


## Disclaimer

This script is provided as-is. The author is not responsible for any data loss or damage caused by its use. Use at your own risk.
