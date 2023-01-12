'use strict';


{
  const open = document.getElementById('modalButton');
  const close = document.getElementById('modalClose');
  const modal = document.getElementById('modalWindow');
  const mask = document.getElementById('modalMask');
  const form = document.getElementById('mainForm');
  const button = document.getElementById('mainModalButton');
  const record = document.getElementById('mainRecord');
  const loader = document.getElementById('mainLoader');

  open.addEventListener('click', function () {
    modal.classList.remove('hidden');
    mask.classList.remove('hidden');
    open.style.display = 'none';
  });
  close.addEventListener('click', function () {
    modal.classList.add('hidden');
    mask.classList.add('hidden');
    form.style.display = "block";
    open.style.display = 'block';

  });
  mask.addEventListener('click', function () {
    modal.classList.add('hidden');
    mask.classList.add('hidden');
    form.style.display = "block";
    open.style.display = 'block';
  });

  button.addEventListener('click', function () {
    form.style.display = "none";
    record.style.display = "block";
    loader.style.display = "block";
    window.setTimeout(function () {
      loader.style.display = 'none';
    }, 3000)
  })



  


  

  // カレンダー作成
  let minDate = new Date();
  minDate = minDate.setDate(minDate.getDate());

  flatpickr('#js-datepicker', {
    locale: 'ja',
    dateFormat: 'Y年m月d日',
    defaultDate: new Date(),
    defaultDate: minDate,
    minDate: minDate,
  });

  const comment = document.getElementById('twitterComment');

  button.onclick = function (event) {
    if (document.getElementById('03-A').checked) {
      event.preventDefault();
      var left = Math.round(window.screen.width / 2 - 275);
      var top = (window.screen.height > 420) ? Math.round(window.screen.height / 2 - 210) : 0;
      window.location.href =
        "https://twitter.com/intent/tweet?text=" + encodeURIComponent(comment.value);
    }
  }




};
