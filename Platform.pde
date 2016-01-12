class Platform{
  
   float x;
   float y;
   
   Platform(float x, float y){
      this.x=x;
      this.y=y;
   }
   
   //arraylist of platform shows what platforms are currently on screen
   ArrayList<Platform> platforms = new ArrayList<Platform>();
   int initPlat = int(random(3,7));
   int sectionSize = height/initPlat;
   //while(initPlat>0){
     
   
   
   //have a random to decide how many y sections to separate screen into;
   //for each section generate one platform
   
   //note for later: take platforms off list when the y coord is off the screen
   //scrolling func in main game tab
   
}