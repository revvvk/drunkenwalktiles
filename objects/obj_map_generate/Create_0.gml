/// @description Insert description here
// You can write your code in this editor


//garantindo que seja aleatório
randomise();

//chamando o script que cria os arrays 2D do mapa
map_dungeon = scr_map_init(MAP_WIDTH, MAP_HEIGHT);

//chamando o script que cria o bebado no meio do mapa e faz ele percorrer transformando em tile de chão
//o caminho por onde passa
map_dungeon = scr_map_drunken_walk(map_dungeon, MAP_WIDTH, MAP_HEIGHT, 0.2);