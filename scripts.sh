#!/bin/sh

venv_regex='\./\.?\(venv\|env\)'

lenv() {
    venv_folder=$(find './' -maxdepth 1 -type d -regex "$venv_regex" | head -n 1)

	venv_activation_script="${venv_folder}/bin/activate"

    [ -f "$venv_activation_script" ] || echo "file $venv_activation_script does not exist"

	if [ -x "$venv_activation_script" ]; then
        . "$venv_activation_script"
    else
        echo "file $venv_activation_script is not executable" 
    fi
}
