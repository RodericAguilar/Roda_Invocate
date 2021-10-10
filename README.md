# Roda_Invocate

Script that "Invoke or Transformation" u a monster, i just boring and do this.

<h1>Config File</h1>

```lua
Config = {}

Config.framework = 'esx' -- esx, qbcore
Config.InteracSound = false -- True for sounds.

Config.RandomPeds = {
    'a_f_m_fatcult_01',  --You can add your own peds, this is from https://docs.fivem.net/docs/game-references/ped-models/
    'a_m_m_acult_01',
    'a_m_m_beach_01',
    'a_m_y_motox_01',
    'a_m_y_motox_02'
}

Config.ItemsToUse = {
    'ouija',
    'potion',           --You can add more if u want, but need to insert it in your db.
    'acid',
    'book_magic'
}

Config.Time = 10
Config.Cooldown = 20
--Invocar Monster
Config.Diccionario = 'scr_rcbarry2'
Config.Particula = 'scr_clown_appears'    -- scr_exp_clown_trails

-- Bye bye Monster

Config.DiccionarioDissapear = 'scr_rcbarry2'
Config.ParticulaDissapear = 'scr_exp_clown_trails'  
```

<h1> Add your own peds or just copy Native Peds <br> Add your webhook in Server/Webhook.lua </h1>
<strong> Support ESX and QBCore, just change from esx to qbcore in Config.lua</strong>

```lua
Config.framework = 'esx' -- esx, qbcore
```

<h2> If u use QBCore add this to your qb-core, or u know </h2>

```lua
	['ouija'] 				 		 = {['name'] = 'ouija', 			  			['label'] = 'Ouija', 					['weight'] = 0, 		['type'] = 'item', 		['image'] = 'ouija.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Ouija Bro'},
	['potion'] 				 		 = {['name'] = 'potion', 			  			['label'] = 'Potion', 					['weight'] = 0, 		['type'] = 'item', 		['image'] = 'potion.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Potion Bro'},
	['acid'] 				 		 = {['name'] = 'acid', 			  				['label'] = 'Acid', 					['weight'] = 0, 		['type'] = 'item', 		['image'] = 'acid.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Simple Acid Bro'},
	['book_magic'] 				 	 = {['name'] = 'book_magic', 			  		['label'] = 'Magic Book', 				['weight'] = 0, 		['type'] = 'item', 		['image'] = 'book_magic.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Magic Book Bro'},
```

<h2> Feel free to join my discord to give u support https://discord.gg/veDufrHnAn </h2>
