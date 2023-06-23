function indivBtn(){
    document.getElementById("indiv").style.display = "block";
    document.getElementById("corp").style.display = "none";
}

function corpBtn(){
    document.getElementById("indiv").style.display = "none";
    document.getElementById("corp").style.display = "block";
}


// 사업자 번호 입력 - 숫자만 입력받는 기능
function onlyNum3(){
    if(event.keyCode<48 || event.keyCode>57){
       event.returnValue=false;
    }
}

// 휴대전화 번호 입력 - 숫자만 입력
function onlyNum() {
    if(event.keyCode<48 || event.keyCode>57){
        event.returnValue=false;
    }
}

function onlyNum2() {
    if(event.keyCode<48 || event.keyCode>57){
        event.returnValue=false;
    }
}