# Savings Goal Tracker

Savings Goal Tracker is a mobile application created using Flutter to calculate the weeks required to achieve the target goal amount. The calculation will be based on the user's current saved amount, target savings goal, and weekly savings amount.

Input

  •	Current Amount Saved
  
  •	Target Savings Goal
  
  •	Savings per Week
  
Process

  •	Amount Needed = Target Savings Goal – Current Amount Saved
  
  •	Weeks Required = Amount Needed / Savings per Week
  
Output

  •	If Amount Needed <= 0, You have already reached your savings goal!
  
  •	Else, You will reach your savings goal in $weeksRequired weeks.

Widget list used

  •	AppBar
  
  •	AppBarTheme
  
  •	Center
  
  •	CircularProgressIndicator
  
  •	Column
  
  •	Container

  • ElevatedButton
  
  •	Image
  
  •	MaterialApp
  
  •	Padding
  
  •	Scaffold
  
  •	SizedBox
  
  •	Text
  
  •	TextField
  
  •	ThemeData

Basic validation approach

  •	Warning the TextField if it is empty
  
  •	Warning the TextField if it is invalid input
  
  •	Warning the TextField if it is not 2 decimal numbers
  
  •	Warning the Target Savings Goal and Savings per Week’s TextField if they are less than or equal to zero
  
  •	Warning Target Savings Goal’s TextField if the value is less than the Current Amount Saved

<table>
  <tr>
    <td><b>Splash Screen</b></td>
    <td><b>Home Screen</b></td>
    <td><b>Home Screen After Calculation</b></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/c8d61597-161d-427e-aac8-74cf3fa094e6" width="300" height="868"></td>
    <td><img src="https://github.com/user-attachments/assets/67dfae5d-0cd4-4d89-91a2-3b1dd0f56fc8" width="300" height="868"></td>
    <td><img src="https://github.com/user-attachments/assets/da3f2ee1-da0d-4fe8-a8e2-d76676c769ba" width="300" height="877"></td>
  </tr>
</table>

