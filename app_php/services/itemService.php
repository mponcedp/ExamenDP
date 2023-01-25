<?php

function getItems()
{
    $url = 'https://my-json-server.typicode.com/dp-danielortiz/dptest_jsonplaceholder/items';

    $data = file_get_contents($url);    
    $json = json_decode($data);

    foreach($json as $item){
        if ($item->color === 'green')
            $newJson = $item;
    }

    return $newJson;
}

function saveJson(string $fileName, stdClass $jsonContent)
{
    $path = 'files/'.$fileName.'.json';
    $jsonString = json_encode($jsonContent, JSON_PRETTY_PRINT);
    $fp = fopen($path, 'w');
    fwrite($fp, $jsonString);
    fclose($fp);
}
