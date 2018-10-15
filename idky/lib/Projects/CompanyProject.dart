class CompanyProject{

  String projectName;
  String companyName;
  String domainName;
  String description;

  CompanyProject(this.projectName, this.companyName, this.domainName, this.description);


}


List<CompanyProject> companyProjects = [

  CompanyProject(
      'Acronis',
      'Acro Solutions',
      'Web Development',
      'Build a Website on PHP'
  ),

  CompanyProject(
      'Freshko',
      'Kalpana Enterprises',
      'Web Development',
      'Build a Website on PHP'
  ),

  CompanyProject(
      'Freshko',
      'Kalpana Enterprises',
      'App Development',
      'Build a mobile app on JAVA'
  ),

  CompanyProject(
      'Amazon Echo',
      'Amazon',
      'Machine Learning',
      'Build a weather prediction system'
  ),

  CompanyProject(
      'Micrsoft Azure',
      'Microsoft',
      'Cloud Computing',
      'Build a SaaS for Azure'
  ),

  CompanyProject(
      'BigBasket',
      'BigBasket',
      'Web Development',
      'Build a website for grocery shopping'
  ),

  CompanyProject(
      'Techeach',
      'Edureka',
      'Competitve Programming',
      'Make Competitive Programming Questions'
  ),


];
