# Journal de bord du projet encadré

### Séance 1
Le premier cours se concentre principalement sur l'apprentissage de la compréhension des ordinateurs et des concepts de base et de l'utilisation des commandes du système Unix.
#### 1. Un ordinateur est composé de plusieurs couches :
- Hardware → Kernel → Shell → Utilities
- Nous interagissons avec le système d'exploitation via un shell
#### 2. Unix
- ⚠️ Tout est fichier (C'est très abstrait, et je pense qu'il faudra beaucoup de temps pour vraiment comprendre le concept.)
- La structure hiérarchique des fichiers et des répertoires (dossiers) : Tout comme s'étendant de la racine d'un arbre jusqu'aux feuilles, cette branche est appelée le chemin pour trouver le fichier (feuille).
- Traitement des fichiers avec des commandes : nom [-option...] [arguments...]
#### 3. Difficulté :
- Nous devons toujours savoir dans quel fichier nous nous trouvons pour passer à l'étape suivante(trouvez le bon chemin)
- La compréhension et l'utilisation des commandes(Nous devons nous familiariser avec de nombreuses commandes et leurs paramètres (options), et devons ensuite souvent connecter plusieurs commandes via le symbole pipe |, ce qui nécessite une certaine réflexion logique.)

---

### Séance 2
Git et GitHub
#### 1. Différence
- Git est un système de gestion de versions (SGV). Il nous permet d'enregistrer chaque modification apportée à un fichier, de conserver son historique et de revenir aux versions précédentes.
- GitHub est une plateforme en ligne basée sur Git qui nous permet de télécharger notre code local sur le cloud pour collaborer, partager et discuter avec d'autres personnes.
- Je comprends que Git est un outil et que GitHub est une plateforme.
#### 2. Déposer mes travail sur Git
J'ai testé quelques-unes des commandes Git les plus courantes : git add, git commit -m "message", etc. J'ai constaté que, même si ces commandes peuvent paraître un peu complexes à mémoriser au premier abord, leur déroulement est en réalité très logique :
```bash
« pull → add → commit → push → tag » 
```
est un processus standard.
#### 3. Manipulation des fichiers
Comme je l’ai mentionné dans la Séance 1, les commandes pour manipuler les fichiers sont parfois complexes et difficiles à mémoriser.
Afin de mieux comprendre leur utilisation, j’ai créé un tableau récapitulatif qui contient :
```bash
les options de chaque commande
leurs arguments
et une explication en chinois pour m’aider à les retenir plus facilement
```
Cette méthode m’aide non seulement à mémoriser plus efficacement, mais aussi à comparer les commandes entre elles.
Je me rends compte qu’il existe encore beaucoup de commandes que je ne connais pas, donc le plus important pour moi est de continuer à explorer et à pratiquer.

---

### Séance 3
Pipelines
#### 1. Les commandes se communiquent
Dans cette partie du cours, j’ai appris à manipuler les flux d’entrées et de sorties (stdin, stdout, stderr) dans Unix. Avant, je ne savais pas vraiment comment les commandes “communiquent” entre elles, mais maintenant je comprends que tout passe par des flux de données.

les commandes peuvent rediriger leurs entrées et sorties vers des fichiers :
```bash
> envoie la sortie dans un fichier
>> ajoute la sortie à la fin d’un fichier
< lit l’entrée à partir d’un fichier
Exemple : wc < texte.txt > compte.txt ➡️ lit un fichier et enregistre le résultat dans un autre, sans rien afficher à l’écran.
```
#### 2. Les pipelines |
Le pipe |, qui permet d’envoyer la sortie d’une commande comme entrée d’une autre. elle permet aussi de combiner des commandes simples pour réaliser des traitements complexes.
Exemple :
```bash
cat *.txt | grep "université" | wc -l
➡️ Cette commande compte le nombre de lignes contenant le mot "université" dans tous les fichiers texte du répertoire courant.
```
J'ai également appris beaucoup de commandes utiles ici : grep, sort, etc. Je les ai ajoutées à ma liste de commandes comme d'habitude pour une visualisation et une mémorisation faciles.

---

