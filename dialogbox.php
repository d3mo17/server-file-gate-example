<?php

require(__DIR__ . '/vendor/autoload.php');

use DMo\ServerFileGate\Configuration;
use DMo\ServerFileGate\Presenter\Dialog;
use DMo\ServerFileGate\Service\LocalFilesystemAdapter;

$template = file_get_contents(__DIR__ . '/dialogbox.tpl');

$config = new Configuration(
    new LocalFilesystemAdapter(__DIR__ . '/targetData'),
    $template, [
        'translation' => [
            'errors' => [
                'wrongFiletype' => 'Only files of following types allowed: %s!',
                'uploadError' => 'An error occured during file upload: %s'
            ],
            'title' => 'File select',
            'directory' => 'directory',
            'directoryUp' => 'Move to parent directory',
            'createDirectory' => 'Create new directory',
            'dirnamePrompt' => 'Enter New Directory Name',
            'defaultNewDirname' => 'NewDir',
            'uploadBTLabel' => 'Upload',
            'cancelBTLabel' => 'Cancel',
            'confirmBTLabel' => 'Confirm',
            'filenameLabel' => 'Select file (use file-browser above):',
            'uploadLabel' => 'Upload file:'
        ]
    ]
);

Dialog::handleRequest($config, $_REQUEST);

