# Primary Health Care Mobile App Using Flutter GetX and Firebase

### Table of contents
- [Introduction](#introduction)
- [System requirements](#system-requirements)
- [Technologies used](#technologies-used)
- [Check the UI of the entire app](#app-navigations)
- [Application structure](#application-structure)
- [How to format your code?](#how-to-formate-your-code?)
- [How you can improve code readability?](#how-you-can-improve-code-readability?)
- [Libraries and tools used](#libraries-and-tools-used)
- [Screenshots](#screenshots)

### Introduction

Welcome to PHC Lab, your trusted companion for managing and accessing your health reports with ease and security. Whether you're a healthcare professional or an individual taking charge of your well-being, PHC Lab empowers you to create, view, edit, delete, and securely share your lab reports in a seamless digital environment.

### System requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.3.0 or greater.

### Technologies Used

* Front-end: Flutter
* Database: Firebase
* State management: GetX

### Check the UI of the entire app

Check the UI of all the app screens from a single place by setting up the 'initialRoute'  to AppNavigation in the AppRoutes.dart file.

### Application structure

After successful build, your application structure should look like this:

```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains all constants classes
    │   ├── errors                  - It contains error handling classes                  
    │   ├── network                 - It contains network-related classes
    │   └── utils                   - It contains common files and utilities of the application
    ├── data
    │   ├── apiClient               - It contains API calling methods 
    │   ├── models                  - It contains request/response models 
    │   └── repository              - Network repository
    ├── localization                - It contains localization classes
    ├── presentation                - It contains widgets of the screens with their controllers and the models of the whole application.
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```

### How to format your code?

- if your code is not formatted then run following command in your terminal to format code
  ```
  dart format .
  ```

### How you can improve code readability?

Resolve the errors and warnings that are shown in the application.

### Libraries and tools used

- get - State management
  https://pub.dev/packages/get
- connectivity_plus - For status of network connectivity
  https://pub.dev/packages/connectivity_plus
- shared_preferences - Provide persistent storage for simple data
  https://pub.dev/packages/shared_preferences
- cached_network_image - For storing internet image into cache
  https://pub.dev/packages/cached_network_image

### Screenshots

![8-imageonline co-merged (1)-imageonline co-merged (1)](https://github.com/SuhailMuhammed1/Primary-Health-Care-Mobile-App-Using-Flutter-GetX-And-Firebase/assets/104970300/41d8e262-f4bd-4298-b4f3-497d0a9bd60d)
