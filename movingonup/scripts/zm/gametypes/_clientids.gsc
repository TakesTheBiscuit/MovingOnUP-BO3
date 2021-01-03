#using scripts\codescripts\struct;
#using scripts\shared\callbacks_shared;
#using scripts\shared\system_shared;
#using scripts\shared\array_shared;
#using scripts\shared\flag_shared;
#using scripts\shared\sound_shared;

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
	wait(2);

	self thread moveup();

}

function moveup() {
	self endon( "death" ); 
	
	for (;;)
	{
		iPrintln("WAITING TO MOVE ON UP");
		//level flag::wait_till("start_zombie_round_logic");
		//iPrintln("MOVING ON UP");
		level waittill( "end_of_round" );

		thread sound::play_in_space("movingonupsound", level.speaker.origin);
		// "Example: 

	}
}
