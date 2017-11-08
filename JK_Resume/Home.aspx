﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="JK_Resume.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="Home_Style.css" rel="stylesheet" />
    <title>Resume</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="topText" class="col-lg-12">
            <div class="col-lg-4 col-md-4 col-sm-4" id="lblExperience" style="z-index:-1; visibility: hidden; float: left; height:100%;">
                <h1 style="float:left;">Experience</h1>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4" id="lblAboutMe" style="z-index:-1; visibility: hidden; text-align: center; height:100%">
                <h1>About Me</h1>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4" id="lblEducation" style="z-index:-1; visibility: hidden; height:100%">
                <h1 style="float:right;">Education</h1>
            </div>

        </div>
        
        
        

        <div id="divHead">
            <img src="me\sprite_0.png"  id="me" width="200" height="200" onmouseover="startLoopMe()" onmouseout="stopLoopMe()"/>
        </div>


        <div id="divAboutMe">
            <img src="aboutMe\sprite_0.png" class="popper" id="aboutMe" width="200" height="200" onclick="aboutMeClick()" onmouseover="startLoopAboutMe()" onmouseout="stopLoopAboutMe()"/>
        </div>
       

        <div id="divBrain">
            <img src="brain/sprite_0.png" id="brain" width="200" height="200" usemap="#brainClick" />
            <map name="brainClick">
                <area id="#brainstuff" onmouseover="startLoopBrain()" onmouseout="stopLoopBrain()" shape="rect" coords="0,0,400,400"/>
            </map>
            
        </div>

        <div id="divCap">
            <img src="cap/sprite_0.png" id="cap" width="215" height="215" usemap="#capClick" />
            <map name="capClick">
                <area id="#capstuff" onmouseover="startLoopCap()" onmouseout="stopLoopCap()" shape="rect" coords="0,0,200,200"/>
            </map>
        </div>

        <div id="divBottomRight">
            <div id="divLinkedIn" class="animate-flicker" onclick="goToLinkedIn()">
                <img src="LinkedIn.png" />
                
            </div>
            <br />
            <div id="divMail" class="animate-flicker">
                <input type="image" src="Mail.png" onserverclick=""/> 
            </div>
        </div>


        <div id="divBottomLeft">
            <img id="code" src="" />
        </div>


        <asp:ScriptManager runat="server">
        </asp:ScriptManager>


        <div id="container">
            <span class="random" onload="loopCoin()" onclick="stopCoin()">
                <input type="button" id="coin2" onclick="stopCoin();" />
            </span>
        </div>


    </form>
</body>
</html>

<audio id="blop">
    <source src="sound_effects/Blop.mp3"/>
</audio>
<audio id="pling">
    <source src="sound_effects/Pling.mp3"/>
</audio>
<audio id="typing">
    <source src="sound_effects/Typing.mp3" />
</audio>
    


<div class="popper-content hide">My third popover content goes here.</div>


