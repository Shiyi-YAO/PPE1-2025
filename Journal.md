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
