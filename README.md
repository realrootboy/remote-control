# mobile-websocket-gamepad
 A cross-platform remote control application that interacts with multimedia controllers, communicating with peripherals via websockets and virtual keys using Windows API.

## Server Setup

To install server requeriments:
```
pip install websockets
pip install pyautogui
```
Set your IP Address in main.py:
```
start_server = websockets.serve(handler, <IP_ADDRESS>, 8001)
```
Run the code:
```
python3 main.py
```

## Client Setup

To install client requeriments:
```
flutter pub get
```
Run the code:
```
flutter run lib/main.dart
```

## Multimedia DLL

The DLL was precompiled but if you want you can go to the server/DLL_Files folder and compile it yourself. I used Visual Studio 2022 Community Edition. 