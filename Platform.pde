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
   
   void initPlatSetup(){
     for(int i=0; i<initPlat; i++){
        float platX = random(0, width);
        float platY = random(sectionSize*i, sectionSize*(i+1));
        line(platX, platY, platX+10, platY);
     }//for i
   }
  
   //have a random to decide how many y sections to separate screen into;
   //for each section generate one platform
   
   //note for later: take platforms off list when the y coord is off the screen
   //scrolling func in main game tab
   
}