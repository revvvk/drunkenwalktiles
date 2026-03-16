/// @description Insert description here
// You can write your code in this editor


//resetando o mapa
if(keyboard_check_released(ord("R"))){
    //chamando o script que cria os arrays 2D do mapa
    map_dungeon = scr_map_init(MAP_WIDTH, MAP_HEIGHT);
    
    //chamando o script que cria o bebado no meio do mapa e faz ele percorrer transformando em tile de chão
    //o caminho por onde passa
    map_dungeon = scr_map_drunken_walk(map_dungeon, MAP_WIDTH, MAP_HEIGHT, 0.2);
}


// --- DEBUG DE ZOOM ---
// Captura a roda do mouse (scroll)
var _wheel = mouse_wheel_down() - mouse_wheel_up();

if (_wheel != 0) {
    var _cam = view_camera[0];
    
    // Pega o tamanho atual
    var _w = camera_get_view_width(_cam);
    var _h = camera_get_view_height(_cam);
    
    // Ajusta o tamanho (multiplica para manter a proporção)
    // 0.1 significa que ele aumenta/diminui 10% por clique
    var _zoom_speed = 0.04;
    _w += _w * _wheel * _zoom_speed;
    _h += _h * _wheel * _zoom_speed;
    
    // Impede que o zoom fique negativo ou absurdamente pequeno
    _w = clamp(_w, 320, 10000); 
    _h = clamp(_h, 180, 10000);
    
    camera_set_view_size(_cam, _w, _h);
}