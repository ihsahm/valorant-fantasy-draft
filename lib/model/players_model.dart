// To parse this JSON data, do
//
//     final playersModel = playersModelFromJson(jsonString);

import 'dart:convert';

PlayersModel playersModelFromJson(String str) => PlayersModel.fromJson(json.decode(str));

String playersModelToJson(PlayersModel data) => json.encode(data.toJson());

class PlayersModel {
    String? playerName;
    String? playerLink;
    String? playerTeamInitials;
    String? playerCountryInitials;
    String? roundsPlayed;
    String? rating;
    String? averageCombatScore;
    String? killsDeaths;
    String? killAssistTradeSurvivePercentage;
    String? averageDamagePerRound;
    String? killsPerRound;
    String? assistsPerRound;
    String? firstKillsPerRound;
    String? firstDeathsPerRound;
    String? headshotPercentage;
    String? clutchSuccessPercentage;
    String? maxKillsInSingleMap;
    String? kills;
    String? deaths;

    PlayersModel({
        this.playerName,
        this.playerLink,
        this.playerTeamInitials,
        this.playerCountryInitials,
        this.roundsPlayed,
        this.rating,
        this.averageCombatScore,
        this.killsDeaths,
        this.killAssistTradeSurvivePercentage,
        this.averageDamagePerRound,
        this.killsPerRound,
        this.assistsPerRound,
        this.firstKillsPerRound,
        this.firstDeathsPerRound,
        this.headshotPercentage,
        this.clutchSuccessPercentage,
        this.maxKillsInSingleMap,
        this.kills,
        this.deaths,
    });

    factory PlayersModel.fromJson(Map<String, dynamic> json) => PlayersModel(
        playerName: json["player_name"],
        playerLink: json["player_link"],
        playerTeamInitials: json["player_team_initials"],
        playerCountryInitials: json["player_country_initials"],
        roundsPlayed: json["rounds_played"],
        rating: json["rating"],
        averageCombatScore: json["average_combat_score"],
        killsDeaths: json["kills_deaths"],
        killAssistTradeSurvivePercentage: json["kill_assist_trade_survive_percentage"],
        averageDamagePerRound: json["average_damage_per_round"],
        killsPerRound: json["kills_per_round"],
        assistsPerRound: json["assists_per_round"],
        firstKillsPerRound: json["first_kills_per_round"],
        firstDeathsPerRound: json["first_deaths_per_round"],
        headshotPercentage: json["headshot_percentage"],
        clutchSuccessPercentage: json["clutch_success_percentage"],
        maxKillsInSingleMap: json["max_kills_in_single_map"],
        kills: json["kills"],
        deaths: json["deaths"],
    );

    Map<String, dynamic> toJson() => {
        "player_name": playerName,
        "player_link": playerLink,
        "player_team_initials": playerTeamInitials,
        "player_country_initials": playerCountryInitials,
        "rounds_played": roundsPlayed,
        "rating": rating,
        "average_combat_score": averageCombatScore,
        "kills_deaths": killsDeaths,
        "kill_assist_trade_survive_percentage": killAssistTradeSurvivePercentage,
        "average_damage_per_round": averageDamagePerRound,
        "kills_per_round": killsPerRound,
        "assists_per_round": assistsPerRound,
        "first_kills_per_round": firstKillsPerRound,
        "first_deaths_per_round": firstDeathsPerRound,
        "headshot_percentage": headshotPercentage,
        "clutch_success_percentage": clutchSuccessPercentage,
        "max_kills_in_single_map": maxKillsInSingleMap,
        "kills": kills,
        "deaths": deaths,
    };
}
