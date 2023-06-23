// notice.html에서 class="salary" 다음에 onkeypress="onlyNum();"을 주고 </body>태그 위에 <script>태그를 추가해 js파일 경로를 지정해주기

function onlyNum() {
    if(event.keyCode<48 || event.keyCode>57){
        event.returnValue=false;
    }
}