# Shell-Scripting

This Bash script provides a simple calculator, a password generator, and a digital watch. It allows users to perform arithmetic calculations, generate random passwords, and display the current time.

## Usage

### Calculator

1. Run the script using `bash calculator.sh`.
2. Follow the on-screen prompts:
   - Enter the first number.
   - Enter the second number.
   - Enter the arithmetic operation (+, -, *, /).
3. The result of the calculation will be displayed.

### Password Generator

1. Run the script using `bash calculator.sh`.
2. Follow the on-screen prompt:
   - Enter the desired length of the password.
3. A random password of the specified length will be generated and displayed.

### Digital Watch

1. Run the script using `bash digital_watch.sh`.
2. The current time will be continuously displayed in blue text.

## Example

### Calculator

```
$ bash calculator.sh
Please enter the first number:
10
Please enter the second number:
5
Please enter the operation (+, -, *, /):
+
The result is: 15
```

### Password Generator

```
$ bash calculator.sh
Welcome to simple password generator
Please enter the length of the password:
12
cW7vhQDqDCrz
```

### Digital Watch

```
$ bash digital_watch.sh
12:34:56
```

## Note

- For the calculator, only integer numbers are supported.
- For the password generator, the password length should be specified in integers. For secure passwords, consider using longer lengths.
- The digital watch continuously displays the current time in blue text.
