window.addEventListener("load", updateTracker);
function updateTracker(){
	track = document.getElementsByClassName("track"), dayNum = document.getElementsByClassName("day"), completionRate = document.getElementById("completion-rate");
	let sub_array = [];
	for(let i = 0; i < track.length; i++){
		// let replaceStr, boolean;
		//Get either 'true' or 'false' for each day of the month.
		// boolean = dayNum[i].innerHTML;
		// days = track.length;
		//Get the index of each 'class="track"'.
		// i = i++;
		//If the variable 'boolean' is "false", replace the string "false" with the day of the month.
		// if(boolean == "false"){
		// 	replaceStr = boolean.replace("false", i + 1);
		// 	dayNum[i].innerHTML = replaceStr;
		// } else if(boolean == "true"){
		// 	replaceStr = boolean.replace("true", "&#9898;");
		// 	dayNum[i].innerHTML = replaceStr;
		// }
		//Format the days based on the month of the tracker.
		days = document.getElementsByClassName("day");
		month = document.getElementById("month").innerHTML;
		year = document.getElementById("year").innerHTML;
		let switcher, dayCount,  daysMark = days[i].innerHTML;
		//console.log(daysMark);
		//Remove 'day 31' for months that contain 30 days.
		if(month == "April" || month == "June" || month == "September" || month == "November"){
			lastDay = dayNum[30].innerHTML;
			track[30].classList.add("read-only");
			switcher = lastDay.replace(lastDay, "x");
			dayNum[30].innerHTML = switcher;
			//Remove the 'href' attribute of the track that contains an 'x'.
			if(switcher == "x"){
				trackLink = dayNum[30].parentElement;
				trackLink.removeAttribute("href");
			}
			dayCount = 30;
			runProgress();
		} else if(month == "February"){
			//Remove 'days 29, 30 and 31' for the month of February only.
			daysFinal = [dayNum[28], dayNum[29], dayNum[30]], tracks = [track[28], track[29], track[30]];
			for(let j = 0; j < daysFinal.length; j++){
				lastDays = daysFinal[j].innerHTML;
				//Check if the year of the tracker is a leap year.
				if((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)){
					//Remove 'days 30 and 31' if it is a leap year.
					switchers = lastDays.replace(/30|31/g, "x");
					//Remove the 'href' attribute of the tracks which contain an 'x'.
					if(switchers == "x"){
						trackLink = daysFinal[j].parentElement;
						trackLink.removeAttribute("href");
					}
					dayCount = 29;
					//Remove the first item of the array.
					tracks.shift();
					for(let k = 0; k < tracks.length; k++){
						tracks[k].classList.add("read-only");
					}
				} else{
					//Remove 'days 29, 30 and 31' if it is not a leap year.
					switchers = lastDays.replace(/29|30|31/g, "x");
					tracks[j].classList.add("read-only");
					//Remove the 'href' attribute of the tracks which contain an 'x'.
					if(switchers == "x"){
						trackLink = daysFinal[j].parentElement;
						trackLink.removeAttribute("href");
					}
					dayCount = 28;
				}
				daysFinal[j].innerHTML = switchers;
			}
			runProgress();
		} else{
			//The months of January, March, May, July, August, October and December have 31 days each.
			dayCount = 31;
			runProgress();
		}
		// if(lastDays == "x"){
		// 	trackLink = daysFinal[i].parentElement;
		// 	trackLink.removeAttribute("href");
		// 	console.log(lastDays);
		// }
		function runProgress(){
			sub_array.push(daysMark);
			//let foos = Array.from(sub_array);
			//newArr = new Array(sub_array);
			tracking = sub_array.filter(x => x == "⚪");
			tracked = tracking.length;
			//The rate is separately calculated for the value of the 'stroke-dashoffset'; a separate value is required to calculate the offset for the animation in the CSS.
			rate = tracked / dayCount;
			completion = rate * 100;
			completion = completion.toFixed(0);
			completion = parseInt(completion);
			// if(completion == 0 || completion == 100){
			// 	completion = completion.toFixed(0);
			// } else{
			// 	completion = completion.toFixed(0);
			// }
			// function test(x){
			// 	return x == "&#9898";
			// 	console.log(x);
			// }
			//Calculate the equivalent value of the rate of completion to the value of the 'stroke-dashoffset'.
			svgDashArray = 500;
			svgDashOffset = svgDashArray - svgDashArray * rate;
			svgDashOffset = svgDashOffset.toFixed(1);
			document.documentElement.style.setProperty('--cRate', svgDashOffset);
			runCounter();
		}
		// track[i].addEventListener("click", trackDaily);
		// function trackDaily(){
		// 	done = document.getElementsByClassName("done");
		// 	for(let i = 0; i < done.length; i++){
		// 		done[i].addEventListener("click", progress);
		// 		console.log("Clicked.", completion);
		// 	}
		// }
		goodTracking = document.getElementById("good-tracking");
		neutralTracking = document.getElementById("neutral-tracking");
		badTracking = document.getElementById("bad-tracking");
		circle = document.getElementsByTagName("circle");
		if(goodTracking){
			circle[0].classList.add("good");
		} else if(badTracking){
			circle[0].classList.add("bad");
		} else{
			circle[0].classList.add("neutral");
		}
	}
	function runCounter(){
		let counter = 0;
		incrementalRate = setInterval(() => {
			if(counter < completion){
				counter += 1;
				completionRate.innerHTML = counter + "%";
			} else if(counter == 0){
				completionRate.innerHTML = 0 + "%";
			} else{
				clearInterval(incrementalRate);
			}
			// if(counter == completion){
			// 	clearInterval(this);
			// } else{
			// 	counter += 1;
			// 	completionRate.innerHTML = counter + "%";
			// }
		}, 10);
	}
	userProgress = document.getElementById("user-progress");
	userProgress.addEventListener("click", function trackDaily(){
		updateTracker();
		//runProgress();
		//runCounter();
		//done = document.getElementsByClassName("done");
		//for(let i = 0; i < done.length; i++){
		//done[i].addEventListener("click", progress);
		//console.log("Clicked.", completion);
		//}
	});
}