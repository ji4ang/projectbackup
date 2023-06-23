const menus = document.querySelectorAll('nav ul li');

const chart1 = document.getElementById('chart1');
const chart2 = document.getElementById('chart2');
const chart3 = document.getElementById('chart3');
const chart4 = document.getElementById('chart4');
const chart5 = document.getElementById('chart5');
const chart6 = document.getElementById('chart6');
const chart7 = document.getElementById('chart7');
const chart8 = document.getElementById('chart8');
const chart9 = document.getElementById('chart9');
const chart10 = document.getElementById('chart10');
const chart11 = document.getElementById('chart11');
const chart12 = document.getElementById('chart12');
const chart13 = document.getElementById('chart13');
const chart14 = document.getElementById('chart14');
const chart15 = document.getElementById('chart15');

menus.forEach((menu, index) => {
    menu.addEventListener('click', () => {
        menus.forEach(item => {
            item.style.backgroundColor = '';
        });

        menu.style.backgroundColor = '#e9e9e9';

        chart1.style.display = 'none';
        chart2.style.display = 'none';
        chart3.style.display = 'none';
        chart4.style.display = 'none';
        chart5.style.display = 'none';
        chart6.style.display = 'none';
        chart7.style.display = 'none';
        chart8.style.display = 'none';
        chart9.style.display = 'none';
        chart10.style.display = 'none';
        chart11.style.display = 'none';
        chart12.style.display = 'none';
        chart13.style.display = 'none';
        chart14.style.display = 'none';
        chart15.style.display = 'none';


        if (index === 0) {
            chart1.style.display = 'block';
        } else if (index === 1) {
            chart2.style.display = 'block';
        } else if (index === 2) {
            chart3.style.display = 'block';
        } else if (index === 3) {
            chart4.style.display = 'block';
        } else if (index === 4) {
            chart5.style.display = 'block';
        } else if (index === 5) {
            chart6.style.display = 'block';
        } else if (index === 6) {
            chart7.style.display = 'block';
        } else if (index === 7) {
            chart8.style.display = 'block';
        } else if (index === 8) {
            chart9.style.display = 'block';
        } else if (index === 9) {
            chart10.style.display = 'block';
        } else if (index === 10) {
            chart11.style.display = 'block';
        } else if (index === 11) {
            chart12.style.display = 'block';
        } else if (index === 12) {
            chart13.style.display = 'block';
        } else if (index === 13) {
            chart14.style.display = 'block';
        } else if (index === 14) {
            chart15.style.display = 'block';
        }
    })
})