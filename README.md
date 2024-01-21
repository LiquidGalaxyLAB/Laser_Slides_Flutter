# Laser_Slides_Flutter

**Introduction:**

This Flutter project is designed to seamlessly integrate with Beyond software using OSC (Open Sound Control) commands. OSC is a protocol for communication among computers, sound synthesizers, and other multimedia devices. The primary goal of this project is to leverage OSC commands to establish reliable and efficient communication with Beyond software, enhancing the capabilities of the Flutter application.

**Key Features:**

1. **OSC Integration with Beyond Software:**
   - Utilizes OSC commands to establish a communication link with Beyond software.
   - Implements OSC messages to send and receive data between the Flutter application and Beyond software.

2. **BLoC Architecture:**
   - Leverages the BLoC pattern to manage the application's state and business logic.
   - Separates OSC integration logic into dedicated BLoCs for modularity and maintainability.

3. **Floor for Local Database:**
   - Integrates Floor for local database management to store OSC-related data and network configurations locally.

4. **GetIt for Service Location:**
   - Implements GetIt to efficiently manage connection repositories, services and dependencies.
   - Enhances the application's scalability and maintainability through proper service location.

**Tech Stack:**

- Dart
- BLoC Architecture
- OSC (Open Sound Control)
- Floor (Local Database)
- GetIt (Service Location)
- KISS Architecture

**OSC (Open Sound Control) Working:**

OSC is a protocol that enables communication between devices by sending messages in a simple, human-readable format. In the context of this Flutter project:

- **Sending OSC Messages:**
  - The Flutter application generates OSC messages based on user interactions or predefined events.
  - OSC messages typically include an address pattern and zero or more arguments.
  - Example: Sending an OSC message to change the color in Beyond software: `/color 255 0 0` (sets color to red).

- **Receiving OSC Messages:**
  - The Flutter application listens for incoming OSC messages from Beyond software.
  - Upon receiving a message, the application processes the OSC data and updates its state accordingly.
  - Example: Receiving an OSC message with new coordinates: `/coordinates 100 50` (updates the application's display).

**How to Run:**

1. Clone the repository.
2. Ensure you have Flutter and Dart installed.
3. Run `flutter pub get` to fetch the project dependencies.
4. Execute `flutter run` to launch the application on an emulator or connected device.

**Screens:**
<p align = "left">
<img src = https://github.com/Saumya-28/Laser_Slides_Flutter/assets/98171392/e21e0cde-853b-4e32-8358-84b61b7c9727 width = "200" height = "430">
<img src = https://github.com/Saumya-28/Laser_Slides_Flutter/assets/98171392/dd1798a4-4cdb-41d5-8962-bbc3efe327f6 width = "200" height = "430">
<img src = https://github.com/Saumya-28/Laser_Slides_Flutter/assets/98171392/15f82f6d-8b4b-4a18-80db-c7979c260f6f width = "200" height = "430">
<img src = https://github.com/Saumya-28/Laser_Slides_Flutter/assets/98171392/8582942d-e7fa-464a-a609-6992cee166b0 width = "200" height = "430">
 </p>
 <br>
 <p align = "left">
<img src =https://github.com/Saumya-28/Laser_Slides_Flutter/assets/98171392/fe2f8b34-8c3c-40c2-bab3-a0eaa113a1e8  width = "200" height = "430">
<img src = https://github.com/Saumya-28/Laser_Slides_Flutter/assets/98171392/61c9002b-2864-46a1-abd0-ffc5f1937a8c width = "200" height = "430">
   <img src = https://github.com/Saumya-28/Laser_Slides_Flutter/assets/98171392/a7e7dc9b-a5c3-4134-be8a-aed62deb1c87 width = "200" height = "430">
      <img src = https://github.com/Saumya-28/Laser_Slides_Flutter/assets/98171392/c42d2b1c-da6a-42ad-b3ab-a5280c6e1752 width = "200" height = "430">
  </p>



