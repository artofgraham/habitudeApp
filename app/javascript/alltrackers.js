//Calculate the equivalent value of the rate of completion to the value of the 'stroke-dashoffset'.
window.addEventListener("load", updateRates);
function updateRates(){
	let habit = document.getElementsByClassName("habit"), completionRate = document.getElementsByClassName("completion-rate"), svgDashArray = 500;
	for(let i = 0; i < habit.length; i++){
		cRate = completionRate[i].innerHTML;
		cRate = cRate / 100;
		// console.log(cRate);
		let svgDashOffset = svgDashArray - svgDashArray * cRate;
		// console.log(svgDashArray, svgDashOffset);
		svgDashOffset = svgDashOffset.toFixed(0);
		habit[i].style.setProperty("--cRate", svgDashOffset);
		// console.log(svgDashOffset);
	}
}