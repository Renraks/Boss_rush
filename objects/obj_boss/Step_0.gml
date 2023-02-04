/// @description Movimentação e ataques
//Andando aleatoriamente de tempos em tempos

// -------------- ESTADO ---------------- //
f_checa_estado()

// -------------- Andar ------------------ //

f_andando();

// ---------------- Dash -------------------//

f_avancando();

// --------------- Ataque -----------------//

f_atacando();

// --------------- Explode ----------------- //

f_explode();
f_verifica_stun() //Verifica se o jogador conseguiu atordoar o boss

// --------------- Recebendo Dano ---------- //

//Verifica ataques meelee
var ataque_atual = instance_place(x, y, obj_ataque_1);
if(place_meeting(x, y, ataque_atual)) f_recebe_dano(ataque_atual)
//Veririca ataques de tiro
var tiro_atual = instance_place(x, y, obj_tiro1_player);
if(place_meeting(x, y, tiro_atual)) f_recebe_dano(tiro_atual)
