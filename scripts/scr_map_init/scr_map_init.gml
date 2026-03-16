/// @description Cria o array 2D que contém as linhas e colunas do mapa
/// @param {real} _largura Largura do mapa (número de colunas) para checar os limites
/// @param {real} _altura Altura do mapa (número de linhas) para checar os limites
/// @returns {array} retorna o mapa criado
function scr_map_init(_largura, _altura){
    //cria o array com a largura do mapa (as colunas do grid)
    dungeon = array_create(_largura);
    
    //cria o array com a altura do mapa com base no número de colunas (as linhas do grid)
    for(var _i = 0; _i < _largura; _i++){
        //define todas as células do grid como parede
        dungeon[_i] = array_create(_altura, TILE_WALL);
    }
    
    //retorna o mapa criado
    return dungeon;
}