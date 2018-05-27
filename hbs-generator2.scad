$fn = 10;

//Parametrics: change as you want them -----------------intersection!!!

xBottom                 = 0;   
yBottom                 = 0;  
zBottom                 = 0;

xTop                    = 0;
yTop                    = 0;
zTop                    = 26;

xCenter                 = 0;
yCenter                 = 0;
zCenter                 = 0;
   
rTop                    = 10;
rBottom                 = rTop;
rCenter                 = 6;

res                     = 20;

height                  = zTop-zBottom;

rCenterOffsetFactor     = 0.1;
xyCenterOffsetFactor    = 0.1;
zCenterOffsetFactor     = 0.1;

rCenterOffset           = height*rCenterOffsetFactor;
xyCenterOffset          = height*xyCenterOffsetFactor;
zCenterOffset           = height*zCenterOffsetFactor;

//alphaTop              =
//alphaBottom           =

//================== Checks
if(rBottom >= rTop) {
    echo("rTop must be greater than rBottom");
    //exit();
}


//================== calculations

rCenter                 = rands(((rTop+rBottom)/2)-rCenterOffset/2,((rTop+rBottom)/2)+rCenterOffset,1)[0]/2;

centerX                 = rands((((xBottom+xTop)/2)-xyCenterOffset),((xBottom+xTop)/2)+xyCenterOffset,1)[0];
centerY                 = rands((((yBottom+yTop)/2)-xyCenterOffset),((yBottom+yTop)/2)+xyCenterOffset,1)[0];

/*
    //difference() {

        //cylinder(r=rTop,h=height);

        translate([xCenter,yCenter,zCenter]) {
            cylinder(r=rCenter,h=height);
        }


        for(i = [0:1:res]) {
            translate([sin(i*360/res)*rTop,cos(i*360/res)*rTop,height/2]) {
                scale([(cos(i*360/res)*-yCenter)+(sin(i*360/res)*-xCenter)+(rTop-rCenter),(cos(i*360/res)*-yCenter)+(sin(i*360/res)*-xCenter)+(rTop-rCenter),height/2]) {
                    sphere(r=1);
                }
            }
        }
    //}
    */