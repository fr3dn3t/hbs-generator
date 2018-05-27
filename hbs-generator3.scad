$fn=35;

module pinViaHeight(height, bottomDia, topDia, res, topForce, bottomForce) {
    /*height = 20;
    bottomDia = 7;
    topDia = 8;
    res = 90;
    topForce = 4;
    bottomForce = 3;*/

    echo();

    heightPerSlice = height/res;
    echo("heightPerSlice", heightPerSlice);
    /*
    //top and bottom slices
    cylinder(d=topDia, h=heightPerSlice);
    translate([0,0,height-heightPerSlice]) {
        cylinder(d=topDia, h=heightPerSlice);
    }
    */

    //middleSlices fixed values
    numberOfSlices = res;
    echo("numberOfSlices", numberOfSlices);

    bottomTotopDiaDifference = topDia-bottomDia;
    echo("bottomTotopDiaDifference", bottomTotopDiaDifference);

    DiaIncreaseFactorPerSlice = bottomTotopDiaDifference/(numberOfSlices);
    echo("DiaIncreaseFactorPerSlice", DiaIncreaseFactorPerSlice);

    forceSum = topForce+bottomForce;
    forceTop = topForce/forceSum;
    forceBottom = bottomForce/forceSum;

    echo ("forceSum",forceSum,forceTop,forceBottom);

    for(i= [0:numberOfSlices]) {

        /*forces are interpreted this way:
                                /\
                                || topForce
                                ||
                        ==================  <-- Slice
                        ==================
                                ||
                                || bottom force
                                \/
        */
        dia = DiaIncreaseFactorPerSlice*i+bottomDia;
        forcePartTop = (i/numberOfSlices)*forceTop;
        forcePartBottom = (1-(i/numberOfSlices))*forceBottom;
        p = forceSum*(forcePartTop+forcePartBottom);
        
        //function: f(i)= (-(1/(res/2))*(i-(res/2))^2+(res/2))/(res/2) --> starts and ends at top&bottom slice (=0), highest point at res/2 = 1

        echo("slice",i,p,forcePartTop,forcePartBottom);

        translate([0,0,heightPerSlice*i]) {
            cylinder(d=dia-(((-(1/(res/2))*((i-(res/2))*(i-(res/2)))+(res/2))/(res/2))*p), h=heightPerSlice);
        }
    }

    echo();
}


pinBottomDia = 10;


/*
//example

cube([20,20,2]);
translate([0,0,2]) {
    for(o= [1:20/pinBottomDia]) {
        translate([o*pinBottomDia-pinBottomDia/2,0,0]) {
            for (u= [1:20/pinBottomDia]) {
                translate([0,u*pinBottomDia-pinBottomDia/2,0]) {
                    pinViaHeight(20, pinBottomDia, pinBottomDia, 200, 5, 3);
                }
            }
        }
    }
}
translate([0,0,22]) {
    cube([20,20,2]);
}
*/

pinViaHeight(20, pinBottomDia, pinBottomDia, 10, 3, 1);
