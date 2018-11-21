function sortByCategory(categoryID, topicID){
	var catSelect = document.getElementById(categoryID);
	var topSelect = document.getElementById(topicID);

	if(catSelect.selectedIndex == 0){
		topSelect.selectedIndex = 0;
		topSelect.onchange();
	}else if(catSelect.selectedIndex == catSelect.length-1){
		for(var i=0; i<topSelect.length; i++){
			topSelect.option[i].display = 'initial';
		}	
	}else if(catSelect.selectedIndex < (catSelect.length-1) && catSelect.selectedIndex > 0){
		for(var i=1; i<topSelect.length; i++){
			if(topSelect.option[i].label != catSelect.option[catSelect.selectedIndex].innerHTML){
				topSelect.option[i].display = 'none';
			}
		}
	}
}

function feedDateTime(eventDate, eventTime, formName){
	document.getElementById("eventDate").setAttribute("value", (eventDate));
	document.getElementById("eventTime").setAttribute("value", (eventTime));
	//document.getElementById(formName).submit();
}

function feedVal(input, value, formName){
	document.getElementById(input).setAttribute("value", value);
	document.getElementById(formName).submit();
}

function feedValue(input, value){
	document.getElementById(input).setAttribute("value", value);
}






function fieldFocusLost(defaultText, field){
	if(field.value == defaultText || field.value == '' || field.value == null){
		field.value = defaultText;
		field.style.color = '#bbb';
	}
}

function fieldFocusGained(defaultText, field){
	field.style.color = '#fff';
	if(field.value == defaultText){
		field.value = '';
	}
}

function selectUsed(select){
	var selectList = document.getElementById(select.id);

	if(selectList.selectedIndex == 0){
		selectList.style.color = '#bbb';
	}else{
		selectList.style.color = '#fff';
	}
}

function removeHelp(helpHolder, helpText, select){
	var selectList = document.getElementById(select.id);
	var help = document.getElementById(helpHolder);

	if(selectList.selectedIndex == 0){
		help.innerHTML = helpText;
		selectList.style.marginBottom = '5px';
	}else{
		help.innerHTML = '';
		selectList.style.marginBottom = '21px';
	}
}

function allNumeric(inputname, formName){  
	var numbers = /^[0-9]+$/;  
	var inputtxt = document.getElementById(inputname);
	if(!(inputtxt.value.match(numbers))){  
		inputtxt.style.backgroundColor = "rgba(255, 0, 0, 0.25)";
		document.getElementById(formName).elements["submitButton"].disabled = "true";
		//check(formName);
	}else{
		inputtxt.style.backgroundColor = "rgba(0, 0, 0, 0)";
		document.getElementById(formName).elements["submitButton"].disabled = "";
		//check(formName);
	}
}

function allLetter(inputname, formName){  
	var pattern = /^[A-Za-z\s]+$/;  
	var inputtxt = document.getElementById(inputname);
	
	if(!(inputtxt.value.match(pattern))){  
		inputtxt.style.backgroundColor = "rgba(255, 0, 0, 0.25)";
		document.getElementById(formName).elements["submitButton"].disabled = "true";
		//check(formName);
	}else{
		inputtxt.style.backgroundColor = "rgba(0, 0, 0, 0)";
		document.getElementById(formName).elements["submitButton"].disabled = "";
		//check(formName);
	}
}

function emailVal(inputname, formName){
	var pattern = /^\w+([.-]\w+)*@\w+([.-]\w+)*\.\w{2,3}$/;    
	var inputtxt = document.getElementById(inputname);
	
	if(!(inputtxt.value.match(pattern))){  
		inputtxt.style.backgroundColor = "rgba(255, 0, 0, 0.25)";
		document.getElementById(formName).elements["submitButton"].disabled = "true";
		//check(formName);
	}else{
		inputtxt.style.backgroundColor = "rgba(0, 0, 0, 0)";
		document.getElementById(formName).elements["submitButton"].disabled = "";
		//check(formName);
	}
}

function showMessage(inputName, dataType){
	if(document.getElementById(inputName).style.backgroundColor == "rgba(255, 0, 0, 0.25)"){
		alert("Please Enter Valid " + dataType);
	}
}