# outfit_store

A new Flutter project.

## Short Review

- core/
contains app-wide configs and utilities (e.g colors, fonts, constants, app themes,  date/time helpers) => used globally

- features/
data/ => API calls, models, local storage
presentation/ => screen and ui components for the features
provider/ => state management(Riverpod, Bloc, Provider)


- shared/
reasubale multiple features (BUttons, Cards, ect)

- Services/
App-wide services(HTTPS requests, jwt token, notification, ect)

- models/
Shared models that multiple features use(Usre, Product, Cart).

- utils/
Helper Functions, validator, or formartters(formatPrice(), validateEmail().)

- routes/
centralizing navigation logic ( app_routes.dart, route_guard,dart, app_router.dart)