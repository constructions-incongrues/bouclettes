# Bouclettes

## Utilisation

- Créer un dossier et y placer le fichier à traiter. Le fichier doit avoir l'extension `.pdf`. Par exemple :

    ```
    mkdir -p bouclettes
    cd bouclettes
    wget https://tel.archives-ouvertes.fr/tel-00006260/document -O doc.pdf 
    ```

- Dans le dossier contenant le fichier PDF, exécuter la commande suivante :

    ```sh
    docker run \
        -v $PWD:/data \
        -e BOUCLETTES_LENGTH=40 \
        ghcr.io/constructions-incongrues/bouclettes
    ```

- Les livrets générés se trouvent dans le dossier `./booklets`

## Configuration

- `BOUCLETTES_LENGTH` : Nombre de pages par livret