### Séance 4
Nous avons appris deux boucles : 
```bash
1. for ➡️ parcourir les éléments
2. while ➡️ faire quelques choses tant que la condition est vrai
👆 comme les boucles dans python
```
Explication du code :
```bash
#!/usr/bin/bash # on est dans le shell bash
if [ $# -ne 1 ] # vérifier si on reçoit 1 argument
then #si la condition est vrai, c-à-d on n'a pas reçu 1 argument
  echo "ce programme demande un argument" #print cette messages pour demander un entrée d'un argument
    exit # sort de ce boucle
fi # pour dire à ordinateur c'est la fin de la boucle
FICHIER_URLS=$1 #un argument nommé FICHIER_URLS
OK =0 #initialiser compteur OK
NOK =0 #initialiser compteur OK
while read -r LINE; #lire ce fichier par ligne
do
  echo "la ligne: $LINE" #print ce qu'on a lit de cette ligne
  if [[ $LINE =∼ ^https?:// ]] #vérifier si cette ligne est commencé par http:// ou https://
  then #si oui 
    echo "ressemble à une URL valide" #print la message pour dire que le contenu de cette ligne ressemble à une URL valide
    OK=$(expr $OK + 1) #compteur des URL valide plus 1
  else #sinon
    echo "ne ressemble pas à une URL valide" ##print la message pour dire que le contenu de cette ligne ne ressemble pas à une URL valide
    NOK=$(expr $NOK + 1) #compteur des URL non valide plus 1
  fi #la fin du boucle
done < $FICHIER_URLS #le contenu du fichier est redirigé vers la boucle while
echo "$OK URLs et $NOK lignes douteuses" #print notre résultat du nombre des URL valide et non valide
```

---

### Séance 5

Réflexions et problèmes rencontrés en faisant les devoirs

Code à élaborer :
```bash
while read -r line;
do
    nb=nb+1
	echo ${line};
done < "$ficher_URLS";
```

Question 1 : Pourquoi ne pas utiliser cat ?  
Concernant la première question concernant le miniprojet, je ne suis pas tout à fait sûr de sa signification. Je vais donc simplement expliquer mon point de vue sur cat et while : l'un ne fait que lire, tandis que l'autre gère le traitement. Cela signifie-t-il qu'on peut utiliser cat et read simultanément ? Je ne pense pas que ce soit nécessaire, car read gère déjà la lecture de fichiers dans while. J'espère que mon professeur pourra répondre à ma question lors de la révision de nos devoirs après les vacances.

Question 2 : Comment transformer "urls/fr.txt" en paramètre du script ?  
Ce problème est relativement simple à résoudre. Nous définissons le chemin d'accès au fichier comme paramètre, de sorte que lors de l'exécution de notre fichier sh, nous devons utiliser le chemin d'accès du fichier d'entrée pour exécuter notre boucle.
```bash
ficher_URLS=$1 #Cela signifie qu'il faut attribuer le premier paramètre injecté à la variable ficher_URLS
while read -r line;
do
    nb=nb+1
	echo "$nb   ${line}";
done < "$ficher_URLS"; #En conséquence, le contenu du fichier saisi ici utilise également nos variables
```
2.1 Valider l’argument : ajouter le code nécessaire pour s’assurer qu’on donne bien un argument au script, sinon on s’arrête  
Ici, j'ai ajouté deux conditions : l'une pour vérifier le nombre de paramètres d'entrée, et l'autre pour vérifier si le paramètre d'entrée est un Fisher. Dans le cas contraire, des informations seront fournies à l'utilisateur.
```bash
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

while read -r line;
do
	echo "$nb   ${line}";
done < "$ficher_URLS";
```
⚠️Il convient de noter que si notre affectation de paramètres est effectuée après la condition de vérification du chemin, le nom du paramètre dans notre condition if ne peut pas utiliser $ficher_URLS, car nous n'avons pas défini le paramètre à ce moment.  

3. Comment afficher le numéro de ligne avant chaque URL (sur la même ligne) ?
   - Bien séparer les valeurs par des tabulations
Pour résoudre ce problème, nous pouvons ajouter un compteur nb pour faciliter le comptage, en comptant de la première à la dernière URL, et en plaçant le nombre nb compté à chaque fois devant l'URL affichée. Je l'ai initialement écrit ainsi :
```bash
nb=0
while read -r line;
do
    nb=nb+1
	echo "$nb   ${line}";
done < "$ficher_URLS";
```
Mais j'ai constaté que chaque URL exécutée était précédée de « nb+1 » au lieu du numéro attendu. Il devait donc y avoir une erreur dans mon affectation de nb. J'ai ensuite relu le didacticiel de la leçon précédente et constaté que pour effectuer une opération mathématique sur une variable définie précédemment, je devais l'écrire ainsi :
```bash
OK =0
OK=$(expr $OK + 1)
```
Voici le code modifié :
```bash
nb=0
while read -r line;
do
    nb=$(expr $nb + 1)
	echo "$nb   ${line}";
done < "$ficher_URLS";
```
Le résultat de cette exécution correspond à ce que nous recherchons.

