window.addEventListener("load", editTracker);
function editTracker(){
	track = document.getElementsByClassName("track"), dayCheck = document.getElementsByClassName("daycheck"), day = document.getElementsByClassName("day");
	trackerDate = document.getElementById("tracker_habitdate").value;
	whatDate = new Date(trackerDate);
	months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	month = months[whatDate.getMonth()];
	year = whatDate.getFullYear();
	//console.log(month, year);
	for(let i = 0; i < track.length; i++){
		if(month == "April" || month == "June" || month == "September" || month == "November"){
			//track[30] is 'day-31'.
			track[30].classList.add("read-only");
			dayCheck[30].setAttribute("disabled", "true");
			dayCheck[30].style.display = "none";
;			lastDay = day[30].innerHTML;
			reX = lastDay.replace(lastDay, "x");
			day[30].innerHTML = reX;
			//console.log(lastDay);
		} else if(month == "February"){
			//track[28] is 'day-29' and track[29] is 'day-30'.
			lastDays = [day[28], day[29], day[30]], lastTracks = [track[28], track[29], track[30]], dayChecks = [dayCheck[28], dayCheck[29], dayCheck[30]];
			//console.log(lastDays, tracks);
			for(let j = 0; j < lastDays.length; j++){
				allLast = lastDays[j].innerHTML;
				//console.log(lastDays);
				//Check if the year of the 'edit tracker' is a leap year.
				if((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)){
					reX = allLast.replace(/30|31/g, "x");
					lastTracks.shift();
					dayChecks.shift();
					for(let k = 0; k < lastTracks.length; k++){
						lastTracks[k].classList.add("read-only");
						dayChecks[k].setAttribute("disabled", "true");
						dayChecks[k].style.display = "none";
					}
				} else{
					lastTracks[j].classList.add("read-only");
					dayChecks[j].setAttribute("disabled", "true");
					dayChecks[j].style.display = "none";
					reX = allLast.replace(/29|30|31/g, "x");
					lastDays[j].innerHTML = reX;
				}
				lastDays[j].innerHTML = reX;
			}
		}
	}
}