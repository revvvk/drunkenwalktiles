///@description Algoritmo para refinar algumas paredes do mapa
/// @param {array} _map O mapa necessário para o algoritmo desenhar
/// @param {real} _map_width Tamanho da largura do array 2D do mapa
/// @param {real} _map_height Tamanho da altura do array 2D do mapa
function scr_map_refine(_map, _map_width, _map_height){
    for(var _i = 1; _i < _map_width - 2; _i++){
        for(var _j = 1; _j < _map_height - 3; _j++){
            //verificando se sou parede
            if(_map[_i][_j] == TILE_WALL){
                //TILES DE PAREDE SOLTOS NO MEIO DO MAPA COM CHÃO AO REDOR DELE
                //TRANSFORMA EM PILAR SIMPLES 2X3
                //guardando a informação sobre vizinhos
                var _is_wall_isolated = (
                    _map[_i - 1][_j] == TILE_FLOOR &&
                    _map[_i + 1][_j] == TILE_FLOOR &&
                    _map[_i][_j - 1] == TILE_FLOOR &&
                    _map[_i][_j + 1] == TILE_FLOOR);
                
                
                //verificando se tenho parede em cima, abaixo, na direita e esquerda
                if(_is_wall_isolated){
                    //transforma no pilar
                    //_map[_i + 1][_j] = TILE_WALL;
                    //_map[_i + 1][_j + 1] = TILE_WALL;
                    //_map[_i + 1][_j + 2] = TILE_WALL;
                    //_map[_i][_j + 1] = TILE_WALL;
                    //_map[_i][_j + 2] = TILE_WALL;
                    
                    //limpando os tiles de parede soltos PROVISÓRIAMENTE <-
                    _map[_i][_j] = TILE_FLOOR;
                    
                    show_debug_message("célula limpa: " + string(_i) + " x " + string(_j));
                }
            }
        }
    }
}