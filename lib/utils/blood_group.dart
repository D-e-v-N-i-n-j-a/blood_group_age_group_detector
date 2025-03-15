import 'dart:math';

final List<Map<String, String>> samples = [
  {'bloodGroup': 'A+', 'age': '20'},
  {'bloodGroup': 'A-', 'age': '25'},
  {'bloodGroup': 'B+', 'age': '30'},
  {'bloodGroup': 'B-', 'age': '35'},
  {'bloodGroup': 'O+', 'age': '40'},
  {'bloodGroup': 'O-', 'age': '45'},
  {'bloodGroup': 'AB+', 'age': '50'},
  {'bloodGroup': 'AB-', 'age': '55'},
  {'bloodGroup': 'A+', 'age': '22'},
  {'bloodGroup': 'A-', 'age': '28'},
  {'bloodGroup': 'B+', 'age': '33'},
  {'bloodGroup': 'B-', 'age': '38'},
  {'bloodGroup': 'O+', 'age': '42'},
  {'bloodGroup': 'O-', 'age': '48'},
  {'bloodGroup': 'AB+', 'age': '53'},
  {'bloodGroup': 'AB-', 'age': '58'},
  {'bloodGroup': 'A+', 'age': '23'},
  {'bloodGroup': 'A-', 'age': '26'},
  {'bloodGroup': 'B+', 'age': '32'},
  {'bloodGroup': 'B-', 'age': '36'},
  {'bloodGroup': 'O+', 'age': '41'},
  {'bloodGroup': 'O-', 'age': '46'},
  {'bloodGroup': 'AB+', 'age': '51'},
  {'bloodGroup': 'AB-', 'age': '56'},
  {'bloodGroup': 'A+', 'age': '24'},
  {'bloodGroup': 'A-', 'age': '29'},
  {'bloodGroup': 'B+', 'age': '34'},
  {'bloodGroup': 'B-', 'age': '39'},
  {'bloodGroup': 'O+', 'age': '43'},
  {'bloodGroup': 'O-', 'age': '49'},
  {'bloodGroup': 'AB+', 'age': '52'},
  {'bloodGroup': 'AB-', 'age': '57'},
];

final random = Random();
final List<String> genders = ['Male', 'Female'];

// Add random gender to each entry
final List<Map<String, String>> updatedSamples = samples.map((sample) {
  return {
    ...sample,
    'gender': genders[random.nextInt(genders.length)] // Randomly assign gender
  };
}).toList();
