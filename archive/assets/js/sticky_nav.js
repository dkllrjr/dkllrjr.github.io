window.onscroll = function() {myFunction()};

var stickynav = document.getElementById("sticky-nav");
var sticky = stickynav.offsetTop;

function myFunction() {
	if (window.pageYOffset >= sticky) {
		stickynav.classList.add("sticky")
	} else {
		stickynav.classList.remove("sticky");
	}
}
