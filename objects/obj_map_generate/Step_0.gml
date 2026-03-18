/// @description Insert description here
// You can write your code in this editor


//resetando o mapa
if(keyboard_check_released(ord("R"))){
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
}


var _cam = view_camera[0];
var _w = camera_get_view_width(_cam);
var _h = camera_get_view_height(_cam);
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);

// --- 1. LÓGICA DE ARRASTAR (PAN) ---
// Clique e segure o botão do meio (scroll) ou direito para arrastar
if (mouse_check_button_pressed(mb_middle)) {
    is_dragging = true;
    drag_x = device_mouse_x_to_gui(0);
    drag_y = device_mouse_y_to_gui(0);
}

if (mouse_check_button_released(mb_middle)) {
    is_dragging = false;
}

if (is_dragging) {
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    
    // Calcula o deslocamento e ajusta pela proporção do zoom (w / window_width)
    // Isso mantém a velocidade do arrasto constante não importa o zoom
    var _diff_x = (_mx - drag_x) * (_w / window_get_width());
    var _diff_y = (_my - drag_y) * (_h / window_get_height());

    _cam_x -= _diff_x;
    _cam_y -= _diff_y;
    
    camera_set_view_pos(_cam, _cam_x, _cam_y);

    drag_x = _mx;
    drag_y = _my;
}

// --- 2. SEU ZOOM (CORRIGIDO PARA NÃO IR PRO TOPO) ---
var _wheel = mouse_wheel_down() - mouse_wheel_up();

if (_wheel != 0) {
    // Guardamos o tamanho antigo antes de mudar
    var _old_w = _w;
    var _old_h = _h;
    
    var _zoom_speed = 0.08; // Ajuste a velocidade aqui
    _w += _w * _wheel * _zoom_speed;
    _h += _h * _wheel * _zoom_speed;
    
    _w = clamp(_w, 320, 10000); 
    _h = clamp(_h, 180, 10000);
    
    // O PULO DO GATO: Reposiciona a câmera para compensar o crescimento
    // Se a largura aumentou 100 pixels, movemos a câmera 50 pixels para trás
    // Isso mantém o centro da tela exatamente onde estava
    _cam_x -= (_w - _old_w) / 2;
    _cam_y -= (_h - _old_h) / 2;

    camera_set_view_size(_cam, _w, _h);
    camera_set_view_pos(_cam, _cam_x, _cam_y);
}