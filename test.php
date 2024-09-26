<?php
    require('components/configurations/config.php');
    require('components/model/security-model.php');

    $securityModel = new SecurityModel();

    $text = '0';

    echo $securityModel->encryptData($text);
?>