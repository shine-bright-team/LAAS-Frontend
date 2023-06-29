# LAAS
[LAAS WEB](https://laas.pspgun.com/)

Flutter project for integrated project II.
LAAS is A platform that helps people can easily access microloans.

## Solution SDG Gold No.10
**problem**
     The small group of people in Thailand can not access traditional financial institutions since they have poor credit and no guarantor, or the loan might be less than the lowest amount the bank allows. They also can not get a credit card. This leads them to the loan shark that has a too high-interest rate. It is inequality among people's statuses.

## Setting up
### Prerequisite
- **.env** file 
Please make sure that you have file named **.env** at the root of the project 
 *Noted:* The file should be included in the zipped folder.
- Dart version
LAAS is running on dart SDK version ```3.10.3 (stable)```. The major version change may affect the running process.
- Flutter version
LAAS is running on Flutter sdk version ```">=3.0.2 <4.0.0"```. The major version change may affect the running process.
- Enable Developer mode (Windows only)
The building plugins requries symlink support. 
Please run ``` start ms-settings:developers``` in Adminstarator mode to open the setting.

### Running LAAS
1. **Download dependencies**
    Download all dependencies via ```flutter pub get```
2. **Running LAAS**
    Using ``` flutter run ``` to run the project 
    Noted: Please use the compatible devices so the experience of Jaijaoni is  smoothly optimized.
2.1 **Running on web**
    If you want to run on the website, Please use ```flutter run -d chrome --web-browser-flag "--disable-web-security"``` instread.

## List of dependencies
- Go_Router
- dynamic_color
- firebase_auth
- flutter_dotenv
- cloud_firestore
- River_pod
- qr_code_scanner
- qr_flutter
- google_sign_in 
- promptpay_qrcode_generate
