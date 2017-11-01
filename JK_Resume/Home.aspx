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

        <div id="divBrain">
            <img src="brain/sprite_0.png" id="brain" width="400" height="400" usemap="#brainClick" />
            <map name="brainClick">
                <area id="#brainstuff" onmouseover="startLoop()" onmouseout="stopLoop()" shape="rect" coords="0,0,400,400" href="google.com" alt="Brain" />
            </map>
        </div>
        <div id="divBottomRight">
            <div id="divLinkedIn" class="animate-flicker" >
                <a href="https://www.linkedin.com/in/jonathan-kaganovich-a4b158b8/">
                    <img src="LinkedIn.png" />
                </a>
                
            </div>
            <br />
            <div id="divMail" class="animate-flicker">
                <img src="Mail.png" />
            </div>
        </div>

    </form>
</body>
</html>
<script>
    //loop();

    var looper = {}
        var rotator = document.getElementById('brain'), //get the element
            dir = 'brain/sprite_',                              //images folder
            delayInSeconds = 1,                           //delay in seconds
            num = 0,                                      //start number
            len = 46;                                      //limit
        function startLoop() {
            looper.loop = setInterval(function loop() {                           //interval changer
                rotator.src = dir + num + '.png';               //change picture
                num = (num === len) ? 0 : ++num;              //reset if last image reached
            }, delayInSeconds * 50); //50ms per frame
        };
    function stopLoop() {
        var stop = clearInterval(looper.loop);
    }
</script>
