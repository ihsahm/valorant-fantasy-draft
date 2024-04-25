import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valorant_fantasy/constants/colors.dart';
import 'package:valorant_fantasy/views/authentication_page/team_build_page/team_build_page.dart';

class TeamPlayerList extends StatefulWidget {
  const TeamPlayerList({super.key});

  @override
  State<TeamPlayerList> createState() => _TeamPlayerListState();
}

class _TeamPlayerListState extends State<TeamPlayerList> {
  List<dynamic> players = [];

  List<dynamic> filteredPlayers = [];

  TextEditingController searchController = TextEditingController();

  void filterPlayers(String query) {
    setState(() {
      filteredPlayers = players
          .where((player) =>
              player['player_name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  bool isLoading = false;

  Future<void> fetchPlayers() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await Dio().get('https://vlrgg.cyclic.app/api/players');
      if (response.statusCode == 200) {
        List<dynamic> sortedPlayers = List.from(response.data['players']);
        sortedPlayers.sort((a, b) => double.parse(b['average_combat_score'])
            .compareTo(double.parse(a['average_combat_score'])));
        setState(() {
          players = sortedPlayers;
          filteredPlayers = sortedPlayers;
        });
      } else {
        throw Exception('Failed to load players');
      }
    } catch (e) {
      final errorSnackbar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(errorSnackbar);
      debugPrint(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 1, 38, 67),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.close,
                color: ColorsConst.white,
              )),
        ),
        body: isLoading
            ? const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 1, 38, 67),
                      Color.fromARGB(255, 1, 38, 67)
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextField(
                        controller: searchController,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) {
                          filterPlayers(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Search by player name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          labelStyle: TextStyle(color: Colors.grey[200]),
                        ),
                      ),
                    ),
                    filteredPlayers.isEmpty
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'No players found with that name',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                              physics: const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  endIndent: 10,
                                  indent: 10,
                                  thickness: 0.5,
                                );
                              },
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final player = filteredPlayers[index];
                                return ListTile(
                                  onTap: () {
                                    showModalBottomSheet(
                                        backgroundColor: const Color.fromARGB(
                                            255, 1, 38, 67),
                                        context: context,
                                        builder: (context) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                player['player_name'],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              ListTile(
                                                leading: const Text(
                                                  "Country",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                trailing: Text(
                                                  player['player_country_initials']
                                                      .toUpperCase(),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              ListTile(
                                                leading: const Text(
                                                  "Rating",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                trailing: Text(
                                                  player['rating'],
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              ListTile(
                                                leading: const Text(
                                                  "KDA",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                trailing: Text(
                                                  player['kills_deaths'],
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              ListTile(
                                                leading: const Text(
                                                  "Headshot percentage",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                trailing: Text(
                                                  player['headshot_percentage']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              ListTile(
                                                leading: const Text(
                                                  "Average damage per round",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                trailing: Text(
                                                  player[
                                                      'average_damage_per_round'],
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              SizedBox(
                                                  width: double.infinity,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Get.offAll(
                                                          () => TeamBuildPage(
                                                                playerName: player[
                                                                    'player_name'],
                                                                teamInitials:
                                                                    player[
                                                                        'player_team_initials'],
                                                              ));
                                                    },
                                                    child: const Text(
                                                      "Add player",
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                    ),
                                                  )),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  title: Text(
                                    player['player_name'],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    player['player_team_initials']
                                        .toUpperCase(),
                                    style:
                                        const TextStyle(color: Colors.white60),
                                  ),
                                  trailing: Text(
                                    player['average_combat_score'],
                                    style:
                                        const TextStyle(color: Colors.white60),
                                  ),
                                );
                              },
                              itemCount: filteredPlayers.length,
                            ),
                          ),
                  ],
                ),
              ));
  }
}
