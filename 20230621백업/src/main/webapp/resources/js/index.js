// Get all the area, industry, emply divs
const divs = document.querySelectorAll('.tag');

// Get the tag_wrap div
const tagWrapDiv = document.getElementById('tag_wrap');

// Create an array to store the selected labels
const selectedLabels = [];

// Add click event listeners to each area, industry, emply div
divs.forEach(function (tags) {
  tags.addEventListener('click', function () {
    // Get the label text from the clicked area, industry, emply div
    const labelText = tags.querySelector('label').textContent;

    // Check if the label is already selected
    if (selectedLabels.includes(labelText)) {
      // Remove the label from the selected labels array
      const index = selectedLabels.indexOf(labelText);
      selectedLabels.splice(index, 1);

      // Remove the corresponding div from tag_wrap
      const selectedDiv = tagWrapDiv.querySelector(`[data-label="${labelText}"]`);
      selectedDiv.remove();
      

      // Reset the border and text color of the clicked div
      tags.querySelector('label').style.border = 'none';
      tags.querySelector('label').style.color = '';
    } else {
      // Add the label to the selected labels array
      selectedLabels.push(labelText);

      // Create a new div element
      const newDiv = document.createElement('div');
      newDiv.textContent = labelText;
      newDiv.setAttribute('data-label', labelText);

      // Create a span element for the close button
      const closeButton = document.createElement('span');
      closeButton.textContent = '×';
      closeButton.classList.add('close-button');

      closeButton.style.marginLeft = "5px";
      closeButton.style.fontSize = "15px";

      // Append the close button to the new div
      newDiv.appendChild(closeButton);
      
      // Append the new div to tag_wrap
      tagWrapDiv.appendChild(newDiv);

      // Add a 1px solid #3399ff border and update text color to the clicked div
      tags.querySelector('label').style.border = '1px solid #3399ff';
      tags.querySelector('label').style.borderRadius = '15px';
      tags.querySelector('label').style.color = '#3399ff';
      tags.querySelector('label').style.padding = '0 15px';

      // Adjust display for the newly added divs
      const addedDivs = tagWrapDiv.querySelectorAll('div[data-label]');
      addedDivs.forEach((div) => {
        div.style.display = 'inline-block';
        div.style.marginRight = '30px';

        // Add click event listener to the newDiv for removal
        div.addEventListener('click', function () {
          // Get the label text of the clicked div
          const clickedLabelText = div.getAttribute('data-label');

          // Remove the label from the selected labels array
          const index = selectedLabels.indexOf(clickedLabelText);
          selectedLabels.splice(index, 1);

          // Remove the clicked div from tag_wrap
          div.remove();

          tags.querySelector('label').style = 'none';

          // Reset the border and text color of the corresponding tag
          const correspondingTag = document.querySelector(`.tag label:contains(${clickedLabelText})`);

          correspondingTag.style.border = 'none';
          correspondingTag.style.color = '';
        });
      });
    }
  });
});


// Get the reset button
const resetButton = document.querySelector('.hire_send_btn button[type="reset"]');

// Add click event listener to the reset button
resetButton.addEventListener('click', function () {
  // Clear the selected labels array
  selectedLabels.length = 0;

  // Remove all the divs inside the tag_wrap container
  while (tagWrapDiv.firstChild) {
    tagWrapDiv.firstChild.remove();
  }

  // Reset the border and text color of all the tag divs
  divs.forEach(function (tags) {
    tags.querySelector('label').style.border = 'none';
    tags.querySelector('label').style.color = '';
  });
});

// ... (existing code)

// Add click event listeners to each area, industry, emply div
divs.forEach(function (tags) {
  tags.addEventListener('click', function () {
    // ... (existing code)

    // Toggle the visibility of hire_send based on tag_wrap content
    toggleHireSendVisibility();
  });
});

// Get the submit button
const submitButton = document.querySelector('.hire_send_btn button[type="submit"]');

// Add click event listener to the submit button
submitButton.addEventListener('click', function (event) {
  event.preventDefault(); // Prevent the default form submission behavior

  // Get the values from the tag_wrap div
  const tagWrapValues = Array.from(tagWrapDiv.querySelectorAll('div[data-label]')).map(div => div.getAttribute('data-label'));

  // Create a form data object
  const formData = new FormData();

  // Append the values to the form data
  tagWrapValues.forEach(value => {
    formData.append('selectedLabels[]', value);
  });

  // Send the form data to the desired destination (replace 'destination' with your actual endpoint)
  const endpoint = 'destination';
  fetch(endpoint, {
    method: 'POST',
    body: formData
  })
  .then(response => {
    // Handle the response from the server (e.g., display success message)
    console.log('Response:', response);
  })
  .catch(error => {
    // Handle any errors that occurred during the request
    console.error('Error:', error);
  });

  // Clear the selected labels array
  selectedLabels.length = 0;

  // Remove all the divs inside the tag_wrap container
  while (tagWrapDiv.firstChild) {
    tagWrapDiv.firstChild.remove();
  }

  // Reset the border and text color of all the tag divs
  divs.forEach(function (tags) {
    tags.querySelector('label').style.border = 'none';
    tags.querySelector('label').style.color = '';
  });
});