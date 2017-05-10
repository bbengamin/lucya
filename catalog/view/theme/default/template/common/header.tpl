<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="/catalog/view/theme/default/stylesheet/jquery.fancybox.min.css" rel="stylesheet" type="text/css" />
<link href="/catalog/view/theme/default/stylesheet/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
<script src="/catalog/view/javascript/jquery.fancybox.min.js" type="text/javascript"></script>

<script src="/catalog/view/javascript/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="/catalog/view/javascript/bootstrap-datepicker.ru.min.js" type="text/javascript"></script>

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" type="text/css" rel="stylesheet" media="screen">
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">

<header>
  <div class="container">
    <div class="clearfix head-row">
      <div class="header-item header-item-logo">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="/"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="/"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="header-item header-item-phone">
        <div class="header-item-phone-inner-box">
          <a href='tel:<?php echo $telephone; ?>' class='head-text-info'>
            <i class="head-icon"><img class='img-responsive' src='/catalog/view/theme/default/image/phone-header-icon.png'></i>
            <span class='head-phone-text'><?php echo $telephone; ?></span>
          </a>
          <a href='tel:<?php echo $telephone2; ?>' class='head-text-info'>
            <i class="head-icon"><img class='img-responsive' src='/catalog/view/theme/default/image/phone-header-icon.png'></i>
            <span class='head-phone-text'><?php echo $telephone2; ?></span>
          </a>
        </div>
        <div class="header-item-phone-inner-box">
          <span class='head-text-info'>
            <i class="head-icon"><img class='img-responsive' src='/catalog/view/theme/default/image/pinmap-header-icon.png'></i>
            <span class='head-phone-text'><?php echo $address; ?></span>
          </span>
          <span class='head-text-info'>
            <i class="head-icon"><img class='img-responsive' src='/catalog/view/theme/default/image/clock-header-icon.png'></i>
            <span class='head-phone-text head-address-text'><?php echo $officeHours; ?></span>
          </span>
        </div>
      </div>
      <div class="header-item header-item-btn">
        <a href='#' class='call-back-btn' data-toggle="modal" data-target="#modal-reservation">Зарезирвировать стол</a>
      </div>
    </div>
  </div>
</header>
<div class="menu-main-box">
  <div class="container">
    <nav id="menu" class="navbar">
      <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
        <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
      </div>
      <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav">
          <li><a href="/">Главная</a></li>
          <li><a href="/about_us">О нас</a></li>
          <li><a href="/karaoke">Караоке</a></li>
          <li><a href="/bakery">Кондитерская</a></li>
          <li><a href="/banketi">Банкеты</a></li>
          <li><a href="/menu">Меню</a></li>
         <!-- <li><a href="/gallery">Галерея</a></li> -->
          <li><a href="/contact">Контакты</a></li>
        </ul>
      </div>
    </nav>
  </div>
</div>

