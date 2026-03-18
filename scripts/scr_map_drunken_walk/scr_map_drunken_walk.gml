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
    
    //tamanho que o bebado vai marcar como caminho
    var _brush_size = 5;
    
    //criando o bebado no meio da sala com o tamanho de 4 tiles
    for(var _i = 0; _i < _brush_size; _i++){
        for(var _j = 0; _j < _brush_size; _j++){
            var _dxw = _walker_position_x + _i;
            var _dyw = _walker_position_y + _j;
            
            if(_dxw - _map_width - _map_frame && _dyw - _map_height - _map_frame){
                if(_map[_dxw][_dyw] != TILE_FLOOR){
                    //definindo a posição inicial do bebado como chão
                    _map[_dxw][_dyw] = TILE_FLOOR;
                    _tiles_floor_created++;
                }
            }
        }
    }
    
    
    //erro para quando a porcentagem de meta de tiles for inválida
    var _max_percentage = (MAP_WIDTH - _map_frame * 2) * (MAP_HEIGHT - _map_frame * 2) / (_map_width * _map_height);
    //se a porcentagem requerida para criar o mapa for maior que a porcentagem possíveis de tiles, mostra o erro
    //e retorna o mapa apenas com a posição inicial
    if(_percentage > _max_percentage){
        show_debug_message("ERRO: meta de tiles impossível de alcançar!" + 
                            "\nValor passado: " + string(_percentage) +
                            "\nValor máximo: " + string(_max_percentage));
        return _map;
    }
    
    
    //percorre o mapa até alcançar a meta de tiles de chão a serem criados
    while(_tiles_floor_created < _tiles_floor_percentage){
        
        //direção aleatória que o bêbado vai andar
        //0 cima, 1 baixo, 2 esquerda e 3 direita
        var _walker_direction = irandom(3);
        var _steps_size = 5;
        
        //move o bebado conforme a direção sorteada
        switch(_walker_direction){
            //cima
        	case 0:
                _walker_position_y -= _steps_size;
            break;
            //baixo
            case 1:
                _walker_position_y += _steps_size;
            break;
            //esquerda
            case 2:
                _walker_position_x -= _steps_size;
            break;
            //direita
            case 3:
                _walker_position_x += _steps_size;
            break;
        }
        
        
        //trava o bêbado dentro da margem definida do array 2D do mapa
        _walker_position_x =  clamp(_walker_position_x, _map_frame, _map_width - _map_frame - 1);
        _walker_position_y =  clamp(_walker_position_y, _map_frame, _map_height - _map_frame - 1);
        
        
        ////se a posição percorrida pelo bebado for diferente de chão
        //if(_map[_walker_position_x][_walker_position_y] != TILE_FLOOR){
            ////transforma em tile de chão
            //_map[_walker_position_x][_walker_position_y] = TILE_FLOOR;
            ////aumenta em 1 a contagem de tiles de chão criados
            //_tiles_floor_created++;
        //}
        
        //loops que percorrem as colunas e linhas do bloco
        for(var _i = 0; _i < _brush_size; _i++){
            for(var _j = 0; _j < _brush_size; _j++){
                //calcula a posição real de cada célula do bloco a ser escavado (2x2)
                var _dx_walker = _walker_position_x + _i;
                var _dy_walker = _walker_position_y + _j;
                
                if(_dx_walker < _map_width - _map_frame && _dy_walker < _map_height - _map_frame){
                    //pinta de chão se ainda não for chão
                    if(_map[_dx_walker][_dy_walker] != TILE_FLOOR){
                        _map[_dx_walker][_dy_walker] = TILE_FLOOR;
                        //conta o tile
                        _tiles_floor_created++;
                    }
                }
            }
        }
    }
    
    //retorna o mapa com o caminho percorrido pelo bebado
    return _map;
}