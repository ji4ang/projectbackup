// 지체 장애 차트 (시작)
var ctx = document.getElementById('myChart1').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [2, 57, 50, 77, 42, 10, 13, 8, 76],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [50, 108, 159, 56, 128, 29, 158, 167, 160],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 지체 장애 차트 (끝)


// 뇌병변 장애 차트 (시작)
var ctx = document.getElementById('myChart2').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [0, 4, 5, 6, 2, 0, 1, 0, 8],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [1, 6, 24, 5, 7, 2, 5, 9, 25],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 뇌병변 장애 차트 (끝)


// 시각 장애 차트 (시작)
var ctx = document.getElementById('myChart3').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [3, 29, 26, 14, 14, 4, 3, 0, 15],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [4, 60, 27, 13, 21, 7, 23, 17, 57],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 시각 장애 차트 (끝)


// 청각 장애 차트 (시작)
var ctx = document.getElementById('myChart4').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [0, 8, 14, 13, 13, 1, 2, 2, 30],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [1, 15, 14, 4, 2, 6, 21, 18, 33],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 청각 장애 차트 (끝)


// 언어 장애 차트 (시작)
var ctx = document.getElementById('myChart5').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [1, 0, 0, 1, 0, 1, 1, 1, 1],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [2, 1, 2, 1, 0, 2, 6, 4, 7],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 언어 장애 차트 (끝)


// 지적 장애 차트 (시작)
var ctx = document.getElementById('myChart6').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [0, 1, 4, 6, 0, 1, 0, 0, 22],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [0, 2, 7, 7, 1, 3, 6, 4, 71],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 지적 장애 차트 (끝)


// 자폐성 장애 차트 (시작)
var ctx = document.getElementById('myChart7').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [0, 0, 1, 0, 0, 0, 0, 0, 0],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [0, 0, 1, 3, 0, 1, 0, 0, 5],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 자폐성 장애 차트 (끝)


// 정신 장애 차트 (시작)
var ctx = document.getElementById('myChart8').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [0, 2, 1, 1, 0, 2, 0, 0, 8],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [1, 0, 0, 0, 0, 0, 1, 2, 9],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 정신 장애 차트 (끝)


// 신장 장애 차트 (시작)
var ctx = document.getElementById('myChart9').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [0, 3, 11, 6, 2, 1, 0, 0, 2],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [2, 10, 12, 1, 6, 3, 3, 11, 14],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 신장 장애 차트 (끝)


// 심장 장애 차트 (시작)
var ctx = document.getElementById('myChart10').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [0, 1, 3, 1, 2, 0, 0, 0, 0],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [0, 0, 1, 1, 0, 0, 0, 0, 2],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 심장 장애 차트 (끝)


// 호흡기 장애 차트 (시작)
var ctx = document.getElementById('myChart11').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [0, 0, 0, 1, 0, 0, 0, 0, 0],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [0, 1, 1, 1, 0, 1, 1, 0, 2],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 호흡기 장애 차트 (끝)


// 간 장애 차트 (시작)
var ctx = document.getElementById('myChart12').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [0, 1, 2, 0, 1, 0, 0, 0, 1],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [2, 3, 3, 2, 0, 1, 1, 2, 1],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 간 장애 차트 (끝)


// 안면 장애 차트 (시작)
var ctx = document.getElementById('myChart13').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [0, 1, 0, 0, 1, 0, 0, 0, 0],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [1, 1, 2, 1, 0, 0, 4, 1, 1],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 안면 장애 차트 (끝)


// 장루/요루 장애 차트 (시작)
var ctx = document.getElementById('myChart14').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [0, 3, 0, 0, 0, 0, 0, 0, 0],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [0, 0, 2, 0, 0, 0, 3, 0, 0],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 장루/요루 장애 차트 (끝)


// 뇌전증 장애 차트 (시작)
var ctx = document.getElementById('myChart15').getContext('2d');

var data = {
    labels: ['관리자', '전문직', '사무종사자', '서비스업', '판매 종사자', '농림·어업 종사자', '기능원 및 관련 기능 종사자', '장치·기계 조작 및 조립 종사자', '단순노무 종사자'],
    datasets: [{
        label: '여자',
        data: [0, 0, 2, 1, 1, 0, 0, 0, 2],
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(255, 99, 132, 1)',
        borderWidth: 1
    }, {
        label: '남자',
        data: [0, 0, 1, 1, 1, 1, 1, 1, 6],
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
    }]
};

var options = {
    indexAxis: 'y',
    scales: {
        x: {
            max: 180
        },
        y: {
            beginAtZero: true
        }
    }
};

var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
// 뇌전증 장애 차트 (끝)