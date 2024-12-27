<?php

spl_autoload_register(function ($class) {
    $baseDir = __DIR__ . '/';

    $file = $baseDir . str_replace('\\', '/', $class) . '.php';

    if (file_exists($file)) {
        require_once $file;
    }
    else {
        if (strpos($class, 'PHPMailer\\') === 0) {
            $file = __DIR__ . '/vendor/phpmailer/src/PHPMailer.php';
            if (file_exists($file)) {
                require_once $file;
            }
            else {
                throw new Exception("Class file not found: $file");
            }
        }
        else {
            throw new Exception("Class file not found: $file");
        }
    }
});
