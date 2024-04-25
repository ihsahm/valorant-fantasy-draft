import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> teamResults = [];
  bool isLoading = false;
  Future<void> fetchTeamResults() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response =
          await Dio().get('https://vlrgg.cyclic.app/api/matches/results');
      if (response.statusCode == 200) {
        setState(() {
          teamResults = response.data['matches'];
        });
      } else {
        throw Exception('Failed to load results');
      }
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTeamResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 38, 67),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Dashboard"),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: teamResults.length,
                      itemBuilder: (context, index) {
                        final teamResult = teamResults[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {},
                            tileColor: const Color.fromARGB(255, 2, 8, 8),
                            visualDensity: const VisualDensity(vertical: 4),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  teamResult['team_one_name'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  teamResult['team_two_name'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  teamResult['team_one_score'],
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  teamResult['team_two_score'],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
    );
  }
}
