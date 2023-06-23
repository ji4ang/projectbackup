document.addEventListener('DOMContentLoaded', function() {
  var form = document.querySelector('.msg_write_area');
  var textarea = document.querySelector('.msg_writebox');
  var chatScreen = document.querySelector('.chat_screen_comments');

  // 폼 제출을 처리
  form.addEventListener('submit', function(e) {
    e.preventDefault();

    var message = textarea.value.trim();

    if (message !== '') {
      // 새로운 코멘트 패키지를 생성
      var commentPackage = document.createElement('div');
      commentPackage.className = 'comment_package';

      // 코멘트 요소를 생성
      var comment = document.createElement('div');
      comment.className = 'comment';
      comment.textContent = message;

      // TTS 버튼 생성
      var ttsButton = document.createElement('div');
      ttsButton.className = 'tts';
      var ttsIcon = document.createElement('i');
      ttsIcon.className = 'fa-sharp fa-solid fa-volume-high';
      ttsButton.appendChild(ttsIcon);

      // 코멘트와 TTS 버튼 코멘트 패키지에 추가
      commentPackage.appendChild(comment);
      commentPackage.appendChild(ttsButton);

      chatScreen.appendChild(commentPackage);

      // 입력 텍스트 영역을 지우기
      textarea.value = '';

      // 스크롤 하단 이동
      chatScreen.scrollTop = chatScreen.scrollHeight;
    }
  });

  // TTS 버튼 클릭시 처리
  chatScreen.addEventListener('click', function(e) {
    if (e.target.classList.contains('fa-volume-high')) {
      e.stopPropagation();
      // 여기에 Text-to-Speech(TTS) 기능을 수행하는 코드 작성
      // TTS 기능에 대한 로직을 구현 가능
    }
  });

  sttButton.addEventListener('click', function(e) {
    e.stopPropagation();
    // 여기에 Speech-to-Text(STT) 기능을 수행하는 코드 작성
    // STT 기능에 대한 로직을 구현 가능
    
  });

});

// 5초마다 새로고침
setInterval(function() {
  var chatWrapper = document.querySelector('.chat_screen'); 
  if (chatWrapper) {
    var newContent = document.createElement('div');
    newContent.textContent = '';
    chatWrapper.appendChild(newContent);
  }

  // 스크롤 하단 이동
  chatWrapper.scrollTop = chatWrapper.scrollHeight;
}, 5000);

// DOM 요소들을 선택
const chats = document.querySelectorAll('.chats');

// 클릭 이벤트 리스너 추가
chats.forEach(chat => {
  chat.addEventListener('click', function() {
    // 다른 채팅 요소들의 화살표를 제거하고 원래 색상으로 변경
    chats.forEach(otherChat => {
      if (otherChat !== this) {
        otherChat.classList.remove('active');
        otherChat.style.backgroundColor = '';
      }
    });

    // 클릭된 채팅 요소에 화살표 아이콘 추가하고 배경 색상을 변경
    this.classList.toggle('active');
    this.style.backgroundColor = this.classList.contains('active') ? 'lightgray' : '';
  });
});