La partie suivante était beaucoup plus complexe. J'ai utilisé ChatGPT pour l'interroger sur les erreurs de mon code et sur certaines options curl. Pour la deuxième partie, nous devions d'abord afficher le code HTTP de chaque lien, comme pour les 1XX, 200, etc. vus en cours. Comme j'avais déjà abordé ce sujet en cours, j'ai trouvé cela relativement simple. J'ai d'abord utilisé curl -I pour extraire les métadonnées du lien. J'ai observé le code dont nous avions besoin dans cette section :
```bash
HTTP/2 200
```
Autrement dit, il me suffit d'utiliser grep pour trouver le mot HTTP et extraire le numéro de code de la deuxième colonne. J'utilise le code suivant pour implémenter mon idée :
```bash
code_http=$(curl -I -s $line | grep HTTP | cut -d ' ' -f2)
# J'ai défini la variable code_http pour stocker chaque code http. L'option « -s » permet de mieux visualiser les métadonnées, et « cut » permet d'extraire uniquement la partie souhaitée. J'utilise « -d » pour séparer la ligne HTTP par un espace et « -f2 » pour extraire uniquement la deuxième colonne.
```
Les deux étapes suivantes pour extraire l'encodage et le nombre de mots d'une page web sont similaires à la méthode précédente. J'ajoute également deux opérations d'écho pour convertir mon résultat en tableau. Voici l'intégralité de mon code :
```bash
ficher_URLS=$1
#    2.1 Valider l’argument : ajouter le code nécessaire pour s’assurer qu’on donne bien un argument au script, sinon on s’arrête

# vérifier si on a bien argument
if [ $# -ne 1 ]
then
    echo "ce programme demande un argument"
    exit
fi

# vérifier l'argument est bien un ficher
if [ ! -f "$ficher_URLS" ]
then
    echo "vous devez indiquer un ficher"
    exit
fi

echo -e "nb\tline\tcode_http\tencodage\tnb_mot" > tableaux/tableau.tsv

nb=0
meta=""
code_http=""
encodage=""
nb_mot=""
while read -r line;
do
    nb=$(expr $nb + 1)
    metadonnee=$(curl -I -s -L "$line")
    code_http=$( echo "${metadonnee}" | grep HTTP | cut -d ' ' -f2)
    encodage=$( echo "${metadonnee}" | grep charset | cut -d '=' -f2 | tr -d '\r')
    nb_mot=$( curl -s -L "$line" | wc -w )

    if [ "$code_http" != "200" ]
    then
        code_http="Page_Not_Found"
    fi

    if [ ! "$encodage" ]
    then
        encodage="No_encodage"
    fi


	echo -e "${nb}\t${line}\t${code_http}\t${encodage}\t${nb_mot}" >> tableaux/tableau.tsv

done < "$ficher_URLS";
```
 ❓❓❓J'ai ensuite découvert un problème : 
 
 Il y a un phénomène très étrange dans ce code. Si j'exécute metadonnee=$(curl -I -s -L "$line"), le résultat de nb_mot=$(curl -s -L "$line" | wc -w) est erroné, et vice-versa.
 
C'est-à-dire je ne pouvais pas utiliser curl plusieurs fois, sinon les résultats renvoyés ne correspondaient pas aux résultats réels. J'ai demandé à chatGPT, et on m'a expliqué que c'était dû au fait que j'exécutais curl plusieurs fois sur la même URL et que la réponse du site web n'était pas corrigée, ce qui entraînait des résultats incorrects. (Ce n'est peut-être pas le problème, car la première fois que j'ai utilisé ce code, il a renvoyé les bons résultats, mais pour une raison inconnue, il a cessé de fonctionner par la suite.)
 
