///@description Limpa paredes muito finas saindo das bordas do mapa ou de blocos de paredes no meio do mapa
/// @param {array} _map O mapa necessário para o algoritmo desenhar
/// @param {real} _map_width Tamanho da largura do array 2D do mapa
/// @param {real} _map_height Tamanho da altura do array 2D do mapa
function scr_map_cleanup(_map, _map_width, _map_height){
    for(var _i = 1; _i < _map_width - 2; _i++){
        for(var _j = 1; _j < _map_height - 3; _j++){
            if(_map[_i][_j] == TILE_WALL){
                //informação de paredes horizontais muito finas
                var _is_thin_horizontal = (
                    _map[_i][_j - 1] == TILE_FLOOR &&
                    _map[_i][_j + 1] == TILE_FLOOR);
                
                //informação de paredes verticais muito finas
                var _is_thin_vertical = (
                    _map[_i - 1][_j] == TILE_FLOOR &&
                    _map[_i + 1][_j] == TILE_FLOOR);
                
                //limpando as paredes finas verticais
                if(_is_thin_vertical){
                    _map[_i][_j] = TILE_FLOOR;
                    //show_debug_message("Península vertical de 1 tile de largura limpa" + string(_i) + " x " + string(_j));
                }
                
                //limpando as paredes finas horizontais
                else if(_is_thin_horizontal){
                    _map[_i][_j] = TILE_FLOOR;
                    //show_debug_message("Península horizontal de 1 tile de largura limpa" + string(_i) + " x " + string(_j));
                }
                
            }
            
            //verificando se sou chão
            if(_map[_i][_j] == TILE_FLOOR){
                //informação se sou chão rodeado de paredes
                var _is_floor_isolated = (
                    _map[_i - 1][_j] == TILE_WALL &&
                    _map[_i + 1][_j] == TILE_WALL &&
                    _map[_i][_j - 1] == TILE_WALL &&
                    _map[_i][_j + 1] == TILE_WALL);
                
                //transformo em parede também se for o caso
                if(_is_floor_isolated){
                    _map[_i][_j] = TILE_WALL;
                }
            }
        }
    }
}

