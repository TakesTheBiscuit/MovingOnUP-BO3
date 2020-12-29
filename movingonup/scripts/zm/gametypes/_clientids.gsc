/*

▒█▀▀█ █▀▀█ █▀▀▄ ▒█▀▀█ █▀▀█ █▀▀▄ ▒█▀▄▀█ █▀▀█ █▀▀▄ █▀▀▄ ░▀░ █▀▀▄ █▀▀▀ 
▒█░░░ █▄▄█ █▀▀▄ ▒█░░░ █░░█ █░░█ ▒█▒█▒█ █░░█ █░░█ █░░█ ▀█▀ █░░█ █░▀█ 
▒█▄▄█ ▀░░▀ ▀▀▀░ ▒█▄▄█ ▀▀▀▀ ▀░░▀ ▒█░░▒█ ▀▀▀▀ ▀▀▀░ ▀▀▀░ ▀▀▀ ▀░░▀ ▀▀▀▀ 
Check out https://cabconmodding.com/!

*/

#using scripts\codescripts\struct;
#using scripts\shared\callbacks_shared;
#using scripts\shared\system_shared;
#using scripts\shared\array_shared;
#using scripts\shared\flag_shared;
#using scripts\zm\_zm_audio;

#insert scripts\shared\shared.gsh;

#namespace clientids;

REGISTER_SYSTEM( "clientids", &__init__, undefined )
	
function __init__()
{
	callback::on_start_gametype( &init );
	callback::on_connect( &on_player_connect );
	callback::on_spawned( &on_player_spawned ); 
}	

function init()
{
	level.clientid = 0;
	level thread moving_on_up_now();
}

function on_player_connect()
{
	self.clientid = matchRecordNewPlayer( self );
	if ( !isdefined( self.clientid ) || self.clientid == -1 )
	{
		self.clientid = level.clientid;
		level.clientid++;
	}

}

function on_player_spawned() //this function will get called on every spawn! 
{
	level flag::wait_till( "initial_blackscreen_passed" );
	iPrintln("github.com/TakesTheBiscuit"); 
}

function moving_on_up_now()
{
	while(1)
	{
		level flag::wait_till( "end_of_round" );
		wait(2);
		iPrintln("MOVING ON UP");
		playsoundatposition("movingonupsound", self.origin);
	}
	
}