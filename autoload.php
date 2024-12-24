<?php

spl_autoload_register(function ($class) {
    $baseDir = __DIR__ . '/';

    // Check if the class is part of your own application first
    $file = $baseDir . str_replace('\\', '/', $class) . '.php';

    // If the class file exists in your app's directory, include it
    if (file_exists($file)) {
        require_once $file;
    } else {
        // If the class is related to PHPMailer, check in the vendor/phpmailer/src directory
        if (strpos($class, 'PHPMailer\\') === 0) {
            // Correct the path to point directly to vendor/phpmailer/src/PHPMailer.php
            $file = __DIR__ . '/vendor/phpmailer/src/PHPMailer.php';
            if (file_exists($file)) {
                require_once $file;
            } else {
                throw new Exception("Class file not found: $file");
            }
        } else {
            // Handle other classes (if needed)
            throw new Exception("Class file not found: $file");
        }
    }
});
