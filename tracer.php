<?php

$command   = $argv[1];
$directory = $argv[2];

if ($command === "init") {
    echo "Initialized empty Tracer repository in $directory/.tracer/\n";
    mkdir("$directory/.tracer", 0777, true);
}

if ($command === "status") {

    $files = preg_grep('/^([^.])/', scandir($directory));

    if ($files) {
        foreach ($file as $files) {
            echo turnTextIntoRed($file) . "\n";
        }

        return;
    }

    echo "No files found.\n";
}

/**
 * Transform your text in red to be show on linux terminal.
 * @var text Text to be changed.
 * @return string Text with color changed. 
 */
function turnTextIntoRed(string $text): string
{
    $red = "\033[31m";
    $reset = "\033[0m";
    return $red . $text . $reset;
}
