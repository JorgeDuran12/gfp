<div id="sidebar">
      <div class="toggle-btn">
        <span>&#9776</span>
      </div>
      <ul>
        <li>
          <img src="img/logo.jpg" alt="Logo Fazt" class="logo">
        </li>
        <li>Home</li>
        <li>About</li>
        <li>Contact</li>
      </ul>
    </div>
    <script>
        const btnToggle = document.querySelector('.toggle-btn');

btnToggle.addEventListener('click', function () {
  console.log('clik')
  document.getElementById('sidebar').classList.toggle('active');
  
  console.log(document.getElementById('sidebar'))
});

    </script>