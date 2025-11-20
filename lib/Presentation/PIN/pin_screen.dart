import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/Components/page_top_layout.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String? firstPin;
  late String pageTitle = 'Enter PIN';
  final securedStorage = FlutterSecureStorage();
  List<String> pin = [];
  final List<String> pinbuttons = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '✓',
    '0',
    '⌫',
  ];
  final int totaldots = 4;

  void handleCompletePIN() {
    final enteredPin = pin.join(); // this converts this list in string.

    setState(() {
      if (firstPin == null) {
        print(
          '____________First PIN Entered : $enteredPin ______________________',
        );

        firstPin = enteredPin;
        pin.clear();
        pageTitle = 'Re-enter PIN';
      } else {
        print(
          '____________________Second PIN Entered : $enteredPin __________________',
        );
        print(
          '____________________Comparing with first PIN : $firstPin __________________',
        );

        if (enteredPin == firstPin) {
          print('____________________');
          print('PIN Matched');

          _savePIN(enteredPin);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Welcome to BKMS'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
          GoRouter.of(context).go('/home');
        } else {
          print('PIN did not match');
          print('First PIN was: $firstPin');
          print('Second PIN was: $enteredPin');

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('PIN is not matching'),
              backgroundColor: Colors.red,
            ),
          );

          firstPin = null;
          pin.clear();
          pageTitle = 'Enter PIN';
        }
      }
    });
  }

  Future<void> _savePIN(String pinToSave) async {
    try {
      await securedStorage.write(key: 'user_pin', value: pinToSave);
      print('PIN saved to Secured Storage PIN is: $pinToSave');
    } catch (e) {
      print('Error saving PIN: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final int pinlenght = pin.length;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              PageTopLayout(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Center(
                  child: Text(pageTitle, style: TextStyle(fontSize: 18)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(totaldots, (index) {
                  final isFilled = index < pinlenght;
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                      color: isFilled ? Colors.black : Colors.transparent,
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 400,
                child: GridView.builder(
                  padding: EdgeInsets.all(50),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0.5,
                    mainAxisSpacing: 11,
                    childAspectRatio: 1.3,
                  ),
                  itemCount: pinbuttons.length,
                  itemBuilder: (context, index) {
                    final label = pinbuttons[index];
                    return GestureDetector(
                      onTap: () {
                        print(
                          '_________Button is pressed: _____________$label __________________',
                        );
                        setState(() {
                          if (label == '⌫') {
                            if (pin.isNotEmpty) {
                              pin.removeLast();
                              print(
                                'Removed Last Digit. Current PIN: ${pin.join()}',
                              );
                            } else {
                              print('PIN is already empty');
                            }
                          } else if (label == '✓') {
                            print('Submit button pressed');
                            if (pin.length == totaldots) {
                              print('PIN is complete, processing.....');
                              handleCompletePIN();
                            } else {
                              print(
                                'PIN is Incomplete. Need $totaldots digit, has ${pin.length}',
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please enter all $totaldots digits.',
                                  ),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          } else {
                            if (pin.length < totaldots) {
                              pin.add(label);
                              print('Current PIN: ${pin.join()}');

                              if (pin.length == totaldots) {
                                handleCompletePIN();
                              }
                            } else {
                              print('PIN hase $totaldots digits');
                            }
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        //color: Colors.grey,
                        child: Center(
                          child: Text(
                            label,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
