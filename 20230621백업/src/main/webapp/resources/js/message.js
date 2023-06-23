document.addEventListener('DOMContentLoaded', function() {
  var form = document.querySelector('.chat_form');
  var textarea = document.querySelector('.input_value');
  var chatScreen = document.querySelector('.chat_screen');

  // 폼 제출을 처리
  form.addEventListener('submit', function(e) {
  e.preventDefault();

    var message = textarea.value.trim();

    if (message !== '') {
      // 새로운 코멘트 패키지를 생성
      var commentPackage = document.createElement('div');
      commentPackage.className = 'chat_content_wrap2';

      // TTS 버튼 생성
      var ttsButton = document.createElement('button');
      ttsButton.className = 'chat_content_tts2';
      var ttsIcon = document.createElement('i');
      ttsIcon.className = 'fa-solid fa-volume-high';
      ttsButton.appendChild(ttsIcon);

      // 코멘트 요소를 생성
      var comment = document.createElement('div');
      comment.className = 'chat_content2';
      comment.textContent = message;

      // 코멘트와 TTS 버튼 코멘트 패키지에 추가
      commentPackage.appendChild(ttsButton);
      commentPackage.appendChild(comment);

      chatScreen.appendChild(commentPackage);

      // 입력 텍스트 영역을 지우기
      textarea.value = '';

      // 스크롤 하단 이동
      chatScreen.scrollTop = chatScreen.scrollHeight;
    }
  });
});
