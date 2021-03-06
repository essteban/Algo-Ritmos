public class DLooper
{ 
    Gain master => dac; //Gain 

    //Sound chain - Electronic kit
    SndBuf bassdrum => master;
    SndBuf snaredrum => master;
    SndBuf hihatcymbal => NRev rev => master;   
    
    .8 => master.gain;
    .065 => rev.mix; 
    
    //.wav files
    me.dir() + "/Kick.wav" => bassdrum.read; 
    me.dir() + "/Snare-Clap.wav" => snaredrum.read;
    me.dir() + "/HH.wav" => hihatcymbal.read;
    
    //inicio 
    bassdrum.samples() => bassdrum.pos;
    snaredrum.samples() => snaredrum.pos;
    hihatcymbal.samples() => hihatcymbal.pos;
    
fun void drum (int beat, int div, int k[], int s[], int hh[])
{   
    BPM tempo;
    tempo.tTempo(beat);
    
    while(true)
    {
        for(0 => int i; i < k.cap() && i < s.cap() && i < hh.cap(); i++)
        {
            if (k[i] == 1)
            {
                0 => bassdrum.pos;
            }
            if (s[i] == 1)
            {
                0 => snaredrum.pos;
            }
            if (hh[i] == 1)
            {
                0 => hihatcymbal.pos;
            } 
            if( div == 1 )
            {
                tempo.whole => now;
            }
            if( div == 2 )
            {
                tempo.half => now;
            }
            if( div == 3 )
            {
                tempo.tEighth => now;
            }
            if( div == 4 )
            {
                tempo.quarter => now;
            }
            if( div == 8 )
            {
                tempo.eighth => now;
            }
            if( div == 16 )
            {
                tempo.sixteenth => now;
            }
            if( div == 32 )
            {
                tempo.thirtysecond => now;
            }
            else
            {
                <<<"Not supported time division">>>;
            }
        }
    }
}
}
