<footer>
  <div class="container">
   <div class="social-footer-list-box">
     <ul class="list-unstyled social-footer-box">
       <li><a href='<?php echo $vk; ?>' target="_blank"><i class="fa fa-vk" aria-hidden="true"></i></a></li>
       <li><a href='<?php echo $facebook; ?>' target="_blank"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
       <li><a href='<?php echo $instagram; ?>' target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
     </ul>
   </div>
   

   
   
   <div class="copy-right-text-box">
      <p>Ресторан “Люся, не ори” © 2017</p>
   </div>
  </div>
</footer>

<!-- Modal-reservation -->
<div id="modal-reservation" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal"><i class="material-icons">close</i></button>
        <h4 class="modal-title">Резервация столика</h4>
       
        <form id="reservation-form" class="modal-form">
             <p>Пожалуйста, введите Ваши данные</p>
            <div class="input-field">
                <input type='text' name='name' placeholder='Ваше имя'>
            </div>
            <div class="input-field">
                <input type='tel' name='phone' placeholder='Ваш телефон'>
            </div>
            <p>Желаемая дата посещения:</p>
            <div class="input-field">
                <input type='text' name='date' class='date-pick-item' placeholder='Нажмите для выбора'>
            </div>
             <div class="input-field">
                <button type='submit' id='reservation-form-submit' class='modal-buttons'>Зарезервировать</button>
            </div>
        </form>
        <h4 class="thanks-text">
            Спасибо, мы перезвоним Вам в течение нескольких минут, для уточнения деталей.
        </h4>
      </div>
    </div>

  </div>
</div>

<!-- Modal-reservation -->
<div id="modal-banket" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal"><i class="material-icons">close</i></button>
        <h4 class="modal-title">Резервация столика</h4>
        
        <form id="banket-form" class="modal-form">
            <p>Пожалуйста, введите Ваши данные</p>
            <div class="input-field">
                <input type='text' name='name' placeholder='Ваше имя'>
            </div>
            <div class="input-field">
                <input type='tel' name='phone' placeholder='Ваш телефон'>
            </div>
            <p>Желаемая дата банкета:</p>
            <div class="input-field">
                <input type='text' name='date' class='date-pick-item' placeholder='Нажмите для выбора'>
            </div>
             <div class="input-field">
                <button type='submit' id='banket-form-submit' class='modal-buttons'>Заказать банкет</button>
            </div>
        </form>
        <h4 class="thanks-text">
            Спасибо, мы перезвоним Вам в течение нескольких минут, для уточнения деталей.
        </h4>
      </div>
    </div>

  </div>
</div>

<!-- Modal-reservation -->
<div id="modal-menu" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal"><i class="material-icons">close</i></button>
        <h4 class="modal-title">Выберите меню</h4>
        
        <div class="menu-selection-box">
            <?php if($files) { ?>
            <ul class="list-unstyled">
                <?php foreach ($files as $file) { ?>
                <li><a href="<?php echo $file['link'] ?>" class="menu-list-item">- <?php echo $file['name']; ?></a></li>
                <?php } } ?>
            </ul>
        </div>
      </div>
    </div>




  </div>
</div>

</body></html>