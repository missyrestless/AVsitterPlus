/******************************************************************
* For most sounds and songs, use the sequence script (https://avsitterplus.github.io/avsitterplus_sequence.html)
*
* This example will loop a sound continuously after a button is pressed in the menu.
* e.g. for switching on a constant sound like a crackling fire in the background.
*
* Prim should contain a sound file that matches "sound".
* or you can use the sound's UUID for "sound" and not have it in the prim.
*
* You'll need to add a button to AVP_Positions notecard that matches the "button_name", either:
* ADJUST Fire Crackle|0 (this will add a button to the [ADJUST] menu).
* or
* BUTTON Fire Crackle|0 (add wherever you like in the menu or a submenu).
******************************************************************/

string button_name = "Fire Crackle";
string sound = "fire_crackle";
float volume = 1.0;

integer playing;

default {
    state_entry(){
        llStopSound(); //stop sounds
    }
    link_message(integer sender, integer num, string msg, key id){
        if(msg==button_name){
            if(playing){
                llStopSound(); //stop sounds
                llRegionSayTo(id,0,"Sound switched off.");
            }
            else{
                llLoopSound(sound,volume); //start looping the sound
                llRegionSayTo(id,0,"Sound switched on.");
            }
            llMessageLinked(LINK_SET,90005,"",id); // give back the menu
            playing=!playing;
        }
    }
}
