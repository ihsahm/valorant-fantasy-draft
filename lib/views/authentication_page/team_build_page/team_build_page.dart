import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valorant_fantasy/views/authentication_page/team_build_page/team_player_list_page.dart';

class TeamBuildPage extends StatelessWidget {
  final String? playerName;
  final String? teamInitials;
  const TeamBuildPage({super.key, this.playerName, this.teamInitials});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select players you prefer",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            playerCard(context),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 35, 211, 129)),
                    onPressed: () {},
                    child: const Text(
                      "Done",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget playerCard(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () async {
                Get.to(() => const TeamPlayerList());
              },
              child: ListTile(
                leading: const Icon(
                  Icons.gamepad,
                  size: 40,
                  color: Colors.amber,
                ),
                title: Text(
                  playerName.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  teamInitials.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ));
        });
  }
}
