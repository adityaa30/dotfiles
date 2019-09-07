#!/bin/bash

scrap_folder="`pwd`/scrapped-data"
total_pokemons=807  # Actually 809 but name for last 2 not in pokeapi
poke_image_base_url='https://assets.pokemon.com/assets/cms2/img/pokedex/full/'
poke_name_base_url='https://pokeapi.co/api/v2/pokemon/'

# Make sure directory for the scrapped data is present
mkdir -p "$scrap_folder"

for((i=1; i < $total_pokemons; ++i))
do
	poke_idx=`printf "%03d" $i`

	# Get the pokemon name
	wget -q ${poke_name_base_url}${i} -O temp.json
	poke_name=`jq -r '.forms[0].name' temp.json`
	# echo $poke_name
	rm temp.json

	# Get the pokemon png image url
	poke_url=${poke_image_base_url}${poke_idx}.png
	echo $poke_url 
	
	# Download the pokemon image
        echo "  > Downloading '$poke_name' from '$poke_url' to '$scrap_folder/$poke_name.png' ..."
        wget "$poke_url" -O "$scrap_folder/$poke_name.png" -q
done