<script>
    

            
     

    function goToLinkedIn() {
        window.location.href = 'https://www.linkedin.com/in/jonathan-kaganovich-a4b158b8/';
    }
    

    function shadowEverything(currentImage, label) {
        $('div').not(currentImage + currentImage+'Content, #topText, #lblAboutMe, #lblExperience, #lblEducation').css({ "opacity": .5, "transition": "ease-in, .5s" });
        //$(label).css("background-color", '#fff1f1')
        $('#coin2').css('visibility', 'hidden');
        var audio = $("#blop")[0];
        audio.play();
    }

    function unshadowEverything(currentImage, label) {
        $('div').not(currentImage).css("opacity", 1, "transition", "2s");
        //$(label).css("background-color", 'none')
        $('#coin2').css('visibility', 'visible');
    }


    var looper = {}

   
    //loop me
    var rotatorMe = document.getElementById('me'),
        Mdir = 'me/sprite_',
        MdelayInSeconds = 1,
        Mnum = 0,
        Mlen = 3;
    var audio2 = $("#typing")[0];
    function startLoopMe() {
        startLoopCode();
        audio2.loop = true;
        audio2.play();

        looper.loopMe = setInterval(function loop() {
            rotatorMe.src = Mdir + Mnum + '.png';
            Mnum = (Mnum === Mlen) ? 0 : ++Mnum;
        }, MdelayInSeconds * 50);
    };
    function stopLoopMe() {
        var stop = clearInterval(looper.loopMe);
        rotatorMe.src = 'me/sprite_0.png';
        audio2.loop = false;
        audio2.pause();
        stopLoopCode();
    }
    
    //loop code
    var rotatorCode = document.getElementById('code'),
        Cdir = 'code/sprite_',
        CdelayInSeconds = 1,
        Cnum = 0,
        Clen = 35;
    
    function startLoopCode() {
        looper.loopCode = setInterval(function loop() {
            rotatorCode.src = Cdir + Cnum + '.png';
            Cnum = (Cnum === Clen) ? 0 : ++Cnum;
        }, CdelayInSeconds * 50);
    };
    function stopLoopCode() {
        var stop = clearInterval(looper.loopCode);
        rotatorCode.src = '';
    }


    //loop case
    var rotatorAboutMe = document.getElementById('aboutMe'),
        Adir = 'aboutMe/sprite_',
        AdelayInSeconds = 1,
        Anum = 0,
        Alen = 12;
    function startLoopAboutMe() {
        looper.loopAboutMe = setInterval(function loop() {
            rotatorAboutMe.src = Adir + Anum + '.png';
            Anum = (Anum === Alen) ? 0 : ++Anum;
        }, AdelayInSeconds * 50);
        shadowEverything('#divAboutMe', '#lblAboutMe');
        $('#lblAboutMe').css("visibility", "visible");
        
    };
    function stopLoopAboutMe() {
        var stop = clearInterval(looper.loopAboutMe);
        rotatorAboutMe.src = 'aboutMe/sprite_0.png';
        unshadowEverything('#divAboutMe', '#lblAboutMe');
        $('#lblAboutMe').css("visibility", "hidden");
       
    }

    //loop brain
    var rotatorBrain = document.getElementById('brain'), //get the element
        Bdir = 'brain/sprite_',                              //images folder
        BdelayInSeconds = 1,                           //delay in seconds
        Bnum = 0,                                      //start number
        Blen = 46;                                      //limit
    function startLoopBrain() {
        looper.loopBrain = setInterval(function loop() {                           //interval changer
            rotatorBrain.src = Bdir + Bnum + '.png';               //change picture
            Bnum = (Bnum === Blen) ? 0 : ++Bnum;              //reset if last image reached
        }, BdelayInSeconds * 50); //50ms per frame
        shadowEverything('#divBrain', '#lblExperience');
        $('#lblExperience').css("visibility", "visible");
    };
    function stopLoopBrain() {
        var stop = clearInterval(looper.loopBrain);
        rotatorBrain.src = 'brain/sprite_0.png';
        unshadowEverything('#divBrain', '#lblExperience');
        $('#lblExperience').css("visibility", "hidden");
    }

    //loop cap
    var rotatorCap = document.getElementById('cap'), 
        dir = 'cap/sprite_',                              
        delayInSeconds = 1,                           
        num = 1,                                      
        len = 11;                                      
    function startLoopCap() {
        looper.loopCap = setInterval(function loop() {                           
            rotatorCap.src = dir + num + '.png';               
            num = (num === len) ? 1 : ++num;              
        }, delayInSeconds * 50);
        shadowEverything('#divCap', '#lblEducation');
        $('#lblEducation').css("visibility", "visible");
    };
    function stopLoopCap() {
        var stop = clearInterval(looper.loopCap);
        rotatorCap.src = 'cap/sprite_0.png';
        unshadowEverything('#divCap', '#lblEducation');
        $('#lblEducation').css("visibility", "hidden");
    }

    //coin random
    function moveDiv() {
        var $span = $(".random");

        $span.fadeOut(1000, function () {
            var maxLeft = $(window).width() - $span.width();
            var maxTop = $(window).height() - $span.height();
            var leftPos = Math.floor(Math.random() * (maxLeft + 1))
            var topPos = Math.floor(Math.random() * (maxTop + 1))

            $span.css({ left: leftPos, top: topPos }).fadeIn(1000);
        });
    };

    moveDiv();
    var coinRandom = setInterval(moveDiv, 5000);

    function stopCoin() {
        clearInterval(coinRandom);
        var $span = $(".random");

        $span.fadeOut(500);
        //$("#coin").css("visibility", "hidden");
    }
</script>
