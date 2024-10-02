<?php
function autoloadPhpSpreadsheet($className) {
    // Define the base directory for PhpSpreadsheet
    $baseDir = __DIR__ . '/src/'; // This should point to the 'src' directory

    // Replace namespace separator with directory separator and append .php
    $filePath = $baseDir . str_replace('\\', '/', $className) . '.php';

    // Check if the file exists
    if (file_exists($filePath)) {
        require_once $filePath;
    } else {
        throw new Exception("File not found: " . $filePath); // This line helps debug the actual path
    }
}

// Register the autoload function
spl_autoload_register('autoloadPhpSpreadsheet');
?>