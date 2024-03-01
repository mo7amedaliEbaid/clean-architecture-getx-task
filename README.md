# mobile_test_task
- This structure follows a clean architecture approach, with clear separation of concerns, Using the efficient Getx state management.

## Directory Structure:
```
lib
│
├── bindings
│   ├── login_bindings.dart
│   ├── register_bindings.dart
│   ├── update_user_bindings.dart
│   └── bindings.dart
│
├── configs
│   ├── app.dart
│   ├── app_dimensions.dart
│   ├── app_typography.dart
│   ├── register.dart
│   ├── app_typography_ext.dart
│   ├── configs.dart
│   ├── space.dart
│   ├── space_ext.dart
│   └── ui.dart
│
├── controllers
│   ├── controllers.dart
│   ├── login.dart
│   ├── register.dart
│   └── update_user.dart
│
├── core
│   ├── app
│   ├── constants
│   ├── di
│   ├── enums
│   ├── helpers
│   ├── interceptors
│   ├── log
│   ├── network
│   ├── routes
│   ├── validators
│   └── core.dart
│
├── data
│   ├── data_sources
│   └── repos
│
├── models
│
├── view
│   ├── screens
│   └── widgets
│
└── main.dart

```
## Dependencies:
```
  dartz:
  dio:
  get:
  hive:
  hive_flutter:
  logger:
  get_it:
  awesome_dialog:
  country_code_picker:
  internet_connection_checker:
```
