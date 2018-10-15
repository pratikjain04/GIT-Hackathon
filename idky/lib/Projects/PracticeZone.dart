class PracticeZone{

  String probName;
  String source;
  String url;
  String difficulty;

  PracticeZone(this.probName, this.url, this.source, this.difficulty);

}


List<PracticeZone> practiceZones = [

  PracticeZone('Small Factorial','https://www.codechef.com/problems/FLOW018' ,'codechef', 'Beginners'),
  PracticeZone('Queries on Tree', 'https://www.hackerearth.com/challenges/', 'Hackerearth', 'Easy'),
  PracticeZone('Factorize', 'https://www.hackerrank.com/', 'Hackerrank', 'Easy'),
  PracticeZone('Bear and Almost Row', 'https://www.spoj.com/', 'SPOJ', 'Medium'),
  PracticeZone('Day Schedule', 'https://www.geeksforgeeks.org/', 'GeeksforGeeks', 'Medium'),
  PracticeZone('A Simple Polygon', 'https://www.topcoder.com', 'TopCoder', 'Hard'),

];