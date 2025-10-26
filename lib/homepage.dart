import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double width;
  TextEditingController currentAmountController = TextEditingController();
  TextEditingController targetGoalController = TextEditingController();
  TextEditingController savingsPerWeekController = TextEditingController();
  bool isCurrentError = false;
  bool isTargetError = false;
  bool isSavingsError = false;
  String currentErrorMsg = '';
  String targetErrorMsg = '';
  String savingsErrorMsg = '';
  String result = '';

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    if (width > 600) {
      width = 600;
    } else {
      width = width;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Savings Goal Tracker'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: width,
          padding: EdgeInsets.fromLTRB(24, 50, 24, 0),
          child: Column(
            // start at left
            crossAxisAlignment: CrossAxisAlignment.start,
            // start at top
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Current Amount Saved'),
              SizedBox(height: 10),
              TextField(
                controller: currentAmountController,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                decoration: InputDecoration(
                  labelText: 'RM',
                  hintText: 'XXXX.XX',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      // cnoditional expressions
                      // https://dart.dev/language/operators
                      color: isCurrentError ? Colors.red : Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      color: isCurrentError ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
              // Error Message or Sized Box
              isCurrentError
                  ? Padding(
                      padding: EdgeInsetsGeometry.fromLTRB(0, 5, 0, 5),
                      child: Text(
                        currentErrorMsg,
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  : SizedBox(height: 10),
              Text('Target Savings Goal'),
              SizedBox(height: 10),
              TextField(
                controller: targetGoalController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'RM',
                  hintText: 'XXXX.XX',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      color: isTargetError ? Colors.red : Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      color: isTargetError ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
              isTargetError
                  ? Padding(
                      padding: EdgeInsetsGeometry.fromLTRB(0, 5, 0, 5),
                      child: Text(
                        targetErrorMsg,
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  : SizedBox(height: 10),
              Text('Savings per Week'),
              SizedBox(height: 10),
              TextField(
                controller: savingsPerWeekController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'RM',
                  hintText: 'XXXX.XX',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      color: isSavingsError ? Colors.red : Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      color: isSavingsError ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
              isSavingsError
                  ? Padding(
                      padding: EdgeInsetsGeometry.fromLTRB(0, 5, 0, 15),
                      child: Text(
                        savingsErrorMsg,
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  : SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: calWeeksRequired,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Color(0xFF5263A4),
                    ),
                    foregroundColor: WidgetStatePropertyAll<Color>(
                      Colors.white,
                    ),
                  ),
                  child: Text('Calculate', style: TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(height: 30),
              if (result.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey[200],
                  ),
                  child: Text(
                    result,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void calWeeksRequired() {
    String currentAmountText = currentAmountController.text;
    String targetGoalText = targetGoalController.text;
    String savingsPerWeekText = savingsPerWeekController.text;
    double currentAmount, targetGoal, savingsPerWeek;

    // make sure the result is empty if got any exceptions
    result = '';
    setState(() {});

    // check current amount text field validity
    if (currentAmountText.isEmpty) {
      isCurrentError = true;
      currentErrorMsg = 'Please enter the field';
      setState(() {});
      return;
    } else {
      // check double parsing
      try {
        currentAmount = double.parse(currentAmountText);
        // check value in 2 decimals
        // reference for solving the problem 10.12 * 100 = 1011.99999999999
        // https://api.dart.dev/stable/2.15.1/dart-core/num/toStringAsFixed.html
        if (double.parse((currentAmount * 100).toStringAsFixed(2)) % 1 != 0) {
          isCurrentError = true;
          currentErrorMsg = 'Please enter amounts maximum two decimal places.';
          setState(() {});
          return;
        }
        isCurrentError = false;
        setState(() {});
      } catch (e) {
        isCurrentError = true;
        currentErrorMsg = 'Please enter valid amounts';
        setState(() {});
        return;
      }
    }

    // check target goal text field validity
    if (targetGoalText.isEmpty) {
      isTargetError = true;
      targetErrorMsg = 'Please enter the field';
      setState(() {});
      return;
    } else {
      try {
        // check double parsing
        targetGoal = double.parse(targetGoalText);
        if (double.parse((targetGoal * 100).toStringAsFixed(2)) % 1 != 0) {
          isTargetError = true;
          targetErrorMsg = 'Please enter amounts maximum two decimal places.';
          setState(() {});
          return;
        }
        // check target goal value if less than or equal to 0
        if (targetGoal <= 0) {
          isTargetError = true;
          targetErrorMsg = 'Target goal must be greater than zero.';
          setState(() {});
          return;
        }
        // check target goal value if less than current amount value
        if (targetGoal < currentAmount) {
          isTargetError = true;
          targetErrorMsg =
              'Target goal must be greater than current amount saved.';
          setState(() {});
          return;
        }
        isTargetError = false;
        setState(() {});
      } catch (e) {
        isTargetError = true;
        targetErrorMsg = 'Please enter valid amounts';
        setState(() {});
        return;
      }
    }

    // check savings per week text fielid validity
    if (savingsPerWeekText.isEmpty) {
      isSavingsError = true;
      savingsErrorMsg = 'Please enter the field';
      setState(() {});
      return;
    } else {
      try {
        // check double parsing
        savingsPerWeek = double.parse(savingsPerWeekText);
        if (double.parse((savingsPerWeek * 100).toStringAsFixed(2)) % 1 != 0) {
          isSavingsError = true;
          savingsErrorMsg = 'Please enter amounts maximum two decimal places.';
          setState(() {});
          return;
        }
        // check savings if less than or equal to 0
        if (savingsPerWeek <= 0) {
          isSavingsError = true;
          savingsErrorMsg = 'Savings per week must be greater than zero.';
          setState(() {});
          return;
        }
        isSavingsError = false;
        setState(() {});
      } catch (e) {
        isSavingsError = true;
        savingsErrorMsg = 'Please enter valid amounts';
        setState(() {});
        return;
      }
    }

    // calculation
    double amountNeeded = targetGoal - currentAmount;
    if (amountNeeded <= 0) {
      result = 'You have already reached your savings goal!';
    } else {
      double weeksRequired = amountNeeded / savingsPerWeek;
      weeksRequired = double.parse(weeksRequired.toStringAsFixed(1));
      result = 'You will reach your savings goal in $weeksRequired weeks.';
    }
    setState(() {});
  }
}