所以我现在的任务是, 找到只使用一次curl来达到我可以提取三种信息(code, encodage, nombre de mot)的方法, 我之前为了返回的数据不要太过庞大, 使用的是curl -I, 这只会返回这个网页的metadonne, 我现在尝试使用curl -i, 来同时返回这个网页的head和body, 这样我就可以只使用一次curl, 然后从中提取我想要的信息  
以下是修改后的code, 这样运行出来的代码是正确的:
```bash
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

echo -e "nb\tline\tcode_http\tencodage\tnb_mot" > tableaux/tableau_fr.tsv

nb=0
meta=""
code_http=""
encodage=""
nb_mot=""
while read -r line;
do
    nb=$(expr $nb + 1)
    reponse=$(curl -s -i "$line")
    code_http=$(echo "$reponse" | head -n 1 | cut -d ' ' -f2) # la deuxième colonne de la première ligne
    encodage=$(echo "$reponse" | grep content-type | sed -nE 's/.*charset=([^; ]*).*/\1/p' | tr -d '\r')
	# J'ai observé le contenu renvoyé par curl -i -s, qui contenait plusieurs jeux de caractères, j'ai donc recherché directement content-type.
	# sed -nE 's/.*charset=([^; ]*).*/\1/p' : Utilisez l'expression régulière sed pour extraire le nom d'encodage après charset=
	# Supprimez les éventuels caractères de retour chariot \r pour garantir une sortie propre
    nb_mot=$(echo "$reponse" | sed '1,/^\r$/d' | wc -w)

	# vérifier si on peut trouver la page
    if [ "$code_http" != "200" ]
    then
        code_http="Page_Not_Found"
    fi

	# vérifier on a bien l'encodage pour cette page
    if [ ! "$encodage" ]
    then
        encodage="No_encodage"
    fi
done < "$ficher_URLS";
```

---

### Séance 6  

Pendant cette séance, nous avons d'abord corriger ensemble le miniprojet, j'ai beaucoup mieux compris les opérations que l'on peut faire avec curl, et je me suis rendu compte que la solution que j'ai utilisé est trop compliqué, pour récupérer les métadonnés de la page, on n'a pas besoin de prendre tous les contenus de la page avec en utilisant -i, on peut simplement utilisé : curl -I -s -L "https://example.com" pour récupérer le code_http et l'encodage, avec cette façon, j'en ai plus besoin de l'expression régulière pour éviter les problèmes de format, ce qui rend mes codes moins compliqué et plus claire.  

J'ai aussi appris que dans le terminal, on peut aussi créer des paramètres ou stocker des données dans un fichier temporaire : .tmp   
Voici les commandes et réponses dans le terminal en utilisant les méthodes précédantes 👇
```bash
~ data=$(curl -I -w "%{http_code}\n{content_type}" -o /dev/null -s https://fr.wikipedia.org)
~ echo $data
301
text/html; charset=UTF-8
~ echo $data | cut -f1
301
text/html; charset=UTF-8
~ curl -I -L-s -w "content_typej\n%http_code}\n" -o tmp.txt https://fr.wikipedia.org› metadata.tmp
~ head -1 metadata.tmp
text/html; charset=UTF-8
~ tail -1 metadata.tmp
200
~ content_type=$(head -1 metadata. tmp)
~ echo $content_type
text/html; charset=UTF-8
~ echo $content_type | cut -d= -f2
UTF-8
~ echo "text/html" | cut -d= -f2
text/html
~ echo $content_typel | grep -E -o "charset=.*"
charset=UTF-8
~ echo $content_typel | grep -E -o "charset=.*" | cut -d= -f2
UTF-8
```
On a appris aussi le HTML aujourd'hui, tout comme l'arbre syntaxe d'une phrase, la structure de HTML a aussi une hérarchie:
```bash
# <...> -> balise, pour chaque structure, on a une balise racine
Il y a 3 types de balise :
• Ouvrantes : <balise> → le début d’une zone
• Fermantes : </balise> → la fin d’une zone
• Autofermantes ou vides : <balise/> → position dans le document
<html> # <...> -> balise
    <head>...</head> #head : l’entête du fichier (avec les métadonnées)
		[...]
		<meta charset="UTF-8" />
		[...]
    <body>...</body> #body : le corps du fichier (avec le contenu textuel et la structure)
</html>
```
Ensuite, avec la meme structure, on peut commencer à créer le tableau en HTML, pour faire ça nous avons besoins de 4 balises :   
1. table : la balise racine du tableau
2. tr : table row, une ligne (se place dans table)
3. th : table header, une cellule d’entête (seulement la première ligne)
4. td : table data, une cellule classique (toutes les lignes pas entête)
en utilisant ces balise, la structure de tableau en HTML sera :
```bash
<table>
	<tr>
		<th>livre</th><th>taille</th>
	</tr>
	<tr>
		<td>Du côté de chez Swann</td><td>1.0Mo</td>
	</tr>
	<tr>
		<td>L’Assommoir</td><td>990 ko</td>
	</tr>
</table>
```
