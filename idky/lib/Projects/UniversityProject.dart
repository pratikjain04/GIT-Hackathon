class UniversityProject{


  String projectName;
  String companyName;
  String domainName;
  String description;
  String longDesc;

  UniversityProject(this.projectName, this.companyName, this.domainName, this.description, this.longDesc);

}


List<UniversityProject> universityProjects = [

  UniversityProject(
      'Smart Energy Rooms',
      'Pratik Jain',
      'Internet of Things',
      'Research Project for Energy Reduction',
      ''
  ),

  UniversityProject(
      'TechiDeate',
      'Anshuman Kalla',
      'Web Development',
      'Website on PHP for Tech Fest',
      ''
  ),

  UniversityProject(
      'Marksheet Scanner',
      'Ankit Sharma',
      'Machine Learning',
      'Uploads the marks of exams \ndirectly in one image',
      ''
  ),

  UniversityProject(
      'infoGIT',
      'Aashis Kumar',
      'App Development',
      'App which gives all the information on GIT',
      ''
  ),

  UniversityProject(
      'DroneAid',
      'Pratik Jain',
      'Internet of Things',
      'Research Project for Disaster Management',
      ''
  ),



];
