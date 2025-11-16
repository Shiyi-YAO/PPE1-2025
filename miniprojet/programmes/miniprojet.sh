ficher_URLS=$1

if [ $# -ne 1 ]
then
    echo "ce programme demande un argument"
    exit
fi

if [ ! -f "$ficher_URLS" ]
then
    echo "vous devez indiquer un ficher"
    exit
fi

echo -e "<table>\n\t<tr><th>nb</th><th>line</th><th>code_http</th><th>encodage</th><th>nb_mot</th>\n" > tableaux/tableau-fr.html

nb=0

while read -r line;
do
    nb=$(expr $nb + 1)
    data=$(curl -I -w "%{http_code}\n%{content_type}" -o /dev/null -s $line)
    code_http=$(echo "$data" | head -1)
    encodage=$(echo "$data" | tail -1 | cut -d '=' -f2 | tr -d '\r')
    nb_mot=$(lynx -dump -nolist $line | wc -w)

	echo -e "\t<tr><td>${nb}</td><td>${line}</td><td>${code_http}</td><td>${encodage}</td><td>${nb_mot}</td></tr>\n" >> tableaux/tableau-fr.html

echo -e "</table>"

done < "$ficher_URLS";

echo -e "
<html>
  <head>
    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css\">
  </head>

  <body>
    <section class=\"section has-background-link-dark\">
        <div class=\"hero has-text-centered\">
            <div class=\"hero-body\">
            <h1 class=\"title is-1 has-text-warning\">
              PPE_Miniprojet
              <h2 class=\"subtitle is-5 has-text-warning-dark\">YAOSHIYI</h2>
              <br />
            </h1>
          </div>
        </div>
        <nav class=\"tabs is-centered\">
          <ul>
            <li class=\"is-active\"><a href=\"index.html\">Accueil</a></li>
            <li><a href=\"../programmes/miniprojet.sh\">Scripts</a></li>
            <li><a href=\"miniprojet/tableaux/tableau-fr.html\">Tableaux</a></li>
          </ul>
        </nav>
        <div class=\"columns is-centered\">
          <div class=\"column is-half\">
          <div class=\"block content\">
          <h3 class=\"title is-3 has-text-warning\">Préparation du projet final</h3>
          <p>C'est un miniprojet qui nous aide à mieux comprendre les choses à faire pour le projet final</p>
          </div>
          <div class=\"block content\">
            <h3 class=\"title is-3 has-text-warning\">Les étapes du miniprojet</h3>
            <p>Le miniprojet se construit selon différentes étapes :</p>
            <ol >
              <li>Récupérer les informations de l'URL et exportez-les au format TSV</li>
              <li>Convertir un fichier TSV en tableau HTML</li>
              <li>Créer une page d'accueil index.html</li>
              <li>Mettre du style Bulma sur le tableau</li>
            </ol>
          </div>
          <div class=\"block content\">
            <h3 class=\"title is-3 has-text-warning\">Le script de récupération de pages</h3>
            <p>Ce script aura plusieurs objectifs, qu'on implémentera au fur et à mesure :</p>
            <ol class=\"is-lower-roman\">
              <li>lire une liste d'URL ;</li>
              <li>pour chaque URL, vérifier si elle est valide ;</li>
              <li>pour chaque URL valide, vérifier la réponse du serveur pour savoir si la page est accessible ;</li>
              <li>pour chaque page accessible, récupérer son encodage ;</li>
              <li>récupérer son contenu textuel et convertir au besoin en <emph>UTF-8</emph> ;</li>
              <li>écrire dans un tableau différentes informations, dont :</li>
              <ol class=\"is-lower-alpha\">
                <li>le code HTTP de retour ;</li>
                <li>l'URL elle-même ;</li>
                <li>le support (nombre d'occurrences) du mot cible dans la page ;</li>
              </ol>
            </ol>
          </div>
        </div>
        </div>
    </section>
  </body>
</html> " > ../index.html
