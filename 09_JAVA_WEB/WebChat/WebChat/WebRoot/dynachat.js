//
showDynaWindow();

function showDynaWindow()
{
	var wWidth = window.screen.width;
	var wHeight = window.screen.height;

	var contentWidth = 300;
	var contentHeight = 150;
 	
	var top = wHeight - contentHeight - 80;
	var left = wWidth - contentWidth - 20;

	var chatDiv = window.open("ChatRoom.jsp","","width="+contentWidth+", height="+contentHeight+", top="+top+", left="+left);
	
}