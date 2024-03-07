import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MealPlanner(),
  ));
}

class MealPlanner extends StatefulWidget {
  @override
  _MealPlannerState createState() => _MealPlannerState();
}

class _MealPlannerState extends State<MealPlanner> {
  Map<String, String> _meals = {};


  void _addMeal(String day, String meal) {
    setState(() {
      _meals[day] = meal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Planner'),
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          String day = _getDayOfWeek(index + 1);
          return ListTile(
            title: Text(day),
            subtitle: _meals.containsKey(day) ? Text(_meals[day]!) : null,
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => _buildAddMealDialog(day),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildAddMealDialog(String day) {
    TextEditingController _textController = TextEditingController();
    return AlertDialog(
      title: Text('Add Meal for $day'),
      content: TextField(
        controller: _textController,
        decoration: InputDecoration(hintText: 'Enter meal name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            _addMeal(day, _textController.text);
            Navigator.pop(context);
          },
          child: Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }

  String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }
}
