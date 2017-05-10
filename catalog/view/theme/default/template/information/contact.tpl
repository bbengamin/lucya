<?php echo $header; ?>
<div class="page-contact">
  <div class="container">
    <div class="page-contact__header col-sm-12">Контакты</div>
    <div class="page-contact__maps col-sm-12">
       <script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A49f6ba71a13184e131ab24261963df1595a752a370561f2075f5e4ac4d009f38&amp;width=100%25&amp;height=100%&amp;lang=ru_UA&amp;scroll=false"></script>
       </div>
    <div class="page-contact__content col-sm-12">
      <div class="page-contact__content-left col-sm-4">
        <a href="tel:<?php echo $telephone; ?>" class="head-text-info">
            <i class="head-icon"><img class="img-responsive" src="/catalog/view/theme/default/image/phone-header-icon.png"></i>
            <span class="head-phone-text"><?php echo $telephone; ?></span>
        </a>
        <a href="tel:<?php echo $telephone2; ?>" class="head-text-info">
            <i class="head-icon"><img class="img-responsive" src="/catalog/view/theme/default/image/phone-header-icon.png"></i>
            <span class="head-phone-text"><?php echo $telephone2; ?></span>
        </a>
        <span class="contact-text-info">
          <i class="head-icon"><img class="img-responsive" src="/catalog/view/theme/default/image/pinmap-header-icon.png"></i>
          <span class="head-phone-text"><?php echo $address; ?></span>
        </span>
        <a href="mailto:info@lusyarestoran.ru" class="head-text-info">
            <i class="head-icon"><img class="img-responsive" src="/catalog/view/theme/default/image/icon-mail.png"></i>
            <span class="head-phone-text"><?php echo $config_email; ?></span>
        </a>
        <span class="head-text-info">
          <i class="head-icon"><img class="img-responsive" src="/catalog/view/theme/default/image/clock-header-icon.png"></i>
          <span class="head-phone-text head-address-text"><?php echo $open; ?></span>
        </span>
      </div>
      <div class="page-contact__content-right col-sm-8">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
          <input class="input__contact" type='text' name='name' required  placeholder='*Имя'>
          <input class="input__contact input__contact-second" name='phone' required type='text' placeholder='*Телефон'>
          <input class="input__contact" type="text" name='email' placeholder='E-mail'>
          <textarea class="input__contact-big" type="text" name='text' placeholder='Ваше сообщение...'></textarea>
          <button type="submit" class="call-back-btn input__contact-btn ">Отправить</button>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>