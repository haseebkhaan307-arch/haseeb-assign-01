---

Difference of Two Decimal Digits (8086 Assembly)

📌 Program Overview

This program is written for the Intel 8086 microprocessor using EMU8086 emulator.
It accepts two decimal digits from the keyboard, calculates their absolute difference, and displays the result in a formatted message.


---

🎯 Objective

The program performs the following tasks:

1. Displays a prompt symbol ?


2. Accepts two decimal digits from the user


3. Converts ASCII input into numeric values


4. Computes the absolute difference between the two digits


5. Displays the result in the format:



THE DIFFERENCE OF X AND Y IS Z


---

🖥️ Sample Input & Output

Input:

7 3

Output:

THE DIFFERENCE OF 7 AND 3 IS 4


---

⚙️ Processor & Environment

Processor: Intel 8086

Emulator: EMU8086

Interrupt Used: INT 21H

Model: SMALL

Language: Assembly Language (MASM syntax)



---

🧠 Logic Used

1. Take two characters using DOS interrupt INT 21H (AH=01H)


2. Convert ASCII to numeric by subtracting 30H


3. Compare the two digits


4. Subtract smaller from larger to get absolute difference


5. Convert result back to ASCII


6. Display formatted output using INT 21H (AH=02H & AH=09H)




---

🗂️ Registers Used

Register	Purpose

AX	Arithmetic operations and DOS calls
AH	DOS function number
AL	Input character and arithmetic
CL	First digit (numeric)
CH	Second digit (numeric)
BL	Stores final difference
DX	Address of strings
DL	Output character
DS	Data segment register



---

🔧 DOS Interrupt Functions

Function	Description

AH = 01H	Input single character
AH = 02H	Display single character
AH = 09H	Display string
AH = 4CH	Terminate program



---

📁 Data Segment Strings

MSG1 DB 0DH,0AH,'THE DIFFERENCE OF $'
MSG2 DB ' AND $'
MSG3 DB ' IS $'


---

▶️ How to Run

1. Open EMU8086


2. Create a new assembly file and paste the code


3. Assemble and Run


4. Enter two digits when prompted


5. View the result on the screen




---

✅ Features

Handles only single-digit decimal numbers (0–9)

Computes absolute difference

Uses simple DOS interrupts

Beginner-friendly assembly program



---

⚠️ Limitations

Only works with single-digit numbers (0–9)

No validation for non-numeric input

Does not handle multi-digit numbers



---

📜 Author

Created for learning purposes in 8086 Assembly Language using EMU8086.
