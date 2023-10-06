import 'package:flutter/material.dart';

class MatchingScreen extends StatelessWidget {
  final MatchingAlgorithm matchingAlgorithm = MatchingAlgorithm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Science Matchmaker'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Simulate user data
            final List<User> projectCreators = [
              User(userId: 1, skills: ['Python', 'Data Analysis'],
                  interests: ['Machine Learning']),
              User(userId: 2, skills: ['Flutter', ' Analysis'],
                  interests: ['Machine ']),
              // Add more Project Creators
            ];
            final List<User> contributors = [
              User(userId: 101, skills: ['Python', 'Machine Learning'], interests: ['Data Analysis']),
              // Add more Contributors
            ];

            // Simulate matching algorithm
            final List<MatchedPair> matches = matchingAlgorithm.findMatches(projectCreators, contributors);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayMatchesScreen(matches: matches),
              ),
            );
          },
          child: Text('Find Matches'),
        ),
      ),
    );
  }
}

class DisplayMatchesScreen extends StatelessWidget {
  final List<MatchedPair> matches;

  DisplayMatchesScreen({required this.matches});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matches'),
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final match = matches[index];
          return ListTile(
            title: Text('Matched Creator (ID ${match.creator.userId}):'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Skills: ${match.creator.skills.join(', ')}'),
                Text('Interests: ${match.creator.interests.join(', ')}'),
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Matched Contributor \n(ID ${match.contributor.userId}):'),
                Text('Skills: \n${match.contributor.skills.join(', ')}'),
                Text('Interests: \n${match.contributor.interests.join(', ')}'),
                Text('Matching\n Score: ${match.matchingScore.toStringAsFixed(2)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MatchingAlgorithm {
  List<MatchedPair> findMatches(List<User> projectCreators, List<User> contributors) {
    // Simulated matching algorithm logic
    final List<MatchedPair> matches = [];

    for (final creator in projectCreators) {
      for (final contributor in contributors) {
        // Simulated matching score calculation
        final double matchingScore = _calculateMatchingScore(creator, contributor);

        // You can define a threshold for matchingScore to consider it a match
        if (matchingScore >= 2.0) {
          matches.add(MatchedPair(creator: creator, contributor: contributor, matchingScore: matchingScore));
        }
      }
    }

    // Sort the matches by matching score in descending order
    matches.sort((a, b) => b.matchingScore.compareTo(a.matchingScore));

    return matches;
  }

  double _calculateMatchingScore(User creator, User contributor) {
    // Simulated matching score calculation logic
    // You should adapt this based on your actual matching criteria
    // For simplicity, let's assume a constant matching score of 2.5 here
    return 2.5;
  }
}

class MatchedPair {
  final User creator;
  final User contributor;
  final double matchingScore;

  MatchedPair({required this.creator, required this.contributor, required this.matchingScore});
}

class User {
  final int userId;
  final List<String> skills;
  final List<String> interests;

  User({required this.userId, required this.skills, required this.interests});
}