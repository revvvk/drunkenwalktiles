/// @description Algoritmo que faz o caminho percorrido pelo bebado virar chão
/// @param {array} _map O mapa necessário para o bêbado percorrer
/// @param {real} _map_width Tamanho da largura do array 2D do mapa
/// @param {real} _map_height Tamanho da altura do array 2D do mapa
/// @param {real} _percentage Porcentagem de chão que o mapa deve conter
function scr_map_drunken_walk(_map, _map_width, _map_height, _percentage){
    //meta de tiles que devem se transformar em chão
    var _tiles_floor_percentage = floor(_map_width * _map_height * _percentage);
    
    var _map_frame = 10;
    
    //posição onde o bêbado vai começar (meio do mapa)
    var _walker_position_x = _map_width div 2;
    var _walker_position_y = _map_height div 2;
    
    //número de tiles de chão criados (começa em 0)
    var _tiles_floor_created = 1;
    
    //definindo a posição inicial do bebado como chão
    _map[_walker_position_x][_walker_position_y] = TILE_FLOOR;
    
    
    //percorre o mapa até alcançar a meta de tiles de chão a serem criados
    while(_tiles_floor_created < _tiles_floor_percentage){
        
        //direção aleatória que o bêbado vai andar
        //0 cima, 1 baixo, 2 esquerda e 3 direita
        var _walker_direction = irandom(3);
        
        //move o bebado conforme a direção sorteada
        switch(_walker_direction){
            //cima
        	case 0:
                _walker_position_y -= 1;
            break;
            //baixo
            case 1:
                _walker_position_y += 1;
            break;
            //esquerda
            case 2:
                _walker_position_x -= 1;
            break;
            //direita
            case 3:
                _walker_position_x += 1;
            break;
        }
        
        
        //trava o bêbado dentro da margem definida do array 2D do mapa
        _walker_position_x =  clamp(_walker_position_x, _map_frame, _map_width - _map_frame - 1);
        _walker_position_y =  clamp(_walker_position_y, _map_frame, _map_height - _map_frame - 1);
        
        
        //se a posição percorrida pelo bebado for diferente de chão
        if(_map[_walker_position_x][_walker_position_y] != TILE_FLOOR){
            //transforma em tile de chão
            _map[_walker_position_x][_walker_position_y] = TILE_FLOOR;
            //aumenta em 1 a contagem de tiles de chão criados
            _tiles_floor_created++;
        }
    }
    
    //retorna o mapa com o caminho percorrido pelo bebado
    return _map;
}