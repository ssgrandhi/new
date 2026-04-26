#!/bin/bash
# A simple shell script to perform basic arithmetic operations

# Prompt user for two numbers
read -p "Enter first number: " num1
read -p "Enter second number: " num2

# Validate that inputs are numbers (integer or decimal)
if ! [[ "$num1" =~ ^-?[0-9]+(\.[0-9]+)?$ && "$num2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Please enter valid numeric values."
    exit 1
fi

# Perform calculations
sum=$(echo "$num1 + $num2" | bc)
diff=$(echo "$num1 - $num2" | bc)
prod=$(echo "$num1 * $num2" | bc)
added file 12334
# Handle division by zero
if (( $(echo "$num2 == 0" | bc -l) )); then
    quotient="undefined (division by zero)"
else
    quotient=$(echo "scale=2; $num1 / $num2" | bc)
fi

# Display results
echo "Sum: $sum"
echo "Difference: $diff"
echo "Product: $prod"
echo "Quotient: $quotient"
