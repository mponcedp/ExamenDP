<?php
include 'includes/header.php';
include_once('services/itemService.php');

if (isset($_GET['name']))
{
    $data = getItems();
    echo 'id: '. $data->id;
    echo '<br>';
    echo 'type: '. $data->type;
    echo '<br>';
    echo 'color: ' .$data->color;
    echo '<br>';

    saveJson('archivoJson',$data);
    header("Location: download.php");
}

include 'includes/footer.php';