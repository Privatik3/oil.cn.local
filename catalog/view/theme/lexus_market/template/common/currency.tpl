<?php if (count($currencies) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">   
    <p><?php echo $text_currency; ?></p> 
    <ul class="currency-body">
      <?php foreach ($currencies as $currency) { ?>
      <?php if ($currency['symbol_left']) { ?>
      <li><button class="currency-select list-item" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?></button></li>
      <?php } else { ?>
      <li><button class="currency-select list-item" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_right']; ?></button></li>
      <?php } ?>
      <?php } ?>
    </ul>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>
