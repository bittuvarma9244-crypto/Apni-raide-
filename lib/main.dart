import 'package:flutter/material.dart';

void main() {
  runApp(const ApniRideApp());
}

class ApniRideApp extends StatelessWidget {
  const ApniRideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apni Ride',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const BookingPage(),
    );
  }
}

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final pickupController = TextEditingController();
  final destinationController = TextEditingController();

  String message = 'अपनी बाइक राइड बुक करें';

  @override
  void dispose() {
    pickupController.dispose();
    destinationController.dispose();
    super.dispose();
  }

  void bookRide() {
    if (pickupController.text.trim().isEmpty ||
        destinationController.text.trim().isEmpty) {
      setState(() {
        message = 'कृपया Pickup और Destination भरें।';
      });
      return;
    }

    setState(() {
      message =
          'बुकिंग अनुरोध तैयार है!\n'
          'Pickup: ${pickupController.text.trim()}\n'
          'Destination: ${destinationController.text.trim()}\n'
          'यह अभी डेमो बुकिंग है।';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apni Ride 🏍️'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.two_wheeler,
              size: 90,
              color: Colors.green,
            ),
            const SizedBox(height: 12),
            const Text(
              'आपकी अपनी राइड',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ambikapur, Chhattisgarh',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            TextField(
              controller: pickupController,
              decoration: const InputDecoration(
                labelText: 'Pickup Location',
                hintText: 'कहाँ से जाना है?',
                prefixIcon: Icon(Icons.my_location),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: destinationController,
              decoration: const InputDecoration(
                labelText: 'Destination',
                hintText: 'कहाँ जाना है?',
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: bookRide,
              icon: const Icon(Icons.directions_bike),
              label: const Text('बाइक बुक करें'),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            const Text(
              'नोट: यह शुरुआती डेमो है। अभी असली ड्राइवर '
              'या लाइव बुकिंग सिस्टम जुड़ा नहीं है।',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
