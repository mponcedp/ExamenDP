<?php
    $path = 'files/archivoJson.json';
    header('Content-Type: application/json');
    header("Content-Transfer-Encoding: Binary");
    header("Content-disposition: attachment; filename=archivoJson.json");
    readfile($path);
    unlink('files/archivoJson.json');