# Automated Disk Imaging with `sudo dd`

This script automates the process of writing an ISO image to a disk using the `dd` command.  It provides a menu-driven interface for selecting the target disk and the ISO image file.  **Use extreme caution:** This script will overwrite all data on the selected disk.


## Usage

1.  **Prerequisites:** Ensure you have the `lsblk` command available (usually included in most Linux distributions).
2.  **Run the script:** Execute the script using `bash dd.sh`.
3.  **Disk Selection:** The script will display a list of available block devices using `lsblk`. Carefully select the target disk, including the partition (e.g., `/dev/sda1`, `/dev/sdb`).  **Double-check your selection to avoid data loss.**
4.  **ISO Image Path:** Enter the full path to your ISO image file.
5.  **Confirmation:** The script will pause for 5 seconds to allow you to cancel the operation (Ctrl+C).
6.  **Execution:** The script will then use `sudo dd` to write the ISO image to the selected disk.
7.  **Completion:** Upon completion, you'll have the option to exit or return to the menu to image another disk.


## Important Safety Precautions

*   **Data Loss:** This script will erase all data on the selected disk partition.  **Double-check your disk selection before proceeding.** There is no undo.
*   **Root Privileges:** The script requires root privileges (`sudo`) to execute the `dd` command.
*   **Correct Disk Selection:**  Incorrect disk selection can lead to irreversible data loss. Carefully review the output of `lsblk` and ensure you select the correct target disk.
*   **ISO Image Integrity:** Verify the integrity of your ISO image before using this script.


## Script Enhancements (Future Considerations)

*   **Input Validation:** Add input validation to prevent common errors (e.g., incorrect disk selection, invalid file paths).
*   **Progress Bar:** Integrate a progress bar to monitor the `dd` operation.
*   **Error Handling:** Implement more robust error handling to catch and report potential issues.
*   **Confirmation Prompt:** Add a more explicit confirmation prompt before proceeding with the write operation.



## Disclaimer

This script is provided as-is. The author is not responsible for any data loss or damage caused by its use. Use at your own risk.
