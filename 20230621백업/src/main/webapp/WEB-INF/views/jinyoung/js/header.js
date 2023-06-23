// 검색버튼 기능 (시작)
const searchButton = document.getElementById('searchButton');
const searchInput = document.getElementById('searchInput');

searchButton.addEventListener('click', () => {
    const searchQuery = searchInput.value;
    // searchQuery를 사용하여 검색 로직 수행
    console.log('Search Query:', searchQuery);
});
// 검색버튼 기능 (끝)


// 로그아웃 기능 (시작)

// 로그아웃 버튼 클릭 시 처리
document.getElementById('logout').addEventListener('click', function(event) {
    event.preventDefault(); // 기본 동작(링크 이동) 방지

    // 서버에 로그아웃 요청 보내기 (예시에서는 비동기적으로 처리하는 가정)
    sendLogoutRequest();
});

// 서버에 로그아웃 요청을 보내는 함수
function sendLogoutRequest() {
    // Ajax나 Fetch 등의 방법을 사용하여 서버에 요청을 보낼 수 있음
    // Fetch API를 사용한 예시
    fetch('/logout', {
        method: 'POST', // 로그아웃 요청을 POST 메서드로 보냄
        credentials: 'same-origin' // 요청을 보낼 때 세션 쿠키를 함께 보냄
    })
    .then(function(response) {
        // 로그아웃 요청이 성공한 경우
        if (response.ok) {
            // 클라이언트 측에서 필요한 조치를 취함
            handleLogout();
        } else {
            // 로그아웃 요청이 실패한 경우에 대한 처리를 추가할 수 있음
            console.log('로그아웃 요청 실패');
        }
    })
    .catch(function(error) {
        // 네트워크 오류 등으로 로그아웃 요청이 실패한 경우에 대한 처리를 추가할 수 있음
        console.log('로그아웃 요청 실패');
    });
}

// 로그아웃 후 클라이언트 측에서 처리할 작업을 수행하는 함수
function handleLogout() {
    // 예시: 로그아웃 후에 홈페이지로 리디렉션
    window.location.href = '/';
}
// 로그아웃 기능 (끝)