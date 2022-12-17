<?php

require(__DIR__ . '/vendor/autoload.php');

use DMo\ServerFileGate\Presenter\DialogTrigger;

echo 'Open file select dialog here: ';
echo (new DialogTrigger('dialogbox.php'))->getHTMLSnippet(dirname(__DIR__), 'selectedFile');

?>
<script>
    function selectedFile(file) {
        alert(file);
    }
</script>