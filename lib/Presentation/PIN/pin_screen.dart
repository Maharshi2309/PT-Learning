import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/Components/page_top_layout.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PinScreen extends StatefulWidget {
  final String mode;
  const PinScreen({super.key, required this.mode});

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

  @override
  void initState() {
    super.initState();
    if (widget.mode == 'create') {
      pageTitle = 'Create PIN';
    } else {
      pageTitle = 'Enter PIN';
    }
  }

  void handleCompletePIN() async {
    final enteredPin = pin.join(); // .join() this converts this list in string.

    setState(() {
      if (widget.mode == 'create') {
        handleCreateMode(enteredPin);
      } else {
        handleVlidateMode(enteredPin);
      }
    });
  }

  void handleCreateMode(String enteredPin) {
    if (firstPin == null) {
      print('--------------------PIN: $enteredPin');

      firstPin = enteredPin;
      pin.clear();
      pageTitle = 'Re-enter PIN';
    } else {
      print('--------------------Confirming PIN:::: First PIN: $firstPin');
      print('--------------------Second PIN: $enteredPin');

      if (enteredPin == firstPin) {
        print(':::::: PIN Matched ::::::');

        _savePIN(enteredPin);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('PIN Created Successfully!!!!   '),
            backgroundColor: Colors.green,
          ),
        );

        Future.delayed(Duration(seconds: 1), () {
          context.go('/home');
        });
      } else {
        print(':::::::  PINs do not match :::::::');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('PIN do not match. Try again !!!!'),
            backgroundColor: Colors.red,
          ),
        );

        firstPin = null;
        pin.clear();
        pageTitle = 'Create PIN';
      }
    }
  }

  void handleVlidateMode(String enteredPin) async {
    print(':::: Validating PIN --- Entered PIN: $enteredPin');

    final storedPin = await securedStorage.read(key: 'user_pin');
    print(' ::::: Stored PIN: $storedPin');

    if (storedPin == null) {
      print(' ::::: ERROR: No Stroed PIN !!!!');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No PIN Found. Please login'),
          backgroundColor: Colors.red,
        ),
      );

      await securedStorage.delete(key: '_user');
      context.go('/login');
      return;
    }

    if (enteredPin == storedPin) {
      print('::::: PIN Matched Successfully ::::::');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Welcome to BKMS'),
          backgroundColor: Colors.green,
        ),
      );
      Future.delayed(Duration(milliseconds: 200), () {
        context.go('/home');
      });
    } else {
      print('::::: Incorrect PIN');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect PIN. Try Again'),
          backgroundColor: Colors.red,
        ),
      );
      pin.clear();
    }
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
