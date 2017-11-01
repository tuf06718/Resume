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
                <area id="#brainstuff" onmouseover="startLoop()" onmouseout="stopLoop()" shape="rect" coords="0,0,400,400"/>
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
        dir = 'brain/sprite_',                              //images folder
        delayInSeconds = 1,                           //delay in seconds
        num = 0,                                      //start number
        len = 46;                                      //limit
    function startLoop() {
        looper.loopBrain = setInterval(function loop() {                           //interval changer
            rotatorBrain.src = dir + num + '.png';               //change picture
            num = (num === len) ? 0 : ++num;              //reset if last image reached
        }, delayInSeconds * 50); //50ms per frame
    };
    function stopLoop() {
        var stop = clearInterval(looper.loopBrain);
        rotatorBrain.src = 'brain/sprite_0.png';
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
