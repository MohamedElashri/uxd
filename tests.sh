#!/bin/bash
# Test script for uxd tool

# Function to strip ANSI color codes
strip_colors() {
    echo "$1" | sed 's/\x1B\[[0-9;]*[JKmsu]//g'
}

# Function to check test result
check_result() {
    if [ "$1" == "$2" ]; then
        echo -e "\e[32m[PASS]\e[0m $3"
    else
        echo -e "\e[31m[FAIL]\e[0m $3"
        echo "Expected: $2"
        echo "Got: $1"
    fi
}

# Test 1: Display the current Unix day
expected_day=$(( $(date +%s) / 86400 ))
result=$(strip_colors "$(./uxd)" | awk '{print $NF}')
check_result "$result" "$expected_day" "Test 1: Display current Unix day"

# Test 2: Convert Unix day 18987 to ordinary date
result=$(strip_colors "$(./uxd -u 18987)" | awk '{print $NF}')
expected_date="2021-12-26"
check_result "$result" "$expected_date" "Test 2: Convert Unix day 18988 to ordinary date"

# Test 3: Convert Unix day 18987 to ordinary date with timezone
result=$(strip_colors "$(./uxd -u 18987 America/New_York)" | awk '{print $NF}')
expected_date="2021-12-26"  # This should be the same as Test 2
check_result "$result" "$expected_date" "Test 3: Convert Unix day 18988 to ordinary date with timezone America/New_York"

# Test 4: Convert ordinary date to Unix day
result=$(strip_colors "$(./uxd -o 2021-12-27)" | awk '{print $NF}')
expected_day="18988"
check_result "$result" "$expected_day" "Test 4: Convert ordinary date 2021-12-26 to Unix day"

# Test 5: Convert ordinary date to Unix day with timezone
result=$(strip_colors "$(./uxd -o 2021-12-27 America/New_York)" | awk '{print $NF}')
expected_day="18988"  # This should be the same as Test 4
check_result "$result" "$expected_day" "Test 5: Convert ordinary date 2021-12-26 to Unix day with timezone America/New_York"

# Test 6: Invalid date format
result=$(strip_colors "$(./uxd -o invalid-date)")
expected_error="Error: Argument must be a valid date in the format YYYY-MM-DD. Please ensure the date is correct."
check_result "$result" "$expected_error" "Test 6: Invalid date format"

# Test 7: Invalid Unix day format
result=$(strip_colors "$(./uxd -u invalid-day)")
expected_error="Error: Argument must be a valid Unix day (an integer). Please provide a numeric value representing the Unix day."
check_result "$result" "$expected_error" "Test 7: Invalid Unix day format"

# Test 8: Invalid timezone
result=$(strip_colors "$(./uxd -u 18988 Invalid/Timezone)")
expected_error="Error: Invalid or unsupported timezone 'Invalid/Timezone'. Please use a valid IANA timezone name, e.g., 'America/New_York'."
check_result "$result" "$expected_error" "Test 8: Invalid timezone"

# Test 9: Help screen
result=$(strip_colors "$(./uxd -h)" | grep -o "Usage: uxd \[option\] \[argument\] \[timezone\]")
expected_help="Usage: uxd [option] [argument] [timezone]"
check_result "$result" "$expected_help" "Test 9: Display help screen"

echo -e "\e[34mAll tests completed.\e[0m"

