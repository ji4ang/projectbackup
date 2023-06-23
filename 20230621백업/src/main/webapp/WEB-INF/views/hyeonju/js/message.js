const lists = document.querySelectorAll('nav ul li');

const form1 = document.getElementById('form1');
const form2 = document.getElementById('form2');
const form3 = document.getElementById('form3');
const form4 = document.getElementById('form4');
const form5 = document.getElementById('form5');

lists.forEach((list, index) => {
  list.addEventListener('click', () => {
    lists.forEach(item => {
      item.style.backgroundColor = '';
    });

    list.style.backgroundColor = '#e9e9e9';

    form1.style.display = 'none';
    form2.style.display = 'none';
    form3.style.display = 'none';
    form4.style.display = 'none';
    form5.style.display = 'none';

    if (index === 0) {
      form1.style.display = 'block';
    } else if (index === 1) {
      form2.style.display = 'block';
    } else if (index === 2) {
      form3.style.display = 'block';
    } else if (index === 3) {
      form4.style.display = 'block';
    } else if (index === 4) {
      form5.style.display = 'block';
    }
  });
});