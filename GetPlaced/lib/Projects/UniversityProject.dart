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
      'Controls Smart Room Control Solution is a unified system for the control of HVAC room terminal equipment, lighting, and shades/sunblind. This solution allows you to achieve the highest levels of comfort for occupants while increasing operating cost savings, from installation time and wiring/material requirements to energy consumption. It is a unique, modular solution designed for local or room applications, such as offices, open spaces, patient rooms, dorms and military housing.'
  ),

  UniversityProject(
      'TechiDeate',
      'Anshuman Kalla',
      'Web Development',
      'Website on PHP for Tech Fest',
      'Techideate is the annual science and technology festival of Manipal University Jaipur. It also refers to the independent body of students who organize this event along with many other social initiatives and outreach programs around the year. Techideate is known for hosting a variety of events that include competitions, exhibitions, lectures as well as workshops. Started in 1998 with the aim of providing a platform for the Indian student community to develop and showcase their technical prowess, it has now grown into Asia\'s Largest Science and Technology Festival with a footfall of 1.75 lakhs in its latest edition. The activities culminate in a grand three-day festival event in the campus of IIT Bombay which attracts people from all over the World, including students, academia, corporates and the general public.'
  ),

  UniversityProject(
      'Marksheet Scanner',
      'Ankit Sharma',
      'Machine Learning',
      'Uploads the marks of exams \ndirectly in one image',
      'This is the first step. After you\'ve scanned the paper documents, you have their electronic versions existing as a non-text format. Optical character recognition (OCR)  is a method of transforming a scanned image into text. Once the paper has been scanned, an electronic document is created, but the computer interprets the text as a number of white and black dots. In order to make the computer interpret the text from a scanned document as text, the OCR software is used. By examining the lines and curves of an image, it attempts to determine whether a combination is a particular sign, or a letter.'
  ),

  UniversityProject(
      'infoGIT',
      'Aashis Kumar',
      'App Development',
      'App which gives all the information on GIT',
      'This is the source for tnetstrings.info, a specification for "tagged netstrings". It\'s a copy of the spec that was originally at tnetstrings.org, which has since disappeared. The original domain has been squatted on by some company that apparently specializes in such idiocy, so I opted to copy the latest version of the original spec I could find (thanks Internet Archive!) and publish it under a new domain.As the site says, most of the text was written by Zed A. Shaw; I just fixed some mismatched tags, and added some CSS and the links to known implementations. Thanks to him for inventing the protocol in the first place and for this spec.'
  ),

  UniversityProject(
      'DroneAid',
      'Pratik Jain',
      'Internet of Things',
      'Research Project for Disaster Management',
      'Drone Aid is an innovative service which brings drones to our everyday life. If you suffer from allergies, asthma or you just had an accident, such as a burn, and you don\'t own the medication, don\'t worry. Just with the touch of a button, a first aid kit for your emergency "lands" at the exact spot where you are. Your accurate position is being tracked by GPS, and our app informs you about the arrival time of the drone, as well as where it lands, in case you are in indoors and the drone cannot reach the place.'
  ),


];
