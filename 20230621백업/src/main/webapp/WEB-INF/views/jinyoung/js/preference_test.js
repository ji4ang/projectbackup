$(document).ready(function() {
    $('.question_wrapper').show(); //페이지를 로드할 때 표시할 요소
    $('.question_wrapper_2').hide(); //페이지를 로드할 때 숨길 요소
    $('.next').click(function(){
    $ ('.question_wrapper').hide(); //클릭 시 첫 번째 요소 숨김
    $ ('.question_wrapper_2').show(); //클릭 시 두 번째 요소 표시
    
    $('.back').click(function(){
    $ ('.question_wrapper_2').hide();
    $ ('.question_wrapper').show();
    })

    return false;
    });
    });

    // 다음 버튼 클릭 시
    document.querySelector(".next").addEventListener("click", function() {
        var progressBar = document.getElementById("progress_bar");
        var progressValue = document.getElementById("progress_value");
        var currentValue = parseInt(progressBar.value);
        var minValue = parseInt(progressBar.min);
        var maxValue = parseInt(progressBar.max);
        
        // progress 값 증가
        progressBar.value = Math.min(currentValue + 50, maxValue);
        progressValue.textContent = progressBar.value;
    });

    // 이전 버튼 클릭 시
    document.querySelector(".back").addEventListener("click", function() {
        var progressBar = document.getElementById("progress_bar");
        var progressValue = document.getElementById("progress_value");
        var currentValue = parseInt(progressBar.value);
        var minValue = parseInt(progressBar.min);
        var maxValue = parseInt(progressBar.max);
        
        // progress 값 감소
        progressBar.value = Math.max(currentValue - 45, minValue);
        progressValue.textContent = progressBar.value;
    });



