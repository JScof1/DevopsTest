import urllib
from urllib.request import urlopen
import json
urldump = urlopen("https://swapi.dev/api/starships/")
urlread = urldump.read()
jsondump = json.loads(urlread)
starships = jsondump["results"]
for ship in starships:
  if ship["pilots"] != []:
    output = ship["name"] + ": "
    firstpilot = True
    for pilot in ship["pilots"]:
      pilotdump = urlopen(pilot)
      pilotread = pilotdump.read()
      pilotjson = json.loads(pilotread)
      if firstpilot:
        firstpilot = False        
      else:
        output = output + ", "
      output = output + pilotjson["name"]
    print(output)
