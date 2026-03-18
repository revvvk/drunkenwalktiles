/// @description Insert description here
// You can write your code in this editor


//garantindo que seja aleatório
randomise();

drag_x = 0;
drag_y = 0;
is_dragging = false;

//chamando o script que cria os arrays 2D do mapa
map_dungeon = scr_map_init(MAP_WIDTH, MAP_HEIGHT);

//chamando o script que cria o bebado no meio do mapa e faz ele percorrer transformando em tile de chão
//o caminho por onde passa
map_dungeon = scr_map_drunken_walk(map_dungeon, MAP_WIDTH, MAP_HEIGHT, PERCENTAGE);

//chamando o script que faz a limpeza de alguns tiles
scr_map_cleanup(map_dungeon, MAP_WIDTH, MAP_HEIGHT);

//chamando o script de refino de paredes
scr_map_refine(map_dungeon, MAP_WIDTH, MAP_HEIGHT);

//chamando o script que desenha as sprites de tiles corretamente
scr_map_autotile(map_dungeon, MAP_WIDTH, MAP_HEIGHT);
