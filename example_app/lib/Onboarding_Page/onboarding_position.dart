enum Onboarding_Position{
  page1,
  page2,
  page3,
}

//image
extension Obd_Image on Onboarding_Position{
  String Image_page(){
    switch(this){
      case Onboarding_Position.page1:
        return "assets/onboading1.png";
      case Onboarding_Position.page2:
        return "assets/onboading2.png";
      case Onboarding_Position.page3:
        return "assets/onboading3.png";
    }
  }
}

extension Obd_Title on Onboarding_Position{
  String Title_page(){
    switch(this){
      case Onboarding_Position.page1:
        return "Manage your tasks";
      case Onboarding_Position.page2:
        return "Create daily routine";
      case Onboarding_Position.page3:
        return "Orgonaize your tasks";
    }
  }
}

extension Obd_Content on Onboarding_Position{
  String Content_page(){
    switch(this){
      case Onboarding_Position.page1:
        return "You can easily manage all of your daily tasks"
            "in DoMe for free";
      case Onboarding_Position.page2:
        return "In Uptodo you can create your presonalized routine to stay"
            "productive";
      case Onboarding_Position.page3:
        return "You can organize your daily tasks by adding your tasls"
            "into separate categories";
    }
  }
}

