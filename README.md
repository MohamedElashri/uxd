# uxd - Unix Day Utility

`uxd` is a simple bash utility that can be used to:
1. Display the current Unix day.
2. Convert a Unix day to an ordinary date (YYYY-MM-DD).
3. Convert an ordinary date (YYYY-MM-DD) to a Unix day.

## Installation

To install `uxd`, follow these steps:

1. Save the `uxd` script to a directory in your `$PATH`. A common choice is `/usr/local/bin`.
    ```bash
    sudo cp uxd /usr/local/bin/
    sudo chmod +x /usr/local/bin/uxd
    ```
2. Ensure that `/usr/local/bin` is in your `$PATH`. You can check by running:
    ```bash
    echo $PATH
    ```
    If `/usr/local/bin` is not included, add it to your `.bashrc` or `.bash_profile`:
    ```bash
    export PATH=$PATH:/usr/local/bin
    ```
3. Source your profile or restart the terminal:
    ```bash
    source ~/.bashrc
    ```

## Usage

### Display the Current Unix Day
```bash
uxd
```
This will print the current Unix day (the number of days since the Unix epoch, 1970-01-01).

### Convert Unix Day to Ordinary Date
```bash
uxd -u [unix_day] [timezone]
```
Example:
```bash
uxd -u 18988
```
This will convert Unix day `18988` to its equivalent ordinary date.
```bash
uxd -u 18988 America/New_York
```
This will convert Unix day `18988` to its equivalent ordinary date in the `America/New_York` timezone.

### Convert Ordinary Date to Unix Day
```bash
uxd -o [date] [timezone]
```
Example:
```bash
uxd -o 2021-12-26
```
This will convert the date `2021-12-26` to its equivalent Unix day.
```bash
uxd -o 2021-12-26 Europe/Berlin
```
This will convert the date `2021-12-26` to its equivalent Unix day in the `Europe/Berlin` timezone.

### Interactive Mode
```bash
uxd -i
```
Interactive mode allows you to perform conversions or display the current Unix day with guided input. Once you enter interactive mode, you'll be prompted to choose from the following options:
1. Display the current Unix day.
2. Convert a Unix day to an ordinary date.
3. Convert an ordinary date to a Unix day.
4. Exit the interactive mode.

### Display Help
```bash
uxd -h
```
This will display the help message with usage instructions.

## Error Handling

The script includes informative error messages to guide you if something goes wrong:
- **Invalid Unix Day**: If you input a non-numeric Unix day, you will receive an error indicating that the input must be a numeric value.
- **Invalid Date**: If you input a date in an incorrect format, you will receive an error instructing you to use the `YYYY-MM-DD` format.
- **Invalid Timezone**: If you input a non-existent or unsupported timezone, the script will notify you and suggest using a valid IANA timezone name.

## Examples
```bash
uxd                       # Show current Unix day
uxd -u 18988              # Convert Unix day 18988 to ordinary date
uxd -o 2021-12-26         # Convert date 2021-12-26 to Unix day
uxd -u 18988 UTC+2        # Convert Unix day 18988 to ordinary date in UTC+2 timezone
uxd -o 2021-12-26 UTC-5   # Convert date 2021-12-26 to Unix day in UTC-5 timezone
uxd -i                    # Start interactive mode
```

## Interactive Mode

For those who prefer a more guided approach, you can start the script in interactive mode using the `-i` flag. This mode walks you through each option step-by-step, making it easy to use even if you're not familiar with command-line arguments.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.


