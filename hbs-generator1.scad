$fn = 90;

//Parametrics: change as you want them -----------------intersection!!!


xBottom                 = 0;   
yBottom                 = 0;  
zBottom                 = 0;

xTop                    = 0;
yTop                    = 0;
zTop                    = 20;

   
rTop                    = 5;
rBottom                 = 6;


resolution              = 1;

//alphaTop                =
//alphaBottom             =




planeHeight             = 0.01;


rCenterOffsetFactor     = 0.1;
xyCenterOffsetFactor    = 0.1;
zCenterOffsetFactor     = 0.1;


//========================================= modules
module cylinderPlane(pX, pY, pZ, pH, pR) {
    translate([pX, pY, pZ]) {
        cylinder(h=pH,r=pR);
    }
}




//========================================= calculations
height                  = zTop-zBottom;

rCenterOffset           = height*rCenterOffsetFactor;
xyCenterOffset          = height*xyCenterOffsetFactor;
zCenterOffset           = height*zCenterOffsetFactor;

rCenter                 = rands(((rTop+rBottom)/2)-rCenterOffset/2,((rTop+rBottom)/2)+rCenterOffset,1)[0]/2;

centerX                 = rands((((xBottom+xTop)/2)-xyCenterOffset),((xBottom+xTop)/2)+xyCenterOffset,1)[0];
centerY                 = rands((((yBottom+yTop)/2)-xyCenterOffset),((yBottom+yTop)/2)+xyCenterOffset,1)[0];
centerZ                 = rands((((zBottom+zTop)/2)-zCenterOffset),((zBottom+zTop)/2)+zCenterOffset,1)[0];



hull() {
   cylinderPlane(xBottom,yBottom,zBottom,planeHeight,rBottom);
   cylinderPlane(centerX,centerY,centerZ,planeHeight,rCenter);
}
hull() {
    cylinderPlane(centerX,centerY,centerZ,planeHeight,rCenter);
    cylinderPlane(xTop,yTop,zTop,planeHeight,rTop);
}


//========================================= debug output
echo("rCenter",rCenter);
echo ("centerX",centerX);
echo ("centerY",centerY);
