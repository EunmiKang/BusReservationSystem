function add()
{
	var tr = document.createElement("tr");
	
	var td1 = document.createElement("td");
	var td2 = document.createElement("td");
	var td3 = document.createElement("td");
	var td4 = document.createElement("td");
	var td5 = document.createElement("td");
	var td6 = document.createElement("td");
	
	var text1 = document.getElementById("addText1").value;
	var text2 = document.getElementById("addText2").value;
	var text3 = document.getElementById("addText3").value;
	var text4 = document.getElementById("addText4").value;
	var text5 = document.getElementById("addText5").value;
	var text6 = document.getElementById("addText6").value;
	
	//li.addEventListener("click",clickDelete); 객체선택으로!!!!!!!
	
	td1.innerHTML = text1;
	td2.innerHTML = text2;
	td3.innerHTML = text3;
	td4.innerHTML = text4;
	td5.innerHTML = text5;
	td6.innerHTML = text6;

	tr.appendChild(td1);
	tr.appendChild(td2);
	tr.appendChild(td3);
	tr.appendChild(td4);
	tr.appendChild(td5);
	tr.appendChild(td6);
	
	document.getElementById("scheduleTable").appendChild(tr);
}

function testPlz() {
	document.getElementById("testForm").submit();
}