/// @description Movimentação e ataques
//Andando aleatoriamente de tempos em tempos

// -------------- ESTADO ---------------- //
checa_estado()

// -------------- Andar ------------------ //

andando();

// ---------------- Dash -------------------//

avancando();

// --------------- Ataque -----------------//

atacando();

// --------------- Recebendo Dano ---------- //

//Verifica ataques meelee
var ataque_atual = instance_place(x, y, obj_ataque_1);
if(place_meeting(x, y, ataque_atual)) recebe_dano(ataque_atual)
//Veririca ataques de tiro
var tiro_atual = instance_place(x, y, obj_tiro1_player);
if(place_meeting(x, y, tiro_atual)) recebe_dano(tiro_atual)
