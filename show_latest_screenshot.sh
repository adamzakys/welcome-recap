#!/bin/bash
latest=$(ls -t ~/.welcome_recap/screenshots/*.png | head -1)
kitty +kitten icat "$latest"

