import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';
import 'dart:math';

// Har user ke liye unique ID
final String localUserID = Random().nextInt(10000).toString();
const String roomID = "star_party_001";

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Star Chat dark theme
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mic_none_rounded, size: 80, color: Colors.blueAccent),
            const SizedBox(height: 20),
            const Text(
              "Star Chat Room",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text("Start Voice Party", style: TextStyle(color: Colors.white, fontSize: 18)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const AudioRoomPage(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AudioRoomPage extends StatelessWidget {
  const AudioRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltLiveAudioRoom(
      appID: 42704720, // Aapki provided AppID
      appSign: 'e81304a0fde82092ef551c656c6baffa5eac43888f13ac9d104f67d0aafb5b0d', // Aapka provided AppSign
      userID: localUserID,
      userName: "User_$localUserID",
      roomID: roomID,
      config: ZegoUIKitPrebuiltLiveAudioRoomConfig.host(),
    );
  }
}
