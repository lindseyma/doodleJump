class Platform{
  
   float platX;
   float platY;
   
   Platform(float platX, float platY){
      this.platX=platX;
      this.platY=platY;
   }
   
   //arraylist of platform shows what platforms are currently on screen
   //if arraylist is empty, do this!
   ArrayList<Platform> platforms = new ArrayList<Platform>();
   //static v. nonstatic how to access this in doodleJump tab
   int initPlat = int(random(3,7));
   int sectionSize = height/initPlat;
   
   void initPlatSetup(){
     for(int i=0; i<initPlat; i++){
        platX = random(0, width);
        platY = random(sectionSize*i, sectionSize*(i+1));
        platforms.add(new Platform(platX, platY));
     }//for i
   }
   
   void display(){
       line(platX, platY, platX+10, platY);
     }
   }
  
   //have a random to decide how many y sections to separate screen into;
   //for each section generate one platform
   
   //note for later: take platforms off list when the y coord is off the screen
   //scrolling func in main game tab
   