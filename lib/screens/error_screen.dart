import 'package:xiv/controllers/error_interface.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CDialog(
      title: 'Citizen not found',
      body: 'Maybe lives in some other server?',
      gifString: kGifError,
    );
  }
}
