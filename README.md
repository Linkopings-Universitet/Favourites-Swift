Favourites
==========

Uppgift
-------

Den här uppgiften går ut på att utöka en primitiv länksamlingsapp med mer funktionalitet. I sitt nuvarande läge har appen ett enkelt gränsnitt med en tabellvy som visar länk-urler och en webbvy som visar länkarna. På iPhone sker detta med en navigation controller som pushar webbvyn när användaren väljer en länk. På iPad finns istället en split view controller som visar både länklistan och webbvyn samtidigt i liggande läge, medan den visar länksamlingen i en popover i stående läge. Allt detta sker med endast två subklasser av UIViewController och en modellklass.

Appen ska utökas så att användaren kan ta bort och lägga till länkar i samlingen samt att länkarna även ska kunna ha en titel. Detta ska ske genom editing mode och swipe-to-delete för borttagning och en modal vy-kontroller som innehåller ett "formulär" för att lägga till nya länkar. Ni måste använda samma vy-kontroller både för iPhone och iPad och den modala vy-kontrollern ska även bakas in i en UINavigationController med en "spara"- och en "avbryt"-knapp.

I tabellvyn som visar länkarna ska cellerna visar cellerna endast en URL för länkarna i appens nuvarande skepnad. Detta är inte så användarvänligt. Ni ska därför utöka modellklassen så att den kan hålla en titel. Tabellvycellerna ska sedan visa både titeln och URLen till länken. När användaren valt en länk ska länkens titel visas i navigation bar:en för vy-kontrollern som laddar länken.

Tyvärr kan inte appen spara någon data mellan sessioner ännu. Det är däremot inte något ni behöver åtgärda. Som bonus-uppgift kan ni om ni vill göra så att länkar lagras i en property-list-fil. Detta ligger dock utanför kursen.
