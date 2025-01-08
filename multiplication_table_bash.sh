#!/bin/bash

# Function to check if the input is a number
 isNumber() {
  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]] ; then
    return 1
  else
    return 0
  fi
}

# Function to check if the input range is valid
 isValidRange() {
  if [[ $1 -lt 1 || $1 -gt 10 ]] ; then
    return 1
  else
    return 0
  fi
}

# Function to display the multiplication table in ascending order
 displayAscendingTable() {
  for ((i=$start; i<=$end; i++)); do
    echo "$number x $i = $(($number * $i))"
  done
}

# Function to display the multiplication table in descending order
 displayDescendingTable() {
  for ((i=$end; i>=$start; i--)); do
    echo "$number x $i = $(($number * $i))"
  done
}

# Main program
continue="yes"
while [[ $continue == "yes" ]]; do
  read -p "Enter a number: " number

  # Validate if the input is a number
  if ! isNumber $number; then
    echo "Invalid input. Please enter a valid number."
    continue
  fi

  read -p "Do you want a full table? (yes/no): " fullTableOption

  # Generate full table
  if [[ $fullTableOption == "yes" ]]; then
    start=1
    end=10
  else
    read -p "Enter the start number of the range: " start
    read -p "Enter the end number of the range: " end

    # Validate range inputs
    if ! isNumber $start || ! isNumber $end || ! isValidRange $start || ! isValidRange $end || [[ $start -gt $end ]] ; then
      echo "Invalid range. Please enter valid numbers in the range of 1 to 10, with start <= end."
      continue
    fi
  fi

  read -p "Do you want to see the table in ascending or descending order? (ascending/descending): " orderOption

  # Display multiplication table in ascending or descending order
  if [[ $orderOption == "ascending" ]]; then
    displayAscendingTable
  elif [[ $orderOption == "descending" ]]; then
    displayDescendingTable
  else
    echo "Invalid option. Please enter either 'ascending' or 'descending'."
  fi

  read -p "Do you want to enter another number? (yes/no): " continue
done

