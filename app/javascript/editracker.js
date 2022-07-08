window.addEventListener("load", editTracker);
function editTracker(){
	trackerDate = document.getElementById("tracker_habitdate").value;
	whatDate = new Date(trackerDate);
	months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	whatMonth = months[whatDate.getMonth()];
	whatYear = whatDate.getFullYear();
	console.log(whatMonth, whatYear);
}