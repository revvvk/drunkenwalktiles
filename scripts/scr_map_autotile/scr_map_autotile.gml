



function scr_map_autotile(_map, _map_width, _map_height){ 
    var _tilemap = layer_tilemap_get_id("tl_dungeon");
    
    for(var _i = 0; _i < _map_width; _i++){
        for(var _j = 0; _j < _map_height; _j++){
            
            //chão ou parede
            if(_map[_i][_j] == TILE_FLOOR){
                tilemap_set(_tilemap, 3, _i, _j);
            }
            else{
                //sou o tile 1 - vazio
                var _tile = 1;
                
                //miolo da parede
                //se sou parede e abaixo de mim é chão
                if(_map[_i][_j] == TILE_WALL && 
                    _j + 1 < _map_height && 
                    _map[_i][_j + 1] == TILE_FLOOR){
                    //sou o tile 2 - miolo da parede
                    _tile = 2;
                }
                
                //canto interior inferior esquerdo
                //se sou parede e tenho chão do meu lado esquerdo e também tenho chão dois tiles abaixo de mim
                //OU o meu vizinho da esquerda tem chão abaixo e eu tenho chão a dois tiles abaixo de mim e acima tenho uma parede
                else if(_map[_i][_j] == TILE_WALL &&
                    _i > 0 &&
                    _j > 0 &&
                    _j + 2 < _map_height &&
                    ((_map[_i - 1][_j] == TILE_FLOOR && _map[_i][_j + 2] == TILE_FLOOR) || 
                    (_map[_i - 1][_j + 1] == TILE_FLOOR && _map[_i][_j + 2] == TILE_FLOOR && _map[_i][_j - 1] == TILE_WALL))){
                    //sou o tile 26 - canto interior inferior esquerdo
                    _tile = 26
                }
                //canto interior inferior direito
                //se sou parede e tenho chão do meu lado direito e também tenho chão dois tiles abaixo de mim
                //OU o meu vizinho da direita tem chão abaixo e eu tenho chão a dois tiles abaixo de mim e acima tenho uma parede
                else if(_map[_i][_j] == TILE_WALL &&
                    _j > 0 &&
                    _i + 1 < _map_width &&
                    _j + 2 < _map_height &&
                    ((_map[_i + 1][_j] == TILE_FLOOR && _map[_i][_j + 2] == TILE_FLOOR) || 
                    (_map[_i + 1][_j + 1] == TILE_FLOOR && _map[_i][_j + 2] == TILE_FLOOR && _map[_i][_j - 1] == TILE_WALL))){
                    _tile = 27;
                }
                
                //topo da parede
                //se sou parede e abaixo de mim tem parede e chão
                else if(_map[_i][_j] == TILE_WALL &&
                    _j + 1 < _map_height && 
                    _map[_i][_j + 1] == TILE_WALL  &&
                    _j + 2 < _map_height && 
                    _map[_i][_j + 2] == TILE_FLOOR){
                    //sou o tile 17 - topo da parede
                    _tile = 17;
                }
                
                //canto interior superior esquerdo
                //se eu sou parede e tenho chão acima e do meu lado esquerdo
                else if(_map[_i][_j] == TILE_WALL &&
                    _i > 0 &&
                    _j > 0 &&
                    _map[_i - 1][_j] == TILE_FLOOR &&
                    _map[_i][_j - 1] == TILE_FLOOR){
                    //sou o tile 24 - canto interior superior esquerdo
                    _tile = 24;
                }
                
                //canto interior superior direito
                //se sou parede e tenho chão acim e do meu lado direito
                else if(_map[_i][_j] == TILE_WALL &&
                    _i + 1 < _map_width &&
                    _j > 0 &&
                    _map[_i + 1][_j] == TILE_FLOOR &&
                    _map[_i][_j - 1] == TILE_FLOOR){
                    //sou o tile 25 - canto interior superior direito
                    _tile = 25;
                }
                
                //borda de baixo
                //se sou parede e acima de mim é chão e abaixo é diferente de chão
                else if(_map[_i][_j] == TILE_WALL &&
                    _j > 0 &&
                    _map[_i][_j - 1] == TILE_FLOOR &&
                    _j + 1 < _map_height &&
                    _map[_i][_j + 1] != TILE_FLOOR){
                    //sou o tile 22 - borda de baixo do mapa
                    _tile = 22;
                }
                
                //parede vertical da esquerda
                //se sou parede e ao meu lado direito é chão OU o tile do lado direito é chão e abaixo dele também
                else if(_map[_i][_j] == TILE_WALL &&
                    _i + 1 < _map_width &&
                    _j + 1 < _map_height &&
                    (_map[_i + 1][_j] == TILE_FLOOR || _map[_i + 1][_j + 1] == TILE_FLOOR)){
                    //sou o tile 19 - parede vertical esquerda
                    _tile = 19;
                }
                
                //parede vertical da direita
                //se sou parede e ao meu lado esquerdo é chão OU o tile do meu lado esquerdo é chão e abaixo dele também
                else if(_map[_i][_j] == TILE_WALL &&
                    _i > 0 &&
                    _j + 1 < _map_height &&
                    (_map[_i - 1][_j] == TILE_FLOOR || _map[_i - 1][_j + 1]) == TILE_FLOOR){
                    //sou o tile 20 - parede vertical direita
                    _tile = 20;
                }
                
                
                //canto superior esquerdo
                //se sou parede e dois tiles abaixo do meu vizinho a direita é chão
                //e um tile abaixo de mim é parede
                else if(_map[_i][_j] == TILE_WALL &&
                    _i + 1 < _map_width &&
                    _j + 2 < _map_height &&
                    _map[_i + 1][_j + 2] == TILE_FLOOR &&
                    _map[_i][_j + 1] == TILE_WALL ){
                    //sou o tile 16 - canto superior esquerdo
                    _tile = 16;
                }
                
                //canto superior direito
                //se sou parede e dois tiles abaixo do meu vizinho a esquerda é chão
                //e um tile abaixo de mim é parede
                else if(_map[_i][_j] == TILE_WALL &&
                    _i > 0 &&
                    _j + 2 < _map_height &&
                    _map[_i - 1][_j + 2] == TILE_FLOOR &&
                    _map[_i][_j + 1] == TILE_WALL){
                    //sou o tile 18 - canto superior direito
                    _tile = 18;
                }
                
                //canto inferior esquerdo
                //se sou parede e um tile acima do meu vizinho a direita é chão
                //e o tile acima de mim tem chão a direita
                else if(_map[_i][_j] == TILE_WALL &&
                    _i + 1 < _map_width &&
                    _j > 0 &&
                    _map[_i + 1][_j - 1] == TILE_FLOOR){
                    //sou o tile 21 - canto inferior esquerdo
                    _tile = 21;
                }
                
                //canto inferior direito
                //se sou parede e um tile acima do meu vizinho a esquerda é chão
                //e o tile acima de mim tem chão a esquerda
                else if(_map[_i][_j] == TILE_WALL &&
                    _i > 0 &&
                    _j > 0 &&
                    _map[_i - 1][_j - 1] == TILE_FLOOR){
                    //sou o tile 23 - canto inferior dirieto
                    _tile = 23;
                }
                
                //aplica os tiles corretamente
                tilemap_set(_tilemap, _tile, _i, _j);
            }
        }
    }
}