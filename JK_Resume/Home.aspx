<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="JK_Resume.Home" %>

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

        <div id="divHead">
            <img src="Me.png"  width="200" height="200" />
        </div>


        <div id="divBrain">
            <img src="brain/sprite_0.png" id="brain" width="200" height="200" usemap="#brainClick" />
            <map name="brainClick">
                <area id="#brainstuff" onmouseover="startLoopBrain()" onmouseout="stopLoopBrain()" shape="rect" coords="0,0,400,400"/>
            </map>
        </div>

        <div id="divCap">
            <img src="cap/sprite_0.png" id="cap" width="200" height="200" usemap="#capClick" />
            <map name="capClick">
                <area id="#capstuff" onmouseover="startLoopCap()" onmouseout="stopLoopCap()" shape="rect" coords="0,0,200,200"/>
            </map>
        </div>

        <div id="divBottomRight">
            <div id="divLinkedIn" class="animate-flicker">
                <a href="https://www.linkedin.com/in/jonathan-kaganovich-a4b158b8/">
                    <input type="image" src="LinkedIn.png" onserverclick=""/> LinkedIn
                </a> 
            </div>
            <br />
            <div id="divMail" class="animate-flicker">
                <input type="image" src="Mail.png" onserverclick=""/> Email Me
            </div>
        </div>


        <asp:ScriptManager runat="server">
        </asp:ScriptManager>

        <asp:updatepanel runat="server">
            <ContentTemplate>
                <div id="container">
                    <span class="random" onload="loopCoin()" onclick="stopCoin()">
                        <input type="button" id="coin2" onclick="stopCoin();" />
                    </span>
                </div>
            </ContentTemplate>
        </asp:updatepanel>
        
    </form>
</body>
</html>
<script>



    var looper = {}

   

    

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
    };
    function stopLoopBrain() {
        var stop = clearInterval(looper.loopBrain);
        rotatorBrain.src = 'brain/sprite_0.png';
    }

    //loop cap
    var rotatorCap = document.getElementById('cap'), //get the element
        dir = 'cap/sprite_',                              //images folder
        delayInSeconds = 1,                           //delay in seconds
        num = 1,                                      //start number
        len = 11;                                      //limit
    function startLoopCap() {
        looper.loopCap = setInterval(function loop() {                           //interval changer
            rotatorCap.src = dir + num + '.png';               //change picture
            num = (num === len) ? 1 : ++num;              //reset if last image reached
        }, delayInSeconds * 50); //50ms per frame
    };
    function stopLoopCap() {
        var stop = clearInterval(looper.loopCap);
        rotatorCap.src = 'cap/sprite_0.png';
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
