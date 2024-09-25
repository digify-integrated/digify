<?php
    require('components/configurations/config.php');
    require('components/model/security-model.php');

    $securityModel = new SecurityModel();

    $text = 'P@ssw0rd';

    echo $securityModel->encryptData($text);
?>