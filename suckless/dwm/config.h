/* See LICENSE file for copyright and license details. */
/*Quick overview of key bindings
 *
 * alt+shif+z closes a window alt+shift+space opens chromium alt+d opens dmenu alt+numbers goes to different windows
 * alt+x or z switches between windows alt+c or v changes orientation of windows alt+b or n resizes windows normally 
 * alt+shift+ a or s or d or f or g or h changes the tiling mode alt+left mouse in floating mode moves window alt+right mouse
 * resizes window in floating mode.
 * I wrote this so you can get some basic functionality out of this*/
/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int gappx     = 15;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "terminus:size=10" };
static const char dmenufont[]       = "terminus:size=10";
static const char col_gray1[]       = "#000000";
static const char col_gray2[]       = "#000000"; //this is the border around the window
static const char col_gray3[]       = "#ffffff"; //the numbers on the bar 
static const char col_gray4[]       = "#000000"; 
static const char col_cyan[]        = "#cd0000";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
	[SchemeStatus]  = { col_gray3, col_gray1,  "#000000"  }, // Statusbar right {text,background,not used but cannot be empty}
	[SchemeTagsSel]  = { col_gray4, col_cyan,  "#000000"  }, // Tagbar left selected {text,background,not used but cannot be empty}
        [SchemeTagsNorm]  = { col_gray3, col_gray1,  "#000000"  }, // Tagbar left unselected {text,background,not used but cannot be empty}
        [SchemeInfoSel]  = { col_gray4, col_cyan,  "#000000"  }, // infobar middle  selected {text,background,not used but cannot be empty}
        [SchemeInfoNorm]  = { col_gray3, col_gray1,  "#000000"  }, // infobar middle  unselected {text,background,not used but cannot be empty}
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8"};

//Rules for less tags variant
static const Rule rules[] = {
	{ "firefox",  NULL,       NULL,       1 << 7,       0,           -1 },
	//{ "Surf",     NULL,	  NULL,	      1 << 7,	    0,		 -1 }, 
	//{ "st",	      NULL,	  NULL,       1 << 1,       0,           -1 }, 
};


/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#include "tcl.c" 
#include "fibonacci.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
 	{ "[@]",      spiral },
 	{ "[\\]",      dwindle },
	{ "|||",		tcl },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };

//I added these so I can open all the apps I want from a keyboard shortcut
static const char *terminal[] = {"st", NULL}; //Open a terminal
static const char *files[] = {"pcmanfm", NULL}; //Open pcmanfm
static const char *mousepad[] = {"mousepad", NULL}; //Open mousepad
static const char *firefox[] = {"firefox", NULL}; //firefox
static const char *email[] = {"thunderbird", NULL}; //Open an email client
static const char *vlc[] = {"vlc", NULL}; //Open vlc media player
static const char *surf[] = {"surf", NULL}; //Open surf
static const char *nitrogen[] = {"nitrogen", NULL}; //Open nitrogen
static const char *connmangtk[] = {"connman-gtk", NULL}; //Open connman-gtk

static Key keys[] = {
	// modifier                     key        function        argument 
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,	        XK_b,      togglebar,      {0} },

	{ MODKEY,                       XK_z,      focusstack,     {.i = +1 } },   //moves between the windows
	{ MODKEY,                       XK_x,      focusstack,     {.i = -1 } },   //moves between the windows
	{ MODKEY, 			XK_h,	   focusstack,	   {.i = -1} },
	{ MODKEY,			XK_l,      focusstack,	   {.i = +1} },
	{ MODKEY,                       XK_c,      incnmaster,     {.i = +1 } },    
	{ MODKEY,	                XK_v,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_b,      setmfact,       {.f = -0.05} }, //resizes the window
	{ MODKEY,                       XK_n,      setmfact,       {.f = +0.05} }, //resizes the window
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_z,      killclient,     {0} }, //closes the program
	//Layout bindings
	{ MODKEY|ShiftMask,             XK_a,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,             XK_s,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ShiftMask,             XK_d,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_f,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY|ShiftMask,             XK_g,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY|ShiftMask,             XK_h,      setlayout,      {.v = &layouts[5]} },
	//Not in use
	//{ MODKEY,                       XK_space,  setlayout,      {0} },
	//{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	//{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	//{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	//{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	//{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	//{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	//{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,			XK_period, setgaps,	   {.i = +1} },
	{ MODKEY,  			XK_comma,  setgaps,	   {.i = -1} },
	{ MODKEY|ShiftMask,		XK_period, setgaps,        {.i = 0} },
	{ MODKEY|ShiftMask,		XK_comma,  setgaps,        {.i = 0} },
	//Bindings I added
	{ MODKEY|ShiftMask,		XK_v,	   spawn,	   {.v = vlc } }, //Should open vlc
	{ MODKEY,			XK_s,	   spawn, 	   {.v = surf } }, //Should open surf
	{ MODKEY,			XK_m,	   spawn,	   {.v = mousepad } }, //Should open mousepad
	{ MODKEY,			XK_e,	   spawn, 	   {.v = email } }, //Should open an email client
	{ MODKEY,			XK_f,	   spawn,	   {.v = files } }, //Should open my file manager
	{ MODKEY, 			XK_t,	   spawn,	   {.v = terminal } }, //Should open a terminal
	{ MODKEY|ShiftMask, 		XK_n,	   spawn, 	   {.v = nitrogen } }, //To open nitrogen
	{ MODKEY|ShiftMask, 		XK_space,  spawn,	   {.v = firefox } }, //Should open chromium
	{ MODKEY|ShiftMask,		XK_c,	   spawn,  	   {.v = connmangtk } },
	TAGKEYS(			XK_w,      		   7) //w stands for "web" so I want it to take me the the "web" page which is page 8

	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

