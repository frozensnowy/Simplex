fighterjets = {"meg_mig25","meg_su27","meg_f14","meg_f15","meg_f22","meg_f23","meg_t50","meg_x45","meg_su27_elite"}
strikecraft = {"meg_av8","meg_a10","meg_su25","meg_f16","meg_f18","meg_mig29","meg_su34","meg_su35","meg_f117","meg_f35","meg_migmfi","meg_su47","meg_x47","meg_f18_elite"}
bombers = {"meg_b52","meg_b1","meg_tu160","meg_b2"}
specialplanes = {"meg_sr71","meg_e767","meg_kc10","meg_c5"}

for x, iCount in fighterjets do
paradeSlot(iCount,{
  -400-(x-1)*100,
  -150+(x-1)*50,
  2600-(x-1)*400,
},{
  0,
  0,
  1,
},{
  -1,
  0,
  0,
},0)
end

for x, iCount in strikecraft do
paradeSlot(iCount,{
  400+(x-1)*100,
  -150+(x-1)*50,
  2600-(x-1)*400,
},{
  0,
  0,
  1,
},{
  1,
  0,
  0,
},0)
end

for x, iCount in bombers do
paradeSlot(iCount,{
  -400-(x-1)*200,
  0+(x-1)*100,
  200-(x-1)*400,
},{
  0,
  0,
  1,
},{
  -1,
  0,
  0,
},0)
end

for x, iCount in specialplanes do
paradeSlot(iCount,{
  400+(x-1)*200,
  0+(x-1)*100,
  200-(x-1)*400,
},{
  0,
  0,
  1,
},{
  1,
  0,
  0,
},0)
end

paradeSlot("misc",{
  0,
  600,
  -650,
},{
  0,
  0,
  1,
},{
  0,
  1,
  0,
},0)